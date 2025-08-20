#' Render interactive ggformula plots
#'
#' Converts a ggplot object with interactive elements into an interactive
#' HTML widget using ggiraph. This function is a wrapper around
#' [ggiraph::girafe()] tailored for ggformula interactive plots.
#'
#' @param object A ggplot object, typically created with a `gf_*_interactive()`
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

interactive_layer_factory <- function(geom) {
  geom_noninteractive <- gsub("_interactive", "", geom, fixed = TRUE)
  gf_noninteractive <- gsub("geom_", "gf_", geom_noninteractive, fixed = TRUE)
  gfenv <- tryCatch(
    environment(get(gf_noninteractive)),
    error = function(e) NULL
  )
  if (is.null(gfenv)) {
    return(NULL)
  }

  aes_form <- rlang::env_get(gfenv, "aes_form", default = NULL)
  extras <- rlang::env_get(gfenv, "extras", default = alist())

  layer_factory(
    interactive = TRUE,
    layer_func_interactive = geom,
    aes_form = aes_form,
    extras = extras
  )
}

geoms <- apropos('geom_.*_interactive')

skipped <- created_funs <- c()

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

  labeller_interactive(.mapping = .mapping, !!!qdots)
}
