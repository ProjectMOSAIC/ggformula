#' Render interactive ggformula plots
#'
#' Converts a ggplot object with interactive elements into an interactive
#' HTML widget using ggiraph. This function is a wrapper around
#' [ggiraph::girafe()] tailored for ggformula interactive plots.
#'
#' @param ggobj A ggplot object, typically created with a `gf_*_interactive()`
#'   function.
#' @param code R code to execute. This parameter is optional and rarely used
#'   in typical workflows.
#' @param ... Additional arguments passed to [ggiraph::girafe()], such as
#'   `width_svg`, `height_svg`, `options`, etc.
#'
#' @return An interactive HTML widget that can be displayed in RStudio Viewer,
#'   R Markdown documents, or Shiny applications.
#'
#' @details
#' This function takes a ggplot object containing interactive elements
#' (created with `gf_*_interactive()` functions) and renders it as an
#' interactive plot. The resulting widget supports features like tooltips,
#' hover effects, and clickable elements.
#'
#' @examples
#' library(ggformula)
#'
#' # Basic interactive plot
#' gf_point_interactive(mpg ~ wt, data = mtcars,
#'                     tooltip = ~ paste("Car:", rownames(mtcars))) |>
#'   gf_girafe()
#'
#' # With custom sizing
#' gf_histogram_interactive(~ mpg, data = mtcars,
#'                         tooltip = ~ paste("Count:", after_stat(count))) |>
#'   gf_girafe(width_svg = 8, height_svg = 6)
#'
#' @seealso [ggiraph::girafe()], [gf_point_interactive()], and other
#'   `gf_*_interactive()` functions
#' @export

gf_girafe <- function(ggobj, code, ...) {

  if (missing(code)) {
    return(ggiraph::girafe(ggobj = ggobj, ...))
  }
  if (missing(ggobj)) {
    return(ggiraph::girafe(code = code, ...))
  }
  ggiraph::girafe(code = code, ggobj = ggobj, ...)
}
geoms <- apropos('geom_.*_interactive')

# geoms <- c('geom_contour_filled_interactive')

skipped <- created_funs <- character(0)

for (g in geoms) {
  gf <- sub("geom_", "gf_", g)
  res <- assign(gf, interactive_layer_factory(g))
  if (is.null(res)) {
    skipped <- c(skipped, g)
    next
  }
  assign(gf, res)
  created_funs <- c(created_funs, gf)
}

cli::cli_h3("Skipped functions:")
cli::cli_ul(skipped)
cli::cli_h3("Created functions:")
cli::cli_ul(created_funs)


#' Interactive facets
#'
#' To create interactive facets, use `gf_facet_wrap_interactive()` or
#' `gf_facet_grid_interactive()` and use [gf_labeller_interactive()]
#' to create the `labeller`.
#'
#' @name interactive_facets
#' @param object a ggplot graphic
#' @param labeller a labeller created using [gf_labeller_interactive()]
#' @param interactive_on one of "text" (strip text is made interactive),
#'   "rect" (strip rectangles are made interactive), or "both". Can be abbreviated.
#' @param ... additional arguments passed to `labeller` and to the
#'   ggplot2 faceting function ([ggplot2::facet_wrap()] or [ggplot2::facet_grid()]).
#' @seealso [ggplot2::facet_wrap()]
#' @seealso [ggplot2::facet_grid()]
#' @seealso [gf_labeller_interactive()]
#' @examples
#'
#' mosaicData::Weather |>
#' gf_line_interactive(
#'   high_temp ~ date,
#'   color = ~city,
#'   show.legend = FALSE,
#'   tooltip = ~city,
#'   data_id = ~city
#' ) |>
#'   gf_facet_wrap_interactive(
#'     ~year,
#'     ncol = 1,
#'     scales = "free_x",
#'     labeller = gf_labeller_interactive(
#'       data_id = ~year,
#'       tooltip = ~ glue::glue("This is the year {year}")
#'     )
#'   ) |>
#'   gf_theme(theme_facets_interactive()) |>
#'   gf_girafe(
#'     options = list(
#'       opts_hover_inv(css = "opacity:0.2;"),
#'       opts_hover(css = "stroke-width:2;", nearest_distance = 40),
#'       opts_tooltip(use_cursor_pos = FALSE, offx = 0, offy = -30)
#'     )
#'   )
#'
#' @export
gf_facet_wrap_interactive <-
  function(object, ..., labeller, interactive_on = c("text", "rect", "both")) {
    qdots <- rlang::enquos(...)
    interactive_on <- match.arg(interactive_on)
    object +
      ggiraph::facet_wrap_interactive(
        ...,
        labeller = labeller,
        interactive_on = interactive_on
      )
  }

#' @name interactive_facets
#' @export
gf_facet_grid_interactive <-
  function(object, ..., labeller, interactive_on = c("text", "rect", "both")) {
    interactive_on <- match.arg(interactive_on)
    object +
      ggiraph::facet_grid_interactive(
        ...,
        labeller = labeller,
        interactive_on = interactive_on
      )
  }

#' Create interactive labeller
#'
#' @param ... Arguments of the form `name = ~ expr` are used to create
#'   `.mapping` (if `.mapping` is missing).  Other arguments (or all arguments
#'    if `.mapping` is not missing) are passed through to [ggplot2::labeller()].
#' @param .mapping An aesthetic mapping as could be created with
#'   [ggplot2::aes()] or [ggplot2::aes_()].  If missing  (the typical use case),
#'   `.mapping` is created from the arguments in `...` that have the form
#'   `name = ~ expr`.
#'
#' @returns a labeller
#'
#' @export
#'
gf_labeller_interactive <- function(..., .mapping) {
  qdots <- rlang::enquos(...)
  aes <- aes_from_qdots(qdots)
  if (missing(.mapping)) {
    .mapping <- aes$mapping
    qdots <- aes$qdots
  }

  ggiraph::labeller_interactive(.mapping = .mapping, !!!qdots)
}


##########################################################################
## Functions copied from ggiraph because they are not (yet) exported there.

ggiraph_layer_interactive <-
  function (layer_func, ..., interactive_geom = NULL, extra_interactive_params = NULL)
  {
    args <- rlang::list2(...)
    interactive_mapping <- NULL
    interactive_params <- NULL
    index <- purrr::detect_index(args, function(x) {
      inherits(x, "uneval")
    })
    ipar <- ggiraph_get_default_ipar(extra_interactive_params)
    if (index > 0 && ggiraph_has_interactive_attrs(args[[index]], ipar = ipar)) {
      interactive_mapping <- ggiraph_get_interactive_attrs(args[[index]],
                                                           ipar = ipar)
      args[[index]] <- ggiraph_remove_interactive_attrs(args[[index]],
                                                        ipar = ipar)
    }
    if (ggiraph_has_interactive_attrs(args, ipar = ipar)) {
      interactive_params <- ggiraph_get_interactive_attrs(args, ipar = ipar)
      args <- ggiraph_remove_interactive_attrs(args, ipar = ipar)
    }
    result <- do.call(layer_func, args)
    layer_ <- NULL
    if (is.list(result)) {
      index <- purrr::detect_index(result, function(x) {
        inherits(x, "LayerInstance")
      })
      if (index > 0) {
        layer_ <- result[[index]]
      }
    }
    else if (inherits(result, "LayerInstance")) {
      layer_ <- result
    }
    if (!is.null(layer_)) {
      if (is.null(interactive_geom)) {
        interactive_geom <- ggiraph_find_interactive_class(layer_$geom)
      }
      layer_$geom <- interactive_geom
      if (!is.null(interactive_mapping)) {
        layer_$mapping <- ggiraph_append_aes(layer_$mapping, interactive_mapping)
      }
      if (!is.null(interactive_params)) {
        layer_$aes_params <- append(layer_$aes_params, interactive_params)
      }
      layer_$geom_params <- append(layer_$geom_params, list(.ipar = ipar))
      default_aes_names <- names(layer_$geom$default_aes)
      missing_names <- setdiff(ipar, default_aes_names)
      if (length(missing_names) > 0) {
        defaults <- Map(missing_names, f = function(x) NULL)
        layer_$geom$default_aes <- ggiraph_append_aes(layer_$geom$default_aes,
                                                      defaults)
      }
      if (is.list(result)) {
        result[[index]] <- layer_
      }
      else {
        result <- layer_
      }
    }
    result
  }

ggiraph_get_ineteractive_attrs <-
  function (x = rlang::caller_env(), ipar = ggiraph_IPAR_NAMES)
  {
    if (is.environment(x)) {
      rlang::env_get_list(env = x, ipar, NULL)
    }
    else {
      if (!is.null(attr(x, "interactive"))) {
        x <- attr(x, "interactive")
      }
      x[ggiraph_get_interactive_attr_names(x, ipar = ipar)]
    }
  }

ggiraph_get_default_ipar <-
  function (extra_names = NULL)
  {
    if (is.character(extra_names) && length(extra_names) > 0) {
      extra_names <- Filter(x = extra_names, function(x) {
        !is.na(x) && nzchar(trimws(x))
      })
    }
    unique(c(ggiraph_IPAR_NAMES, extra_names))
  }

ggiraph_get_interactive_attrs <-
  function (x = rlang::caller_env(), ipar = ggiraph_IPAR_NAMES)
  {
    if (is.environment(x)) {
      rlang::env_get_list(env = x, ipar, NULL)
    }
    else {
      if (!is.null(attr(x, "interactive"))) {
        x <- attr(x, "interactive")
      }
      x[ggiraph_get_interactive_attr_names(x, ipar = ipar)]
    }
  }

ggiraph_get_interactive_attr_names <-
  function (x, ipar = ggiraph_IPAR_NAMES)
  {
    intersect(names(x), ipar)
  }

ggiraph_remove_interactive_attrs <-
  function (x, ipar = ggiraph_IPAR_NAMES)
  {
    for (a in ipar) {
      x[[a]] <- NULL
    }
    x
  }

ggiraph_find_interactive_class <-
  function (gg, baseclass = c("Geom", "Guide"), env = parent.frame())
  {
    baseclass <- rlang::arg_match(baseclass)
    if (inherits(gg, baseclass)) {
      name <- class(gg)[1]
    }
    else if (is.character(gg) && length(gg) == 1) {
      name <- gg
      if (name == "histogram") {
        name <- "bar"
      }
    }
    else {
      rlang::abort(paste0("`gg` must be either a string or a ", baseclass,
                          "* object, not ", obj_desc(gg)), call = NULL)
    }
    if (!startsWith(name, baseclass)) {
      name <- paste0(baseclass, camelize(name, first = TRUE))
    }
    baseinteractive <- paste0(baseclass, "Interactive")
    if (!startsWith(name, baseinteractive)) {
      name <- sub(baseclass, baseinteractive, name)
    }
    obj <- find_global(name, env = env)
    if (is.null(obj) || !inherits(obj, baseclass)) {
      rlang::abort(paste0("Can't find interactive ", baseclass, " function based on ",
                          as_label(gg)), call = NULL)
    }
    else {
      obj
    }
  }

ggiraph_has_interactive_attrs <-
  function (x, ipar = ggiraph_IPAR_NAMES)
  {
    length(intersect(names(x), ipar)) > 0
  }

ggiraph_append_aes <-
  function (mapping, lst)
  {
    mapping[names(lst)] <- lst
    mapping
  }

ggiraph_IPAR_NAMES <-
  c(
    "data_id", "tooltip", "onclick", "hover_css", "selected_css",
    "tooltip_fill", "hover_nearest")


###############################################################################