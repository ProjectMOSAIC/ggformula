#' @keywords internal
#' Formula interface to ggplot2
#'
#' @section The ggformula system:
#'
#' The functions in \pkg{ggformula} provide a formula interface to \pkg{ggplot2} layer
#' functions and a system for working with pipes to create multi-layer
#' plots and to refine plots.
#' For plots with just one layer, the formula interface
#' is more compact than native \pkg{ggplot2} code and is consistent with modeling
#' functions like [stats::lm()] that use a formula interface and with the
#' numerical summary functions in the \pkg{mosaic} package.
#'
#' @section Specifying plot attributes:
#'
#' Positional attributes (a.k.a aesthetics) are typically specified using a formula
#' (see the `gformula` argument).
#' Setting and mapping of additional attributes can be done through the use of additional arguments.
#' Attributes can be set can be set using arguments of the form `attribute = value` or
#' mapped using arguments of the form `attribute = ~ expression`.
#' A (sometimes partial) list of available attributes can be obtained by executing
#' plotting functions with no arguments.
#'
#' In formulas of the form `A | B`, `B` will be used to form facets using
#' [facet_wrap()] or [facet_grid()].
#' This provides an alternative to [gf_facet_wrap()] and
#' [gf_facet_grid()] that is terser and may feel more familiar to users
#' of \pkg{lattice}.
#'
#' @section Evaluation:
#' Evaluation of the \pkg{ggplot2} code occurs in the environment specified
#' by `environment`. This will typically do the right thing, but is exposed
#' in case some non-standard behavior is desired. In earlier versions,
#' the environment of the formula was used, but since some functions in
#' the package do not require a formula, a separate argument is used now.
#'
#' @rdname ggformula
#' @name ggformula
#' @examples
#' apropos("gf_")
#' gf_point()

"_PACKAGE"

## usethis namespace: start
## usethis namespace: end

NULL
