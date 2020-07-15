
#' Formula interface to ggplot()
#'
#' Create a new ggplot and (optionally) set default dataset aesthetics mapping.
#'
#' @param ... arguments that can include `data` (a data frame or something that can be
#'   [`ggplot2::fortify()`]ed to become one) and aesthetics specified using the following
#'   formula notation: `aesthetic = ~ expression`.  See examples.
#' @return a gg object
#' @export
#' @examples
#' gf_plot(mtcars, x = ~ wt, y = ~ mpg, color = ~ factor(cyl)) %>%
#'   gf_density_2d() %>%
#'   gf_point()
#'
gf_plot <- function(...) {
  dots <- list(...)
  formulas <- sapply(dots, rlang::is_formula)
  flist <- dots[formulas]
  mlist <- lapply(flist, rlang::f_rhs)
  olist <- dots[!formulas]
  mapping <- do.call(aes, mlist)
  do.call(ggplot, c(list(mapping = mapping), olist))
}
