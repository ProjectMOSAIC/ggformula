utils::globalVariables(c('s', 'p'))

#' @importFrom mosaicCore makeFun
#' @importFrom stats dnorm

NA

#' Formula interface to geom_point()
#'
#' Scatterplots in `ggformula`.
#'
#' @section Specifying plot attributes:
#'
#' Positional attributes (a.k.a, aesthetics) are specified using the formula in `gformula`.
#' Setting and mapping of additional attributes can be done through the
#' use of additional arguments.
#' Attributes can be set can be set using arguments of the form `attribute = value` or
#' mapped using arguments of the form `attribute = ~ expression`.
#'
#' In formulas of the form `A | B`, `B` will be used to form facets using
#' [facet_wrap()] or [facet_grid()].
#' This provides an alternative to
#' [gf_facet_wrap()] and
#' [gf_facet_grid()] that is terser and may feel more familiar to users
#' of \pkg{lattice}.
#'
#' @section Evaluation:
#'
#' Evaluation of the \pkg{ggplot2} code occurs in the environment of `gformula`.
#' This will typically do the right thing when formulas are created on the fly, but might not
#' be the right thing if formulas created in one environment are used to create plots
#' in another.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#' of the chain.  Most users can safely ignore this argument.
#' See details and examples.
#'
#' @param gformula A formula with shape `y ~ x`.
#'   Faceting can be achieved by including `|` in the formula.
#' @param data A data frame with the variables to be plotted.
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param size A numeric size or a formula used for mapping size.
#' @param shape An integer or letter shape or a formula used for mapping shape.
#' @param color A color or a formula used for mapping color.
#' @param fill A color for filling, or a formula used for mapping fill.
#' @param group Used for grouping.
#' @param stroke A numeric size of the border or a formula used to map stroke.
#' @param environment An environment in which to look for variables not found in `data`.
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`,
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`, or
#'   (d) arguments for the geom, stat, or position function.
#' @param geom A character string naming the geom used to make the layer.
#' @param stat A character string naming the stat used to make the layer.
#' @param position Either a character string naming the position function used
#'   for the layer or a position object returned from a call to a position function.
#' @param show.legend A logical indicating whether this layer should be included in
#'   the legends.  `NA`, the default, includes layer in the legends if any
#'   of the attributes of the layer are mapped.
#' @param show.help If `TRUE`, display some minimal help.
#' @param inherit A logical indicating whether default attributes are inherited.
#' @param xlab Label for x-axis. See also [`gf_labs()`].
#' @param ylab Label for y-axis. See also [`gf_labs()`].
#' @param title,subtitle,caption Title, sub-title, and caption for the plot.
#'   See also [`gf_labs()`].
#'
#' @return a gg object
#' @seealso [ggplot2::geom_point()], [gf_line()], [gf_jitter()]
#' @export
#' @examples
#' gf_point()
#' gf_point((10 * ((1:25) %/% 10)) ~ ((1:25) %% 10),
#'   shape = 1:25,
#'   fill = "skyblue", color = "navy", size = 4, stroke = 1, data = NA
#' )
#' gf_point(mpg ~ hp, color = ~cyl, size = ~wt, data = mtcars)
#' # faceting -- two ways
#' gf_point(mpg ~ hp, data = mtcars) |>
#'   gf_facet_wrap(~am)
#' gf_point(mpg ~ hp | am, group = ~cyl, data = mtcars)
#' gf_point(mpg ~ hp | ~am, group = ~cyl, data = mtcars)
#' gf_point(mpg ~ hp | am ~ ., group = ~cyl, data = mtcars)
#' # Chaining in the data
#' mtcars |> gf_point(mpg ~ wt)
#'
#' # short cuts for main labels in the plot
#' gf_point(births ~ date,
#'   color = ~wday, data = mosaicData::Births78,
#'   xlab = "Date", ylab = "Number of Live Births",
#'   title = "Interesting Patterns in the Number of Births",
#'   subtitle = "(United States, 1978)",
#'   caption = "Source: mosaicData::Births78"
#' )
gf_point <-
  layer_factory(
    geom = "point",
    extras = alist(alpha = , color = , size = , shape = , fill = , group = , stroke = )
  )

#' Formula interface to geom_jitter()
#'
#' Jittered scatter plots in `ggformula`.
#'
#' @inherit gf_point
#' @param width Amount of horizontal jitter.
#' @param height Amount of vertical jitter.
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_jitter()], [gf_point()]
#' @export
#' @examples
#' gf_jitter()
#' # without jitter
#' gf_point(age ~ sex, alpha = 0.25, data = mosaicData::HELPrct)
#' # jitter only horizontally
#' gf_jitter(age ~ sex, alpha = 0.25, data = mosaicData::HELPrct, width = 0.2, height = 0)
#' # alternative way to get jitter
#' gf_point(age ~ sex,
#'   alpha = 0.25, data = mosaicData::HELPrct,
#'   position = "jitter", width = 0.2, height = 0
#' )
gf_jitter <-
  layer_factory(
    geom = "point",
    position = "jitter",
    extras = alist(
      alpha = , color = , size = , shape = , fill = ,
      width = , height = , group = , stroke =
      )
  )

#' Formula interface to geom_line() and geom_path()
#'
#' Line plots in `ggformula`.  `gf_path()` differs from `gf_line()` in that points
#' are connected in the order in which they appear in `data`.
#'
#' @inherit gf_point
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a formula used
#'   for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping linewidth.
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_line()], [gf_point()]
#' @export
#' @examples
#' gf_line()
#' gf_point(age ~ sex, alpha = 0.25, data = mosaicData::HELPrct)
#' gf_point(births ~ date, color = ~wday, data = mosaicData::Births78)
#' # lines make the exceptions stand out more prominently
#' gf_line(births ~ date, color = ~wday, data = mosaicData::Births78)
gf_line <-
  layer_factory(
    geom = "line",
    extras = alist(
      alpha = , color = , fill = , group = , linetype = , linewidth =,
      # size = ,  # remove eventually?
      lineend = , linejoin = , linemitre = , arrow =
      )
  )

#' @rdname gf_line
#' @inheritParams ggplot2::geom_path
#' @export
#' @examples
#' gf_path()
#' if (require(dplyr)) {
#'   data.frame(t = seq(1, 10 * pi, length.out = 400)) |>
#'     mutate(x = t * cos(t), y = t * sin(t)) |>
#'     gf_path(y ~ x, color = ~t)
#' }
gf_path <-
  layer_factory(
    geom = "path",
    extras = alist(
      alpha = , color = , group = ,
      linetype = , linewidth = ,
      # size = , # remove eventually?
      lineend = "butt", linejoin = "round", linemitre = 1, arrow = NULL
    )
  )

#' Formula interface to stat_ellipse()
#'
#' Formula interface to [ggplot2::stat_ellipse()].
#'
#' @inheritParams gf_line
#' @inheritParams ggplot2::stat_ellipse
#' @inheritParams ggplot2::geom_path
#' @param geom Geom for drawing ellipse.  Note: `"polygon"` allows fill; `"path"` does not;
#'   on the other hand, `"path"` allows `alpha` to be applied to the border, while `"polygon"`
#'   applies `alpha` only to the interior.
#' @seealso [ggplot2::stat_ellipse()]
#' @export
#' @examples
#' gf_ellipse()
#' gf_point(eruptions ~ waiting, data = faithful) |>
#'   gf_ellipse(alpha = 0.5)
#'
#' gf_point(eruptions ~ waiting, data = faithful, color = ~ (eruptions > 3)) |>
#'   gf_ellipse(alpha = 0.5)
#'
#' gf_point(eruptions ~ waiting, data = faithful, color = ~ (eruptions > 3)) |>
#'   gf_ellipse(type = "norm", linetype = ~ "norm") |>
#'   gf_ellipse(type = "t",    linetype = ~ "t")
#'
#' gf_point(eruptions ~ waiting, data = faithful, color = ~ (eruptions > 3)) |>
#'   gf_ellipse(type = "norm",   linetype = ~ "norm") |>
#'   gf_ellipse(type = "euclid", linetype = ~ "euclid", level = 3) |>
#'   gf_refine(coord_fixed())
#'
#' # Use geom = "polygon" to enable fill
#' gf_point(eruptions ~ waiting, data = faithful, fill = ~ (eruptions > 3)) |>
#'   gf_ellipse(geom = "polygon", alpha = 0.3, color = "black")
#'
#' gf_point(eruptions ~ waiting, data = faithful, fill = ~ (eruptions > 3)) |>
#'   gf_ellipse(geom = "polygon", alpha = 0.3) |>
#'   gf_ellipse(alpha = 0.3, color = "black")
#'
#' gf_ellipse(eruptions ~ waiting, data = faithful, show.legend = FALSE,
#'   alpha = 0.3, fill = ~ (eruptions > 3), geom = "polygon") |>
#'   gf_ellipse(level = 0.68, geom = "polygon", alpha = 0.3) |>
#'   gf_point(data = faithful, color = ~ (eruptions > 3), show.legend = FALSE)

gf_ellipse <-
  layer_factory(
    geom = "path",
    stat = "ellipse",
    extras = alist(
      alpha = , color = , group = ,
      type = "t", level = 0.95, segments = 51
      # linetype = , size = ,
      # lineend = "butt", linejoin = "round", linemitre = 1, arrow = NULL
    )
  )

#' Formula interface to geom_polygon()
#'
#'
#' @inherit gf_line
#' @inheritParams ggplot2::geom_polygon
#' @param shape,stroke Aesthetics for polygons.
#' @examples
#' gf_polygon()
#' if (require(maps) && require(ggthemes) && require(dplyr)) {
#'   US <- map_data("state") |>
#'     dplyr::mutate(name_length = nchar(region))
#'   States <- US |>
#'     dplyr::group_by(region) |>
#'     dplyr::summarise(lat = mean(range(lat)), long = mean(range(long))) |>
#'     dplyr::mutate(name = abbreviate(region, 3))
#'
#'   gf_polygon(lat ~ long,
#'     data = US, group = ~group,
#'     fill = ~name_length, color = "white"
#'   ) |>
#'     gf_text(lat ~ long,
#'       label = ~name, data = States,
#'       color = "gray70", inherit = FALSE
#'     ) |>
#'     gf_refine(ggthemes::theme_map())
#' }
#' @export
gf_polygon <-
  layer_factory(
    geom = "polygon",
    extras = alist(alpha = , color = , linewidth =,
                   # size = , # remove eventually?
                   shape = , fill = , group = , stroke = )
  )


#' Formula interface to geom_smooth()
#'
#' LOESS and linear model smoothers in `ggformula`.
#'
#' @inherit gf_line
#' @inheritParams ggplot2::geom_smooth
#' @inheritParams ggplot2::stat_smooth
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_smooth()], [gf_spline()]
#'
#' @export
#' @examples
#' gf_smooth()
#' gf_lm()
#' gf_smooth(births ~ date, color = ~wday, data = mosaicData::Births78)
#' gf_smooth(births ~ date,
#'   color = ~wday, data = mosaicData::Births78,
#'   fullrange = TRUE
#' )
#' gf_smooth(births ~ date,
#'   color = ~wday, data = mosaicData::Births78,
#'   show.legend = FALSE, se = FALSE
#' )
#' gf_smooth(births ~ date,
#'   color = ~wday, data = mosaicData::Births78,
#'   show.legend = FALSE, se = TRUE
#' )
#' gf_lm(length ~ width,
#'   data = mosaicData::KidsFeet,
#'   color = ~biggerfoot, alpha = 0.2
#' ) |>
#'   gf_point()
#' gf_lm(length ~ width,
#'   data = mosaicData::KidsFeet,
#'   color = ~biggerfoot, fullrange = FALSE, alpha = 0.2
#' )
#' gf_point()
#' gf_lm(length ~ width,
#'   color = ~sex, data = mosaicData::KidsFeet,
#'   formula = y ~ poly(x, 2), linetype = "dashed"
#' ) |>
#'   gf_point()
#' gf_lm(length ~ width,
#'   color = ~sex, data = mosaicData::KidsFeet,
#'   formula = log(y) ~ x, backtrans = exp
#' ) |>
#'   gf_point()
#'
#' gf_lm(hwy ~ displ,
#'   data = mpg,
#'   formula = log(y) ~ poly(x, 3), backtrans = exp,
#'   interval = "prediction", fill = "skyblue"
#' ) |>
#'   gf_lm(
#'     formula = log(y) ~ poly(x, 3), backtrans = exp,
#'     interval = "confidence", color = "red"
#'   ) |>
#'   gf_point()
#'
#'   clotting <- data.frame(
#'    u = c(5,10,15,20,30,40,60,80,100),
#'    lot1 = c(118,58,42,35,27,25,21,19,18),
#'    lot2 = c(69,35,26,21,18,16,13,12,12))
#'   gf_point(lot1 ~ u, data = clotting) |>
#'     gf_smooth(formula = y ~ log(x), method = "glm",
#'               method.args = list(family = Gamma))
#'   gf_point(lot2 ~ u, data = clotting) |>
#'     gf_smooth(formula = y ~ log(x), color = "red", method = "glm",
#'               method.args = list(family = Gamma))
#'

# summary(glm(lot1 ~ log(u), data = clotting, family = Gamma))
# summary(glm(lot2 ~ log(u), data = clotting, family = Gamma))
gf_smooth <-
  layer_factory(
    geom = "smooth",
    stat = "smooth",
    extras = alist(
      method = "auto", formula = y ~ x, se = FALSE, method.args = ,
      n = 80, span = 0.75, fullrange = FALSE, level = 0.95
    )
  )

#' @rdname gf_smooth
#' @inheritParams geom_lm
#' @param lm.args A list of arguments to [stats::lm()].
#' @export

gf_lm <-
  layer_factory(
    geom = "lm",
    stat = "lm",
    aes_form = y ~ x,
    extras = alist(alpha = 0.3, lm.args = list(), interval = "none", level = 0.95, fullrange = TRUE)
  )

#' Formula interface to geom_spline()
#'
#' Fitting splines in `ggformula`.
#'
#' @inherit gf_line
#' @inheritParams geom_spline
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [geom_spline()], [gf_smooth()], [gf_lm()]
#' @export
#' @examples
#' gf_spline(births ~ date, color = ~wday, data = mosaicData::Births78)
#' gf_spline(births ~ date, color = ~wday, data = mosaicData::Births78, df = 20)
#' gf_spline(births ~ date, color = ~wday, data = mosaicData::Births78, df = 4)
gf_spline <-
  layer_factory(
    geom = "line",
    stat = "spline",
    extras = alist(
      alpha = , color = , group = ,
      linetype = , linewidth = ,
      # size = , # remove eventually?
      weight = , df = , spar = , tol =
      )
  )

#' Formula interface to geom_raster()
#'
#' Formula interface to geom_raster()
#'
#' @inherit gf_line
#' @inheritParams ggplot2::geom_raster
#'
#' @param gformula A formula with shape  `y ~ x` or `fill ~ x + y`
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_raster()]
#' @export
#' @examples
#' # Justification controls where the cells are anchored
#' D <- expand.grid(x = 0:5, y = 0:5)
#' D$z <- runif(nrow(D))
#' # centered squares
#' gf_raster(z ~ x + y, data = D)
#' gf_raster(y ~ x, fill = ~z, data = D)
#' # zero padding
#' gf_raster(z ~ x + y, data = D, hjust = 0, vjust = 0)
gf_raster <-
  layer_factory(
    geom = "raster",
    aes_form = list(y ~ x, fill ~ x + y),
    extras = alist(
      alpha = , color = , fill = , group = ,
      linetype = , linewidth = ,
      # size = , # remove eventually?
      hjust = 0.5, vjust = 0.5, interpolate = FALSE
    )
  )

#' Formula interface to geom_quantile()
#'
#' @inherit ggplot2::stat_quantile description references
#' @inherit gf_line
#' @inheritParams ggplot2::geom_quantile
#' @inheritParams ggplot2::stat_quantile
#' @inheritParams gf_violin
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_quantile()]
#' @export
#' @examples
#' gf_point((1 / hwy) ~ displ, data = mpg) |>
#'   gf_quantile((1 / hwy) ~ displ)
gf_quantile <-
  layer_factory(
    geom = "quantile",
    stat = "quantile",
    extras = alist(
      alpha = , color = , group = ,
      linetype = , linewidth = ,
      # size = , # remove eventually?
      lineend = "butt", linejoin = "round", linemitre = 1, quantiles = ,
      formula = , method = , method.args =
      )
  )

#' Formula interface to geom_density_2d() and geom_density_2d_filled()
#'
#' @rdname gf_density_2d
#' @inherit ggplot2::geom_density_2d description
#' @inherit gf_line
#' @inheritParams ggplot2::geom_density_2d
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_density_2d()]
#' @export
#' @examples
#' gf_jitter(avg_drinks ~ age,
#'   alpha = 0.2, data = mosaicData::HELPrct,
#'   width = 0.4, height = 0.4
#' ) |>
#'   gf_density_2d(avg_drinks ~ age, data = mosaicData::HELPrct)
gf_density_2d <-
  layer_factory(
    geom = "density_2d",
    stat = "density_2d",
    extras = alist(
      alpha = , color = , group = ,
      linetype = , linewidth = ,
      # size = , # remove eventually?
      contour = TRUE, n = 100, h = NULL, lineend = "butt", linejoin = "round",
      linemitre = 1
    )
  )

#' @rdname gf_density_2d
#' @export
#' @examples
#' gf_density_2d_filled(avg_drinks ~ age, data = mosaicData::HELPrct, show.legend = FALSE) |>
#'   gf_jitter(avg_drinks ~ age,
#'     alpha = 0.3, data = mosaicData::HELPrct,
#'     width = 0.4, height = 0.4,
#'     color = "white"
#' )
gf_density_2d_filled <-
  layer_factory(
    geom = "density_2d_filled",
    stat = "density_2d_filled",
    extras = alist(
      alpha = , color = , group = ,
      linetype = , linewidth = ,
      # size = , # remove eventually?
      contour = TRUE, n = 100, h = NULL, lineend = "butt", linejoin = "round",
      linemitre = 1
    )
  )


#' @rdname gf_density_2d
#' @export
#' @examples
#' gf_jitter(avg_drinks ~ age,
#'   alpha = 0.2, data = mosaicData::HELPrct,
#'   width = 0.4, height = 0.4
#' ) |>
#'   gf_density2d(avg_drinks ~ age, data = mosaicData::HELPrct)
gf_density2d <-
  layer_factory(
    geom = "density2d",
    stat = "density2d",
    extras = alist(
      alpha = , color = , group = ,
      linetype = , linewidth = ,
      # size = , # remove eventually?
      contour = TRUE, n = 100, h = NULL,
      lineend = "butt", linejoin = "round",
      linemitre = 1
    )
  )

#' @rdname gf_density_2d
#' @export
#' @examples
#' gf_density2d_filled(avg_drinks ~ age, data = mosaicData::HELPrct, show.legend = FALSE) |>
#'   gf_jitter(avg_drinks ~ age,
#'     alpha = 0.4, data = mosaicData::HELPrct,
#'     width = 0.4, height = 0.4,
#'     color = "white"
#' )
gf_density2d_filled <-
  layer_factory(
    geom = "density2d_filled",
    stat = "density_2d_filled",
    extras = alist(
      alpha = , color = , group = ,
      linetype = , linewidth = ,
      # size = , # remove eventually?
      contour = TRUE, n = 100, h = NULL,
      lineend = "butt", linejoin = "round",
      linemitre = 1
    )
  )

#' Formula interface to geom_hex()
#'
#' @inherit ggplot2::geom_hex details
#' @inherit gf_line
#' @inheritParams ggplot2::geom_hex
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_hex()]
#' @export
#' @examples
#' gf_hex(avg_drinks ~ age, data = mosaicData::HELPrct, bins = 15) |>
#'   gf_density2d(avg_drinks ~ age, data = mosaicData::HELPrct, color = "red", alpha = 0.5)
gf_hex <-
  layer_factory(
    geom = "hex",
    stat = "binhex",
    extras = alist(bins = , binwidth = , alpha = , color = , fill = , group = ,
                   linetype = , linewidth =
                   #size =  # remove eventually?
    )
  )

#' Formula interface to geom_boxplot()
#'
#' @inherit ggplot2::geom_boxplot description references
#' @inherit gf_line
#' @inheritParams ggplot2::geom_boxplot
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#'
#' @param outlier.color,outlier.fill,outlier.shape,outlier.size,outlier.stroke,outlier.alpha
#' 	 Default aesthetics for outliers.
#' 	 Set to NULL to inherit from the aesthetics used for the box.
#' 	 In the unlikely event you specify both US and UK spellings of colour,
#' 	 the US spelling will take precedence.
#'   Sometimes it can be useful to hide the outliers, for example when overlaying the
#'   raw data points on top of the boxplot. Hiding the outliers can be achieved by
#'   setting outlier.shape = NA. Importantly, this does not remove the outliers, it only
#'   hides them, so the range calculated for the y-axis will be the same with outliers shown
#'   and outliers hidden.
#'
#' @seealso [ggplot2::geom_boxplot()], [fivenum()], [df_stats()]
#' @export
#' @examples
#' gf_boxplot(age ~ substance, data = mosaicData::HELPrct)
#' gf_boxplot(age ~ substance, data = mosaicData::HELPrct, varwidth = TRUE)
#' gf_boxplot(age ~ substance, data = mosaicData::HELPrct, color = ~sex)
#' gf_boxplot(age ~ substance,
#'   data = mosaicData::HELPrct,
#'   color = ~sex, outlier.color = "gray50"
#' )
#' # longer whiskers
#' gf_boxplot(age ~ substance,
#'   data = mosaicData::HELPrct,
#'   color = ~sex, coef = 2
#' )
#'
#' # Note: width for boxplots is full width of box.
#' #       For jittering, it is the half-width.
#' gf_boxplot(age ~ substance | sex,
#'   data = mosaicData::HELPrct,
#'   coef = 5, width = 0.4
#' ) |>
#'   gf_jitter(width = 0.2, alpha = 0.3)
#' # move boxplots away a bit by adjusting dodge
#' gf_boxplot(age ~ substance,
#'   data = mosaicData::HELPrct,
#'   color = ~sex, position = position_dodge(width = 0.9)
#' )
gf_boxplot <-
  layer_factory(
    aes_form = list(y ~ x, ~ x, y ~ .),
    geom = "boxplot",
    stat = "boxplot",
    position = "dodge",
    extras = alist(
      alpha = , color = , fill = , group = ,
      linetype = , linewidth = ,
      # size = , # remove eventually?
      coef = ,
      outlier.color = NULL, outlier.fill = NULL,
      outlier.shape = 19, outlier.size = 1.5, outlier.stroke = 0.5,
      outlier.alpha = NULL, notch = FALSE, notchwidth = 0.5, varwidth = FALSE
    )
  )

#' Formula interface to geom_text() and geom_label()
#'
#' @inherit ggplot2::geom_text references description
#' @inherit gf_point
#' @inheritParams ggplot2::geom_text
#' @param label The text to be displayed.
#' @param angle An angle for rotating the text.
#' @param family A font family.
#' @param hjust,vjust Numbers between 0 and 1 indicating how to justify
#'   text relative the the specified location.
#' @param lineheight Line height.
#' @param fontface One of `"plain"`, `"bold"`, `"italic"`, or `"bold italic"`.
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_text()]
#' @export
#' @examples
#' data(penguins, package = "palmerpenguins")
#' gf_text(bill_length_mm ~ bill_depth_mm,
#'   data = penguins,
#'   label = ~species, color = ~species, size = 2, angle = 30
#' )
#' penguins |>
#' gf_point(bill_length_mm ~ bill_depth_mm, color = ~species, alpha = 0.5) |>
#'   gf_text(bill_length_mm ~ bill_depth_mm,
#'     label = ~species, color = ~species,
#'     size = 2, angle = 0, hjust = 0, nudge_x = 0.1, nudge_y = 0.1
#'   )
gf_text <-
  layer_factory(
    geom = "text",
    position = "nudge",
    pre = {
      if ((nudge_x != 0) || (nudge_y != 0)) {
        position <- position_nudge(nudge_x, nudge_y)
      }
    },
    extras = alist(
      label = , alpha = , angle = , color = ,
      family = , fontface = , group = , hjust = ,
      lineheight = , size = , vjust = , parse = FALSE,
      nudge_x = 0, nudge_y = 0,
      check_overlap = FALSE
    )
  )

#' @rdname gf_text
#' @export
#' @examples
#' if (require(dplyr)) {
#'   data(penguins, package = "palmerpenguins")
#'   penguins_means <-
#'     penguins |>
#'     group_by(species) |>
#'     summarise(bill_length_mm = mean(bill_length_mm), bill_depth_mm = mean(bill_depth_mm))
#'   gf_point(bill_length_mm ~ bill_depth_mm, data = penguins, color = ~species) |>
#'     gf_label(bill_length_mm ~ bill_depth_mm,
#'       data = penguins_means,
#'       label = ~species, color = ~species, size = 2, alpha = 0.7
#'     )
#' }
gf_label <-
  layer_factory(
    stat = "identity",
    geom = "label",
    position = "nudge",
    pre = {
      if ((nudge_x != 0) || (nudge_y != 0)) {
        position <- position_nudge(nudge_x, nudge_y)
      }
    },
    layer_fun = quo(ggplot2::geom_label),
    extras = alist(
      label =, alpha = , angle = , color = ,
      family = , fontface = , group = , hjust = ,
      label = , alpha = , angle = , color = ,
      family = , fontface = ,
      group = , hjust = , vjust = ,
      lineheight = , size = ,
      parse = ,
      nudge_x = 0, nudge_y = 0,
      label.padding = unit(0.25, "lines"), label.r = unit(0.15, "lines"),
      label.size = 0.25
    )
  )

#' Formula interface to geom_area()
#'
#' @inherit ggplot2::geom_area description
#' @inheritParams gf_line
#' @inheritParams ggplot2::geom_area
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_area()]
#' @export
#' @examples
#' if (require(dplyr) && require(mosaicData)) {
#'   Temps <- Weather |>
#'     filter(city == "Chicago", year == 2016, month <= 4)
#'   gf_linerange(low_temp + high_temp ~ date, color = ~high_temp, data = Temps)
#'   gf_ribbon(low_temp + high_temp ~ date, data = Temps, color = "navy", alpha = 0.3)
#'   gf_area(high_temp ~ date, data = Temps, color = "navy", alpha = 0.3)
#'
#'   gf_ribbon(low_temp + high_temp ~ date, data = Weather, alpha = 0.3) |>
#'     gf_facet_grid(city ~ .)
#'
#'   gf_linerange(low_temp + high_temp ~ date, color = ~high_temp, data = Weather) |>
#'     gf_facet_grid(city ~ .) |>
#'     gf_refine(scale_colour_gradientn(colors = rev(rainbow(5))))
#' }
gf_area <-
  layer_factory(
    geom = "area",
    extras = alist(
      alpha = , color = , fill = , group = ,
      # size = , # remove eventually?
      linetype = , linewidth =
    )
  )

#' Formula interface to geom_violin()
#'
#' @inherit ggplot2::geom_violin references description
#' @inherit gf_point
#' @inheritParams gf_line
#' @inheritParams ggplot2::geom_violin
#' @inheritParams ggplot2::stat_ydensity
#' @param weight Useful for summarized data, `weight` provides a count
#'   of the number of values with the given combination of `x` and `y` values.
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_violin()]
#' @export
#' @examples
#' gf_violin(age ~ substance, data = mosaicData::HELPrct)
#' gf_violin(age ~ substance, data = mosaicData::HELPrct, fill = ~sex)
gf_violin <-
  layer_factory(
    geom = "violin",
    stat = "ydensity",
    position = "dodge",
    extras = alist(
      alpha = , color = , fill = , group = ,
      linetype = , linewidth = ,
      # size = , # remove eventually?
      weight = , draw_quantiles = NULL, trim = TRUE,
      scale = "area", bw = , adjust = 1, kernel = "gaussian"
    )
  )

#' Formula interface to geom_spoke()
#'
#' This is a polar parameterisation of geom_segment.
#' It is useful when you have variables that describe direction
#' and distance.
#'
#' @inherit ggplot2::geom_spoke description references
#' @inherit gf_line
#' @inheritParams ggplot2::geom_spoke
#' @param angle The angle at which segment leaves the point (x,y).
#' @param radius The length of the segment.
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_spoke()]
#' @export
#' @examples
#' SomeData <- expand.grid(x = 1:10, y = 1:10)
#' SomeData$angle <- runif(100, 0, 2 * pi)
#' SomeData$speed <- runif(100, 0, sqrt(0.1 * SomeData$x))
#'
#' gf_point(y ~ x, data = SomeData) |>
#'   gf_spoke(y ~ x, angle = ~angle, radius = 0.5)
#'
#' gf_point(y ~ x, data = SomeData) |>
#'   gf_spoke(y ~ x, angle = ~angle, radius = ~speed)
gf_spoke <-
  layer_factory(
    geom = "spoke",
    extras = alist(
      angle = , radius = ,
      alpha = , color = , group = ,
      # size = , # remove eventually?
      linetype = , linewidth =
      ),
    note = "Note: angle and radius must be set or mapped."
  )


#' Formula interface to geom_step()
#'
#' @inherit ggplot2::geom_step description references
#' @inherit gf_line
#' @inheritParams ggplot2::geom_step
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_step()]
#' @export
#' @examples
#' gf_step(births ~ date, data = mosaicData::Births78, color = ~wday)
#'
#' # Roll your own Kaplan-Meier plot
#'
#' if (require(survival) && require(broom)) {
#'   # fit a survival model
#'   surv_fit <- survfit(coxph(Surv(time, status) ~ age + sex, lung))
#'   surv_fit
#'   # use broom::tidy() to create a tidy data frame for plotting
#'   surv_df <- tidy(surv_fit)
#'   head(surv_df)
#'   # now create a plot
#'   surv_df |>
#'     gf_step(estimate ~ time) |>
#'     gf_ribbon(conf.low + conf.high ~ time, alpha = 0.2)
#' }
gf_step <-
  layer_factory(
    geom = "step",
    extras = alist(
      alpha = , color = , group = ,
      linetype = , linewidth = ,
      # size = , # remove eventually?
      direction = "hv")
  )

#' Formula interface to geom_tile()
#'
#' @inherit ggplot2::geom_tile description references
#' @inherit gf_line
#' @inherit gf_point
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_tile()]
#' @export
#' @examples
#' D <- expand.grid(x = 0:5, y = 0:5)
#' D$z <- runif(nrow(D))
#' gf_tile(y ~ x, fill = ~z, data = D)
#' gf_tile(z ~ x + y, data = D)
gf_tile <-
  layer_factory(
    geom = "tile",
    aes_form = list(y ~ x, fill ~ x + y),
    extras = alist(
      alpha = , color = , fill = , group = ,
      # size = , # remove eventually?
      linetype = , linewidth =
    )
  )

#' Formula interface to geom_bin2d()
#'
#' `geom_bin2d()` uses [`ggplot2::stat_bin2d()`] to bin the data before using
#' [`gf_tile()`] to display the results.
#'
#' @inherit ggplot2::geom_tile references
#' @inherit gf_tile
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [`ggplot2::geom_bin2d()`], [`gf_tile()`]
#' @export
#' @examples
#' gf_bin2d(eruptions ~ waiting, data = faithful, bins = 15) |>
#'   gf_refine(scale_fill_viridis_c(begin = 0.1, end = 0.9))
gf_bin2d <-
  layer_factory(
    geom = "tile",
    stat = "bin2d",
    aes_form = list(y ~ x),
    extras = alist(
      alpha = , color = , fill = , group = ,
      # size = , # remove eventually?
      linetype = , linewidth =
    )
  )

#' Formula interface to geom_count()
#'
#' @inherit ggplot2::geom_count description references
#' @inherit gf_point
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_count()]
#' @export
#' @examples
#' # Best used in conjunction with scale_size_area which ensures that
#' # counts of zero would be given size 0. This doesn't make much difference
#' # here because the smallest count is already close to 0.
#'
#' gf_count(hwy ~ cty, data = mpg, alpha = 0.3) |>
#'   gf_refine(scale_size_area())
gf_count <-
  layer_factory(
    geom = "point",
    stat = "sum",
    extras = alist(
      alpha = , color = , fill = , group = , shape = , size = , stroke =
      )
  )

#' Formula interface to geom_col()
#'
#' @inherit ggplot2::geom_col description references
#' @inherit gf_line
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_col()]
#' @export
#' @examples
#' SomeData <- data.frame(
#'   group = LETTERS[1:3],
#'   count = c(20, 25, 18)
#' )
#' gf_col(count ~ group, data = SomeData)
#'
#' # A Pareto chart
#'
#' if (require(dplyr) && require(mosaicData)) {
#'   HELPrct |>
#'     group_by(substance) |>
#'     summarise(count = n()) |>
#'     ungroup() |>
#'     dplyr::arrange(-count) |>
#'     mutate(
#'       cumcount = cumsum(count),
#'       substance = reorder(substance, -count)
#'     ) |>
#'     gf_col(count ~ substance, fill = "skyblue") |>
#'     gf_point(cumcount ~ substance) |>
#'     gf_line(cumcount ~ substance, group = 1) |>
#'     gf_refine(
#'       scale_y_continuous(sec.axis = sec_axis(~ . / nrow(HELPrct)))
#'     )
#' }
gf_col <-
  layer_factory(
    geom = "col",
    position = "stack",
    extras = alist(
      alpha = , color = , fill = , group = ,
      # size = ,# remove eventually?
      linetype = , linewidth =
      )
  )

#' Formula interface to geom_blank()
#'
#' @inherit ggplot2::geom_blank description references
#' @inherit gf_line
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_blank()]
#' @export
#' @examples
#'
#' gf_point((c(0, 1)) ~ (c(0, 5)))
#' gf_frame((c(0, 1)) ~ (c(0, 5)))
#' gf_blank((c(0, 1)) ~ (c(0, 5)))
#' # gf_blank() can be used to expand the view
#' gf_point((c(0, 1)) ~ (c(0, 5))) |>
#'   gf_blank((c(0, 3)) ~ (c(-2, 7)))
gf_blank <-
  layer_factory(geom = "blank", check.aes = FALSE)

#' @rdname gf_blank
#' @export
#'
gf_frame <-
  layer_factory(geom = "blank", check.aes = FALSE)


#' Formula interface to geom_histogram()
#'
#' Count and density histograms in `ggformula`.
#' @inherit ggplot2::geom_histogram description references
#' @inherit gf_line
#' @inheritParams ggplot2::geom_histogram
#' @param gformula A formula with shape `~ x` (or `y ~ x`, but this shape is not
#'   generally needed).
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_histogram()]
#' @export
#' @examples
#' x <- rnorm(1000)
#' gf_histogram(~x, bins = 30)
#' gf_dhistogram(~x, bins = 30)
#' gf_dhistogram(~x, binwidth = 0.5, center = 0, color = "black")
#' gf_dhistogram(~x, binwidth = 0.5, boundary = 0, color = "black")
#' gf_dhistogramh(x ~ ., binwidth = 0.5, boundary = 0, color = "black")
#' gf_dhistogram(~x, bins = 30) |>
#'   gf_fitdistr(dist = "dnorm") # see help for gf_fitdistr() for more info.
#'
#' gf_histogram(~x, fill = ~ (abs(x) <= 2), boundary = 2, binwidth = 0.25)
#'
#' data(penguins, package = "palmerpenguins")
#' gf_histogram(~ bill_length_mm | species, data = penguins, binwidth = 0.25)
#' gf_histogram(~age,
#'   data = mosaicData::HELPrct, binwidth = 5,
#'   fill = "skyblue", color = "black"
#' )
#' # bins can be adjusted left/right using center or boundary
#' gf_histogram(~age,
#'   data = mosaicData::HELPrct,
#'   binwidth = 5, fill = "skyblue", color = "black", center = 42.5
#' )
#' gf_histogram(~age,
#'   data = mosaicData::HELPrct,
#'   binwidth = 5, fill = "skyblue", color = "black", boundary = 40
#' )
#' gf_histogram(age ~ .,
#'   data = mosaicData::HELPrct,
#'   binwidth = 5, fill = "skyblue", color = "black", boundary = 40
#' )
gf_histogram <-
  layer_factory(
    geom = "bar", stat = "bin", position = "stack",
    aes_form = list(~x, y ~ ., y ~ x),
    extras = alist(
      bins = 25, binwidth = , alpha = 0.5, color = , fill = , group = ,
      # size = # remove eventually?
      linetype = , linewidth =
    ),
    note =
        "y may be after_stat(density) or after_stat(count) or after_stat(ndensity) or after_stat(ncount), but see gf_dhistogram().",
  )

#' @rdname gf_histogram
#' @export
gf_dhistogram <-
  layer_factory(
    geom = "bar", stat = "bin", position = "stack",
    aes_form = list(~x, y ~ x,  y ~ .),
    extras =
      alist(
        bins = 25, binwidth = , alpha = 0.5, color = , fill = , group = ,
        linetype = , linewidth =
      ),
    note =
        "y may be after_stat(density) or after_stat(count) or after_stat(ndensity) or after_stat(ncount)",
    aesthetics = aes(y = ggplot2::after_stat(density))
  )

#' @rdname gf_histogram
#' @export
gf_dhistogramh <-
  layer_factory(
    geom = "bar", stat = "bin", position = "stack",
    aes_form = list(y ~ x,  y ~ .),
    extras =
      alist(
        bins = 25, binwidth = , alpha = 0.5, color = , fill = , group = ,
        linetype = , linewidth =
      ),
    note =
        "x may be after_stat(density) or after_stat(count) or after_stat(ndensity) or after_stat(ncount)",
    aesthetics = aes(x = ggplot2::after_stat(density))
  )
#' Formula interface to stat_density()
#'
#' Computes and draws a kernel density estimate, which is a smoothed version of the
#' histogram and is a useful alternative when the data come from an underlying smooth
#' distribution.
#' The only difference between `gf_dens()` and `gf_density()` is the default geom
#' used to show the density curve: `gf_density()` uses an area geom (which can be filled).
#' `gf_dens()` using a line geom (which cannot be filled).
#'
#' @inherit ggplot2::geom_density description references
#' @inherit gf_line
#' @inheritParams ggplot2::geom_density
#'
#' @param gformula A formula with shape `~ x`.
#'   Faceting can be achieved by including `|` in the formula.
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [`gf_ash()`], [`ggplot2::geom_density()`]
#' @export
#' @examples
#' gf_dens()
#' data(penguins, package = "palmerpenguins")
#' gf_density(~bill_length_mm, fill = ~species, data = penguins)
#' gf_dens(~bill_length_mm, color = ~species, data = penguins)
#' gf_dens2(~bill_length_mm, color = ~species, fill = ~species, data = penguins)
#' gf_freqpoly(~bill_length_mm, color = ~species, data = penguins, bins = 15)
#' # Chaining in the data
#' data(penguins, package = "palmerpenguins")
#' penguins |> gf_dens(~bill_length_mm, color = ~species)
#' # horizontal orientation
#' penguins |> gf_dens(bill_length_mm ~ ., color = ~species)
gf_density <-
  layer_factory(
    geom = "area", stat = "density",
    aes_form = list( ~x, y ~ .),
    extras = alist(
      alpha = 0.5, color = , fill = ,
      group = ,
      linetype = , linewidth =,
      # size = , # remove eventually?
      kernel = "gaussian", n = 512, trim = FALSE
    ),
    aesthetics = aes(y = ggplot2::after_stat(density))
  )

#' @rdname gf_density
#' @export

gf_dens <-
  layer_factory(
    geom = "line", stat = "density",
    aes_form = list( ~x, y ~ .),
    extras = alist(
      alpha = 0.5, color = , fill = NA,
      group = ,
      linetype = , linewidth =,
      # size = , # remove eventually?
      kernel = "gaussian", n = 512, trim = FALSE
    ),
    aesthetics = aes(y = ggplot2::after_stat(density))
  )

#' @rdname gf_density
#' @export

gf_dens2 <-
  layer_factory(
    geom = "density_line", stat = "density",
    aes_form = list( ~x, y ~ .),
    extras = alist(
      alpha = 0.5, color = , fill = NA,
      group = ,
      linetype = , linewidth =,
      # size = , # remove eventually?
      kernel = "gaussian", n = 512, trim = FALSE
    ),
    aesthetics = aes(y = ggplot2::after_stat(density))
  )
#' Formula interface to geom_dotplot()
#'
#' @inherit gf_point
#' @inherit ggplot2::geom_dotplot details description references
#' @inheritParams ggplot2::geom_dotplot
#' @param gformula A formula with shape `~ x`.
#'   Faceting can be achieved by including `|` in the formula.
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @section Warning:
#' Dotplots in `ggplot2` (and hence in `ggformula`) often require some fiddling because
#' the default y-axis is meaningless and the ideal size of the dots depends on the
#' aspect ratio of the plot.
#'
#' @seealso [ggplot2::geom_dotplot()]
#' @export
#' @examples
#' data(penguins, package = "palmerpenguins")
#' gf_dotplot(~bill_length_mm, fill = ~species, data = penguins)
gf_dotplot <-
  layer_factory(
    geom = "dotplot",
    stat = rlang::quo(ggplot2::StatBin),
    layer_fun = rlang::quo(ggplot2::geom_dotplot),
    aes_form = ~x,
    extras = alist(
      alpha = , color = , fill = , group = ,
      binwidth = NULL, binaxis = "x", method = "dotdensity",
      binpositions = "bygroup", stackdir = "up", stackratio = 1,
      dotsize = 1, stackgroups = FALSE, origin = NULL, right = TRUE,
      width = 0.9, drop = FALSE
    )
  )

#' Formula interface to geom_bar()
#'
#' @inherit ggplot2::geom_bar description references
#' @inherit gf_point
#' @inheritParams gf_line
#' @inheritParams ggplot2::geom_bar
#'
#' @param gformula A formula, typically with shape `~ x`.  (`y ~ x` is also possible,
#'   but typically using one of [gf_col()], [gf_props()], or [gf_percents()] is preferable
#'   to using this formula shape.)
#'   Faceting can be achieved by including `|` in the formula.
#' @param width Width of the bars.
#' @param denom A formula, the right hand side of which describes the denominators used for
#'   computing proportions and percents.  These are computed after the stat has been applied
#'   to the data and should refer to variables available at that point.  See the examples.
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_bar()]
#' @export
#' @examples
#' gf_bar(~substance, data = mosaicData::HELPrct)
#' gf_bar(~substance, data = mosaicData::HELPrct, fill = ~sex)
#' gf_bar(~substance,
#'   data = mosaicData::HELPrct, fill = ~sex,
#'   position = position_dodge()
#' )
#' # gf_counts() is another name for gf_bar()
#' gf_counts(~substance,
#'   data = mosaicData::HELPrct, fill = ~sex,
#'   position = position_dodge()
#' )
#' # gf_props() and gf_percents() use proportions or percentages instead of counts
#' # use denom to control which denominators are used.
#' gf_props(~substance,
#'   data = mosaicData::HELPrct, fill = ~sex,
#'   position = position_dodge()
#' )
#' gf_props(substance ~ .,
#'   data = mosaicData::HELPrct, fill = ~sex,
#'   position = position_dodge(),
#'   orientation = 'y'
#' )
#' gf_props(substance ~ .,
#'   data = mosaicData::HELPrct, fill = ~sex,
#'   position = "dodge"
#' )
#'
#' gf_percents(~substance,
#'   data = mosaicData::HELPrct, fill = ~sex,
#'   position = position_dodge()
#' )
#' gf_percents(~substance,
#'   data = mosaicData::HELPrct, fill = ~sex,
#'   position = position_dodge(),
#'   denom = ~x
#' )
#' gf_percents(~substance,
#'   data = mosaicData::HELPrct, fill = ~sex,
#'   position = position_dodge(),
#'   denom = ~fill
#' )
#' gf_percents(~substance | sex,
#'   data = mosaicData::HELPrct, fill = ~homeless,
#'   position = position_dodge()
#' )
#' gf_percents(~substance | sex,
#'   data = mosaicData::HELPrct,
#'   fill = ~homeless,
#'   denom = ~fill,
#'   position = position_dodge()
#' )
#' gf_percents(~substance | sex,
#'   data = mosaicData::HELPrct,
#'   fill = ~homeless,
#'   denom = ~interaction(fill, PANEL),
#'   position = position_dodge()
#' )
#' if (require(scales)) {
#'   gf_percents(~substance,
#'     data = mosaicData::HELPrct, fill = ~sex,
#'     position = position_dodge(),
#'     denom = ~ x,
#'   ) |>
#'     gf_refine(scale_y_continuous(labels = scales::percent))
#' }
gf_bar <-
  layer_factory(
    geom = "bar", stat = "count", position = "stack",
    aes_form = list(~x, y ~ ., y ~ x),
    extras = alist(
      alpha = , color = , fill = , group = ,
      linetype = , linewidth = ,
      # size = , # remove eventually?
      width = NULL
    )
  )

#' @rdname gf_bar
#' @export

gf_counts <-
  layer_factory(
    geom = "bar", stat = "count", position = "stack",
    aes_form = list(~x, y ~.),
    extras = alist(
      alpha = , color = , fill = , group = ,
      linetype = , linewidth = ,
      # size = , # remove eventually?
      width = NULL
    )
  )

#' Compute groupwise proportions and percents
#'
#' Transform a vector of counts and a vector of groups into
#' a vector of proportions or percentages within groups.
#'
#' @rdname proportions
#' @param x A vector of counts
#' @param group A vector to determine groups.
#'
#' @export
#' @examples
#'
#' x <- c(20, 30, 30, 70)
#' g1 <- c("A", "A", "B", "B")
#' g2 <- c("A", "B", "A", "B")
#' props_by_group(x, g1)
#' percs_by_group(x, g1)
#' props_by_group(x, g2)

percs_by_group <-
  function(x, group) {
    tibble(x, group = rep(!!group, length.out = length(x))) |>
      dplyr::group_by(group) |>
      dplyr::mutate(s = sum(x), p = 100 * x / s) |>
      dplyr::pull(p)
  }

#' @rdname proportions
#' @export
props_by_group <-
  function(x, group) {
    tibble(x, group = rep(!!group, length.out = length(x))) |>
      dplyr::group_by(group) |>
      dplyr::mutate(s = sum(x), p = x / s) |>
      dplyr::pull(p)
  }

#' @rdname gf_bar
#' @export
gf_props <-
  layer_factory(
    geom = "bar", stat = "count", position = "stack",
    aes_form = list(~x, y ~ ., y ~ x),
    extras =
      alist(
        alpha = , color = , fill = , group = ,
        linetype = , linewidth = ,
        # size = , # remove eventually?
        ylab = "proportion"
      ),
    aesthetics = aes(y = ggplot2::after_stat(props_by_group(count, DENOM))),
    # pre = { aesthetics[['y']][[2]][[2]][[3]] <- rlang::f_rhs(denom) },
    pre = {
      yaes_expr <- rlang::quo_get_expr(aesthetics[['y']]);
      yaes_expr[[2]][[3]] <- rlang::f_rhs(denom) ;
      aesthetics[['y']] <- yaes_expr
    },
    denom = ~ PANEL
  )

#' @rdname gf_bar
#' @export
gf_percents <-
  layer_factory(
    geom = "bar", stat = "count", position = "stack",
    aes_form = list(~x, y ~ .),
    extras = alist(
      alpha = , color = , fill = , group = ,
      linetype = , linewidth = ,
      # size = , # remove eventually?
      ylab = "percent"
    ),
    aesthetics = aes(y = ggplot2::after_stat(percs_by_group(count, DENOM))),
    pre = {
      yaes_expr <- rlang::quo_get_expr(aesthetics[['y']]);
      yaes_expr[[2]][[3]] <- rlang::f_rhs(denom) ;
      aesthetics[['y']] <- yaes_expr
    },
    denom = ~ PANEL
  )

#' Formula interface to geom_freqpoly()
#'
#' @inherit ggplot2::geom_freqpoly description references
#' @inherit gf_line
#' @inheritParams ggplot2::geom_freqpoly
#' @param gformula A formula with shape `~ x` or `y ~ x`.
#'   Faceting can be achieved by including `|` in the formula.
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_freqpoly()]
#' @export
#' @examples
#' data(penguins, package = "palmerpenguins")
#' gf_histogram(~ bill_length_mm | species, alpha = 0.2, data = penguins, bins = 20) |>
#'   gf_freqpoly(~bill_length_mm, data = penguins, color = ~species, bins = 20)
#' gf_freqpoly(~bill_length_mm, color = ~species, data = penguins, bins = 20)
#' gf_dens(~bill_length_mm, data = penguins, color = "navy") |>
#'   gf_freqpoly(after_stat(density) ~ bill_length_mm,
#'     data = penguins,
#'     color = "red", bins = 20
#'   )
gf_freqpoly <-
  layer_factory(
    geom = "path", stat = "bin",
    aes_form = list(~x, y ~ .),
    extras = alist(
      alpha = , color = , group = ,
      linetype = , linewidth = ,
      # size = , # remove eventually?
      binwidth = , bins = , center = , boundary =
      ),
    note =
        "y may be omitted or after_stat(density) or after_stat(count) or after_stat(ndensity) or after_stat(ncount)."
  )

#' Formula interface to geom_qq()
#'
#' `gf_qq()` an `gf_qqstep()` both create quantile-quantile plots. They
#' differ in how they display the qq-plot.
#' `gf_qq()` uses points and `gf_qqstep()` plots a step function
#' through these points.
#'
#' @inherit gf_freqpoly
#' @inheritParams ggplot2::stat_qq
#' @param gformula A formula with shape `~ sample`. Facets can be
#'   added using `|`.
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_qq()]
#' @export
#' @examples
#' gf_qq(~ rnorm(100))
#' data(penguins, package = "palmerpenguins")
#' gf_qq(~ bill_length_mm | species, data = penguins) |> gf_qqline()
#' gf_qq(~ bill_length_mm | species, data = penguins) |> gf_qqline(tail = 0.10)
#' gf_qq(~bill_length_mm, color = ~species, data = penguins) |>
#'   gf_qqstep(~bill_length_mm, color = ~species, data = penguins)
gf_qq <-
  layer_factory(
    geom = "point", stat = "qq",
    aes_form = ~sample,
    extras = alist(group = , distribution = stats::qnorm, dparams = list())
  )
#' @rdname gf_qq
#' @export

gf_qqline <-
  layer_factory(
    geom = "path", stat = "qq_line",
    aes_form = ~sample,
    extras = alist(
      group = , distribution = stats::qnorm, dparams = list(),
      linetype = "dashed", alpha = 0.7
    )
  )

#' @export
#' @rdname gf_qq

gf_qqstep <-
  layer_factory(
    geom = "step", stat = "qq", position = "identity",
    aes_form = ~sample,
    extras = alist(group = , distribution = stats::qnorm, dparams = list())
  )

#' Formula interace to empirical cumulative distribution
#'
#' The empirical cumulative distribution function (ECDF) provides an alternative
#' visualization of distribution. Compared to other visualizations that rely on
#' density (like histograms or density plots) the ECDF doesn't require any tuning
#' parameters and handles both continuous and categorical variables. The
#' downside is that it requires more training to accurately interpret, and the
#' underlying visual tasks are somewhat more challenging.
#'
#' @inheritParams ggplot2::stat_ecdf
#' @inheritParams gf_step
#' @export
#' @examples
#' Data <- data.frame(
#'   x = c(rnorm(100, 0, 1), rnorm(100, 0, 3), rt(100, df = 3)),
#'   g = gl(3, 100, labels = c("N(0, 1)", "N(0, 3)", "T(df = 3)") )
#' )
#' gf_ecdf( ~ x, data = Data)

#' # Don't go to positive/negative infinity
#' gf_ecdf( ~ x, data = Data, pad = FALSE)
#'
#' # Multiple ECDFs
#' gf_ecdf( ~ x, data = Data, color = ~ g)

gf_ecdf <-
  layer_factory(
    geom = "step", stat = "ecdf", position = "identity",
    aes_form = list(~ x, y ~ .),
    extras = alist(group = , pad = , n = NULL)
  )

#' Formula interface to geom_rug()
#'
#' `gf_rugx()` and `gf_rugy()` are versions that only add a rug to x- or y- axis.
#' By default, these functions do not inherit from the formula in the original layer
#' (because doing so would often result in rugs on both axes), so the formula is required.
#'
#' @inherit ggplot2::geom_rug description
#' @inheritParams ggplot2::geom_rug
#' @inherit gf_line
#'
#' @param gformula A formula with shape `y ~ x` (`gf_rug()`) or `~ x` (`gf_rugx()`) or
#'   `~ y` (`gf_rugy()`).
#' @param width amount of horizontal jittering when position is jittered.
#' @param height amount of vertical jittering when position is jittered.
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_rug()]
#' @export
#' @examples
#' data(penguins, package = "palmerpenguins")
#' gf_point(bill_length_mm ~ bill_depth_mm, data = penguins) |>
#'   gf_rug(bill_length_mm ~ bill_depth_mm)
#'
#' # There are several ways to control x- and y-rugs separately
#' gf_point(bill_length_mm ~ bill_depth_mm, data = penguins) |>
#'   gf_rugx(~bill_depth_mm, data = penguins, color = "red") |>
#'   gf_rugy(bill_length_mm ~ ., data = penguins, color = "green")
#'
#' gf_point(bill_length_mm ~ bill_depth_mm, data = penguins) |>
#'   gf_rug(. ~ bill_depth_mm, data = penguins, color = "red", inherit = FALSE) |>
#'   gf_rug(bill_length_mm ~ ., data = penguins, color = "green", inherit = FALSE)
#'
#' gf_point(bill_length_mm ~ bill_depth_mm, data = penguins) |>
#'   gf_rug(. ~ bill_depth_mm, data = penguins, color = "red", sides = "b") |>
#'   gf_rug(bill_length_mm ~ ., data = penguins, color = "green", sides = "l")
#'
#' # jitter requires both an x and a y, but we can turn off one or the other with sides
#' gf_jitter(bill_length_mm ~ bill_depth_mm, data = penguins) |>
#'   gf_rug(color = "green", sides = "b", position = "jitter")
#'
#' # rugs work with some 1-varialbe plots as well.
#' gf_histogram(~eruptions, data = faithful) |>
#'   gf_rug(~eruptions, data = faithful, color = "red") |>
#'   gf_rug(~eruptions, data = faithful, color = "navy", sides = "t")
#'
#' # we can take advantage of inheritance to shorten the code
#' gf_histogram(~eruptions, data = faithful) |>
#'   gf_rug(color = "red") |>
#'   gf_rug(color = "navy", sides = "t")
#'
#' # Need to turn off inheritance when using gf_dhistogram:
#' gf_dhistogram(~eruptions, data = faithful) |>
#'   gf_rug(~eruptions, data = faithful, color = "red", inherit = FALSE)
#'
#' # using jitter with gf_histogram() requires manually setting the y value.
#' gf_dhistogram(~bill_depth_mm, data = penguins) |>
#'   gf_rug(0 ~ bill_depth_mm, data = penguins, color = "green", sides = "b", position = "jitter")
#'
#' # the choice of y value can affect how the plot looks.
#' gf_dhistogram(~bill_depth_mm, data = penguins) |>
#'   gf_rug(0.5 ~ bill_depth_mm, data = penguins, color = "green", sides = "b", position = "jitter")
gf_rug <-
  layer_factory(
    geom = "rug",
    aes_form = list(~x, y ~ x, NULL),
    extras = alist(
      sides = "bl", alpha = , color = , group = ,
      # size =  # remove eventually?
      linetype = , linewidth =
    )
  )

#' @rdname gf_rug
#' @export
#' @importFrom rlang %||%
gf_rugx <-
  layer_factory(
    geom = "rug",
    aes_form = list( ~ x, y ~ x, NULL),
    check.aes = FALSE,
    inherit = FALSE,
    extras = alist(
      sides = "b", alpha = , color = , group = ,
      linetype = , linewidth = ,
      # size = , # remove eventually?
      height = 0),
    pre = {
      if (inherits(object, "gg")) {
        if (uses_stat(object$mapping$y)) {
          orig_args[["y"]] <- orig_args[["y"]] %||% ~ 0
        }
      }
    }
  )

#' @rdname gf_rug
#' @export
gf_rugy <-
  layer_factory(
    geom = "rug",
    aes_form = list(~y, y ~ ., NULL),
    inherit = FALSE,
    extras = alist(
      sides = "l", alpha = , color = , group = ,
      linetype = , linewidth = ,
      # size = , # remove eventually?
      width = 0),
    pre = {
      if (inherits(object, "gg")) {
        if (uses_stat(object$mapping$x)) {
          orig_args[["x"]] <- orig_args[["x"]] %||% ~ 0
        }
      }
    }
  )

#' Formula interface to geom_contour() and geom_contour_filled()
#'
#' @rdname gf_contour
#' @inherit ggplot2::geom_contour description references
#' @inherit gf_point
#' @inheritParams ggplot2::geom_contour
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_contour()], [gf_density_2d()]
#' @export
#' @examples
#' gf_density_2d(eruptions ~ waiting, data = faithful, alpha = 0.5, color = "navy") |>
#'   gf_contour(density ~ waiting + eruptions, data = faithfuld, bins = 10, color = "red")
gf_contour <-
  layer_factory(
    geom = "contour", stat = "contour",
    aes_form = z ~ x + y
  )

#' @rdname gf_contour
#' @export
#' @examples
#' gf_contour_filled(density ~ waiting + eruptions, data = faithfuld, bins = 10,
#'     show.legend = FALSE) |>
#'   gf_jitter(eruptions ~ waiting, data = faithful, color = "white", alpha = 0.5,
#'     inherit = FALSE)
gf_contour_filled <-
  layer_factory(
    geom = "contour_filled", stat = "contour_filled",
    aes_form = z ~ x + y
  )

#' Formula interface to geom_ribbon()
#'
#' @inherit ggplot2::geom_ribbon description references
#' @inherit gf_area
#' @inheritParams ggplot2::geom_ribbon
#' @param gformula A formula with shape `ymin + ymax ~ x`.
#'   Faceting can be achieved by including `|` in the formula.
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_ribbon()]
#' @export
#' @examples
#' gf_ribbon()
#'
#' gf_ribbon(low_temp + high_temp ~ date, data = mosaicData::Weather, fill = ~city, alpha = 0.4) |>
#'   gf_theme(theme = theme_minimal())
#' gf_linerange(
#'   low_temp + high_temp ~ date | city ~ .,
#'   color = ~high_temp,
#'   data = mosaicData::Weather
#' ) |>
#'   gf_refine(scale_colour_gradientn(colors = rev(rainbow(5))))
#' gf_ribbon(low_temp + high_temp ~ date | city ~ ., data = mosaicData::Weather)
#' # Chaining in the data
#' \dontrun{
#' mosaicData::Weather |>
#'   gf_ribbon(low_temp + high_temp ~ date, alpha = 0.4) |>
#'   gf_facet_grid(city ~ .)
#' }
gf_ribbon <-
  layer_factory(
    geom = "ribbon",
    aes_form = list(ymin + ymax ~ x, y ~ xmin + xmax),
    extras = list(alpha = 0.3)
  )

#' Formula interface to geom_curve()
#'
#' @inherit ggplot2::geom_curve description references
#' @inherit gf_line
#' @inheritParams ggplot2::geom_curve
#'
#' @param gformula A formula with shape `y + yend ~ x + xend`.
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_curve()]
#' @export
#' @examples
#' D <- data.frame(x1 = 2.62, x2 = 3.57, y1 = 21.0, y2 = 15.0)
#' gf_point(mpg ~ wt, data = mtcars) |>
#'   gf_curve(y1 + y2 ~ x1 + x2, data = D, color = "navy") |>
#'   gf_segment(y1 + y2 ~ x1 + x2, data = D, color = "red")
gf_curve <-
  layer_factory(
    geom = "curve", aes_form = y + yend ~ x + xend,
    extras = alist(
      alpha = , color = , group = ,
      linetype = , linewidth = ,
      # size = , # remove eventually?
      curvature = 0.5, angle = 90, ncp = 5, arrow = NULL, lineend = "butt"
    )
  )

#' Formula interface to geom_segment()
#'
#' @inherit ggplot2::geom_segment description references
#' @inherit gf_curve
#' @inheritParams ggplot2::geom_segment
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_segment()]
#' @export
#' @examples
#' D <- data.frame(x1 = 2.62, x2 = 3.57, y1 = 21.0, y2 = 15.0)
#' gf_point(mpg ~ wt, data = mtcars) |>
#'   gf_curve(y1 + y2 ~ x1 + x2, data = D, color = "navy") |>
#'   gf_segment(y1 + y2 ~ x1 + x2, data = D, color = "red")
gf_segment <-
  layer_factory(
    geom = "segment",
    aes_form = y + yend ~ x + xend,
    extras = alist(
      alpha = , color = , group = ,
      linetype = , linewidth = ,
      # size = , # remove eventually?
      arrow = NULL, lineend = "butt"
    )
  )

#' Formula interface to geom_linerange() and geom_pointrange()
#'
#' @inherit ggplot2::geom_linerange description references
#' @inherit gf_ribbon
#' @inheritParams ggplot2::geom_linerange
#' @inheritParams gf_line
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_linerange()]
#' @export
#' @examples
#' gf_linerange()
#'
#' gf_ribbon(low_temp + high_temp ~ date,
#'   data = mosaicData::Weather,
#'   fill = ~city, alpha = 0.4
#' ) |>
#'   gf_theme(theme = theme_minimal())
#' gf_linerange(
#'   low_temp + high_temp ~ date | city ~ .,
#'   data = mosaicData::Weather,
#'   color = ~ ((low_temp + high_temp) / 2)
#' ) |>
#'   gf_refine(scale_colour_gradientn(colors = rev(rainbow(5)))) |>
#'   gf_labs(color = "mid-temp")
#'
#' gf_ribbon(low_temp + high_temp ~ date | city ~ ., data = mosaicData::Weather)
#'
#' # Chaining in the data
#' mosaicData::Weather |>
#'   gf_ribbon(low_temp + high_temp ~ date, alpha = 0.4) |>
#'   gf_facet_grid(city ~ .)
gf_linerange <-
  layer_factory(
    geom = "linerange",
    aes_form = list(ymin + ymax ~ x, y ~ xmin + xmax),
    extras = alist(
      alpha = , color = , group = ,
      linetype = , linewidth =
      # size =  # remove eventually?
    )
  )

#' @rdname gf_linerange
#' @inheritParams ggplot2::geom_pointrange
#' @param size size aesthetic for points (`gf_pointrange()`).
#' @seealso [ggplot2::geom_pointrange()]
#' @export
#' @examples
#' if (require(mosaicData) && require(dplyr)) {
#'   HELP2 <- HELPrct |>
#'     group_by(substance, sex) |>
#'     summarise(
#'       age = NA,
#'       mean.age = mean(age),
#'       median.age = median(age),
#'       max.age = max(age),
#'       min.age = min(age),
#'       sd.age = sd(age),
#'       lo = mean.age - sd.age,
#'       hi = mean.age + sd.age
#'     )
#'
#'   gf_jitter(age ~ substance, data = HELPrct,
#'       alpha = 0.5, width = 0.2, height = 0, color = "skyblue") |>
#'     gf_pointrange(mean.age + lo + hi ~ substance, data = HELP2) |>
#'     gf_facet_grid(~sex)
#'
#'   gf_jitter(age ~ substance, data = HELPrct,
#'     alpha = 0.5, width = 0.2, height = 0, color = "skyblue") |>
#'     gf_errorbar(lo + hi ~ substance, data = HELP2, inherit = FALSE) |>
#'     gf_facet_grid(~sex)
#'
#'   # width is defined differently for gf_boxplot() and gf_jitter()
#'   #   * for gf_boxplot() it is the full width of the box.
#'   #   * for gf_jitter() it is half that -- the maximum amount added or subtracted.
#'   gf_boxplot(age ~ substance, data = HELPrct, width = 0.4) |>
#'     gf_jitter(width = 0.4, height = 0, color = "skyblue", alpha = 0.5)
#'
#'   gf_boxplot(age ~ substance, data = HELPrct, width = 0.4) |>
#'     gf_jitter(width = 0.2, height = 0, color = "skyblue", alpha = 0.5)
#' }
gf_pointrange <-
  layer_factory(
    geom = "pointrange",
    aes_form = list(y + ymin + ymax ~ x, y ~ x + xmin + xmax),
    extras = alist(
      alpha = , color = , group = ,
      linetype = , linewidth = ,
      size = ,
      fatten = 2
    )
  )

#' @rdname gf_linerange
#' @inheritParams ggplot2::geom_pointrange
#' @inheritParams ggplot2::stat_summary
#' @seealso [ggplot2::geom_pointrange()], [ggplot2::stat_summary()]
#' @export
#' @examples
#' p <- gf_jitter(mpg ~ cyl, data = mtcars, height = 0, width = 0.15); p
#' p |> gf_summary(fun.data = "mean_cl_boot", color = "red", size = 2, linewidth = 1.3)

#' # You can supply individual functions to summarise the value at
#' # each x:
#' p |> gf_summary(fun.y = "median", color = "red", size = 3, geom = "point")
#' p |>
#'   gf_summary(fun.y = "mean", color = "red", size = 3, geom = "point") |>
#'   gf_summary(fun.y = mean, geom = "line")

#' p |>
#'   gf_summary(fun.y = mean, fun.ymin = min, fun.ymax = max, color = "red")

#' \dontrun{
#'   p |>
#'   gf_summary(fun.ymin = min, fun.ymax = max, color = "red", geom = "linerange")
#' }
#'
#' gf_bar(~ cut, data = diamonds)
#' gf_col(price ~ cut, data = diamonds, stat = "summary_bin", fun.y = "mean")
#'
#' # Don't use gf_lims() to zoom into a summary plot - this throws the
#' # data away
#' p <- gf_summary(mpg ~ cyl, data = mtcars, fun.y = "mean", geom = "point")
#' p
#' p |> gf_lims(y = c(15, 30))
#' # Instead use coord_cartesian()
#' p |> gf_refine(coord_cartesian(ylim = c(15, 30)))

#' # A set of useful summary functions is provided from the Hmisc package.
#' \dontrun{
#' p <- gf_jitter(mpg ~ cyl, data = mtcars, width = 0.15, height = 0); p
#' p |> gf_summary(fun.data = mean_cl_boot, color = "red")
#' p |> gf_summary(fun.data = mean_cl_boot, color = "red", geom = "crossbar")
#' p |> gf_summary(fun.data = mean_sdl, group = ~ cyl, color = "red",
#'                    geom = "crossbar", width = 0.3)
#' p |> gf_summary(group = ~ cyl, color = "red", geom = "crossbar", width = 0.3,
#'         fun.data = mean_sdl, fun.args = list(mult = 1))
#' p |> gf_summary(fun.data = median_hilow, group = ~ cyl, color = "red",
#'         geom = "crossbar", width = 0.3)
#' }
#'

#' # An example with highly skewed distributions:
#' if (require("ggplot2movies")) {
#'   set.seed(596)
#'   Mov <- movies[sample(nrow(movies), 1000), ]
#'   m2 <- gf_jitter(votes ~ factor(round(rating)), data = Mov, width = 0.15, height = 0, alpha = 0.3)
#'   m2 <- m2 |>
#'     gf_summary(fun.data = "mean_cl_boot", geom = "crossbar",
#'                colour = "red", width = 0.3) |>
#'     gf_labs(x = "rating")
#'   m2
#'   # Notice how the overplotting skews off visual perception of the mean
#'   # supplementing the raw data with summary statistics is _very_ important
#'
#'   # Next, we'll look at votes on a log scale.
#'
#'   # Transforming the scale means the data are transformed
#'   # first, after which statistics are computed:
#'   m2 |> gf_refine(scale_y_log10())
#'   # Transforming the coordinate system occurs after the
#'   # statistic has been computed. This means we're calculating the summary on the raw data
#'   # and stretching the geoms onto the log scale.  Compare the widths of the
#'   # standard errors.
#'   m2 |> gf_refine(coord_trans(y="log10"))
#' }

gf_summary <-
  layer_factory(
    geom = "pointrange",
    stat = "summary",
    aes_form = y ~ x,
    extras = alist(
      alpha = , color = , group = ,
      linetype = , linewidth = ,
      size = , # now separate from linewidth
      fun.y = NULL, fun.ymax = NULL, fun.ymin = NULL, fun.args = list(),
      fatten = 2
    )
  )

#' Formula interface to geom_crossbar()
#'
#' @inherit ggplot2::geom_crossbar description references
#' @inherit gf_line
#' @inheritParams ggplot2::geom_crossbar
#'
#' @param gformula A formula with shape `y + ymin + ymax ~ x`.
#'   Faceting can be achieved by including `|` in the formula.
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_crossbar()]
#' @export
#' @examples
#' if (require(mosaicData) && require(dplyr)) {
#'   HELP2 <- HELPrct |>
#'     summarise(.by = c(substance, sex),
#'       mean.age   = mean(age),
#'       median.age = median(age),
#'       max.age    = max(age),
#'       min.age    = min(age),
#'       sd.age     = sd(age),
#'       lo         = mean.age - sd.age,
#'       hi         = mean.age + sd.age
#'     )
#'
#'   gf_jitter(age ~ substance, data = HELPrct,
#'       alpha = 0.7, width = 0.2, height = 0, color = "skyblue") |>
#'     gf_pointrange(mean.age + lo + hi ~ substance, data = HELP2) |>
#'     gf_facet_grid(~sex)
#'
#'   gf_jitter(age ~ substance, data = HELPrct,
#'       alpha = 0.7, width = 0.2, height = 0, color = "skyblue")  |>
#'     gf_errorbar(lo + hi ~ substance, data = HELP2, inherit = FALSE) |>
#'     gf_facet_grid(~sex)
#'
#'   gf_jitter(age ~ substance, data = HELPrct,
#'       alpha = 0.7, width = 0.2, height = 0, color = "skyblue") |>
#'     gf_crossbar(mean.age + lo + hi ~ substance, data = HELP2,
#'       fill = "transparent") |>
#'     gf_facet_grid(~sex)
#'
#'   gf_jitter(substance ~ age, data = HELPrct,
#'       alpha = 0.7, height = 0.2, width = 0, color = "skyblue") |>
#'     gf_crossbar(substance ~ mean.age + lo + hi, data = HELP2,
#'       fill = "transparent", color = "red") |>
#'     gf_facet_grid(~sex)
#' }
#'
gf_crossbar <-
  layer_factory(
    geom = "crossbar",
    aes_form = list(y + ymin + ymax ~ x, y ~ x + xmin + xmax),
    extras = alist(
      alpha = , color = , group = ,
      linetype = , linewidth = ,
      # size = , # remove eventually?
      fatten = 2.5
    )
  )

#' Formula interface to geom_errorbar()
#'
#' @inherit gf_ribbon
#' @inheritParams gf_line
#' @inheritParams ggplot2::geom_errorbar
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_errorbar()]
#' @export
#' @examples
#' if (require(mosaicData) && require(dplyr)) {
#'   HELP2 <- HELPrct |>
#'     group_by(substance, sex) |>
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
#'   gf_jitter(age ~ substance, data = HELPrct,
#'       alpha = 0.5, width = 0.2, height = 0, color = "skyblue") |>
#'     gf_pointrange(mean.age + lo + hi ~ substance, data = HELP2,
#'       inherit = FALSE) |>
#'     gf_facet_grid(~sex)
#'
#'   gf_jitter(age ~ substance, data = HELPrct,
#'       alpha = 0.5, width = 0.2, height = 0, color = "skyblue") |>
#'     gf_errorbar(lo + hi ~ substance, data = HELP2, inherit = FALSE) |>
#'     gf_facet_grid(~sex)
#'   gf_jitter(age ~ substance, data = HELPrct,
#'       alpha = 0.5, width = 0.2, height = 0, color = "skyblue") |>
#'     gf_boxplot(age ~ substance, data = HELPrct, color = "red") |>
#'     gf_crossbar(mean.age + lo + hi ~ substance, data = HELP2) |>
#'     gf_facet_grid(~sex)
#' }
gf_errorbar <-
  layer_factory(
    geom = "errorbar",
    aes_form = list(ymin + ymax ~ x, y ~ xmin + xmax),
    inherit.aes = TRUE, # changed from FALSE to TRUE after aesthetic renaming in ggplot2
    check.aes = FALSE,
    extras = alist(
      alpha = , color = , group = ,
      linetype = , linewidth =
      # size = # remove eventually?
      )
  )



#' Formula interface to geom_rect()
#'
#' @inherit gf_line
#' @inherit ggplot2::geom_rect description references
#' @inheritParams ggplot2::geom_rect
#'
#' @param gformula A formula with shape `ymin + ymax ~ xmin + xmax`.
#'   Faceting can be achieved by including `|` in the formula.
#'
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @seealso [ggplot2::geom_rect()]
#' @export
#' @examples
#' gf_rect(1 + 2 ~ 3 + 4, alpha = 0.3, color = "red")
#' # use data = data.frame() so we get 1 rectangle and not 1 per row of faithful
#' # use inherit = FALSE because we are not reusing eruptions and waiting
#' gf_point(eruptions ~ waiting, data = faithful) |>
#'   gf_rect(1.5 + 3 ~ 45 + 68,
#'     fill = "red", alpha = 0.2,
#'     data = data.frame(), inherit = FALSE) |>
#'   gf_rect(3 + 5.5 ~ 68 + 100,
#'     fill = "green", alpha = 0.2,
#'     data = data.frame(), inherit = FALSE)
gf_rect <-
  layer_factory(
    geom = "rect",
    aes_form = ymin + ymax ~ xmin + xmax,
    extras = alist(
      alpha = , color = , fill = , group = ,
      linetype = , linewidth =
      # size = # remove eventually?
    )
  )


#' Reference lines -- horizontal, vertical, and diagonal.
#'
#' These functions create layers that display lines described i various ways.  Unlike most
#' of the plotting functions in `ggformula`, these functions do not take a formula
#' as input for describing positional attributes of the plot.
#'
#' @inheritParams ggplot2::geom_abline
#' @inheritParams ggplot2::geom_line
#' @inheritParams gf_line
#'
#' @param gformula Must be `NULL`.
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @rdname gf_lines
#' @seealso [ggplot2::geom_abline()],
#'   [ggplot2::geom_vline()],
#'   [ggplot2::geom_hline()]
#' @export
#' @examples
#' mtcars2 <- df_stats(wt ~ cyl, data = mtcars, median_wt = median)
#' gf_point(wt ~ hp, size = ~wt, color = ~cyl, data = mtcars) |>
#'   gf_abline(slope = ~0, intercept = ~median_wt, color = ~cyl, data = mtcars2)
#'
#' gf_point(wt ~ hp, size = ~wt, color = ~cyl, data = mtcars) |>
#'   gf_abline(slope = 0, intercept = 3, color = "green")
#'
#' # avoid warnings by using formulas:
#'
#' gf_point(wt ~ hp, size = ~wt, color = ~cyl, data = mtcars) |>
#'   gf_abline(slope = ~0, intercept = ~3, color = "green")
#'
#' gf_point(wt ~ hp, size = ~wt, color = ~cyl, data = mtcars) |>
#'   gf_hline(yintercept = ~median_wt, color = ~cyl, data = mtcars2)
#'
#' gf_point(mpg ~ hp, color = ~cyl, size = ~wt, data = mtcars) |>
#'   gf_abline(color = "red", slope = ~ - 0.10, intercept = ~ 35)
#'
#' gf_point(mpg ~ hp, color = ~cyl, size = ~wt, data = mtcars) |>
#'   gf_abline(
#'     color = "red", slope = ~slope, intercept = ~intercept,
#'     data = data.frame(slope = -0.10, intercept = 33:35)
#'   )
#'
#' # We can set the color of the guidelines while mapping color in other layers
#' gf_point(mpg ~ hp, color = ~cyl, size = ~ wt, data = mtcars) |>
#'   gf_hline(color = "navy", yintercept = ~ c(20, 25), data = NA) |>
#'   gf_vline(color = "brown", xintercept = ~ c(200, 300), data = NA)
#'
#' # If we want to map the color of the guidelines, it must work with the
#' # scale of the other colors in the plot.
#' gf_point(mpg ~ hp, size = ~wt, data = mtcars, alpha = 0.3) |>
#'   gf_hline(color = ~"horizontal", yintercept = ~ c(20, 25), data = NA) |>
#'   gf_vline(color = ~"vertical", xintercept = ~ c(100, 200, 300), data = NA)
#'
#' gf_point(mpg ~ hp, size = ~wt, color = ~ factor(cyl), data = mtcars, alpha = 0.3) |>
#'   gf_hline(color = "orange", yintercept = ~ 20) |>
#'   gf_vline(color = ~ c("4", "6", "8"), xintercept = ~ c(80, 120, 250), data = NA)
#'
#' gf_point(mpg ~ hp, size = ~wt, color = ~ factor(cyl), data = mtcars, alpha = 0.3) |>
#'   gf_hline(color = "orange", yintercept = ~ 20) |>
#'   gf_vline(color = c("green", "red", "blue"), xintercept = ~ c(80, 120, 250),
#'     data = NA)
#'
#' # reversing the layers requires using inherit = FALSE
#' gf_hline(color = "orange", yintercept = ~ 20) |>
#'   gf_vline(color = ~ c("4", "6", "8"), xintercept = ~ c(80, 120, 250), data = NA) |>
#'   gf_point(mpg ~ hp,
#'     size = ~wt, color = ~ factor(cyl), data = mtcars, alpha = 0.3,
#'     inherit = FALSE
#'   )
gf_abline <-
  layer_factory(
    geom = "abline",
    aes_form = NULL,
    extras = alist(
      slope = , intercept = , color = ,
      linetype = , linewidth = ,
      # size = , # remove eventually?
      alpha = ),
    inherit.aes = FALSE,
    data = NA,
    layer_fun = rlang::quo(ggplot2::geom_abline)
  )

#' @rdname gf_lines
#' @export
gf_hline <-
  layer_factory(
    geom = "hline",
    aes_form = NULL,
    extras = alist(
      yintercept = , color = ,
      linetype = , linewidth = ,
      # size = , # remove eventually?
      alpha = ),
    inherit.aes = FALSE,
    data = NA,
    layer_fun = rlang::quo(ggplot2::geom_hline)
  )

#' @rdname gf_lines
#' @export
gf_vline <-
  layer_factory(
    geom = "vline",
    aes_form = NULL,
    extras = alist(
      xintercept = , color = ,
      linetype = , linewidth = ,
      # size = , # remove eventually?
      alpha = ),
    inherit.aes = FALSE,
    data = NA,
    layer_fun = rlang::quo(ggplot2::geom_vline)
  )

#' @rdname gf_lines
#' @param coef A numeric vector of coefficients.
#' @param model A model from which to extract coefficients.
#' @export

gf_coefline <- function(object = NULL, coef = NULL, model = NULL, ...) {
  if (is.null(coef) + is.null(model) != 1) stop("must specify exactly one of coef or model")
  if (is.null(coef)) coef <- coef(model)
  if (length(coef) > 2) warning("Ignoring all but first two values of coef.")
  if (length(coef) < 2) stop("coef must be of length at least 2.")
  gf_abline(object = object, intercept = ~ coef[1], slope = ~ coef[2], ...,
            inherit = TRUE)
}

utils::globalVariables(c("x"))

#' Layers displaying graphs of functions
#'
#' These functions provide two different
#' interfaces for creating a layer that contains the graph of a function.
#'
#' @inheritParams gf_line
#' @inheritParams ggplot2::stat_function
#' @param ... Other arguments such as `position="dodge"`.
#' @param fun A function.
#' @rdname gf_function
#' @export
#' @examples
#' gf_function(fun = sqrt, xlim = c(0, 10))
#' gf_dhistogram(~age, data = mosaicData::HELPrct, binwidth = 3, alpha = 0.6) |>
#'   gf_function(
#'     fun = stats::dnorm,
#'     args = list(mean = mean(mosaicData::HELPrct$age), sd = sd(mosaicData::HELPrct$age)),
#'     color = "red"
#'   )
gf_function <- function(object = NULL, fun, data = NULL, ..., inherit = FALSE) {
  if (rlang::is_function(object) || rlang::is_character(object)) {
    fun <- object
    object <- NULL
  }
  if (is.null(data)) {
    data <- ensure_nonempty_data
  }
  if (is.null(object)) {
    object <- ggplot() # data = data.frame(x = xlim), aes(x))
    # inherit <- TRUE
  }
  qdots <- rlang::quos(...)
  afq <- aes_from_qdots(qdots)
  p <- object +
    do.call(
      ggplot2::layer,
      list(
        geom = "path", stat = "function", position = "identity",
        mapping = afq$mapping,
        inherit.aes = inherit,
        data = data, # if (missing(xlim)) NULL else data.frame(x = xlim),
        params = c(list(fun = fun), lapply(afq$qdots, rlang::f_rhs))
      )
    )
  class(p) <- unique(c('gf_ggplot', class(p)))
  p
}

#' @rdname gf_function
#' @param formula A formula describing a function.  See examples and [mosaicCore::makeFun()].
#' @param ... Additional arguments passed as `params` to `layer()`. This includes `xlim`,
#'   a numeric vector providing the extent of
#'   the x-axis values used to evaluate `fun` for plotting. By default, `xlim` is not used for
#'   other layers.
#' @export
#' @examples
#' gf_fun(5 + 3 * cos(10 * x) ~ x, xlim = c(0, 2))
#' # Utility bill is quadratic in month?
#' f <- makeFun(lm(totalbill ~ poly(month, 2), data = mosaicData::Utilities))
#' gf_point(totalbill ~ month, data = mosaicData::Utilities, alpha = 0.6) |>
#'   gf_fun(f(m) ~ m, color = "red")
gf_fun <- function(object = NULL, formula, data = NULL, ..., inherit = FALSE) {
  if (rlang::is_formula(object) && missing(formula)) {
    formula <- object
    object <- NULL
  }

  if (is.null(data)) {
    data <- ensure_nonempty_data
  }

  if (is.null(object)) {
    object <- ggplot() # data = data.frame(x = xlim), aes(x))
    # inherit <- TRUE
  }

  qdots <- rlang::quos(...)
  fun <- function(x, ...) mosaicCore::makeFun(formula)(x, ...)
  afq <- aes_from_qdots(qdots)
  p <- object +
    do.call(
      ggplot2::layer,
      list(
        geom = "path", stat = "function", position = "identity",
        mapping = afq$mapping,
        inherit.aes = inherit,
        data = data, # if (missing(xlim)) NULL else data.frame(x = xlim),
        params = c(list(fun = fun), lapply(afq$qdots, rlang::f_rhs))
      )
    )
  class(p) <- unique(c('gf_ggplot', class(p)))
  p
}

#' Plot density function based on fit to data
#'
#' `MASS::fitdistr()` is used to fit coefficients of a specified family of
#' distributions and the resulting density curve is displayed.
#'
#' @inherit gf_line
#' @param object When chaining, this holds an object produced in the earlier portions
#' of the chain.  Most users can safely ignore this argument. See examples.
#' @param gformula A formula with shape ` ~ x` used to specify the data
#'   to be fit to a family of distributions.
#' @param data A data frame containing the variable to be fitted.
#' @param dist A quoted name of a distribution function.
#'   See [`mosaicCore::fit_distr_fun()`] for more details about allowable distributions.
#' @param size size aesthetic for dots in pmf plots.
#' @param start Starting value(s) for the search for MLE.  (See [MASS::fitdistr].)
#' @param environment An environment in which to look for variables not found in `data`.
#' @param ... Additional arguments
####  to [MASS::fitdistr()].
#' @param geom A character string naming the geom used to make the layer.
#' @param stat A character string naming the stat used to make the layer.
#' @param position Either a character string naming the position function used
#'   for the layer or a position object returned from a call to a position function.
#' @param show.legend A logical indicating whether this layer should be included in
#'   the legends.  `NA`, the default, includes layer in the legends if any
#'   of the attributes of the layer are mapped.
#' @param show.help If `TRUE`, display some minimal help.
#' @param inherit A logical indicating whether default attributes are inherited.
#' @return a gg object
#' @seealso [mosaicCore::fit_distr_fun()]
#' @export
#' @examples
#' gf_fitdistr(~length, data = mosaicData::KidsFeet, inherit = FALSE) |>
#'   gf_dhistogram(~length, data = mosaicData::KidsFeet, binwidth = 0.5, alpha = 0.25)
#'
#' gf_dhistogram(~length, data = mosaicData::KidsFeet, binwidth = 0.5, alpha = 0.25) |>
#'   gf_fitdistr()
#'
#' set.seed(12345)
#' Dat <- data.frame(
#'   f = rf(500, df1 = 3, df2 = 47),
#'   g = rgamma(500, 3, 10)
#' )
#' gf_dhistogram(~g, data = Dat) |>
#'   gf_fitdistr(dist = "dgamma", linewidth = 1.4)
#'
#' gf_dhistogram(~g, data = Dat) |>
#'   gf_fun(mosaicCore::fit_distr_fun(~g, data = Dat, dist = "dgamma"))
#'
#' gf_dhistogram(~f, data = Dat) |>
#'   gf_fitdistr(dist = "df", start = list(df1 = 2, df2 = 50))
#'
#' # fitted parameters are default argument values
#' args(
#'   mosaicCore::fit_distr_fun(~f,
#'     data = Dat, dist = "df",
#'     start = list(df1 = 2, df2 = 50)
#'   )
#' )
#' args(mosaicCore::fit_distr_fun(~g, data = Dat, dist = "dgamma"))
gf_fitdistr <-
  layer_factory(
    geom = "path", stat = "fitdistr", position = "identity",
    aes_form = list(~x), inherit.aes = "x",
    extras = alist(
      dist = "dnorm", start = NULL, alpha = ,
      color = , fill = , group = ,
      linetype = , linewidth = ,
      size =
      ),
    note = "dist should be a density function like dnorm or dgamma"
  )

#' Formula interface to geom_sina()
#'
#' @inherit ggforce::geom_sina description references
#' @inherit gf_point
#' @inheritParams ggforce::geom_sina
#' @inheritParams ggforce::stat_sina
#'
#' @seealso [ggforce::geom_sina()]
#' @examples
#' \dontrun{
#'   library(ggforce)
#'   gf_sina(age ~ substance, data = mosaicData::HELPrct)
#' }
#'
#' @export

gf_sina <-
  layer_factory(
    pre = {
      if (!requireNamespace("ggforce", quietly = TRUE))
        stop("The ggforce package is required.  Please install and try again.")
      if (! "package:ggforce" %in% search())
        stop("To use gf_sina(), the ggforce package must be loaded.\n    Try, for example, `library(ggforce)`.")
  },
    geom = "point", stat = "sina", position = "identity",
    extras = alist(alpha = , color = , size = , fill = , group = )
  )


#' Mapping with shape files
#'
#' Mapping with shape files
#'
#' @inheritParams gf_point
# #' @inherit ggplot2::geom_sf
#' @inherit gf_line
#' @param geometry A column of class sfc containing simple features data. (Another option
#'   is that `data` may contain a column named `geometry`.)  `geometry` is never
#'   inherited.
# #' @seealso [`ggplot2::geom_sf()`]
#' @export
#' @examples
#'
#' if (requireNamespace('maps', quietly = TRUE)) {
#'   library(maps)
#'   world1 <- sf::st_as_sf(map('world', plot = FALSE, fill = TRUE))
#'   gf_sf(data = world1)
#' }
#'
#' if (requireNamespace('maps', quietly = TRUE)) {
#'   world2 <- sf::st_transform(
#'     world1,
#'     "+proj=laea +y_0=0 +lon_0=155 +lat_0=-90 +ellps=WGS84 +no_defs"
#'   )
#'   gf_sf(data = world2)
#' }

# \dontrun{
# if (require(maps) && require(maptools) &&
#   require(sf) && require(rgeos))
#   US <- sf::st_as_sf(maps::map("state", plot = FALSE, fill = TRUE))
#   gf_sf(fill = ~ factor(nchar(ID)), data = US) |>
#     gf_refine(coord_sf())
#
#   # We can specify shape data and external data separately using geometry
#   MI <- sf::st_as_sf(maps::map("county", "michigan", plot = FALSE, fill = TRUE))
#   MIgeom <- MI$geom
#   gf_sf(
#     fill = ~ log10(population), data = MIpop |> dplyr::arrange(county),
#     geometry = ~MIgeom, color = "white"
#   ) |>
#     gf_refine(coord_sf(), theme_bw())
#
#   # alternatively we can merge external data and shape data into one data frame.
#   MI |>
#     dplyr::mutate(county = gsub("michigan,", "", ID)) |>
#     dplyr::left_join(MIpop |> dplyr::mutate(county = tolower(county))) |>
#     gf_sf(fill = ~ population / 1e3) |>
#     gf_refine(
#       coord_sf(), theme_bw(),
#       scale_fill_continuous(name = "population (thousands)", trans = "log10")
#     )
# }


gf_sf <-
    layer_factory(
      layer_fun = quo(ggplot2::geom_sf),
      geom = "sf", stat = "sf",
      position = "identity",
      aes_form = list(NULL),
      extras = alist(
        alpha = , color = , fill = , group = ,
        linetype = , linewidth = ,
        # size = , # remove eventually?
        geometry =
        ),
      pre = {
        if (!requireNamespace("sf", quietly = TRUE)) {
          stop("The sf package is required.  Please install and try again.")
        }
      }
    )
#' Create an "empty" plot
#'
#' This is primarily useful as a way to start a sequence of piped
#' plot layers.
#'
#' @param environment An environment passed to [`ggplot2::ggplot()`]
#' @return A plot with now layers.
#' @examples
#' gf_empty()
#' data(penguins, package = "palmerpenguins")
#' gf_empty() |>
#'   gf_point(bill_length_mm ~ bill_depth_mm, data = penguins, color = ~species)
#' @export
gf_empty <- function(environment = parent.frame()) {
  ggplot2::ggplot(environment = environment)
}

