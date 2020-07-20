
#' Formula interface to ggridges plots
#'
#' Formula interface to ggridges plots
#'
#' @rdname ggridges
#' @import ggridges
#' @inheritParams gf_density
#' @inheritParams ggridges::geom_ridgeline
#' @inheritParams ggridges::geom_density_ridges
#' @inheritParams ggridges::geom_density_ridges_gradient
#' @seealso [`ggridges::geom_density_ridges()`]
#' @seealso [`ggridges::geom_ridgeline()`]
#' @seealso [`ggridges::geom_density_ridges_gradient()`]
#' @param height The height of each ridgeline at the respective x value.
#'   Automatically calculated and provided by [`ggridges::stat_density_ridges()`]
#'   if the default stat is not changed.
#' @param scale
#'   A scaling factor to scale the height of the ridgelines relative to the
#'   spacing between them. A value of 1 indicates that the maximum point of any ridgeline touches the baseline right above, assuming even spacing between baselines.
#' @param rel_min_height
#'   Lines with heights below this cutoff will be removed. The cutoff is
#'   measured relative to the overall maximum, so `rel_min_height = 0.01` would
#'   remove everything. Default is 0, so nothing is removed.
#' @param min_height A height cutoff on the drawn ridgelines. All values that fall below
#'   this cutoff will be removed. The main purpose of this cutoff is to remove
#'   long tails right at the baseline level, but other uses are possible. The
#'   cutoff is applied before any height scaling is applied via the scale
#'   aesthetic. Default is 0, so negative values are removed.
#' @param point_shape,point_colour,point_size,point_fill,point_alpha,point_stroke
#'   As in [`ggridges::geom_ridgeline()`].
#' @export
#' @examples
#' data.frame(
#'   x = rep(1:5, 3), y = c(rep(0, 5), rep(1, 5), rep(3, 5)),
#'   height = c(0, 1, 3, 4, 0, 1, 2, 3, 5, 4, 0, 5, 4, 4, 1)
#' ) %>%
#'   gf_ridgeline(y ~ x, height = ~ height, group = ~y, fill = "lightblue", alpha = 0.7)

gf_ridgeline <-
  layer_factory(
    geom = "ridgeline", stat = "identity", position = "identity",
    aes_form = y ~ x,
    extras = alist(height =, scale = 1, min_height = 0, color = , fill = , alpha = ,
                   group =, linetype = , size = ,
                   point_size =, point_shape = , point_colour = , point_fill = ,
                   point_alpha = , point_stroke =)
  )

#' @rdname ggridges
#' @section Details:
#' Note that the [`ggridges::stat_density_ridges()`] makes joint density estimation
#' across all datasets. This may not generate the desired result when using
#' faceted plots. As an alternative, you can set `stat = "density"` to use
#' [`ggplot2::stat_density()`]. In this case, it is required to add the aesthetic mapping
#' `height = stat(density)` (see examples).
#'
#' @export
#' @examples
#' diamonds %>%
#'   gf_density_ridges(cut ~ price,
#'     scale = 2, fill = ~ cut, alpha = 0.6, show.legend = FALSE) %>%
#'   gf_theme(theme_ridges()) %>%
#'   gf_refine(
#'     scale_y_discrete(expand = c(0.01, 0)),
#'     scale_x_continuous(expand = c(0.01, 0))
#'   )
#' diamonds %>%
#'   gf_density_ridges(clarity ~ price | cut,
#'     scale = 2, fill = ~ clarity, alpha = 0.6, show.legend = FALSE) %>%
#'   gf_theme(theme_ridges()) %>%
#'   gf_refine(
#'     scale_y_discrete(expand = c(0.01, 0)),
#'     scale_x_continuous(expand = c(0.01, 0))
#'   )
#' diamonds %>%
#'   gf_density_ridges(clarity ~ price | cut, height = ~stat(density), stat = "density",
#'     scale = 2, fill = ~ clarity, alpha = 0.6, show.legend = FALSE) %>%
#'   gf_theme(theme_ridges()) %>%
#'   gf_refine(
#'     scale_y_discrete(expand = c(0.01, 0)),
#'     scale_x_continuous(expand = c(0.01, 0))
#'   )

gf_density_ridges <-
  layer_factory(
    geom = "density_ridges", stat = "density_ridges", position = "points_sina",
    aes_form = y ~ x,
    extras = alist(height =, scale = 1, rel_min_height = 0,
                   color = , fill = , alpha = , group =, linetype = , size = ,
                   point_size =, point_shape = , point_colour = , point_fill = ,
                   point_alpha = , point_stroke =,
                   panel_scaling = TRUE)
  )


#' @rdname ggridges
#' @export
#' @examples
#' diamonds %>%
#'   gf_density_ridges2(cut ~ price, scale = 2, fill = ~ cut, alpha = 0.6, show.legend = FALSE) %>%
#'   gf_theme(theme_ridges()) %>%
#'   gf_refine(
#'     scale_y_discrete(expand = c(0.01, 0)),
#'     scale_x_continuous(expand = c(0.01, 0))
#'   )

gf_density_ridges2 <-
  layer_factory(
    geom = "density_ridges2", stat = "density_ridges", position = "points_sina",
    aes_form = y ~ x,
    extras = alist(height =, scale = 1, rel_min_height = 0,
                   color = , fill = , alpha = , group =, linetype = , size = ,
                   point_size =, point_shape = , point_colour = , point_fill = ,
                   point_alpha = , point_stroke =,
                   panel_scaling = TRUE)
  )

#' @rdname ggridges
#' @export
#' @examples
#' diamonds %>%
#'   gf_density_ridges(cut ~ price,
#'     scale = 2, fill = ~ cut, alpha = 0.6, show.legend = FALSE) %>%
#'   gf_theme(theme_ridges()) %>%
#'   gf_refine(
#'     scale_y_discrete(expand = c(0.01, 0)),
#'     scale_x_continuous(expand = c(0.01, 0))
#'   )
#' diamonds %>%
#'   gf_density_ridges(clarity ~ price | cut,
#'     scale = 2, fill = ~ clarity, alpha = 0.6, show.legend = FALSE) %>%
#'   gf_theme(theme_ridges()) %>%
#'   gf_refine(
#'     scale_y_discrete(expand = c(0.01, 0)),
#'     scale_x_continuous(expand = c(0.01, 0))
#'   )
#' diamonds %>%
#'   gf_density_ridges(clarity ~ price | cut, height = ~stat(density), stat = "density",
#'     scale = 2, fill = ~ clarity, alpha = 0.6, show.legend = FALSE) %>%
#'   gf_theme(theme_ridges()) %>%
#'   gf_refine(
#'     scale_y_discrete(expand = c(0.01, 0)),
#'     scale_x_continuous(expand = c(0.01, 0))
#'   )

gf_density_ridgeline_gradient <-
  layer_factory(
    geom = "ridgeline_gradient", stat = "identity", position = "identity",
    aes_form = y ~ x,
    extras = alist(height =,
                   color = , fill = , alpha = , group =, linetype = , size = ,
                   gradient_lwd = 0.5)
  )

#' @rdname ggridges
#' @export
#' @examples
#' mosaicData::Weather %>%
#'   gf_density_ridges_gradient(month ~ high_temp | city ~ ., fill = ~stat(x),
#'     group = ~ month, show.legend = FALSE, rel_min_height = 0.02) %>%
#'   gf_refine(scale_fill_viridis_c(option = "B"), theme_bw())


gf_density_ridges_gradient <-
  layer_factory(
    geom = "density_ridges_gradient", stat = "density_ridges", position = "points_sina",
    aes_form = y ~ x,
    extras = alist(height =, panel_scaling = TRUE,
                   color = , fill = ~stat(x), alpha = , group =, linetype = , size = ,
                   gradient_lwd = 0.5)
  )
