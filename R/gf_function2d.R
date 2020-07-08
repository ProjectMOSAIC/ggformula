#' Plot functions of two variables
#'
#' Plot functions of two variables as tile and/or contour plots.
#'
#' @param object An R object, typically of class "gg".
#' @param fun A function of two variables to be plotted.
#' @param formula A formula describing a function of two variables to be plotted.  See [`mosaic::makeFun()`]
#'   for details regarding the conversion from a formula to a function.
#' @param xlim x limits for generating points to be plotted.
#' @param ylim y limits for generating points to be plotted.
#' @param tile A logical indicating whether the tile layer should be drawn.
#' @param contour A logical indicating whether the contour layer should be drawn.
#' @param resolution  A numeric vector of length 1 or 2 specifying the
#'   number of grid points at which the function is evaluated (in each dimension).
#' @param ... additional arguments passed to [`gf_tile()`] or [`gf_contour()`].
#' @return A gg plot.
#'
#' @rdname gf_function2d
#' @examples
#' theme_set(theme_bw())
#' gf_function_2d(fun = function(x, y) sin(2 * x * y), xlim = c(-pi, pi), ylim = c(-pi, pi)) %>%
#'   gf_refine(scale_fill_viridis_c())
#' gf_function_2d(fun = function(x, y) x + y, contour = FALSE)
#' gf_function_tile(fun = function(x, y) x * y) %>%
#'   gf_function_contour(fun = function(x, y) x * y, color = "white") %>%
#'   gf_refine(scale_fill_viridis_c())
#' gf_fun_tile(x * y ~ x + y, xlim = c(-3, 3), ylim = c(-2, 2)) %>%
#'   gf_fun_contour(x * y ~ x + y, color = "white") %>%
#'   gf_refine(scale_fill_viridis_c()) %>%
#'   gf_labs(fill = "product")
#' @importFrom magrittr %>%
#' @export
#'
gf_function_2d <-
  function(object = NULL, fun = identity, xlim = NULL, ylim = NULL, ...,
             tile = TRUE, contour = TRUE, resolution = 50) {
    if (is.function(object)) {
      fun <- object
      object <- NULL
    }


    if (is.null(xlim)) {
      if (is.null(object)) {
        xlim <- c(0, 1)
      } else {
        xlim <- ggplot2::layer_scales(object)$x$range$range
      }
    }

    if (is.null(ylim)) {
      if (is.null(object)) {
        ylim <- c(0, 1)
      } else {
        ylim <- ggplot2::layer_scales(object)$y$range$range
      }
    }

    xlim <- range(xlim)
    ylim <- range(ylim)
    resolution <- rep(resolution, 2)

    Layer_Data <-
      expand.grid(
        x = seq(xlim[1], xlim[2], length.out = resolution[1]),
        y = seq(ylim[1], ylim[2], length.out = resolution[2])
      ) %>%
      dplyr::mutate(value = fun(x, y))

    res <- object
    if (tile) {
      res <-
        res %>%
        gf_tile(value ~ x + y, data = Layer_Data, ...) %>%
        gf_labs(fill = "")
    }
    if (contour) {
      res <-
        res %>%
        gf_contour(value ~ x + y, data = Layer_Data, ...) %>%
        gf_labs(fill = "")
    }
    class(res) <- unique(c('gf_ggplot', class(res)))
    res
  }

#' @rdname gf_function2d
#' @export
gf_function2d <- gf_function_2d

#' @rdname gf_function2d
#' @export
gf_function_contour <-
  function(object = NULL, fun = identity, xlim = NULL, ylim = NULL, ...,
             resolution = 50) {
    gf_function_2d(object, fun = fun, xlim = xlim, ylim = ylim, contour = TRUE, tile = FALSE, ...)
  }


#' @rdname gf_function2d
#' @export
#'
gf_function_tile <-
  function(object = NULL, fun = identity, xlim = NULL, ylim = NULL, ...,
             resolution = 50) {
    gf_function_2d(object,
      fun = fun, xlim = xlim, ylim = ylim, contour = FALSE, tile = TRUE,
      resolution = resolution, ...
    )
  }

#' @rdname gf_function2d
#' @export
#'
gf_fun_2d <-
  function(object = NULL, formula = NULL, xlim = NULL, ylim = NULL, tile = TRUE,
             contour = TRUE, ..., resolution = 50) {
    if (inherits(object, "formula")) {
      formula <- object
      object <- NULL
    }

    gf_function_2d(object,
      fun = mosaic::makeFun(formula),
      xlim = xlim, ylim = ylim, contour = contour,
      tile = tile, resolution = resolution, ...
    )
  }

#' @rdname gf_function2d
#' @export
gf_fun2d <- gf_fun_2d

#' @rdname gf_function2d
#' @export
#'
gf_fun_tile <-
  function(object = NULL, formula = NULL, xlim = NULL, ylim = NULL, ...,
             resolution = 50) {
    gf_fun_2d(object,
      formula = formula,
      xlim = xlim, ylim = ylim, contour = FALSE,
      tile = TRUE, resolution = resolution, ...
    )
  }

#' @rdname gf_function2d
#' @export
#'
gf_fun_contour <-
  function(object = NULL, formula = NULL, xlim = NULL, ylim = NULL, ...,
             resolution = 50) {
    gf_fun_2d(object,
      formula = formula,
      xlim = xlim, ylim = ylim, contour = TRUE,
      tile = FALSE, resolution = resolution, ...
    )
  }
