
#' Discrete Breaks
#'
#' Creates a function that can be passed to scales for creating discrete breaks
#' at multilples of `resolution`.
#'
#' @param resolution Resolution of the breaks
#' @return A function that can be passed to scales functions as the `breaks` argument.
#'
#' @export
#' @examples
#' x <- rbinom(100, 100, 0.4)
#' p <- gf_bar( ~ x)
#' p |> gf_refine(scale_x_continuous(breaks = discrete_breaks()))
#' p |> gf_refine(scale_x_continuous(breaks = discrete_breaks(5)))
#' p |> gf_refine(scale_x_continuous(breaks = discrete_breaks(2)))

discrete_breaks <- function(resolution = 1) {
  res <-
    function(x, resolution) {
      a <- floor(range(x))[1]
      b <- ceiling(range(x))[2]
      bks <- seq(0, b, by = resolution)
      bks[bks > a]
    }
  formals(res) <- c(alist(x = ), list(resolution = resolution))
  res
}
