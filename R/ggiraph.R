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

gf_girafe <- function(object, code, ...) {
  code <- rlang::enquo(code)
  ggiraph::girafe(code = {{ code }}, ggobj = object, ...)
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
