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
NA


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
#' @param pre code to run as a "pre-process".
#' @param aes_form A single formula or a list of formulas specifying
#'   how attributes are inferred from the formula.  Use `NULL` if the
#'   function may be used without a formula.
#' @param extras An alist of additional arguments (potentially with defaults)
#' @param note A note to add to the quick help.
#' @param aesthetics Additional aesthetics (typically created using
#'   [`ggplot2::aes()`]) set rather than inferred from formula.
#'   `gf_dhistogram()` uses this to set the y aesthetic to `stat(density)`,
#'   for example.
#' @param inherit.aes A logical indicating whether aesthetics should be
#'   inherited from prior layers or a vector of character names of aesthetics
#'   to inherit.
#' @param check.aes A logical indicating whether a warning should be emited
#'   when aesthetics provided don't match what is expected.
#' @param data A data frame or `NULL` or `NA`.
#' @param layer_fun The function used to create the layer or a quosure that evaluates
#'   to such a function.
#' @param ... Additional arguments.
#' @return A function.
#' @export

layer_factory <-
  function(
    geom = "point",
    position = "identity",
    stat = "identity",
    pre = {},
    aes_form = y ~ x,
    extras = alist(),
    note = NULL,
    aesthetics = aes(),
    inherit.aes = TRUE,
    check.aes = TRUE,
    data = NULL,
    layer_fun = quo(ggplot2::layer),
    ...) {

  pre <- substitute(pre)

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
      xlab, ylab, title, subtitle, caption,
      show.legend, function_name, inherit,
      environment = parent.frame(),
      ...) {

      # evaluate quosures
      geom      = rlang::eval_tidy(geom)
      stat      = rlang::eval_tidy(stat)
      position  = rlang::eval_tidy(position)
      layer_fun = rlang::eval_tidy(layer_fun)

      function_name <- as.character(match.call()[1])
      orig_args <- as.list(match.call())[-1]

      eval(pre)  # pre will be placed in the function environment so it is available here

      # make sure we have a list of formulas here
      if (!is.list(aes_form)) aes_form <- list(aes_form)

      # show help if requested or if there are no arguments to the function
      if (is.null(show.help)) { show.help <- length(orig_args) < 1 }

      if (show.help) {
        emit_help(
          function_name = function_name,
          aes_form, extras, note,
          geom = geom, stat = stat, position = position
        )
        return(invisible(NULL))
      }

      # figure out what sort of object is first and adjust args as required
      if (inherits(object, "formula")) {
        gformula <- object
        object <- NULL
      }

      if (inherits(object, "data.frame")) {
        data <- object
        object <- NULL
      }

      # not sure whether we should use the environment recorded in object or not,
      # but this is how/where to do it.

      # if (inherits(object, "gg")) {
      #   environment <- object$plot_env
      # }

      # convert y ~ 1 into ~ y if a 1-sided formula is an option and 2-sided is not
      gformula <- response2explanatory(gformula, aes_form)

      # find matching formula shape
      aes_form <-
        first_matching_formula(
          gformula, aes_form, object, inherit, inherited.aes, function_name)

      ############# create extras_and_dots ############
      # collect arguments
      #  * remove those that are "missing"
      #  * remove function args not for layer, stat, or geom

      stat_formals <- grab_formals(stat, "stat")
      geom_formals <- grab_formals(geom, "geom")
      extras_and_dots <-
        create_extras_and_dots(
          args = orig_args, formals = formals(),
          stat_formals = stat_formals, geom_formals = geom_formals,
          extras = extras, env = environment)
      # turn character position into a position object using any available arguments
      if (is.character(position)) {
        position_fun <- paste0("position_", position)
        pdots <-
          extras_and_dots[intersect(names(extras_and_dots), names(formals(position_fun)))]
        position <- do.call(position_fun, pdots)
      }

      # remove symbols from extras_and_dots (why?)
      if (length(extras_and_dots) > 0) {
        extras_and_dots <-
          extras_and_dots[sapply(extras_and_dots, function(x) !is.symbol(x))]
      }

      add <- inherits(object, c("gg", "ggplot"))

      # add in selected additional aesthetics -- partial inheritance
      if (add) {
        for (aes.name in inherited.aes) {
          aesthetics[[aes.name]] <- object$mapping[[aes.name]]
        }
      }

      # look for arguments of the form argument = ~ something and turn them
      # into aesthetics
      if (length(extras_and_dots) > 0) {
        w <- which(
          sapply(extras_and_dots, function(x) {
            rlang::is_formula(x) && length(x) == 2L
          })
        )
        aesthetics <- add_aes(aesthetics, extras_and_dots[w], environment)
        extras_and_dots[w] <- NULL
      }
      ingredients <-
        gf_ingredients(
          formula = gformula, data = data,
          gg_object = object,
          extras = extras_and_dots,
          aes_form = aes_form,
          aesthetics = aesthetics,
          envir = environment
        )

      # layer has a params argument, geoms and stats do not
      if ("params" %in% names(formals(layer_fun))) {
        layer_args <-
          list(
            geom = geom, stat = stat,
            data = ingredients[["data"]],
            mapping = ingredients[["mapping"]],
            position = position,
            params = remove_from_list(ingredients[["params"]], "inherit"),
            check.aes = check.aes, check.param = FALSE,
            show.legend = show.legend,
            inherit.aes = inherit
          )
      } else {
        layer_args <-
          c(
            list(
              data = ingredients[["data"]],
              mapping = ingredients[["mapping"]],
              show.legend = show.legend,
              geom = geom, stat = stat
              # arguments below are not used by geom_abline() and friends, so don't include them.
              # check.aes = TRUE, check.param = FALSE,
              # inherit.aes = inherit
            ),
            # these become regular arguments for other layer functions
            remove_from_list(ingredients[["params"]], "inherit")
          )
      }

      # If no ..., be sure to remove things not in the formals list
      if (! "..." %in% names(formals(layer_fun))) {
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
      if (length(layer_args[['mapping']]) < 1) {
        layer_args[['mapping']] <- NULL
        layer_args[['data']] <- NULL
      }

      new_layer <- do.call(layer_fun, layer_args, envir = environment)

      if (is.null(ingredients[["facet"]])) {
        if (add) {
          p <- object + new_layer
        } else {
          p <-
            do.call(
              ggplot,
              list(
                data = ingredients$data,
                mapping = ingredients[["mapping"]]
              ),
              envir = environment
            ) +
            new_layer
        }
      } else {
        if (add) {
          p <- object + new_layer + ingredients[["facet"]]
        } else {
          p <-
            do.call(
              ggplot,
              list(
                data = ingredients$data,
                mapping = ingredients[["mapping"]]
              ),
              envir = environment
            ) +
            new_layer +
            ingredients[["facet"]]
        }
      }

      if (! rlang::is_missing(ylab)) {
        p <- p + ggplot2::ylab(ylab)
      }
      if (! rlang::is_missing(xlab)) {
        p <- p + ggplot2::xlab(xlab)
      }
      if (! rlang::is_missing(title)) {
        p <- p + ggplot2::labs(title = title)
      }
      if (! rlang::is_missing(subtitle)) {
        p <- p + ggplot2::labs(subtitle = subtitle)
      }
      if (! rlang::is_missing(caption)) {
        p <- p + ggplot2::labs(caption = caption)
      }
      class(p) <- unique(c("gf_ggplot", class(p)))
      p
    }
  formals(res) <-
    c(
      create_formals(
        extras, layer_fun = layer_fun, geom = geom, stat = stat,
        position = position, inherit.aes = inherit.aes),
      list(...))

  assign("inherit.aes", inherit.aes, environment(res))
  assign("check.aes", check.aes, environment(res))
  assign("pre", pre, environment(res))
  assign("extras", extras, environment(res))
  res
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
  new <- do.call(aes, new) %>% aes_env(envir)
  res <- modifyList(mapping, new)
  res
}


# grab formuls from a stat or geom (or similar)

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

create_formals <-
  function(extras = list(), layer_fun,
           geom, stat, position, inherit.aes = TRUE)
  {
    layer_fun <- rlang::eval_tidy(layer_fun)
    res <-
      c(
        list(object = NULL, gformula = NULL, data = NULL),
        alist(... = ),
        extras[setdiff(names(extras),
                       c("xlab", "ylab", "title", "subtitle", "caption"))],
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
          geom = geom, stat = stat, position = position,
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
  function(args, formals, stat_formals = list(), geom_formals = list(),
           extras = list(), env) {
    extras_and_dots <- modifyList(formals, args)
    # to avoid object = formula becoming an aesthetic
    extras_and_dots[["object"]] <- NULL
    # remove missing -- is there a better way to determine missing?
    extras_and_dots <-
      extras_and_dots[!sapply(
        extras_and_dots,
        function(x) is.symbol(x) && identical(as.character(x), "")
      )]
    # remove args not used by stat or geom and not in extras
    for (n in setdiff(
      names(formals),
      union(
        union(
          stat_formals,
          geom_formals
        ),
        names(extras)
      )
    )
    ) {
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

first_matching_formula <-
  function(gformula, aes_form, object, inherit, inherited.aes, function_name) {
    fmatches <- formula_match(gformula, aes_form = aes_form)

    if (!any(fmatches)) {
      if (inherits(object, "gg") && (inherit || length(inherited.aes) > 0)) {
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
      ! is.null(aes_form) &&
      ( ! any(sapply(aes_form, function(f) length(f) == 2L)) ||
          any(sapply(aes_form, function(f) length(f) == 3L)) )
    ) {
      return(formula)
    }

    if (length(formula) == 3L && isTRUE(formula[[3]] == 1)) {
      formula[[3]] <- formula[[2]]
      # can remove either slot 2 or slot 3 here to get 1-sided formula
      formula[[2]] <- NULL
    } else if (length(formula) == 3L &&
               length(formula[[3]]) == 3L &&
               isTRUE(formula[[3]][[1]] == as.name("|")) &&
               isTRUE(formula[[3]][[2]] == 1L)) {
      formula[[3]][[2]] <- formula[[2]]
      formula[[2]] <- NULL
    } else if (length(formula) == 3L && rlang::is_formula(formula[[2]])) {
      formula[[2]] <- response2explanatory(formula[[2]])
    }
    formula
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
  } else if (length(x) > 1 && is.name(x[[1]]) && !deparse(x[[1]]) %in% c("+", "|")) {
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

as_formula.formula <- function(x, ...) {
  x
}


as_formula.call <- function(x, ...) {
  res <- ~ x
  # environment(res) <- env
  res[[2]] <- x[[2]]
  res
}

as_formula.name <- function(x, env = parent.frame(), ...) {
  res <- ~ x
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
    return(list(f_formula_slots(rlang::f_lhs(x), env), f_formula_slots(rlang::f_rhs(x), env)))
  }
  if (x[[1]] == as.symbol("(")) {
    res <- ~ x
    res[[2]] <- x[[2]]  # strip parens
    environment(res) <- env
    return(res)
  }
  if (length(x) == 2L) {
    res <- ~ x
    res[[2]] <- x  # leave call as is
    environment(res) <- env
    return(res)
  }
  # if we get here, we should have a binary operation
  return(list(f_formula_slots(rlang::f_lhs(x), env), f_formula_slots(rlang::f_rhs(x), env)))
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
      if (rlang::is_formula(f_rhs(qdots[[i]])) && length(rlang::f_rhs(qdots[[i]])) == 2L) {
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

emit_help <- function(function_name, aes_form, extras = list(), note = NULL,
                      geom, stat = "identity", position = "identity") {
  message_text <- ""
  if (any(sapply(aes_form, is.null))) {
    message_text <-
      paste0(message_text, function_name, "() does not require a formula.")
  } else {
    message_text <-
      paste0(
        message_text, function_name, "() uses \n    * a formula with shape ",
        paste(sapply(aes_form, format), collapse = " or "), "."
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
            width = options("width")[[1]] - 20, simplify = TRUE,
            paste(
              names(extras), .default_value(extras),
              collapse = ", ", sep = ""
            ),
            initial = "",
            prefix = "\n                   "
          ),
          collapse = "", sep = ""
        )
      )
  }
  if (!is.null(note)) {
    message_text <- paste(message_text, "\nNote: ", note)
  }
  message_text <- paste0(message_text, "\n\nFor more information, try ?", function_name)

  message(message_text)

  return(invisible(NULL))
}


formula_split <- function(formula) {
  # split A | B into formula <- A; condition <- B
  fs <-
    stringr::str_split(deparse(formula), "\\|")[[1]]
  # try to split, else leave formula unchanged and set condition to NULL
  if ((length(fs) != 2) ||
    !tryCatch({
      formula_string <- fs[1]
      condition_string <- fs[2]
      if (!grepl("~", condition_string)) {
        condition_string <- paste0("~", condition_string)
        condition <- as.formula(condition_string, env = environment(formula))
        facet_type <- "facet_wrap"
      } else {
        condition <- as.formula(condition_string, env = environment(formula))
        facet_type <- "facet_grid"
      }
      formula <- as.formula(formula_string, env = environment(formula))
      TRUE
    }, error = function(e) {
      warning(e)
      FALSE
    })
  ) {
    condition <- NULL
    facet_type <- "none"
  }
  list(formula = formula, condition = condition, facet_type = facet_type)
}

#  #' @export
#  match_call <- function(n = 1L, include_missing = FALSE) {
#    call <- evalq(match.call(), parent.frame(n))
#    formals <- evalq(formals(), parent.frame(n))
#
#    for(i in setdiff(names(formals), names(call))) {
#      if (include_missing || !rlang::is_missing(formals[[i]])) {
#        call[i] <- list( formals[[i]] )
#      }
#    }
#    match.call(sys.function(sys.parent()), call)
#  }
#
#  #' @export
#  have_arg <-
#    function(arg, n = 1L,
#             call = evalq(match_call(include_missing = FALSE), parent.frame(n))
#    ) {
#    arg %in% names(call)
#  }

gf_ingredients <-
  function(formula = NULL, data = NULL,
             extras = list(),
             aes_form = y ~ x,
             aesthetics = aes(),
             gg_object = NULL,
             envir = NULL) {

    if (is.null(envir)) {
      if(inherits(formula, "formula")) envir <- environment(formula)
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

    mapping <- modifyList(aesthetics, do.call(aes, mapped_list))  # was aes_string
    mapping <- aes_env(mapping, envir)
    mapping <- remove_dot_from_mapping(mapping)

    set_list <- as.list(aes_df[["expr"]][!aes_df$map])
    names(set_list) <- aes_df[["role"]][!aes_df$map]
    set_list <- modifyList(extras, set_list)


    res <-
      list(
        data = data,
        mapping = mapping,
        setting = set_list,
        facet =
          if (is.null(fs[["condition"]])) {
            NULL
          } else {
            do.call(fs[["facet_type"]], list(facets = fs[["condition"]]))
          },
        params = modifyList(set_list, extras)
      )
    if (identical(data, NA)) {
      res$data <-
        do.call(
          data.frame,
          c(
            lapply(res[["mapping"]], rlang::get_expr), res[["setting"]],
            list(stringsAsFactors = FALSE)
          )
        )
      res$params[names(res$mapping)] <- NULL # remove mapped attributes
      aes_list <- as.list(intersect(names(res$data), names(res$mapping)))
      names(aes_list) <- aes_list
      res$mapping <- do.call(aes_string, aes_list)
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

formula_shape0 <- function(x) {
  if (length(x) < 2) {
    return(0)
  }
  arity <- length(x) - 1
  if (as.character(x[[1]]) %in% c("(")) {
    return(0)
  }
  if (as.character(x[[1]]) %in% c(":", "(")) {
    return(0) # was -1 when supporting attribute:value
  }
  # stop if we hit a name that isn't + or ~
  if (is.name(x[[1]]) && !as.character(x[[1]]) %in% c("+", "~")) {
    return(0)
  }

  # if (as.character(x[[1]]) %in% c("|")){
  #   return(formula_shape0(x[[2]]))
  # }

  if (arity == 1L) {
    right_shape0 <- formula_shape0(x[[2]])
    arity <- arity - (right_shape0[1] < 0)
    if (arity == 0) {
      return(arity)
    }
    return(right_shape0)
  }
  if (arity == 2L) {
    right_shape0 <- formula_shape0(x[[3]])
    left_shape0 <- formula_shape0(x[[2]])
    if (left_shape0[1] < 0 && right_shape0 < 0) {
      return(0)
    }
    if (left_shape0[1] < 0) {
      if (right_shape0[1] == 1L) {
        return(right_shape0[-1])
      }
      return(right_shape0)
    }
    if (right_shape0[1] < 0) {
      if (left_shape0[1] == 1L) {
        return(left_shape0[-1])
      }
      return(left_shape0)
    }
    return(c(2, left_shape0, right_shape0))
  }
  stop("Bug: problems determining formula shape (0).")

  c(length(x) - 1, unlist(sapply(x[-1], formula_shape0)))
  # list(length(x) - 1, lapply(x[-1], formula_shape0))
}


formula_shape <- function(x) {
  if (is.null(x)) {
    return(integer(0))
  }
  if (length(x) == 1L) {
    return(0L)
  }
  if (x[[1]] == as.symbol("~")) {
    return(c( length(x) - 1, formula_shape(rlang::f_lhs(x)), formula_shape(rlang::f_rhs(x))))
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
    return(c(2L, formula_shape(rlang::f_lhs(x)), formula_shape(rlang::f_rhs(x))))
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

formula_to_df <- function(formula = NULL, data_names = character(0),
                          aes_form = y ~ x) {
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

  parts <- formula_slots(formula) %>%
    rapply(get_leaf, how = "replace") %>%
    unlist()
  aes_names <- formula_slots(aes_form) %>%
    rapply(get_leaf, how = "replace") %>%
    unlist()

  # trim leading/trailing blanks and turn `some name` into "`some name`"
  # parts <- gsub("^\\s+|\\s+$", "", parts)

  # # split into pairs/nonpairs
  # pairs <- parts[grepl(":+", parts)]
  # nonpairs <- parts[ !grepl(":+", parts)]

  # ## !! turning off support for attribute:value !!
  # pairs <- parts[FALSE]
  # nonpairs <- parts[TRUE]

  # pair_list <- list()
  # mapped_pairs <- character(0)
  # for (pair in pairs) {
  #   this_pair <- stringr::str_split(pair, ":+", n = 2)[[1]]
  #   pair_list[this_pair[1]] <- this_pair[2]
  #   if (stringr::str_match(pair, ":+") == "::") {
  #     mapped_pairs <- c(mapped_pairs, this_pair[1])
  #   }
  # }

  parts_list <- parts # nonpairs

  # remove items specified explicitly
  aes_names <- all.vars(aes_form)  # setdiff(all.vars(aes_form), names(pair_list))
  names(parts_list) <- head(aes_names, length(parts_list))

  if (length(parts_list) > length(aes_names)) {
    stop("Formula too large.  I'm looking for ", format(aes_form),
      call. = FALSE
    )
  }
  if (length(parts_list) < length(aes_names)) {
    stop("Formula too small.  I'm looking for ", format(aes_form),
      call. = FALSE
    )
  }

  # res <- c(parts_list, pair_list)

  res <-
    tibble::tibble(
      role = names(parts_list),
      expr = unlist(parts_list),
      map = unlist(parts_list) %in% c(data_names) | role %in% aes_names #  | role %in% mapped_pairs
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
    "", prefix,
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


formula_to_aesthetics <- function(formula,
                                  data_names = NULL,
                                  prefix = "",
                                  aes_form = y ~ x) {
  df <- formula_to_df(formula, data_names, aes_form = aes_form)
  df_to_aesthetics(df, data_names = data_names, prefix = prefix)
}

# pairs_in_formula() was here.  but we don't use formulas that way anymore,
# so it has been removed.
