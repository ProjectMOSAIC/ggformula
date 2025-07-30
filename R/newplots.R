
# for predictdf()

utils::globalVariables(c("x", "y", "ymin", "ymax"))

#' @importFrom grid gList
#' @importFrom mosaicCore ash_points fit_distr_fun
#' @importFrom stats quantile

NA



#' Average Shifted Histograms
#'
#' An ASH plot is the average over all histograms of a fixed bin width.
#' `geom_ash()` and `gf_ash()` provide ways to create ASH plots
#' using \pkg{ggplot2} or \pkg{ggformula}.
#'
#' @inherit gf_freqpoly
#' @inheritParams geom_ash
#' @param object When chaining, this holds an object produced in the earlier portions
#' of the chain.  Most users can safely ignore this argument.
#' See details and examples.
#'
#' @param gformula A formula with shape `~x` or `y ~ x`.
#'   `y` may be `stat(density)` or `stat(count)` or `stat(ndensity)` or `stat(ncount)`.
#'   Faceting can be achieved by including `|` in the formula.
#' @param data A data frame with the variables to be plotted.
#' @param environment An environment in which to look for variables not found in `data`.
#' @param ... Additional arguments.  Typically these are
#'   (a) ggplot2 aesthetics to be set with `attribute = value`,
#'   (b) ggplot2 aesthetics to be mapped with `attribute = ~ expression`, or
#'   (c) attributes of the layer as a whole, which are set with `attribute = value`.
#' @param geom A character string naming the geom used to make the layer.
#' @param stat A character string naming the stat used to make the layer.
#' @param position Either a character string naming the position function used
#'   for the layer or a position object returned from a call to a position function.
#' @param show.legend A logical indicating whether this layer should be included in
#'   the legends.  `NA`, the default, includes layer in the legends if any
#'   of the attributes of the layer are mapped.
#' @param show.help If `TRUE`, display some minimal help.
#' @param inherit A logical indicating whether default attributes are inherited.
#' @param inherit.aes A logical indicating whether default aesthetics are inherited.
#' @return a gg object
#' @seealso [ggplot2::geom_histogram()], [gf_histogram()].
#' @param binwidth the width of the histogram bins.  If `NULL` (the default) the
#'   binwidth will be chosen so that approximately 10 bins cover the data.  `adjust`
#'   can be used to to increase or decrease `binwidth`.
#' @param adjust a numeric adjustment to `binwidth`.  Primarily useful when `binwidth` is
#'   not specified.  Increasing `adjust` makes the plot smoother.
#' @export
#' @rdname gf_ash
#' @examples
#' data(penguins, package = "palmerpenguins")
#' gf_ash(~bill_length_mm, color = ~species, data = penguins)
#' gf_ash(~bill_length_mm, color = ~species, data = penguins, adjust = 2)
#' gf_ash(~bill_length_mm, color = ~species, data = penguins, binwidth = 1)
#' gf_ash(~bill_length_mm, color = ~species, data = penguins, binwidth = 1, adjust = 2)
gf_ash <-
  layer_factory(
    geom = "line", stat = "ash", position = "identity",
    aes_form = list(~x, y ~ x),
    extras = alist(alpha = , color = , group = , linetype = , linewidth = )
  )

#' ggproto classes for ggplot2
#'
#' These are typically accessed through their associated `geom_*`, `stat_*` or
#' `gf_*` functions.
#'
#' @rdname ggformula-ggproto
#' @format NULL
#' @export
#' @seealso [stat_ash()]
#' @seealso [gf_ash()]

StatAsh <-
  ggproto("StatAsh", Stat,
    compute_group = function(data, scales, binwidth = NULL, adjust = NULL) {
      ash_points(data$x, binwidth = binwidth, adjust = adjust)
    },
    required_aes = c("x")
  )

#' @rdname gf_ash
#' @export
stat_ash <-
  function(mapping = NULL, data = NULL, geom = "line",
             position = "identity", na.rm = FALSE, show.legend = NA,
             inherit.aes = TRUE, binwidth = NULL, adjust = 1, ...) {
    ggplot2::layer(
      stat = StatAsh, data = data, mapping = mapping, geom = geom,
      position = position, show.legend = show.legend, inherit.aes = inherit.aes,
      params = list(na.rm = na.rm, binwidth = binwidth, adjust = adjust, ...)
    )
  }

# #' @export
# GeomAsh <-
#   ggproto("GeomAsh", Geom,
#           required_aes = c("x"),
#           default_aes = aes(size = 1, colour = "black"),
#           draw_key = draw_key_path,
#
#           draw_panel = function(data, panel_scales, coord) {
#             coords <- coord$transform(data, panel_scales)
#             grid::linesGrob(
#               coords$x, coords$y,
#               gp = grid::gpar(col = coords$colour,lwd = coords$size)
#             )
#           }
#   )

# GeomAsh <-
#   ggproto("GeomAsh", GeomLine,
#           default_aes = aes(colour = "black", size = 0.5, linetype = 1, alpha = NA)
# )

#' @rdname gf_ash
#' @param mapping set of aesthetic mappings created by ggplot2::aes()]
#' or [ggplot2::aes_()].
#' @param na.rm	 If FALSE (the default), removes missing values with a warning.
#' If TRUE silently removes missing values.
#' @export
#' @examples
#' ggplot(faithful, aes(x = eruptions)) +
#'   geom_histogram(aes(y = stat(density)),
#'     fill = "lightskyblue", colour = "gray50", alpha = 0.2
#'   ) +
#'   geom_ash(colour = "red") +
#'   geom_ash(colour = "forestgreen", adjust = 2) +
#'   geom_ash(colour = "navy", adjust = 1 / 2) +
#'   theme_minimal()
geom_ash <-
  function(mapping = NULL, data = NULL, stat = "ash",
             position = "identity", na.rm = FALSE, show.legend = NA,
             inherit.aes = TRUE, binwidth = NULL, adjust = 1, ...) {
    ggplot2::layer(
      stat = stat, geom = ggplot2::GeomLine, data = data, mapping = mapping,
      position = position, show.legend = show.legend,
      inherit.aes = inherit.aes,
      params = list(na.rm = na.rm, binwidth = binwidth, adjust = adjust, ...)
    )
  }

#' @rdname ggformula-ggproto
#' @format NULL
#' @export
#' @seealso [stat_spline()]
#' @seealso [gf_spline()]
StatSpline <-
  ggproto("StatSpline", Stat,
    compute_group = function(data, scales, weight = NULL, df = NULL, spar = NULL,
                                 cv = FALSE, all.knots = FALSE, nknots = stats::.nknots.smspl,
                                 df.offset = 0, penalty = 1, control.spar = list(),
                                 tol = NULL) {
      if (is.null(tol)) tol <- 1e-6 * IQR(data$x)
      SS <- if (is.null(df)) {
        smooth.spline(data$x, data$y,
          w = weight, spar = spar,
          cv = cv, all.knots = all.knots, nknots = nknots,
          df.offset = df.offset, penalty = penalty, control.spar = control.spar,
          tol = tol
        )
      } else {
        smooth.spline(data$x, data$y,
          w = weight, df = df, spar = spar,
          cv = cv, all.knots = all.knots, nknots = nknots,
          df.offset = df.offset, penalty = penalty, control.spar = control.spar,
          tol = tol
        )
      }
      tibble(x = SS$x, y = SS$y)
    },
    required_aes = c("x", "y")
  )

#' Geoms and stats for spline smoothing
#'
#' Similar to [ggplot2::geom_smooth], this adds spline fits to plots.
#'
#' @rdname geom_spline
#' @param mapping An aesthetic mapping produced with ggplot2::aes()] or
#' ggplot2::aes_string()].
#' @param data A data frame.
#' @param geom A geom.
#' @param stat A stat.
#' @param position A position object.
#' @param na.rm A logical indicating whether a warning should be issued when
#'   missing values are removed before plotting.
#' @param show.legend A logical indicating whether legends should be included
#'   for this layer.  If `NA`, legends will be included for each aesthetic
#'   that is mapped.
#' @param inherit.aes A logical indicating whether aesthetics should be
#'   inherited.  When `FALSE`, the supplied `mapping` will be
#'   the only aesthetics used.
#' @param weight An optional vector of weights.
#'   See [smooth.spline()].
#' @param df desired equivalent degrees of freedom.
#'   See [smooth.spline()] for details.
#' @param spar A smoothing parameter, typically in (0,1].
#'   See [smooth.spline()] for details.
#' @param cv A logical.
#'   See [smooth.spline()] for details.
#' @param all.knots A logical.
#'   See [smooth.spline()] for details.
#' @param nknots An integer or function giving the number of knots to use
#'   when `all.knots = FALSE`.
#'   See [smooth.spline()] for details.
#' @param df.offset A numerical value used to increase the degrees of freedom
#'   when using GVC.
#'   See [smooth.spline()] for details.
#' @param penalty the coefficient of the penalty for degrees of freedom in the
#'   GVC criterion.
#'   See [smooth.spline()] for details.
#' @param control.spar An optional list used to control root finding
#'   when the parameter `spar` is computed.
#'   See [smooth.spline()] for details.
#' @param tol A tolerance for sameness or uniqueness of the `x` values.
#'   The values are binned into bins of size tol and values which fall into
#'   the same bin are regarded as the same. Must be strictly positive (and finite).
#'   When `NULL`, `IQR(x) * 10e-6` is used.
#' @param ... Additional arguments
#' @export
#' @examples
#' if (require(mosaicData)) {
#'   ggplot(Births) + geom_spline(aes(x = date, y = births, colour = wday))
#'   ggplot(Births) + geom_spline(aes(x = date, y = births, colour = wday), nknots = 10)
#' }
stat_spline <-
  function(mapping = NULL, data = NULL, geom = "line",
             position = "identity", na.rm = FALSE, show.legend = NA,
             inherit.aes = TRUE, weight = NULL, df = NULL, spar = NULL,
             cv = FALSE, all.knots = FALSE, nknots = stats::.nknots.smspl,
             df.offset = 0, penalty = 1, control.spar = list(),
             tol = NULL, ...) {
    ggplot2::layer(
      stat = StatSpline, data = data, mapping = mapping, geom = geom,
      position = position, show.legend = show.legend, inherit.aes = inherit.aes,
      params = list(
        na.rm = na.rm, weight = weight, df = df, spar = spar,
        cv = cv, all.knots = all.knots, nknots = nknots,
        df.offset = df.offset, penalty = penalty,
        control.spar = control.spar, tol = tol, ...
      )
    )
  }

#' @rdname geom_spline
#' @export
geom_spline <-
  function(mapping = NULL, data = NULL, stat = "spline",
             position = "identity", na.rm = FALSE, show.legend = NA,
             inherit.aes = TRUE, weight = NULL, df = NULL, spar = NULL,
             cv = FALSE, all.knots = FALSE, nknots = stats::.nknots.smspl,
             df.offset = 0, penalty = 1, control.spar = list(),
             tol = NULL, ...) {
    ggplot2::layer(
      stat = stat, geom = ggplot2::GeomLine, data = data, mapping = mapping,
      position = position, show.legend = show.legend,
      inherit.aes = inherit.aes,
      params = list(
        na.rm = na.rm, weight = weight, df = df, spar = spar,
        cv = cv, all.knots = all.knots, nknots = nknots,
        df.offset = df.offset, penalty = penalty,
        control.spar = control.spar, tol = tol, ...
      )
    )
  }

# Based on an example found at
#  * https://stackoverflow.com/questions/4357031/qqnorm-and-qqline-in-ggplot2/
#  * and stackoverflow.com/a/4357932/1346276

qq.line <- function(sample, qdist, na.rm = TRUE, tail = 0.25) {
  q.sample <- stats::quantile(sample, c(tail, 1 - tail), na.rm = na.rm)
  q.theory <- qdist(c(tail, 1 - tail))
  slope <- diff(q.sample) / diff(q.theory)
  intercept <- q.sample[1] - slope * q.theory[1]
  list(slope = slope, intercept = intercept)
}

#' @rdname ggformula-ggproto
#' @format NULL
#' @export
#' @seealso [ggplot2::stat_qq()]
#' @seealso [gf_qq()]
StatQqline <- ggproto("StatQqline", Stat,
  required_aes = c("sample"),
  compute_group = function(data, scales,
                             distribution = stats::qnorm,
                             dparams = list(),
                             tail = 0.25,
                             na.rm = FALSE) {
    qdist <- function(p) do.call(distribution, c(list(p = p), dparams))

    n <- length(data$sample)
    theoretical <- qdist(stats::ppoints(n))
    qq <- qq.line(data$sample, qdist = qdist, tail = tail, na.rm = na.rm)

    data.frame(x = theoretical, y = qq$intercept + theoretical * qq$slope)
  }
)

#' A Stat for Adding Reference Lines to QQ-Plots
#'
#' This stat computes quantiles of the sample and theoretical distribution for
#' the purpose of providing reference lines for QQ-plots.
#'
#' @param mapping An aesthetic mapping produced with ggplot2::aes()] or
#' ggplot2::aes_string()].
#' @param data A data frame.
#' @param geom A geom.
#' @param position A position object.
#' @param distribution A quantile function.
#' @param dparams A list of arguments for `distribution`.
# @param tail A tail probability.
#   The constructed line will connect the \code{tail} and \code{1 - tail} quantiles
#   of the sample and theoretical distributions.
#' @param na.rm A logical indicating whether a warning should be issued when
#'   missing values are removed before plotting.
#' @param show.legend A logical indicating whether legends should be included
#'   for this layer.  If `NA`, legends will be include for each aesthetic
#'   that is mapped.
#' @param inherit.aes A logical indicating whether aesthetics should be
#'   inherited.  When `FALSE`, the supplied `mapping` will be
#'   the only aesthetics used.
#' @param ... Additional arguments
#' @rdname stat_qqline
#' @export
#' @examples
#' data(penguins, package = "palmerpenguins")
#' ggplot(data = penguins, aes(sample = bill_length_mm)) +
#'   geom_qq() +
#'   stat_qqline(alpha = 0.7, color = "red", linetype = "dashed") +
#'   ggplot2::facet_wrap(~species)
stat_qqline <-
  function(mapping = NULL, data = NULL, geom = "line",
             position = "identity", ...,
             distribution = stats::qnorm,
             dparams = list(),
             na.rm = FALSE,
             show.legend = NA,
             inherit.aes = TRUE) {
    layer(
      stat = StatQqline, data = data, mapping = mapping, geom = geom,
      position = position, show.legend = show.legend, inherit.aes = inherit.aes,
      params = list(
        distribution = distribution,
        dparams = dparams,
        na.rm = na.rm, ...
      )
    )
  }



#' @rdname geom_lm
#' @export
stat_lm <-
  function(
             mapping = NULL, data = NULL, geom = "lm",
             position = "identity",
             interval = c("none", "prediction", "confidence"),
             level = 0.95,
             formula = y ~ x, lm.args = list(), backtrans = identity,
             ...,
             na.rm = FALSE,
             show.legend = NA,
             inherit.aes = TRUE) {
    interval <- match.arg(interval)
    params <- list(
      interval = interval, level = level, formula = formula,
      lm.args = lm.args, na.rm = na.rm, backtrans = backtrans, ...
    )

    layer(
      stat = StatLm, data = data, mapping = mapping, geom = geom,
      position = position, show.legend = show.legend, inherit.aes = inherit.aes,
      params = params
    )
  }

#' @rdname ggformula-ggproto
#' @format NULL
#' @export
#' @seealso [stat_lm()]
#' @seealso [gf_lm()]
StatLm <-
  ggproto("StatLm", Stat,
    setup_params = function(data, params) {
      if (identical(params$interval, "none")) {
        params$se <- FALSE
      } else {
        params$se <- TRUE
      }
      params
    },
    compute_group = function(data, scales, formula = y ~ x,
                                 n = 80, span = 0.75, fullrange = TRUE,
                                 xseq = NULL, level = 0.95, interval = "confidence",
                                 lm.args = list(), na.rm = FALSE, se = NULL,
                                 backtrans = identity) {
      model <- NULL
      interval <- match.arg(interval, c("none", "confidence", "prediction"))

      # if no model provided, fit one
      if (is.null(model)) {
        # unless we don't have enough data
        if (length(unique(data$x)) < 2) {
          return(data.frame())
        }
        if (is.null(data$weight)) data$weight <- 1
        # figure out x-values
        if (is.null(xseq)) {
          if (is.integer(data$x)) {
            if (fullrange) {
              xseq <- scales$x$dimension()
            } else {
              xseq <- sort(unique(data$x))
            }
          } else {
            if (fullrange) {
              range <- scales$x$dimension()
            } else {
              range <- range(data$x, na.rm = TRUE)
            }
            xseq <- seq(range[1], range[2], length.out = n)
          }
        }
        base.args <- list(formula = formula, data = quote(data), weights = quote(weight))
        model <- do.call(stats::lm, c(base.args, lm.args))
      }

      predictdf(model, xseq = xseq, level = level, interval = interval, se = se, backtrans = backtrans)
    },
    required_aes = c("x", "y")
  )

# modeled after ggplot2:::predictdf.default, but allowing for prediction intervals
# as well as confidence intervals and always computes SEs.

predictdf <-
  function(model, xseq, level, interval, se = TRUE, backtrans = identity) {
    if (!inherits(model, "lm")) {
      stop("Model must be created using lm()")
    }

    if (interval == "none") interval <- "confidence"

    pred <- suppressWarnings(
      stats::predict(model,
        newdata = data.frame(x = xseq),
        se.fit = TRUE, level = level, interval = interval
      )
    )
    fit <- as.data.frame(pred$fit)
    names(fit) <- c("y", "ymin", "ymax")
    fit <- transform(fit, y = backtrans(y), ymin = backtrans(ymin), ymax = backtrans(ymax))
    if (se) {
      data.frame(x = xseq, fit, se = pred$se.fit, se_param = TRUE)
    } else {
      data.frame(x = xseq, fit, se = pred$se.fit)
    }
  }

#' Linear Model Displays
#'
#' Adds linear model fits to plots. `geom_lm()` and `stat_lm()` are essentially
#' equivalent.  Use `geom_lm()` unless you want a non-standard geom.
#'
#' Stat calculation is performed by the (currently undocumented)
#' `predictdf`.  Pointwise confidence or prediction bands are
#' calculated using the [predict()] method.
#'
#' @rdname geom_lm
#' @inheritParams ggplot2::layer
#' @inheritParams ggplot2::geom_point
#' @param geom,stat Use to override the default connection between
#'   `geom_lm` and `stat_lm`.
#' @param formula a formula describing the model in terms of `y` (response)
#'   and `x` (predictor).
#' @param lm.args A list of arguments supplied to [lm()] when performing the fit.
#' @param backtrans a function that transforms the response back to
#'   the original scale when the `formula` includes a transformation on
#'   `y`.
#' @param interval One of `"none"`, `"confidence"` or `"prediction"`.
#' @param level The level used for confidence or prediction intervals
#'
#' @seealso [lm()] for details on linear model fitting.
#' @export
#' @examples
#' ggplot(data = mosaicData::KidsFeet, aes(y = length, x = width, color = sex)) +
#'   geom_lm() +
#'   geom_point()
#' ggplot(data = mosaicData::KidsFeet, aes(y = length, x = width, color = sex)) +
#'   geom_lm(interval = "prediction", color = "skyblue") +
#'   geom_lm(interval = "confidence") +
#'   geom_point() +
#'   ggplot2::facet_wrap(~sex)
#' # non-standard display
#' ggplot(data = mosaicData::KidsFeet, aes(y = length, x = width, color = sex)) +
#'   stat_lm(aes(fill = sex),
#'     color = NA, interval = "confidence", geom = "ribbon",
#'     alpha = 0.2
#'   ) +
#'   geom_point() +
#'   ggplot2::facet_wrap(~sex)
#' ggplot(mpg, aes(displ, hwy)) +
#'   geom_lm(
#'     formula = log(y) ~ poly(x, 3), backtrans = exp,
#'     interval = "prediction", fill = "skyblue"
#'   ) +
#'   geom_lm(
#'     formula = log(y) ~ poly(x, 3), backtrans = exp, interval = "confidence",
#'     color = "red"
#'   ) +
#'   geom_point()
geom_lm <-
  function(
             mapping = NULL, data = NULL, stat = "lm",
             position = "identity",
             interval = c("none", "prediction", "confidence"),
             level = 0.95,
             formula = y ~ x, lm.args = list(), backtrans = identity,
             ...,
             na.rm = FALSE,
             show.legend = NA,
             inherit.aes = TRUE) {
    interval <- match.arg(interval)
    params <- list(
      interval = interval, level = level, formula = formula,
      lm.args = lm.args, na.rm = na.rm, backtrans = backtrans, ...
    )

    layer(
      data = data,
      mapping = mapping,
      stat = stat,
      geom = GeomLm,
      position = position,
      show.legend = show.legend,
      inherit.aes = inherit.aes,
      params = params
    )
  }

#' @rdname ggformula-ggproto
#' @format NULL
#' @export
#' @seealso [geom_lm()]
#' @seealso [gf_lm()]

GeomLm <- ggproto("GeomLm", Geom,
  setup_data = function(data, params) {
    GeomLine$setup_data(data, params)
  },
  draw_group = function(data, panel_params, coord) {
    ribbon <- transform(data, colour = NA)
    path <- transform(data, alpha = NA)

    has_ribbon <- !is.null(data$se_param) # !is.null(data$ymax) && !is.null(data$ymin)

    grid::gList(
      if (has_ribbon) GeomRibbon$draw_group(ribbon, panel_params, coord),
      GeomLine$draw_panel(path, panel_params, coord)
    )
  },

  draw_key = draw_key_smooth,

  required_aes = c("x", "y"),
  optional_aes = c("ymin", "ymax"),

  default_aes = aes(
    colour = "#3366FF", fill = "grey60", linewidth = 0.7,
    linetype = 1, weight = 1, alpha = 0.3
  )
)

#' ggproto classes for ggplot2
#'
#' These are typically accessed through their associated `geom_*`, `stat_*` or
#' `gf_*` functions.
#'
#' @rdname ggformula-ggproto
#' @format NULL
#' @export
#' @seealso [stat_ash()]
#' @seealso [gf_ash()]

StatAsh <-
  ggproto("StatAsh", Stat,
    compute_group = function(data, scales, binwidth = NULL, adjust = NULL) {
      ash_points(data$x, binwidth = binwidth, adjust = adjust)
    },
    required_aes = c("x")
  )

# #' @rdname gf_fitdistr
# #' @export
# stat_fitdistr <-
#   function(mapping = NULL, data = NULL, geom = "path",
#            position = "identity", na.rm = FALSE, show.legend = NA,
#            inherit.aes = TRUE, start = NULL, ...) {
#     ggplot2::layer(
#       stat = StatFitdistr, data = data, mapping = mapping, geom = geom,
#       position = position, show.legend = show.legend, inherit.aes = inherit.aes,
#       params = list(start = NULL, ...)
#     )
#   }


#' @rdname ggformula-ggproto
#' @format NULL
#' @export

StatFitdistr <-
  ggproto(
    "StatFitdistr", Stat,
    default_aes = aes(y = calc(y)),
    required_aes = c("x"),
    compute_group =
      function(data, scales, dist = "dnorm", start = NULL,
                     xlim = NULL, n = 101, args = list()) {
        # range <- xlim %||% scales$x$dimension()
        range <- if (is.null(xlim)) scales$x$dimension() else xlim
        xseq <- seq(range[1], range[2], length.out = n)

        if (scales$x$is_discrete()) {
          x_trans <- xseq
        } else {
          # For continuous scales, need to back transform from transformed range
          # to original values
          x_trans <- scales$x$trans$inverse(xseq)
        }

        ddist <- do.call(
          mosaicCore::fit_distr_fun,
          c(list(~x, data = data, dist = dist, start = start), args)
        )
        data.frame(
          x = xseq,
          y = do.call(ddist, c(list(quote(x_trans))))
        )
      }
  )


#' A stat for fitting distributions
#'
#' This stat computes points for plotting a distribution function.  Fitting is done
#' using `MASS::fitdistr()` when analytic solutions are not available.
#'
#' @param mapping Aesthetics created using `aes()` or `aes_string()`.
#' @param data A data frame.
#' @param dist A character string indicating the distribution to fit.  Examples include
#'   `"dnorm"`, `"dgamma"`, etc.
#' @param start A list of starting values used by `MASS::fitdistr()` when numerically
#'   approximating the maximum likelihood estimate.
#' @param geom A character string naming the geom used to make the layer.
#' @param position Either a character string naming the position function used
#'   for the layer or a position object returned from a call to a position function.
#' @param inherit.aes If `FALSE`, overrides the default aesthetics, rather than combining
#'   with them.
#' @param na.rm If TRUE, do not emit a warning about missing data.
#' @param show.legend A logical. Should this layer be included in the legends? `NA`,
#'   the default, includes if any aesthetics are mapped. `FALSE` never includes,
#'   and `TRUE` always includes.
#' @param ... Additional arguments.
#' @return A gg object
#' @export

stat_fitdistr <-
  function(mapping = NULL, data = NULL, geom = "path",
             position = "identity", na.rm = FALSE, show.legend = NA,
             inherit.aes = TRUE, dist = "dnorm", start = NULL, ...) {
    #    mapping[["y"]] <- NULL
    dist_name <- deparse(substitute(dist))
    if (!is.character(dist)) dist <- dist_name

    ggplot2::layer(
      stat = StatFitdistr, data = data, mapping = mapping, geom = geom,
      position = position, show.legend = show.legend, inherit.aes = inherit.aes,
      params = list(dist = dist, start = start, ...)
    )
  }
