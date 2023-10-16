#' Non-layer functions for gf plots
#'
#' These functions modify things like labels, limits, scales, etc. for plots
#' ggplot2 plots. They are wrappers around functions in ggplot2 that allow for
#' chaining syntax.
#'
#' `gf_refine()` provides a mechanism to replace `+` with the
#' chaining/pipe operator `|>`.
#' Each of its `\dots` arguments is added in turn to the
#' base plot in `object`.  The other functions are thin wrappers around
#' specific `ggplot2` refinement functions and pass their `\dots`
#' arguments through to the similarly named `ggplot2` functions.
#'
#' @param object a gg object
#' @param ... additional arguments passed through to the similarly named function in
#' \pkg{ggplot2}.
#' @return a modified gg object
#'
#' @rdname gf_aux
#' @export
#' @examples
#' gf_dens(~cesd, color = ~substance, linewidth = 1.5, data = mosaicData::HELPrct) |>
#'   gf_labs(
#'     title = "Center for Epidemiologic Studies Depression measure",
#'     subtitle = "(at baseline)",
#'     color = "Abused substance: ",
#'     x = "CESD score",
#'     y = "",
#'     caption = "Source: HELPrct"
#'   ) |>
#'   gf_theme(theme_classic()) |>
#'   gf_theme(
#'     axis.text.y = element_blank(),
#'     legend.position = "top",
#'     plot.title = element_text(hjust = 0.5, color = "navy"),
#'     plot.subtitle = element_text(hjust = 0.5, color = "navy", size = 12)
#'   )
#'
#' gf_point(eruptions ~ waiting, data = faithful, alpha = 0.5)
#' gf_point(eruptions ~ waiting, data = faithful, alpha = 0.5) |>
#'   gf_lims(x = c(65, NA), y = c(3, NA))
#'
#' # modify scales using gf_refine()
#' data(penguins, package = "palmerpenguins")
#' gf_jitter(bill_length_mm ~ bill_depth_mm, color = ~species, data = penguins) |>
#'   gf_refine(scale_color_brewer(type = "qual", palette = 3)) |>
#'   gf_theme(theme_bw())
#'
#' gf_jitter(bill_length_mm ~ bill_depth_mm, color = ~species, data = penguins) |>
#'   gf_refine(scale_color_manual(values = c("red", "navy", "limegreen"))) |>
#'   gf_theme(theme_bw())
gf_labs <- function(object, ...) {
  object + ggplot2::labs(...)
}

#' @rdname gf_aux
#' @export
gf_lims <- function(object, ...) {
  object + ggplot2::lims(...)
}

#' Themes for ggformula
#'
#' Themes for ggformula
#'
#' @rdname gf_theme
#' @param object a gg object
#' @param theme a ggplot2 theme function like [theme_minimal()].
#' @param ... If `theme` is missing, then these additional arguments are theme elements
#'   of the sort handled by [ggplot2::theme()].
#' @return a modified gg object
#' @export
gf_theme <- function(object, theme, ...) {
  if (missing(theme)) {
    object + ggplot2::theme(...)
  } else {
    if (is.function(theme)) {
      object + do.call(theme, list(...))
    } else {
      object + theme
    }
  }
}

#' Add facets to a plot
#'
#' These functions provide more control over faceting than is possible using
#' the formula interface.
#'
#' @param object A ggplot object
#' @param ... Additional arguments passed to [facet_wrap()] or [facet_grid()].
#'   This typically includes an unnamed formula argument describing the facets.
#'   `scales` and `space` are additional useful arguments.  See the examples.
#'
#'
#' @seealso [ggplot2::facet_grid()], [ggplot2::facet_wrap()].
#' @examples
#' gf_histogram(~avg_drinks, data = mosaicData::HELPrct) |>
#'   gf_facet_grid(~substance)
#' gf_histogram(~avg_drinks, data = mosaicData::HELPrct) |>
#'   gf_facet_grid(~substance, scales = "free")
#' gf_histogram(~avg_drinks, data = mosaicData::HELPrct) |>
#'   gf_facet_grid(~substance, scales = "free", space = "free")
#' gf_line(births ~ date, data = mosaicData::Births, color = ~wday) |>
#'   gf_facet_wrap(~year, scales = "free_x", nrow = 5) |>
#'   gf_theme(
#'     axis.title.x = element_blank(),
#'     axis.text.x = element_blank(), axis.ticks.x = element_blank()
#'   ) |>
#'   gf_labs(color = "Day")
#' @rdname gf_facet_grid
#' @export
gf_facet_wrap <- function(object, ...) {
  object + ggplot2::facet_wrap(...)
}

#' @rdname gf_facet_grid
#' @export
gf_facet_grid <- function(object, ...) {
  object + ggplot2::facet_grid(...)
}

#' @rdname gf_aux
#' @export
gf_refine <- function(object, ...) {
  Reduce(`+`, list(...), init = object)
}
