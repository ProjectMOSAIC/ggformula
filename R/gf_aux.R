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
#' @param theme a ggplot2 theme function like [ggplot2::theme_minimal()].
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

#' Guides for ggformula
#'
#' Guides for each scale can be set scale-by-scale with the `guide` argument,
#'   or en masse with `gf_guides()`.
#'
#'
#' @rdname gf_guides
#' @param object a gg object
#' @param ... arguments passed to [ggplot2::guides()].
#' @return a modified gg object
#' @export
#' @seealso [ggplot2::guides()]
#' @examples
#'
#' dat <-
#'   data.frame(
#'     x = 1:5, y = 1:5,
#'     p = 1:5, q = factor(1:5), r = factor(1:5)
#'  )
#'
#' p <-
#'   dat |>
#'   gf_point( y ~ x, colour = ~ p, size = ~ q, shape = ~r)
#'
#' # without guide specification
#' p
#'
#' # Show colorbar guide for colour.
#' # All these examples below have a same effect.
#'
#' p |> gf_guides(colour = "colorbar", size = "legend", shape = "legend")
#' p |> gf_guides(colour = guide_colorbar(), size = guide_legend(),
#'            shape = guide_legend())
#' p +
#'   scale_colour_continuous(guide = "colorbar") +
#'   scale_size_discrete(guide = "legend") +
#'   scale_shape(guide = "legend")
#'
#' # Remove some guides
#' p |> gf_guides(colour = "none")
#' p |> gf_guides(colour = "colorbar",size = "none")
#'
#' # Guides are integrated where possible
#'
#' p |>
#'   gf_guides(
#'     colour = guide_legend("title"),
#'     size = guide_legend("title"),
#'     shape = guide_legend("title")
#'   )
# same as
#' g <- guide_legend("title")
#' p |> gf_guides(colour = g, size = g, shape = g)
#'
#' p |> gf_theme(legend.position = "bottom")
#'
#' # position of guides
#'
#' # Set order for multiple guides
#' mpg |>
#'   gf_point(cty ~ displ, size = ~hwy, shape = ~ drv) |>
#'   gf_guides(
#'     colour = guide_colourbar(order = 1),
#'     shape = guide_legend(order = 2),
#'     size = guide_legend(order = 3)
#'   )


gf_guides <- function(object, ...) {
      object + ggplot2::guides(...)
}

#' Add facets to a plot
#'
#' These functions provide more control over faceting than is possible using
#' the formula interface.
#'
#' @param object A ggplot object
#' @param ... Additional arguments passed to [ggplot2::facet_wrap()] or [ggplot2::facet_grid()].
#'   This typically includes an unnamed formula argument describing the facets.
#'   `scales` and `space` are additional useful arguments.  See the examples.
#'
#'
#' @seealso [ggplot2::facet_grid()], [ggplot2::facet_wrap()].
#' @examples
#' gf_histogram(~avg_drinks, data = mosaicData::HELPrct, bins =25) |>
#'   gf_facet_grid(~substance)
#' gf_histogram(~avg_drinks, data = mosaicData::HELPrct, bins =25) |>
#'   gf_facet_grid(~substance, scales = "free")
#' gf_histogram(~avg_drinks, data = mosaicData::HELPrct, bins =25) |>
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

#' Add an annotation layer to a graphic
#'
#' @inherit ggplot2::annotate
#' @inheritParams ggplot2::annotate
#' @param object a gg object
#'
#' @examples
#' p <- gf_point(mpg ~wt, data = mtcars)
#' p |> gf_annotate("text", x = 4, y = 25, label = "Some text")
#' p |> gf_annotate("text", x = 2:5, y = 25, label = "Some text")
#' p |> gf_annotate("rect", xmin = 3, xmax = 4.2, ymin = 12, ymax = 21,
#'              alpha = .2)
#' p |> gf_annotate("segment", x = 2.5, xend = 4, y = 15, yend = 25,
#'              colour = "blue")
#' p |> gf_annotate("pointrange", x = 3.5, y = 20, ymin = 12, ymax = 28,
#'              colour = "red", size = 2.5, linewidth = 1.5)
#'
#' p |> gf_annotate("text", x = 2:3, y = 20:21, label = c("my label", "label 2"))
#'
#' p |> gf_annotate("text", x = 4, y = 25, label = "italic(R) ^ 2 == 0.75",
#'              parse = TRUE)
#' p |> gf_annotate("text", x = 4, y = 25,
#'              label = "paste(italic(R) ^ 2, \" = .75\")", parse = TRUE)
#'
#' @export

gf_annotate <-
  function(
    object, geom = "text",
    x = NULL,
    y = NULL,
    xmin = NULL,
    xmax = NULL,
    ymin = NULL,
    ymax = NULL,
    xend = NULL,
    yend = NULL,
    ...,
    na.rm = FALSE
  ) {
    object +
      ggplot2::annotate(
        geom = geom, x = x, y = y,
        xmin = xmin, xmax = xmax,
        ymin = ymin, ymax = ymax,
        xend = xend, yend = yend,
        ...,
        na.rm = na.rm
      )
  }
