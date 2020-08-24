
#' Formula interface to geom_barh()
#'
#' @section Horizontal Geoms:
#' There are two ways to obtain "horizontal" geoms:
#' (1) The ggstance package provides a set of "horizontal" geoms and positions;
#' (2) Thee ggplot2 now provides an `orientation` argument for "native" horizontal
#' geoms and positions.  ggformula supports both.
#'
#' @inherit ggstance::geom_barh description references
#' @inherit gf_point
#' @inheritParams gf_line
#' @inheritParams ggstance::geom_barh
#' @importFrom utils packageVersion
#'
#' @param gformula A formula, typically with shape `~ x`.  (`y ~ x` is also possible,
#'   but typically using one of [gf_col()], [gf_props()], or [gf_percents()] is preferable
#'   to using this formula shape.)
#'   Faceting can be achieved by including `|` in the formula.
#' @param width Width of the bars.
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggstance::geom_barh()]
#' @export
#' @examples
#' gf_barh(~Diet, data = ChickWeight)
#' gf_bar(Diet ~ ., data = ChickWeight, orientation = 'y' )
#' gf_barh(~substance, data = mosaicData::HELPrct, fill = ~sex)
#' gf_bar(substance ~ ., data = mosaicData::HELPrct, fill = ~sex, orientation = 'y')
#' gf_barh(~substance,
#'   data = mosaicData::HELPrct, fill = ~sex,
#'   position = position_dodgev()
#' )
#' # gf_countsh() is another name for gf_barh()
#' gf_countsh(~Diet, data = ChickWeight)
#'
#' # gf_propsh() and gf_percentsh() use proportions or percentages instead of counts
#' gf_propsh(substance ~ ., data = mosaicData::HELPrct, fill = ~sex,
#'   position = position_dodgev())
#' gf_props(substance ~ ., data = mosaicData::HELPrct, fill = ~sex,
#'   position = position_dodge(), orientation = 'y')
#' gf_props(~substance, data = mosaicData::HELPrct, fill = ~sex,
#'   position = position_dodge())
#' gf_percents(~substance, data = mosaicData::HELPrct, fill = ~sex,
#'   position = position_dodge())
#'
#' if (require(scales)) {
#'   gf_props(~substance, data = mosaicData::HELPrct, fill = ~sex,
#'     position = position_dodge()) %>%
#'       gf_refine(scale_y_continuous(labels = scales::percent))
#' }
gf_barh <-
  layer_factory(
    geom = "barh", stat = "counth", position = "stackv",
    aes_form = list(~y, y ~ x),
    extras = alist(
      alpha = , color = , fill = , group = , linetype = , size = ,
      width = NULL
    )
  )

#' @rdname gf_bar
#' @export

gf_countsh <-
  layer_factory(
    geom = "barh", stat = "counth", position = "stackv",
    aes_form = list(~y, y ~ .),
    extras = alist(
      alpha = , color = , fill = , group = , linetype = , size = ,
      width = NULL
    )
  )

#' @rdname gf_bar
#' @export

gf_colh <-
  layer_factory(
    geom = "colh", position = "stackv",
    aes_form = list(y ~ x),
    extras = alist(
      alpha = , color = , fill = , group = , linetype = , size = ,
      width = NULL
    )
  )

#' @rdname gf_bar
#' @export
gf_propsh <-
  layer_factory(
    geom = "barh", stat = "counth", position = "stackv",
    aes_form = list(~y, y ~ .),
    extras =
      alist(
        alpha = , color = , fill = , group = ,
        linetype = , size = , xlab = "proportion"
      ),
    aesthetics = aes(x = after_stat(props_by_group(count, DENOM))),
    pre = {
      xaes_expr <- rlang::quo_get_expr(aesthetics[['x']]);
      xaes_expr[[2]][[3]] <- rlang::f_rhs(denom) ;
      aesthetics[['x']] <- xaes_expr
    },
    denom = ~ PANEL
  )

#' @rdname gf_bar
#' @export
gf_percentsh <-
  layer_factory(
    geom = "barh", stat = "counth", position = "stackv",
    aes_form = list(~y, y ~ .),
    extras = alist(
      alpha = , color = , fill = , group = ,
      linetype = , size = , xlab = "percent"
    ),
    aesthetics = aes(x = after_stat(percs_by_group(count, DENOM))),
    pre = {
      xaes_expr <- rlang::quo_get_expr(aesthetics[['x']]);
      xaes_expr[[2]][[3]] <- rlang::f_rhs(denom) ;
      aesthetics[['x']] <- xaes_expr
    },
    denom = ~ PANEL
  )

#' Formula interface to geom_boxploth()
#'
#' @section Horizontal Geoms:
#' There are two ways to obtain "horizontal" geoms:
#' (1) The ggstance package provides a set of "horizontal" geoms and positions;
#' (2) Thee ggplot2 now provides an `orientation` argument for "native" horizontal
#' geoms and positions.  ggformula supports both.
#'
#' @inherit ggstance::geom_boxploth description references
#' @inherit gf_line
#' @inheritParams gf_boxplot
#' @inheritParams ggstance::geom_boxploth
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#'
#' @seealso [ggstance::geom_boxploth()][ggplot2::geom_boxplot()], [fivenum()], [df_stats()]
#' @importFrom ggstance geom_boxploth stat_boxploth position_dodgev
#' @export
#' @examples
#' gf_boxploth(sex ~ age, data = mosaicData::HELPrct, varwidth = TRUE)
#' gf_boxplot(sex ~ age, data = mosaicData::HELPrct, varwidth = TRUE, orientation = 'y')
#' gf_boxploth(substance ~ age, data = mosaicData::HELPrct, color = ~sex)
#' # move boxplots away a bit by adjusting dodge
#' gf_boxploth(substance ~ age,
#'   data = mosaicData::HELPrct, color = ~sex,
#'   position = position_dodgev(height = 0.9)
#' )
#' # gf_boxplot guesses horizontal because substance is categorical
#' gf_boxplot(substance ~ age,
#'   data = mosaicData::HELPrct, color = ~sex,
#'   position = position_dodge(width = 0.9)
#' )
#' gf_boxploth(substance ~ age, data = mosaicData::HELPrct, color = ~sex, outlier.color = "gray50")
#' # longer whiskers
#' gf_boxploth(substance ~ age, data = mosaicData::HELPrct, color = ~sex, coef = 2)
#' # Note: height for boxplots is full width of box.
#' #   For jittering, it is the half-height.
#' gf_boxploth(substance ~ age | sex, data = mosaicData::HELPrct, coef = 5, height = 0.4) %>%
#'   gf_jitter(height = 0.2, alpha = 0.3)
#'
#' # combining boxplots and histograms
#' gf_histogram(~eruptions, data = faithful) %>%
#'   gf_boxploth(0 ~ eruptions, alpha = 0, width = 2)
#' gf_histogram(~eruptions, data = faithful) %>%
#'   gf_boxploth(-2 ~ eruptions, alpha = 0, width = 2)
#' gf_histogram(~eruptions, data = faithful) %>%
#'   gf_boxploth(32 ~ eruptions, alpha = 0, width = 2)
gf_boxploth <-
  layer_factory(
    aes_form = list(y ~ x, ~x, y ~ .),
    geom = "boxploth",
    stat = "boxploth",
    position = "dodgev",
    extras = alist(
      alpha = , color = , fill = , group = , linetype = , size = , # shape = ,
      coef = ,
      outlier.color = NULL, outlier.fill = NULL,
      outlier.shape = 19, outlier.size = 1.5, outlier.stroke = 0.5,
      outlier.alpha = NULL, notch = FALSE, notchwidth = 0.5, varwidth = FALSE
    )
  )

#' @rdname gf_histogram
#'
#' @section Horizontal Geoms:
#' There are two ways to obtain "horizontal" geoms:
#' (1) The ggstance package provides a set of "horizontal" geoms and positions;
#' (2) Thee ggplot2 now provides an `orientation` argument for "native" horizontal
#' geoms and positions.  ggformula supports both.
#'
#' @export
#' @examples
#'
#' gf_histogramh(~x, bins = 30)
#' gf_histogram(x ~., bins = 30)
#' gf_histogramh(x ~ ., bins = 30)
#' gf_histogramh(x ~ stat(density), bins = 30)
gf_histogramh <-
  layer_factory(
    aes_form = list(y ~ x, ~y, y ~ .),
    geom = "barh",
    stat = "binh",
    position = "stackv",
    note = "x may be stat(density) or stat(count) or stat(ndensity) or stat(ncount)",
    extras = alist(
      bins = 25, binwidth = , alpha = 0.5, color = , fill = , group = ,
      linetype = , size =
      )
  )

#' @rdname gf_histogram
#' @export
#' @examples
#' gf_dhistogramh(~x, bins = 30)
#' gf_dhistogram(x ~ ., bins = 30)
#' gf_dhistogramh(x ~ ., bins = 30)
gf_dhistogramh <-
  layer_factory(
    geom = "barh", stat = "binh", position = "stackv",
    aes_form = list(y ~ x, ~y, y ~ .),
    extras =
      alist(bins = 25, binwidth = , alpha = 0.5, color = , fill = , group = , linetype = , size = ),
    note = "x may be stat(density) or stat(count) or stat(ndensity) or stat(ncount)",
    aesthetics = aes(x = stat(density))
  )

#' @rdname gf_linerange
#' @export
#' @examples
#' gf_linerangeh(date ~ low_temp + high_temp | ~city,
#'   data = mosaicData::Weather,
#'   color = ~avg_temp
#' ) %>%
#'   gf_refine(scale_color_viridis_c(begin = 0.1, end = 0.9, option = "C"))
#' gf_linerange(date ~ low_temp + high_temp | ~city,
#'   data = mosaicData::Weather,
#'   color = ~avg_temp,
#'   orientation = 'y'
#' ) %>%
#'   gf_refine(scale_color_viridis_c(begin = 0.1, end = 0.9, option = "C"))
gf_linerangeh <-
  layer_factory(
    geom = "linerangeh",
    aes_form = list(y ~ xmin + xmax),
    extras = alist(alpha = , color = , group = , linetype = , size = )
  )

#' @rdname gf_linerange
#' @export
#' @examples
#' gf_pointrangeh(date ~ avg_temp + low_temp + high_temp | ~city,
#'   data = Weather,
#'   color = ~avg_temp
#' ) %>%
#'   gf_refine(scale_color_viridis_c(begin = 0.1, end = 0.9, option = "C"))
gf_pointrangeh <-
  layer_factory(
    geom = "pointrangeh",
    aes_form = y ~ x + xmin + xmax,
    extras = alist(alpha = , color = , group = , linetype = , size = )
  )

#' @rdname gf_crossbar
#' @export
gf_crossbarh <-
  layer_factory(
    geom = "crossbarh",
    aes_form = y ~ x + xmin + xmax,
    extras = alist(
      alpha = , color = , group = , linetype = , size = , fatten = 2.5
    )
  )

#' @rdname gf_violin
#' @examples
#' gf_violinh(substance ~ age, data = mosaicData::HELPrct)
#' gf_violinh(substance ~ age, data = mosaicData::HELPrct, fill = ~sex)
#' @export
gf_violinh <-
  layer_factory(
    aes_form = list(y ~ x, ~x),
    geom = "violinh",
    stat = "xdensity",
    position = "dodgev",
    extras = alist(
      alpha = , color = , fill = , group = , linetype = ,
      size = , weight = , draw_quantiles = NULL, trim = TRUE,
      scale = "area", bw = , adjust = 1, kernel = "gaussian"
    )
  )

#' Formula interface to geom_errorbarh()
#'
#' @inherit ggplot2::geom_errorbarh description references
#' @inherit gf_line
#' @inheritParams ggplot2::geom_errorbarh
#' @param gformula A formula with shape `y ~ x + xmin + xmax`.
#'   Faceting can be achieved by including `|` in the formula.
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#'
#' @seealso [ggplot2::geom_errorbarh()]
#' @export
#' @examples
#' if (require(dplyr)) {
#'   HELP2 <- mosaicData::HELPrct %>%
#'     group_by(substance, sex) %>%
#'     summarise(
#'       mean.age = mean(age),
#'       median.age = median(age),
#'       max.age = max(age),
#'       min.age = min(age),
#'       sd.age = sd(age),
#'       lo = mean.age - sd.age,
#'       hi = mean.age + sd.age
#'     )
#'
#'   gf_jitter(substance ~ age, data = mosaicData::HELPrct,
#'       alpha = 0.5, height = 0.2, width = 0, color = "skyblue") %>%
#'     gf_errorbarh(substance ~ lo + hi, data = HELP2, inherit = FALSE) %>%
#'     gf_facet_grid(~sex)
#'
#'   gf_jitter(age ~ substance, data = mosaicData::HELPrct,
#'       alpha = 0.5, width = 0.2, height = 0, color = "skyblue") %>%
#'     gf_errorbar(lo + hi ~ substance, data = HELP2, inherit = FALSE) %>%
#'     gf_facet_grid(~sex)
#' }
gf_errorbarh <-
  layer_factory(
    geom = "errorbarh",
    aes_form = y ~ xmin + xmax,
    check.aes = FALSE,
    extras = alist(
      alpha = , color = , group = , linetype = , size =
      )
  )
