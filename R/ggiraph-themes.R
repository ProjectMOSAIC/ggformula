#' Interactive theme for ggiraph facets
#'
#' A theme that enables interactive strip text and backgrounds for faceted plots
#' using ggiraph. This theme ensures that facet labels can receive hover events
#' and tooltips.
#'
#' @param base_theme A theme that will will be modified
#' @param interactive_text A logical indicating whether text elements of strips should be interactive.
#' @param interactive_rects A logical indicating whether rect elements of strips should be interactive.
#'
#' @param strip_text_color Color for strip text (or NULL to retain settings from `base_theme`)
#' @param strip_background_color Color for strip background (or NULL to retain settings from `base_theme`)
#' @param strip_text_size Size for strip text (or NULL to retain settings from `base_theme`)
#'
#' @return A ggplot2 theme object
#' @export
theme_facets_interactive <- function(
  base_theme = theme_bw(),
  interactive_text = TRUE,
  interactive_rects = TRUE,
  strip_text_color = NULL,
  strip_background_color = NULL,
  strip_text_size = NULL
) {
  base_theme %+replace%
    ggplot2::theme(
      # Make strip text interactive-friendly
      strip.text.x = if (interactive_text) {
        ggiraph::element_text_interactive()
      } else {
        ggplot2::element_text()
      },
      strip.text.y = if (interactive_text) {
        ggiraph::element_text_interactive()
      } else {
        ggplot2::element_text()
      },
      strip.text.color = strip_text_color,
      strip.text.size = strip_text_size,

      strip.background = if (interactive_rects) {
        ggiraph::element_rect_interactive()
      } else {
        ggplot2::element_rect()
      },
      strip.background.color = strip_background_color,

      # Ensure proper spacing for interactive elements
      strip.placement = "outside",

      # Panel spacing to accommodate interactive strips
      panel.spacing = unit(0.7, "lines"),
    )
}
