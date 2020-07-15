
#' Formula interface to ggridges plots
#'
#' Formula interface to ggridges plots
#'
#' @rdname ggridges
#' @import ggridges
#' @inheritParams ggridges::geom_ridgeline
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
#' @seealso [`ggridges::geom_density_ridges()`]
#' @section Details:
#' Note that the default stat (`stat_density_ridges`) makes joint density estimation
#' across all datasets. This may not generate the desired result when using
#' faceted plots. As an alternative, you can set `stat = "density"` to use
#' `stat_density()`. In this case, it is required to add the aesthetic mapping
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
#' @seealso [`ggridges::geom_density_ridges()`]
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
#' @seealso [`ggridges::geom_density_ridges()`]
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

gf_density_ridgeline_gradient <-
  layer_factory(
    geom = "ridgeline_gradient", stat = "identity", position = "identity",
    aes_form = y ~ x,
    extras = alist(height =,
                   color = , fill = , alpha = , group =, linetype = , size = ,
                   gradient_lwd = 0.5)
  )


#' @export
#' @examples
#' mosaicData::Weather %>%
#'   gf_density_ridges_gradient(month ~ high_temp | city ~ ., fill = ~stat(x),
#'     group = ~ month, show.legend = FALSE) %>%
#'   gf_refine(scale_fill_viridis_c(option = "B"), theme_bw())


gf_density_ridges_gradient <-
  layer_factory(
    geom = "density_ridges_gradient", stat = "density_ridges", position = "points_sina",
    aes_form = y ~ x,
    extras = alist(height =, panel_scaling = TRUE,
                   color = , fill = ~stat(x), alpha = , group =, linetype = , size = ,
                   gradient_lwd = 0.5)
  )
