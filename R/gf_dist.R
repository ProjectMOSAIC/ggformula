#' @importFrom mosaicCore named unnamed named_among
NA

#' Plot distributions
#'
#' Create a layer displaying a probability distribution.
#'
#' @importFrom stats approxfun ppoints
#' @importFrom rlang set_env
#' @param object a gg object.
#' @param dist A character string providing the name of a distribution.  Any
#'   distribution for which the functions with names formed by prepending
#'   "d", "p", or "q" to `dist` exist can be used.
#' @param xlim A numeric vector of length 2 providing lower and upper bounds for the
#'   portion of the distribution that will be displayed.  The default is to attempt
#'   to determine reasonable bounds using quantiles of the distribution.
#' @param ... additional arguments passed both to the distribution functions and
#'   to the layer.  Note: Possible ambiguities using `params` or by preceding plot
#'   argument with `plot_`.
#' @param kind One of `"density"`, `"cdf"`, `"qq"`, `"qqstep"`, or `"histogram"`
#'   describing what kind of plot to create.
#' @param resolution An integer specifying the number of points to use for creating
#'  the plot.
#' @param eps a (small) numeric value. When other defaults are not available, the
#'   distribution is processed from the `eps` to `1 - eps` quantiles.
#' @param params a list of parameters for the distribution.
#' @export
#' @examples
#' gf_dhistogram(~ rnorm(100), bins = 20) |>
#'   gf_dist("norm", color = "red")
#'
#' # shading tails -- but see pdist() for this
#' gf_dist("norm", fill = ~ (abs(x) <= 2), geom = "area")
#' gf_dist("norm", color = "red", kind = "cdf")
#' gf_dist("norm", fill = "red", kind = "histogram")
#' gf_dist("norm", color = "red", kind = "qqstep", resolution = 25) |>
#'   gf_dist("norm", color = "black", kind = "qq", resolution = 25, linewidth = 2, alpha = 0.5)
#' # size is used as parameter for binomial distribution
#' gf_dist("binom", size = 20, prob = 0.25)
#' # If we want to adjust size argument for plots, we have two choices:
#' gf_dist("binom", size = 20, prob = 0.25, plot_size = 2)
#' gf_dist("binom", params = list(size = 20, prob = 0.25), size = 2)
gf_dist <-
  function(
    object = ggplot(),
    dist,
    ...,
    xlim = NULL,
    #  xmin = NULL, xmax = NULL,
    kind = c("density", "cdf", "qq", "qqstep", "histogram"),
    resolution = 5000L,
    eps = 1e-6,
    params = NULL
  ) {
    if (missing(dist)) {
      if (is.character(object)) {
        dist <- object
      } else {
        stop("You must specify a distribution.")
      }
    }

    if (!is.character(dist)) {
      stop(
        "`dist' must be a string naming a distribution; don't forget the quotes."
      )
    }

    kind <- match.arg(kind)

    ddist <- paste("d", dist, sep = "")
    qdist <- paste("q", dist, sep = "")
    pdist <- paste("p", dist, sep = "")

    dots <- list(...)
    original_call <- match.call()
    dots <- original_call
    dots[[1]] <- NULL
    unnamed_dots <- original_call
    named_dots <- original_call
    unnamed_dots[[1]] <- NULL
    named_dots[[1]] <- NULL
    groupless_dots <- original_call
    groupless_dots[[1]] <- NULL
    for (i in length(unnamed_dots):1) {
      if (names(unnamed_dots)[i] != "") {
        unnamed_dots[i] <- NULL
      } else {
        named_dots[i] <- NULL
      }
    }
    if (is.null(params)) {
      params <- original_call
      params[[1]] <- NULL
      for (item in names(formals())) {
        if (item %in% names(params)) params[[item]] <- NULL
      }
      dparams <- c(unnamed(params), named_among(params, names(formals(ddist))))
      pparams <- c(unnamed(params), named_among(params, names(formals(pdist))))
      qparams <- c(unnamed(params), named_among(params, names(formals(qdist))))
      dots[
        names(dparams) |>
          union(names(pparams)) |>
          union(names(qparams))
      ] <- NULL
    } else {
      dparams <- params
      pparams <- params
      qparams <- params
      dots[["params"]] <- NULL
    }
    names(dots) <- gsub("plot_", "", names(dots))
    # remove some things from dots
    #
    if ("object" %in% names(dots)) {
      dots[["object"]] <- NULL
    }
    if ("dist" %in% names(dots)) {
      dots[["dist"]] <- NULL
    }
    # remove size for lines now that linewidth is used instead.
    dots_for_lines <- dots
    if ('size' %in% names(dots_for_lines)) {
      dots_for_lines[['size']] <- NULL
    }

    # attempting to make evaluation of these arguments more intuitive
    env <- parent.frame()
    dparams <- lapply(dparams, function(x) eval(x, env))
    pparams <- lapply(pparams, function(x) eval(x, env))
    qparams <- lapply(qparams, function(x) eval(x, env))

    sample_values <- do.call(qdist, c(p = list(ppoints(resolution)), qparams))

    unique_values <- unique(sample_values)
    # in a discrete distribution, we expect lots of ties
    discrete <- length(unique_values) < 0.9 * length(sample_values)

    if (is.null(xlim)) {
      # most distributions can handle 0 and 1, but just in case...

      xlim_opts <-
        tryCatch(
          do.call(
            qdist,
            c(list(p = c(0, eps, 0.01, 0.99, 1 - eps, 1)), qparams)
          ),
          error = function(x) {
            do.call(qdist, c(list(p = c(eps, 0.01, 0.99, 1 - eps)), qparams))
          }
        )
      xlim[1] <- min(xlim_opts[is.finite(xlim_opts)])
      xlim[2] <- max(xlim_opts[is.finite(xlim_opts)])
    }
    if (!discrete) {
      unif_values <- seq(xlim[1], xlim[2], length.out = resolution)
      # do.call(qdist, c(list(p = plim[1]), qparams)),
      # do.call(qdist, c(list(p = plim[2]), qparams)),
      # length.out = resolution
      fewer_values <- unif_values
    } else {
      fewer_values <- unique_values
    }

    if (kind == "cdf") {
      if (discrete) {
        step <- min(diff(fewer_values))
        cdfx <- seq(
          min(fewer_values) - 1.5 * step,
          max(fewer_values) + 1.5 * step,
          length.out = resolution
        )
        cdfx <- sort(unique(c(fewer_values, cdfx)))
        cdfy <- approxfun(
          fewer_values,
          do.call(pdist, c(list(q = fewer_values), pparams)),
          method = "constant",
          f = 0,
          yleft = 0,
          yright = 1
        )(cdfx)
        PlotData <- data.frame(y = cdfy, x = cdfx)
      } else {
        cdfx <- unif_values
        cdfy <- do.call(pdist, c(list(q = unif_values), pparams))
        PlotData <- data.frame(y = cdfy, x = cdfx)
      }
    }

    ydata <-
      switch(
        kind,
        density = do.call(ddist, c(list(x = fewer_values), dparams)),
        cdf = cdfy,
        qq = NULL,
        qqstep = NULL,
        histogram = do.call(ddist, c(list(x = sample_values), dparams))
      )

    # print(length(fewer_values))

    if (discrete) {
      switch(
        kind,
        density = do.call(
          gf_point,
          c(
            list(
              do.call(
                gf_segment,
                c(
                  list(
                    object,
                    rlang::set_env(density + 0 ~ x + x, parent.frame()),
                    data = data.frame(density = ydata, x = fewer_values)
                  ),
                  dots_for_lines
                )
              ),
              rlang::set_env(y ~ x, parent.frame()),
              data = data.frame(y = ydata, x = fewer_values)
            ),
            dots
          )
        ),
        cdf = do.call(
          gf_step,
          c(
            list(
              object,
              rlang::set_env(cumulative_density ~ x, parent.frame()),
              data = data.frame(cumulative_density = ydata, x = cdfx)
            ),
            dots_for_lines
          )
        ),
        qq = do.call(
          gf_qq,
          c(
            list(
              object,
              rlang::set_env(~x, parent.frame()),
              data = data.frame(x = sample_values)
            ),
            dots
          )
        ),
        qqstep = do.call(
          gf_qqstep,
          c(
            list(
              object,
              rlang::set_env(~x, parent.frame()),
              data = data.frame(x = sample_values)
            ),
            dots_for_lines
          )
        ),
        histogram = do.call(
          gf_dhistogram,
          c(
            list(
              object,
              rlang::set_env(~x, parent.frame()),
              data = data.frame(x = sample_values)
            ),
            dots_for_lines
          )
        )
      )
    } else {
      switch(
        kind,
        density = do.call(
          gf_line,
          c(
            list(
              object,
              rlang::set_env(density ~ x, parent.frame()),
              data = data.frame(density = ydata, x = fewer_values)
            ),
            dots_for_lines
          )
        ),
        cdf = do.call(
          gf_line,
          c(
            list(
              object,
              rlang::set_env(cumulative_density ~ x, parent.frame()),
              data = data.frame(cumulative_density = ydata, x = cdfx)
            ),
            dots_for_lines
          )
        ),
        qq = do.call(
          gf_qq,
          c(
            list(
              object,
              rlang::set_env(~x, parent.frame()),
              data = data.frame(x = sample_values)
            ),
            dots
          )
        ),
        qqstep = do.call(
          gf_qqstep,
          c(
            list(
              object,
              rlang::set_env(~x, parent.frame()),
              data = data.frame(x = sample_values)
            ),
            dots_for_lines
          )
        ),
        histogram = do.call(
          gf_dhistogram,
          c(
            list(
              object,
              rlang::set_env(~x, parent.frame()),
              data = data.frame(x = sample_values)
            ),
            dots_for_lines
          )
        )
      )
    }
  }
