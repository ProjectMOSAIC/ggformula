utils::globalVariables("role")

#' @importFrom utils head tail
#' @importFrom tibble tibble
#' @importFrom stringr str_split str_match
#' @importFrom stats as.formula
#' @importFrom utils modifyList
#' @importFrom rlang is_character exprs f_rhs f_lhs is_formula is_null enquo
#' @importFrom rlang get_expr
#' @importFrom rlang is_missing
#' @import ggplot2
#' @import scales
#' @importFrom ggiraph girafe
#'
NA


###############################################################################
## Helper functions used by the body of the function that `layer_factory()`
## generates (see `res` below). Each one handles a single stage of the
## "formula -> ggplot2 layer" pipeline:
##
##   1. resolve_object_arg()        figure out what `object` is (a formula,
##                                   a data frame, or a previous `gg` plot)
##   2. resolve_aes_form_and_roles() match/derive the formula "shape" that
##                                   applies to this call, folding in any
##                                   `x = ~var1`-style role arguments (d)
##   3. collect_layer_extras()      gather stat/geom parameters from the
##                                   call, and resolve `position`
##   4. extract_formula_aesthetics() turn any remaining `arg = ~expr`
##                                   arguments into aesthetics
##   5. build_layer_args()          assemble the argument list for
##                                   `layer_fun` (usually `ggplot2::layer()`)
##   6. assemble_plot()             combine the new layer (and any facet)
##                                   with `object` or a fresh `ggplot()`
##   7. apply_plot_labels()         attach xlab/ylab/title/subtitle/caption
##
## Splitting these out keeps the generated function's body (further below)
## readable as a linear sequence of named stages, and makes each stage
## separately testable.

# Stage 1: what kind of thing was passed as the first argument?
# Returns the (possibly updated) `gformula`, `data`, and `object`.
#
# `gformula` is itself a formal of the generated function (typically bound
# positionally, e.g. `df |> gf_point(y ~ x)` binds `df` to `object` and
# `y ~ x` to `gformula`), so its incoming value must be preserved except
# when `object` turns out to *also* be a formula (e.g. `gf_point(y ~ x)`
# with no data frame supplied positionally).
resolve_object_arg <- function(object, gformula, data) {
  if (inherits(object, "formula")) {
    gformula <- object
    object <- NULL
  }
  if (inherits(object, "data.frame")) {
    data <- object
    object <- NULL
  }
  list(gformula = gformula, data = data, object = object)
}

# Stage 2: resolve which `aes_form` template applies (if any), folding in
# `x = ~var1`-style named role arguments (see `formula_role_names()` and
# `extract_role_formula_args()`). Returns the matched `aes_form` (a single
# formula, or `NULL`), the `role_overrides` to pass on to `gf_ingredients()`,
# and the remaining `orig_args` (with any consumed role arguments removed).
resolve_aes_form_and_roles <-
  function(
    gformula,
    aes_form,
    orig_args,
    object,
    inherit,
    inherited.aes,
    function_name
  ) {
    # convert y ~ 1 into ~ y if a 1-sided formula is an option and 2-sided is not
    gformula <- response2explanatory(gformula, aes_form)

    all_roles <- formula_role_names(aes_form)
    role_formula_args <- extract_role_formula_args(orig_args, all_roles)
    role_overrides <- role_formula_args[["role_exprs"]]
    orig_args <- role_formula_args[["args"]]

    # If there's no literal formula but the named role arguments fully
    # cover the roles required by at least one candidate `aes_form`,
    # that's a valid call on its own -- `first_matching_formula()`
    # doesn't need to find a literal match in that case.
    role_args_cover_a_template <-
      is.null(gformula) &&
      length(role_overrides) > 0 &&
      any(sapply(aes_form, function(f) {
        !is.null(f) && all(all.vars(f) %in% names(role_overrides))
      }))

    aes_form <-
      first_matching_formula(
        gformula,
        aes_form,
        object,
        inherit,
        inherited.aes,
        function_name,
        allow_null = role_args_cover_a_template
      )

    # If both a literal formula and named role arguments supply the same
    # role (e.g. `gf_point(var2 ~ var1, x = ~var3)`), the named argument
    # wins; warn about the duplication.
    if (!is.null(aes_form) && length(role_overrides) > 0) {
      overridden_roles <- intersect(names(role_overrides), all.vars(aes_form))
      if (length(overridden_roles) > 0) {
        warning(
          function_name,
          "(): ",
          paste(overridden_roles, collapse = ", "),
          " specified in both the formula and as named argument(s); ",
          "using the named argument value(s).",
          call. = FALSE
        )
      }
    }

    list(
      gformula = gformula,
      aes_form = aes_form,
      role_overrides = role_overrides,
      orig_args = orig_args
    )
  }

# Stage 3: gather stat/geom parameters and other "extra" arguments from the
# call, and resolve a character `position` (e.g. "jitter") into a `Position`
# object using whichever of those extras apply.
collect_layer_extras <-
  function(orig_args, formals_snapshot, stat, geom, extras, envir, position) {
    stat_formals <- grab_formals(stat, "stat")
    geom_formals <- grab_formals(geom, "geom")
    extras_and_dots <-
      create_extras_and_dots(
        args = orig_args,
        formals = formals_snapshot,
        stat_formals = stat_formals,
        geom_formals = geom_formals,
        extras = extras,
        env = envir
      )

    if (is.character(position)) {
      position_fun <- paste0("position_", position)
      pdots <-
        extras_and_dots[intersect(
          names(extras_and_dots),
          names(formals(position_fun))
        )]
      position <- do.call(position_fun, pdots)
    }

    # remove symbols from extras_and_dots (why?)
    if (length(extras_and_dots) > 0) {
      extras_and_dots <-
        extras_and_dots[sapply(extras_and_dots, function(x) !is.symbol(x))]
    }

    list(extras_and_dots = extras_and_dots, position = position)
  }

# Stage 4: look for remaining arguments of the form `argument = ~ something`
# and turn them into aesthetics (e.g. `color = ~group`). This is the more
# general, longstanding mechanism that `resolve_aes_form_and_roles()`'s
# role-specific handling deliberately runs before, so that
# formula-valued `x`/`y`/etc. role arguments are handled there instead.
extract_formula_aesthetics <- function(extras_and_dots, aesthetics, envir) {
  if (length(extras_and_dots) > 0) {
    w <- which(
      sapply(extras_and_dots, function(x) {
        rlang::is_formula(x) && length(x) == 2L
      })
    )
    aesthetics <- add_aes(aesthetics, extras_and_dots[w], envir)
    extras_and_dots[w] <- NULL
  }
  list(aesthetics = aesthetics, extras_and_dots = extras_and_dots)
}

# Stage 5: assemble the argument list to pass to `layer_fun` (typically
# `ggplot2::layer()`, or `layer_interactive()` for ggiraph layers).
build_layer_args <-
  function(
    layer_fun,
    geom,
    stat,
    position,
    ingredients,
    check.aes,
    show.legend,
    inherit,
    interactive,
    layer_func_interactive
  ) {
    # layer has a params argument, geoms and stats do not
    if ("params" %in% names(formals(layer_fun))) {
      layer_args <-
        list(
          geom = geom,
          stat = stat,
          data = ingredients[["data"]],
          mapping = ingredients[["mapping"]],
          position = position,
          params = remove_from_list(ingredients[["params"]], "inherit"),
          check.aes = check.aes,
          check.param = FALSE,
          show.legend = show.legend,
          inherit.aes = inherit
        )
    } else {
      # `layer_fun` is a `geom_*()`/`stat_*()`-style constructor (e.g.
      # `geom_violin()`, `geom_sf()`, `geom_abline()`), or an interactive
      # wrapper, rather than `ggplot2::layer()`. Such functions declare
      # their structural arguments individually and differ in which ones
      # they accept, so consult `formals(layer_fun)` instead of assuming a
      # particular signature.
      layer_fun_formals <- names(formals(layer_fun))
      layer_args <-
        c(
          list(
            geom = geom,
            stat = stat,
            data = ingredients[["data"]],
            mapping = ingredients[["mapping"]],
            show.legend = show.legend
          ),
          # `inherit.aes` must be forwarded when `layer_fun` declares it,
          # or `gf_*(inherit = FALSE)` is silently ignored (as happened
          # for `gf_violin()`, which uses `layer_fun = geom_violin`).
          # Doing this by signature is safe for `geom_abline()` and
          # friends: their own `inherit.aes` default is FALSE, and the
          # corresponding `gf_*()` functions are built with
          # `layer_factory(inherit.aes = FALSE)`, so `inherit` already
          # carries that same default. Layer functions that cannot make
          # use of `inherit.aes` simply don't declare it and are left
          # alone; `layer_interactive()` declares it precisely so that
          # interactive layers opt in to this forwarding.
          # `check.aes`/`check.param` remain `ggplot2::layer()`-only.
          if ("inherit.aes" %in% layer_fun_formals) {
            list(inherit.aes = inherit)
          },
          # these become regular arguments for other layer functions
          remove_from_list(ingredients[["params"]], "inherit")
        )
    }

    # If no ..., be sure to remove things not in the formals list
    if (!"..." %in% names(formals(layer_fun))) {
      layer_args <- cull_list(layer_args, names(formals(layer_fun)))
    }

    # remove additional arguments that layer_fun doesn't use, even if we have ...
    # this is here to avoid unused arguments in gf_abline(), gf_hline(), and gf_vline()
    for (f in c("geom", "stat", "position")) {
      if (!f %in% names(formals(layer_fun))) {
        layer_args[[f]] <- NULL
      }
    }

    # remove any duplicated arguments
    layer_args <- layer_args[unique(names(layer_args))]

    # remove mapping and data if mapping is empty -- to avoid warnings from gf_abline() and friends
    if (length(layer_args[["mapping"]]) < 1) {
      layer_args[["mapping"]] <- NULL
      layer_args[["data"]] <- NULL
    }

    if (interactive) {
      layer_args <- c(list(layer_func = layer_func_interactive), layer_args)
    }
    layer_args
  }

# Stage 6: combine the new layer (and, if present, a facet spec) with
# either `object` (when adding to an existing plot) or a freshly created
# `ggplot()`.
assemble_plot <- function(object, add, new_layer, ingredients, envir) {
  base_plot <- function() {
    do.call(
      ggplot,
      list(data = ingredients$data, mapping = ingredients[["mapping"]]),
      envir = envir
    )
  }

  if (is.null(ingredients[["facet"]])) {
    if (add) {
      object + new_layer
    } else {
      base_plot() + new_layer
    }
  } else {
    if (add) {
      object + new_layer + ingredients[["facet"]]
    } else {
      base_plot() + new_layer + ingredients[["facet"]]
    }
  }
}

# Stage 7: attach any of the label-related arguments that were supplied.
apply_plot_labels <- function(p, xlab, ylab, title, subtitle, caption) {
  if (!rlang::is_missing(ylab)) {
    p <- p + ggplot2::ylab(ylab)
  }
  if (!rlang::is_missing(xlab)) {
    p <- p + ggplot2::xlab(xlab)
  }
  if (!rlang::is_missing(title)) {
    p <- p + ggplot2::labs(title = title)
  }
  if (!rlang::is_missing(subtitle)) {
    p <- p + ggplot2::labs(subtitle = subtitle)
  }
  if (!rlang::is_missing(caption)) {
    p <- p + ggplot2::labs(caption = caption)
  }
  p
}


#' Create a ggformula layer function
#'
#' Primarily intended for package developers, this function factory
#' is used to create the layer functions in the ggformula package.
#'
#' @param geom The geom to use for the layer
#'   (may be specified as a string).
#' @param position The position function to use for the layer
#'   (may be specified as a string).
#' @param stat The stat function to use for the layer
#'   (may be specified as a string).
#' @param interactive A logical indicating whether this is being used
#'   to create an interactive layer.
#' @param layer_func_interactive layer function passed to call of
#'   the internal function `layer_interactive()`.
#' @param pre code to run as a "pre-process".
#' @param aes_form A single formula or a list of formulas specifying
#'   how attributes are inferred from the formula.  Use `NULL` if the
#'   function may be used without a formula.
#' @param extras An alist of additional arguments (potentially with defaults)
#' @param note A note to add to the quick help.
#' @param aesthetics Additional aesthetics (typically created using
#'   [ggplot2::aes()]) set rather than inferred from formula.
#'   `gf_dhistogram()` uses this to set the y aesthetic to `stat(density)`,
#'   for example.
#' @param inherit.aes A logical indicating whether aesthetics should be
#'   inherited from prior layers or a vector of character names of aesthetics
#'   to inherit.
#' @param check.aes A logical indicating whether a warning should be emited
#'   when aesthetics provided don't match what is expected.
#' @param data A data frame or `NULL` or `NA`.
#' @param required_packages A character vector naming packages that must be
#'   both installed and attached (via [library()]) for the resulting
#'   function to work -- typically because `geom`/`stat` are given as
#'   strings that must be resolved against an attached package's namespace
#'   (see the "Extending ggformula" vignette). Each named package is
#'   checked before `pre` runs, and an informative error is raised if a
#'   package is missing or not attached. Use `character(0)` (the default)
#'   if there are no such requirements, or if a `layer_fun` is used that
#'   calls the extension package's own function directly (in which case
#'   the package usually only needs to be installed, not attached, in
#'   which case `installed_packages` is the better fit).
#' @param installed_packages A character vector naming packages that must
#'   be installed (but need not be attached via [library()]) for the
#'   resulting function to work -- typically because `layer_fun` calls the
#'   extension package's own function directly (e.g. via `pkg::fun()`),
#'   which doesn't require the package to be attached. Each named package
#'   is checked before `pre` runs (alongside `required_packages`), and an
#'   informative error is raised if a package is missing. Use
#'   `character(0)` (the default) if there is no such requirement.
#' @param layer_func_interactive The function used to create the layer when `interactive`` is TRUE
#'   (or a quosure that evaluates to such a function).
#' @param layer_fun function used to create a layer. The default value is anticipated
#'   to work in most (all?) cases.
#'
#' @param ... Additional arguments.
#' @return A function.
#' @export

layer_factory <-
  function(
    geom = "point",
    position = "identity",
    stat = "identity",
    interactive = FALSE,
    layer_func_interactive = "geom_point",
    pre = {},
    aes_form = y ~ x,
    extras = alist(),
    note = NULL,
    aesthetics = aes(),
    inherit.aes = TRUE,
    check.aes = TRUE,
    data = NULL,
    required_packages = character(0),
    installed_packages = character(0),
    layer_fun = if (interactive) {
      quo(layer_interactive)
    } else {
      quo(ggplot2::layer)
    },
    ...
  ) {
    pre <- substitute(pre)

    geom <- enexpr(geom)
    stat <- enexpr(stat)
    position <- enexpr(position)

    if (!is.logical(inherit.aes)) {
      inherited.aes <- inherit.aes
      inherit.aes <- FALSE
    } else {
      inherited.aes <- character(0)
    }

    # the formals of this will be modified below
    # the formals included here help avoid CRAN warnings
    res <-
      function(
        xlab,
        ylab,
        title,
        subtitle,
        caption,
        show.legend,
        function_name,
        inherit,
        environment = parent.frame(),
        ...
      ) {
        function_name <- as.character(match.call()[1])

        # confirm any packages this function depends on are installed
        # (and, for `required_packages`, also attached) before running
        # `pre` or anything else
        check_required_packages(required_packages, function_name)
        check_installed_packages(installed_packages, function_name)

        # pre and will be placed in the function environment so available here
        eval(pre)

        # evaluate quosures
        geom <- rlang::eval_tidy(geom)
        stat <- rlang::eval_tidy(stat)
        position <- rlang::eval_tidy(position)
        layer_fun <- rlang::eval_tidy(layer_fun)
        layer_func_interactive <- rlang::eval_tidy(layer_func_interactive)

        orig_args <- as.list(match.call())[-1]

        # make sure we have a list of formulas here
        if (!is.list(aes_form)) {
          aes_form <- list(aes_form)
        }

        # show help if requested or if there are no arguments to the function
        if (is.null(show.help)) {
          show.help <- length(orig_args) < 1
        }

        if (show.help) {
          emit_help(
            function_name = function_name,
            aes_form,
            extras,
            note,
            geom = geom,
            stat = stat,
            position = position
          )
          return(invisible(NULL))
        }

        # Stage 1: what kind of thing was passed as `object`?
        # (not sure whether we should use the environment recorded in
        # `object` or not, but this is how/where to do it, if so:
        #   if (inherits(object, "gg")) environment <- object$plot_env)
        resolved_object <- resolve_object_arg(object, gformula, data)
        gformula <- resolved_object[["gformula"]]
        data <- resolved_object[["data"]]
        object <- resolved_object[["object"]]

        # Stage 2: which `aes_form` template applies, folding in any
        # `x = ~var1`-style named role arguments (goal (d))?
        resolved_aes_form <-
          resolve_aes_form_and_roles(
            gformula,
            aes_form,
            orig_args,
            object,
            inherit,
            inherited.aes,
            function_name
          )
        aes_form <- resolved_aes_form[["aes_form"]]
        role_overrides <- resolved_aes_form[["role_overrides"]]
        orig_args <- resolved_aes_form[["orig_args"]]
        gformula <- resolved_aes_form[["gformula"]]

        # Stage 3: collect stat/geom parameters and resolve `position`.
        collected_extras <-
          collect_layer_extras(
            orig_args,
            eval_pairlist(formals()),
            stat,
            geom,
            extras,
            environment,
            position
          )
        extras_and_dots <- collected_extras[["extras_and_dots"]]
        position <- collected_extras[["position"]]

        add <- inherits(object, c("gg", "ggplot"))

        # add in selected additional aesthetics -- partial inheritance
        if (add) {
          for (aes.name in inherited.aes) {
            aesthetics[[aes.name]] <- object$mapping[[aes.name]]
          }
        }

        # Stage 4: fold any remaining `arg = ~expr` arguments into aesthetics.
        extracted_aesthetics <-
          extract_formula_aesthetics(extras_and_dots, aesthetics, environment)
        aesthetics <- extracted_aesthetics[["aesthetics"]]
        extras_and_dots <- extracted_aesthetics[["extras_and_dots"]]

        ingredients <-
          gf_ingredients(
            formula = gformula,
            data = data,
            gg_object = object,
            extras = extras_and_dots,
            aes_form = aes_form,
            aesthetics = aesthetics,
            envir = environment,
            role_overrides = role_overrides
          )

        # Stage 5: assemble the arguments for `layer_fun` and create the layer.
        layer_args <-
          build_layer_args(
            layer_fun,
            geom,
            stat,
            position,
            ingredients,
            check.aes,
            show.legend,
            inherit,
            interactive,
            layer_func_interactive
          )
        new_layer <- do.call(layer_fun, layer_args, envir = environment)

        # Stage 6: combine the layer with `object` or a fresh `ggplot()`.
        p <- assemble_plot(object, add, new_layer, ingredients, environment)

        # Stage 7: attach labels, if any were supplied.
        p <- apply_plot_labels(p, xlab, ylab, title, subtitle, caption)

        class(p) <- unique(c("gf_ggplot", class(p)))
        p
      }
    formals(res) <-
      c(
        create_formals(
          extras,
          layer_fun = layer_fun,
          geom = geom,
          stat = stat,
          position = position,
          inherit.aes = inherit.aes
        ),
        list(...)
      )

    assign("inherit.aes", inherit.aes, environment(res))
    assign("check.aes", check.aes, environment(res))
    assign("pre", pre, environment(res))
    assign("extras", extras, environment(res))
    assign("required_packages", required_packages, environment(res))
    assign("installed_packages", installed_packages, environment(res))

    # Record the arguments used to build this function as an explicit,
    # documented "spec" (see `ggformula_spec()`). This is what
    # `interactive_layer_factory()` uses to build the `_interactive`
    # counterpart of a `gf_*` function, and is also the recommended way
    # for extension packages to introspect a `gf_*` function's geom/stat/
    # formula-shape/etc. without relying on `layer_factory()`'s internals.
    #
    # It lives in the function's enclosing environment rather than in an
    # attribute on the function itself: `print.function()` displays a
    # function's attributes, so an attribute here would mean that merely
    # typing `gf_point` at the console dumped the whole spec after the
    # closure. The single dot-prefixed binding is deliberate -- it keeps
    # the spec distinguishable from the individual values also assigned
    # above (which exist because the function body references them at
    # call time).
    assign(
      ".ggformula_spec",
      list(
        geom = geom,
        stat = stat,
        position = position,
        aes_form = aes_form,
        extras = extras,
        pre = pre,
        aesthetics = aesthetics,
        inherit.aes = inherit.aes,
        check.aes = check.aes,
        required_packages = required_packages,
        installed_packages = installed_packages
      ),
      environment(res)
    )
    res
  }

#' Retrieve the specification used to build a `gf_*` function
#'
#' Every function created by [layer_factory()] records the arguments
#' (`geom`, `stat`, `position`, `aes_form`, `extras`, `pre`, `aesthetics`,
#' `inherit.aes`, `check.aes`, `required_packages`, `installed_packages`)
#' it was built with. `ggformula_spec()` retrieves that record, which is
#' the recommended way for extension packages (or `ggformula` itself, e.g.
#' when building `_interactive` counterparts) to introspect a `gf_*`
#' function without depending on the internals of [layer_factory()].
#'
#' The spec is stored in the function's enclosing environment rather than
#' as an attribute on the function, so that printing a `gf_*` function at
#' the console shows just the function. Use `ggformula_spec()` rather than
#' reaching for the binding directly; its name and location are an
#' implementation detail.
#'
#' Note that `pre` is included precisely so that
#' `interactive_layer_factory()` (and similar tools) can replay it: some
#' `gf_*` functions (e.g. `gf_text()`, whose `nudge_x`/`nudge_y` handling
#' lives in `pre`, or `gf_violin()`, whose `quantile_gp` default is only
#' valid after `pre` computes it) depend on `pre` having already run
#' before any of their `extras` defaults are evaluated. Building a
#' variant without replaying `pre` can therefore produce broken or even
#' self-referential defaults.
#'
#' @param gf_fun A function created by [layer_factory()] (e.g. `gf_point`).
#' @return A list with components `geom`, `stat`, `position`, `aes_form`,
#'   `extras`, `pre`, `aesthetics`, `inherit.aes`, `check.aes`,
#'   `required_packages`, and `installed_packages`, or `NULL` if `gf_fun`
#'   was not created by [layer_factory()].
#' @export
ggformula_spec <- function(gf_fun) {
  if (!is.function(gf_fun)) {
    return(NULL)
  }

  # Development versions between 1.1.0 and this one stored the spec as an
  # attribute; honor that if we find it, so functions built by an older
  # ggformula (or by an extension package built against one) still work.
  spec <- attr(gf_fun, "ggformula_spec")

  if (is.null(spec)) {
    env <- environment(gf_fun)
    # primitives (and functions stripped of their environment) have none
    if (is.null(env)) {
      return(NULL)
    }
    # `inherit = FALSE`: only the function's own enclosing environment --
    # the one `layer_factory()` created -- counts as a match.
    spec <-
      rlang::env_get(env, ".ggformula_spec", default = NULL, inherit = FALSE)
  }

  if (is_ggformula_spec(spec)) spec else NULL
}

# Guards against mistaking some unrelated `.ggformula_spec` binding (or a
# stale/partial one) for a real spec.
is_ggformula_spec <- function(x) {
  is.list(x) &&
    all(c("geom", "stat", "position", "aes_form", "extras") %in% names(x))
}

###############################################################################
##
## modified version of a function in ggiraph: it omits optional arguments
## that were not supplied, and resolves the interactive layer constructor
## from ggiraph's namespace rather than the search path.

layer_interactive <- function(
  layer_func,
  stat = NULL,
  position = NULL,
  ...,
  inherit.aes = NULL,
  interactive_geom = NULL,
  extra_interactive_params = NULL
) {
  # `interactive_layer_factory()` records the interactive constructor by
  # name (e.g. "geom_point_interactive"). Resolve it from {ggiraph}'s
  # namespace here rather than leaving it to `do.call()`, whose character
  # lookup falls through to the search path -- which would require
  # {ggiraph} to be attached rather than merely installed.
  if (is.character(layer_func)) {
    layer_func <- ggiraph_fun(layer_func)
  }

  # `inherit.aes` is declared explicitly (rather than left to `...`) so
  # that `build_layer_args()` -- which forwards `inherit.aes` only to
  # layer functions whose signature declares it -- knows it is safe to
  # pass along. Without it, `gf_*_interactive(inherit = FALSE)` was
  # silently ignored. ggiraph's `geom_*_interactive()` functions are all
  # `...`-passthrough wrappers around the corresponding ggplot2 geom
  # (e.g. `geom_point_interactive(...)` calls `geom_point(...)`), so the
  # value reaches a function that understands it.
  #
  # `position` and `inherit.aes` are omitted entirely when NULL rather
  # than forwarded as NULL, since for those wrappers an explicit NULL is
  # not the same as an absent argument (`position = NULL` in particular
  # is an error). Omitting `inherit.aes` leaves the underlying geom's own
  # default in force, which matters for `geom_abline()` and friends,
  # whose default is FALSE rather than TRUE.
  #
  # `ggiraph_layer_interactive()` collects its `...` with `rlang::list2()`,
  # so `!!!` splicing of the optional arguments works here.
  optional <- list(position = position, inherit.aes = inherit.aes)
  optional <- optional[!vapply(optional, is.null, logical(1))]

  ggiraph_layer_interactive(
    layer_func,
    stat = stat,
    !!!optional,
    ...,
    interactive_geom = interactive_geom,
    extra_interactive_params = extra_interactive_params
  )
}


###############################################################################

#' Create an interactive ggformula layer function
#'
#' Primarily intended for package developers, this function factory
#' is used to create layer functions in the ggformula package.
#'
#' Given `"geom_point_interactive"`, this looks up the corresponding
#' non-interactive function (`gf_point()`) and reads its
#' [ggformula_spec()] to determine the `geom`, `stat`, `position`,
#' `aes_form`, `extras`, `aesthetics`, `inherit.aes`, and `check.aes` to
#' reuse when building the interactive counterpart, rather than
#' introspecting `gf_point()`'s internals directly. This makes it robust to
#' `gf_*` functions built by other packages, as long as they were created
#' with [layer_factory()] (and therefore have a spec to read).
#'
#' @param geom_fun A character string naming an interactive geom (example: "geom_point_interactive")
#'
interactive_layer_factory <- function(geom_fun) {
  stopifnot(is.character(geom_fun))
  geom_noninteractive <- gsub("_interactive", "", geom_fun, fixed = TRUE)
  gf_noninteractive <- gsub("geom_", "gf_", geom_noninteractive, fixed = TRUE)

  gf_fun <- tryCatch(get(gf_noninteractive), error = function(e) NULL)
  spec <- ggformula_spec(gf_fun)
  if (is.null(spec)) {
    return(NULL)
  }

  do.call(
    layer_factory,
    list(
      geom = spec[["geom"]] %||% "point",
      position = spec[["position"]] %||% "identity",
      stat = spec[["stat"]] %||% "identity",
      interactive = TRUE,
      layer_func_interactive = geom_fun,
      aes_form = spec[["aes_form"]],
      extras = spec[["extras"]] %||% alist(),
      pre = spec[["pre"]] %||% quote({}),
      aesthetics = spec[["aesthetics"]] %||% aes(),
      inherit.aes = spec[["inherit.aes"]] %||% TRUE,
      check.aes = spec[["check.aes"]] %||% TRUE,
      required_packages = spec[["required_packages"]] %||% character(0),
      # {ggiraph} need only be installed, not attached: the interactive
      # constructor and its ggproto objects are looked up in its
      # namespace (see `ggiraph_fun()`, `find_global_ggiraph()`).
      # Checking here gives an actionable error at call time rather than
      # a lookup failure deep inside the layer machinery.
      installed_packages = union(
        spec[["installed_packages"]] %||% character(0),
        "ggiraph"
      ),
      layer_fun = layer_interactive
    )
  )
}


#########################################################################
#

# Modify environments of aesthetics in a mapping
#
# @param mapping an aesthetic mapping
# @param environment an environment to use for aesthetics that have environments.
#
aes_env <- function(mapping, envir) {
  for (i in one_upto(length(mapping))) {
    if (!is.null(environment(mapping[[i]]))) {
      environment(mapping[[i]]) <- envir
    }
  }
  mapping
}

# Check if an aesthetic uses a stat
#
# @param aes an item in an aesthetic mapping
# @return a logical indicating whether the aethetic is of the form `stat( ... )`.

uses_stat <- function(aes) {
  e <- rlang::get_expr(aes)
  length(e) > 1 && e[[1]] == as.name("stat")
}


add_aes <- function(mapping, new, envir = parent.frame()) {
  # convert ~ x into just x (as a name)
  if (length(new) > 0L) {
    for (i in 1L:length(new)) {
      if (rlang::is_formula(new[[i]]) && length(new[[i]] == 2L)) {
        new[[i]] <- new[[i]][[2]]
      }
    }
  }
  new <- do.call(aes, new) |> aes_env(envir)
  res <- modifyList(mapping, new)
  res
}


# Check that each package named in `required_packages` is both installed
# and currently attached (i.e. loaded via `library()`), raising an
# actionable error otherwise. This generalizes the check historically
# hand-written in `pre` blocks like `gf_sina()`'s (see the "Extending
# ggformula" vignette): most extension packages need to be *attached*,
# not just installed, because `layer_factory()`'s `geom =`/`stat =`
# strings are resolved by searching attached namespaces.
check_required_packages <- function(required_packages, function_name) {
  for (pkg in required_packages) {
    if (!requireNamespace(pkg, quietly = TRUE)) {
      stop(
        "The ", pkg, " package is required for ", function_name, "().",
        "  Please install and try again.",
        call. = FALSE
      )
    }
    if (!paste0("package:", pkg) %in% search()) {
      stop(
        "To use ", function_name, "(), the ", pkg, " package must be loaded.\n",
        "    Try, for example, `library(", pkg, ")`.",
        call. = FALSE
      )
    }
  }
  invisible(NULL)
}

# Like `check_required_packages()`, but only confirms that each package is
# installed -- not that it is attached. This is the right check for
# functions that call an extension package's own function directly (via
# `pkg::fun()` in `layer_fun`), which doesn't require the package to be
# attached with `library()`.
check_installed_packages <- function(installed_packages, function_name) {
  for (pkg in installed_packages) {
    if (!requireNamespace(pkg, quietly = TRUE)) {
      stop(
        "The ", pkg, " package is required for ", function_name, "().",
        "  Please install and try again.",
        call. = FALSE
      )
    }
  }
  invisible(NULL)
}

# Structural/layer-machinery argument names that must never be treated as
# generic "extra" geom/stat parameters. ggplot2's geom_*()/stat_*()
# constructors all declare formals with these names (see e.g.
# formals(geom_hline)), but ggformula always handles them explicitly
# elsewhere in the pipeline: `data` and `mapping` are built from the
# formula/data frame, `position` is resolved from the `position` argument,
# and `show.legend`/`inherit.aes`/`geom`/`stat` are already separate,
# explicit formals of the generated gf_* function. If these names are
# allowed to also flow through as "extras" (merely because a geom/stat
# constructor happens to declare a same-named formal), they can leak into
# the parameter/data-frame construction used for `data = NA` calls and
# produce duplicated or malformed arguments (see #<issue>).
reserved_layer_arg_names <-
  c("mapping", "data", "geom", "stat", "position", "show.legend", "inherit.aes")

# grab formals from a stat or geom (or similar)

grab_formals <- function(f, type = "stat") {
  # wrapping with c() is per issue #150 due to change in "union() and friends"
  if (is.character(f) && !grepl(paste0("^", type), f)) {
    return(c(formals(paste0(type, "_", f))))
  } else if (is.function(f)) {
    return(c(formals(f)))
  } else {
    return(list())
  }
}

#' @importFrom rlang enexpr !!

create_formals <-
  function(
    extras = list(),
    layer_fun,
    geom,
    stat,
    position,
    inherit.aes = TRUE
  ) {
    layer_fun <- rlang::eval_tidy(layer_fun)

    res <-
      c(
        list(object = NULL, gformula = NULL, data = NULL),
        alist(... = ),
        extras[setdiff(
          names(extras),
          c("xlab", "ylab", "title", "subtitle", "caption")
        )],
        if (is.null(extras[["xlab"]])) {
          alist(xlab = )
        } else {
          list(xlab = extras[["xlab"]])
        },
        if (is.null(extras[["ylab"]])) {
          alist(ylab = )
        } else {
          list(ylab = extras[["ylab"]])
        },
        if (is.null(extras[["title"]])) {
          alist(title = )
        } else {
          list(title = extras[["title"]])
        },
        if (is.null(extras[["subtitle"]])) {
          alist(subtitle = )
        } else {
          list(subtitle = extras[["subtitle"]])
        },
        if (is.null(extras[["caption"]])) {
          alist(caption = )
        } else {
          list(caption = extras[["caption"]])
        },
        list(
          geom = geom,
          stat = stat,
          position = position,
          show.legend = NA,
          show.help = NULL,
          inherit = inherit.aes,
          environment = quote(parent.frame())
        )
      )

    # remove arguments from resulting function that layer_fun doesn't use.
    # this is here to avoid unused arguments in gf_abline(), gf_hline(), and gf_vline()
    for (f in c("geom", "stat", "position")) {
      if (!f %in% names(formals(layer_fun))) {
        res[[f]] <- NULL
      }
    }
    res
  }

create_extras_and_dots <-
  function(
    args,
    formals,
    stat_formals = list(),
    geom_formals = list(),
    extras = list(),
    env
  ) {
    extras_and_dots <- modifyList(formals, args)
    # to avoid object = formula becoming an aesthetic
    extras_and_dots[["object"]] <- NULL
    # remove missing -- is there a better way to determine missing?
    extras_and_dots <-
      extras_and_dots[
        !sapply(
          extras_and_dots,
          function(x) is.symbol(x) && identical(as.character(x), "")
        )
      ]
    # remove args not used by stat or geom and not in extras; always drop
    # the reserved structural names regardless of whether the stat/geom
    # constructor happens to also declare a formal with that name (see
    # `reserved_layer_arg_names`)
    allowed_extra_names <-
      setdiff(
        names(stat_formals) |>
          union(names(geom_formals)) |>
          union(names(extras)),
        reserved_layer_arg_names
      )
    for (n in setdiff(names(formals), allowed_extra_names)) {
      extras_and_dots[[n]] <- NULL
    }

    # evaluate any items that are names or still calls
    extras_and_dots <-
      lapply(extras_and_dots, function(x) {
        if (is.symbol(x) || is.call(x)) eval(x, env) else x
      })
    extras_and_dots
  }

# Find first matching formula shape.
# Emit error message when no good matches.
#
# `allow_null` bypasses the "no match" error even when there is nothing to
# inherit from a prior layer. This is used when named arguments like
# `x = ~var1, y = ~var2` (see `extract_role_formula_args()`) already supply
# every role required by at least one candidate `aes_form`, so there is no
# literal formula to match but the call is still well-formed.

first_matching_formula <-
  function(
    gformula,
    aes_form,
    object,
    inherit,
    inherited.aes,
    function_name,
    allow_null = FALSE
  ) {
    fmatches <- formula_match(gformula, aes_form = aes_form)

    if (!any(fmatches)) {
      if (
        allow_null ||
          (inherits(object, "gg") && (inherit || length(inherited.aes) > 0))
      ) {
        return(NULL)
      } else {
        stop("Invalid formula type for ", function_name, ".", call. = FALSE)
      }
    } else {
      return(aes_form[[which.max(fmatches)]])
    }
  }

# if aes_form includes 1-sided formula but no 2-sided formula, then
#   covert y ~ 1 into ~ y
#   convert y ~ 1 | a into ~ y | a
#   convert y ~ 1 | a ~ b into ~ y | a ~ b
#   convert y ~ 1 | ~ a into ~ y | ~ a

# This is clunky because | doen't have the right precedence for the intended
# interpretation of the formula.

response2explanatory <-
  function(formula, aes_form = NULL) {
    if (
      !is.null(aes_form) &&
        (!any(sapply(aes_form, function(f) length(f) == 2L)) ||
          any(sapply(aes_form, function(f) length(f) == 3L)))
    ) {
      return(formula)
    }

    if (length(formula) == 3L && isTRUE(formula[[3]] == 1)) {
      formula[[3]] <- formula[[2]]
      # can remove either slot 2 or slot 3 here to get 1-sided formula
      formula[[2]] <- NULL
    } else if (
      length(formula) == 3L &&
        length(formula[[3]]) == 3L &&
        isTRUE(formula[[3]][[1]] == as.name("|")) &&
        isTRUE(formula[[3]][[2]] == 1L)
    ) {
      formula[[3]][[2]] <- formula[[2]]
      formula[[2]] <- NULL
    } else if (length(formula) == 3L && rlang::is_formula(formula[[2]])) {
      formula[[2]] <- response2explanatory(formula[[2]])
    }
    formula
  }

###############################################################################
## Support for `gf_point(x = ~var1, y = ~var2, ...)` as an alternative to
## `gf_point(var2 ~ var1, ...)`.
##
## The general idea: every `aes_form` template (e.g. `y ~ x`, `~x`, or
## `low + high ~ x`) names a set of "roles". If the caller supplies a named
## argument matching one of those role names whose value is a one-sided
## formula (e.g. `x = ~var1`), we treat it exactly like the corresponding
## slot of a literal formula. This works two ways:
##  * If no literal formula was supplied at all, and the named role
##    arguments fully cover the roles of some candidate `aes_form`
##    template, we skip the (otherwise required) formula entirely.
##  * If a literal formula *and* overlapping named role arguments are both
##    supplied, the named arguments win and a warning names the roles that
##    were overridden.

# All of the role names (e.g. c("y", "x"), or c("low", "high", "x")) used
# across every candidate formula in `aes_form` (a list of template
# formulas, some of which may be `NULL` for functions that also allow no
# formula at all).
formula_role_names <- function(aes_form) {
  unique(unlist(lapply(aes_form, function(f) {
    if (is.null(f)) character(0) else all.vars(f)
  })))
}

# Pull out named arguments in `args` whose name is one of `candidate_roles`
# and whose value is a one-sided formula (`~ expr`). Returns the extracted
# expressions (as a named list of unevaluated language objects, matching
# the representation `formula_to_df()` uses internally) together with the
# remaining arguments (so the extracted ones aren't later treated as plain
# geom/stat parameters or re-processed as generic formula-valued
# aesthetics).
extract_role_formula_args <- function(args, candidate_roles) {
  is_role_formula <- function(x) rlang::is_formula(x) && length(x) == 2L
  candidate_names <- intersect(names(args), candidate_roles)
  if (length(candidate_names) > 0) {
    candidate_names <-
      candidate_names[
        vapply(args[candidate_names], is_role_formula, logical(1))
      ]
  }

  role_exprs <- lapply(args[candidate_names], function(f) f[[2]])
  names(role_exprs) <- candidate_names

  list(
    role_exprs = role_exprs,
    args = args[setdiff(names(args), candidate_names)]
  )
}

# The actual graphing functions are created dynamically.
#  See the functions at the bottom of this file

# These are unexported helper functions to create the gf_ functions. The gf_ functions
# themselves are at the end of this file....

# traverse a formula and return a nested list of "nodes"
# stop traversal if we encounter a binary operator in stop_binops
formula_slots <- function(x, stop_binops = c(":", "::")) {
  if (length(x) == 2L && deparse(x[[1]]) == "~") {
    formula_slots(x[[2]])
  } else if (length(x) == 3L && deparse(x[[1]]) == "~") {
    list(formula_slots(x[[2]]), formula_slots(x[[3]]))
  } else if (
    length(x) > 1 && is.name(x[[1]]) && !deparse(x[[1]]) %in% c("+", "|")
  ) {
    list(x)
  } else if (length(x) == 3L && deparse(x[[1]]) %in% stop_binops) {
    list(x)
  } else if (length(x) <= 2L) {
    list(x)
  } else {
    list(formula_slots(x[[2]]), formula_slots(x[[3]]))
  }
}


as_formula <- function(x, ...) {
  UseMethod("as_formula", x)
}

#' @export
as_formula.formula <- function(x, ...) {
  x
}


#' @export
as_formula.call <- function(x, ...) {
  res <- ~x
  # environment(res) <- env
  res[[2]] <- x[[2]]
  res
}

#' @export
as_formula.name <- function(x, env = parent.frame(), ...) {
  res <- ~x
  environment(res) <- env
  res[[2]] <- x
  res
}

f_formula_slots <- function(x, env = parent.frame()) {
  if (is.null(x)) {
    return(x)
  }
  if (length(x) == 1L) {
    return(as_formula(x, env))
  }
  if (x[[1]] == as.symbol("~")) {
    return(list(
      f_formula_slots(rlang::f_lhs(x), env),
      f_formula_slots(rlang::f_rhs(x), env)
    ))
  }
  if (x[[1]] == as.symbol("(")) {
    res <- ~x
    res[[2]] <- x[[2]] # strip parens
    environment(res) <- env
    return(res)
  }
  if (length(x) == 2L) {
    res <- ~x
    res[[2]] <- x # leave call as is
    environment(res) <- env
    return(res)
  }
  # if we get here, we should have a binary operation
  return(list(
    f_formula_slots(rlang::f_lhs(x), env),
    f_formula_slots(rlang::f_rhs(x), env)
  ))
}

# add quotes to character elements of list x and returns a vector of character
.quotify <- function(x) {
  if (is_null(x)) {
    return("NULL")
  }
  x <- if (rlang::is_character(x)) paste0('"', x, '"') else x
  x <- if (is.name(x)) as.character(x) else x
  x <- if (rlang::is_character(x)) x else format(x)
  x
}


.default_value <- function(x) {
  sapply(
    x,
    function(x) if (is.symbol(x)) "" else paste0(" = ", .quotify(x))
  )
}

aes_from_qdots <- function(qdots, mapping = aes()) {
  if (length(qdots) > 0) {
    # proceed backwards through list so that removing items doesn't mess up indexing
    for (i in length(qdots):1L) {
      if (
        rlang::is_formula(f_rhs(qdots[[i]])) &&
          length(rlang::f_rhs(qdots[[i]])) == 2L
      ) {
        mapping[[names(qdots)[i]]] <- rlang::f_rhs(qdots[[i]])[[2]]
        qdots[[i]] <- NULL
      }
    }
  }
  list(
    mapping = do.call(aes, mapping),
    qdots = qdots
  )
}

emit_help <- function(
  function_name,
  aes_form,
  extras = list(),
  note = NULL,
  geom,
  stat = "identity",
  position = "identity"
) {
  message_text <- ""
  if (any(sapply(aes_form, is.null))) {
    message_text <-
      paste0(message_text, function_name, "() does not require a formula.")
  } else {
    message_text <-
      paste0(
        message_text,
        function_name,
        "() uses \n    * a formula with shape ",
        paste(sapply(aes_form, format), collapse = " or "),
        "."
      )
  }
  if (is.character(geom)) {
    message_text <- paste(message_text, "\n    * geom: ", geom)
  }
  if (is.character(stat) && stat != "identity") {
    message_text <- paste(message_text, "\n    * stat: ", stat)
  }
  if (is.character(position) && position != "identity") {
    message_text <- paste(message_text, "\n    * position: ", position)
  }

  if (length(extras) > 0) {
    message_text <-
      paste(
        message_text,
        "\n    * key attributes: ",
        paste(
          strwrap(
            width = options("width")[[1]] - 20,
            simplify = TRUE,
            paste(
              names(extras),
              .default_value(extras),
              collapse = ", ",
              sep = ""
            ),
            initial = "",
            prefix = "\n                   "
          ),
          collapse = "",
          sep = ""
        )
      )
  }
  if (!is.null(note)) {
    message_text <- paste(message_text, "\nNote: ", note)
  }
  message_text <- paste0(
    message_text,
    "\n\nFor more information, try ?",
    function_name
  )

  message(message_text)

  return(invisible(NULL))
}


formula_split <- function(formula) {
  # split A | B into formula <- A; condition <- B
  fs <-
    stringr::str_split(deparse(formula), "\\|")[[1]]
  # try to split, else leave formula unchanged and set condition to NULL
  if (
    (length(fs) != 2) ||
      !tryCatch(
        {
          formula_string <- fs[1]
          condition_string <- fs[2]
          if (!grepl("~", condition_string)) {
            condition_string <- paste0("~", condition_string)
            condition <- as.formula(
              condition_string,
              env = environment(formula)
            )
            facet_type <- "facet_wrap"
          } else {
            condition <- as.formula(
              condition_string,
              env = environment(formula)
            )
            facet_type <- "facet_grid"
          }
          formula <- as.formula(formula_string, env = environment(formula))
          TRUE
        },
        error = function(e) {
          warning(e)
          FALSE
        }
      )
  ) {
    condition <- NULL
    facet_type <- "none"
  }
  list(formula = formula, condition = condition, facet_type = facet_type)
}

gf_ingredients <-
  function(
    formula = NULL,
    data = NULL,
    extras = list(),
    aes_form = y ~ x,
    aesthetics = aes(),
    gg_object = NULL,
    envir = NULL,
    role_overrides = list()
  ) {
    if (is.null(envir)) {
      if (inherits(formula, "formula")) envir <- environment(formula)
    }
    # split A | B into formula <- A; condition <- B
    fs <- formula_split(formula)

    var_names <-
      if (is.null(data)) {
        if (is.null(gg_object)) {
          character(0)
        } else {
          names(gg_object$data)
        }
      } else {
        names(data)
      }

    # create mapping -- assume ggplot2 version >= 3.0
    aes_df <-
      formula_to_df(fs[["formula"]], var_names, aes_form = aes_form)

    mapped_list <- as.list(aes_df[["expr"]][aes_df$map])
    names(mapped_list) <- aes_df[["role"]][aes_df$map]
    # . is placeholder for "no aesthetic mapping", so remove the dots
    mapped_list[mapped_list == "."] <- NULL

    # `role_overrides` comes from named arguments like `x = ~var1` (see
    # `extract_role_formula_args()`); these take priority over anything
    # supplied via the formula for the same role (a warning is emitted by
    # the caller when both are present), and can also supply roles when no
    # formula was given at all.
    if (length(role_overrides) > 0) {
      mapped_list <- modifyList(mapped_list, role_overrides)
    }

    mapping <- modifyList(aesthetics, do.call(aes, mapped_list))
    mapping <- aes_env(mapping, envir)
    mapping <- remove_dot_from_mapping(mapping)

    set_list <- as.list(aes_df[["expr"]][!aes_df$map])
    names(set_list) <- aes_df[["role"]][!aes_df$map]
    if (length(role_overrides) > 0) {
      set_list[names(role_overrides)] <- NULL
    }
    set_list <- modifyList(extras, set_list)

    res <-
      list(
        data = data,
        mapping = mapping,
        setting = set_list,
        facet = if (is.null(fs[["condition"]])) {
          NULL
        } else {
          switch(
            fs[["facet_type"]],
            "facet_wrap" = do.call(
              fs[["facet_type"]],
              list(facets = fs[["condition"]])
            ),
            "facet_grid" = do.call(
              fs[["facet_type"]],
              list(rows = fs[["condition"]])
            )
          )
        },
        params = modifyList(set_list, extras)
      )
    if (identical(data, NA)) {
      res$data <-
        do.call(
          data.frame,
          c(
            lapply(res[["mapping"]], rlang::get_expr),
            res[["setting"]],
            list(stringsAsFactors = FALSE)
          )
        )
      res$params[names(res$mapping)] <- NULL # remove mapped attributes
      aes_list <- as.list(intersect(names(res$data), names(res$mapping)))
      names(aes_list) <- aes_list
      # tidy-eval replacement for the deprecated/removed `aes_string()`:
      # build aes(role = role, ...) from symbols rather than from strings
      res$mapping <- do.call(aes, lapply(aes_list, as.name))
      res$setting <- as.list(res$data)[names(res$setting)]
      res$params[names(res$setting)] <- res$setting
    }
    res
  }


# remove item -> . mappings
remove_dot_from_mapping <- function(mapping) {
  for (item in rev(seq_along(mapping))) {
    if (identical(rlang::get_expr(mapping[[item]]), quote(.))) {
      mapping[[item]] <- NULL
    }
  }
  mapping
}

formula_shape <- function(x) {
  if (is.null(x)) {
    return(integer(0))
  }
  if (length(x) == 1L) {
    return(0L)
  }
  if (x[[1]] == as.symbol("~")) {
    return(c(
      length(x) - 1,
      formula_shape(rlang::f_lhs(x)),
      formula_shape(rlang::f_rhs(x))
    ))
  }
  if (x[[1]] == as.symbol("(")) {
    return(0L)
  }
  # this is covered by fall through below now
  # if (length(x) == 2L) {
  #   return(0L)
  # }

  if (length(x) == 3 && as.character(x[[1]]) %in% c('+')) {
    # treat as binary op and call recusively on lhs and rhs
    return(c(
      2L,
      formula_shape(rlang::f_lhs(x)),
      formula_shape(rlang::f_rhs(x))
    ))
  }

  return(0)
}

# @param formula a formula describing aesthetics
# @param aes_form a list of template formulas (or a single formula)
# @param value a logical indicating whether the first matching value should be returend
#   rather than a vector of logicals
# @param unmatched value of retun if value = TRUE and there are no matches.

formula_match <-
  function(formula, aes_form = y ~ x, value = FALSE, unmatched = NULL) {
    if (!is.list(aes_form)) {
      aes_form <- list(aes_form)
    }
    user_shape <- formula_shape(formula_split(formula)$formula)
    shapes <- lapply(aes_form, formula_shape)
    bools <- sapply(shapes, function(s) identical(s, user_shape))
    if (value) {
      if (any(bools)) {
        aes_form[[which.max(bools)]]
      } else {
        unmatched
      }
    } else {
      bools
    }
  }

formula_to_df <- function(
  formula = NULL,
  data_names = character(0),
  aes_form = y ~ x
) {
  if (is.null(formula)) {
    return(data.frame(
      role = character(0),
      expr = character(0),
      map = logical(0)
    ))
  }
  get_leaf <- function(x) {
    # if there are any special cases, add them here
    return(x)
  }

  parts <- formula_slots(formula) |>
    rapply(get_leaf, how = "replace") |>
    unlist()
  aes_names <- formula_slots(aes_form) |>
    rapply(get_leaf, how = "replace") |>
    unlist()

  parts_list <- parts

  aes_names <- all.vars(aes_form)
  names(parts_list) <- head(aes_names, length(parts_list))

  if (length(parts_list) > length(aes_names)) {
    stop(
      "Formula too large.  I'm looking for ",
      format(aes_form),
      call. = FALSE
    )
  }
  if (length(parts_list) < length(aes_names)) {
    stop(
      "Formula too small.  I'm looking for ",
      format(aes_form),
      call. = FALSE
    )
  }

  res <-
    tibble::tibble(
      role = names(parts_list),
      expr = unlist(parts_list),
      map = unlist(parts_list) %in% c(data_names) | role %in% aes_names
    )
  row.names(res) <- NULL
  res
}

df_to_aesthetics <- function(formula_df, data_names = NULL, prefix = "") {
  aes_substr <-
    if (is.null(data_names) || nrow(formula_df) == 0) {
      ""
    } else {
      paste0(
        "aes(",
        with(
          subset(formula_df, formula_df$map),
          paste(role, expr, sep = " = ", collapse = ", ")
        ),
        ")",
        ifelse(any(!formula_df$map), ", ", "") # prepare for more args
      )
    }
  S <- paste0(
    "",
    prefix,
    ifelse(nchar(prefix) > 0, ", ", ""),
    aes_substr,
    with(
      subset(formula_df, !formula_df$map),
      paste(role, expr, sep = " = ", collapse = ", ")
    ),
    ""
  )
  S
}


formula_to_aesthetics <- function(
  formula,
  data_names = NULL,
  prefix = "",
  aes_form = y ~ x
) {
  df <- formula_to_df(formula, data_names, aes_form = aes_form)
  df_to_aesthetics(df, data_names = data_names, prefix = prefix)
}

# pairs_in_formula() was here.  but we don't use formulas that way anymore,
# so it has been removed.
