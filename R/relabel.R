
#' Set and extract labels from a labeled object
#'
#' Some packages like expss provide mechanisms for providing longer labels to R objects.
#' These labels can be used when labeling plots and tables, for example, without requiring
#' long or awkward variable names.  This is an experimental feature and currently only supports
#' expss or any other system that stores a label in the `label` attribute of a vector.
#'
#' @rdname get_labels
#' @param object An R object, potentially labelled.
#' @param ... Additional arguments. Ignored in existing methods.
#' @return The label(s) for the object.  If `object` is a data frame,
#'   labels are extracted from each variable and returned as a named list.
#'   If there are no labels, `NULL` is returned.
#'
#' @export
#' @examples
#' KF <-
#'   mosaicData::KidsFeet %>%
#'   set_labels(
#'       length      = 'foot length (cm)',
#'       width       = 'foot width (cm)',
#'       birthmonth  = 'birth month',
#'       birthyear   = 'birth year',
#'       biggerfoot  = 'bigger foot',
#'       domhand     = 'dominant hand'
#'   )
#' KF %>%
#'   gf_point(length ~ width, color = ~ domhand)
#' get_labels(KF)

get_labels <- function(object, ...) {
  UseMethod('get_labels')
}

#' @rdname get_labels
#' @export
get_labels.data.frame <- function(object, ...) {
  res <- lapply(object, get_labels)
  if (is.null(res)) res <- list()
  res
}

#' @rdname get_labels
#' @export
get_labels.labelled <- function(object, ...) {
  attr(object, "label")
}

#' @rdname get_labels
#' @export
get_labels.default <- function(object, ...) {
  attr(object, "label")
}

#' @rdname get_labels
#' @param lab A string providing a label (when `object` is a vector, for example)
#'   or a named list of strings
#'   providing multiple labels (when `object` is a data frame, for example).
#' @export

set_labels <- function(object, ...) {
  UseMethod("set_labels")
}

#' @rdname get_labels
#' @export

set_labels.default <- function(object, lab = NULL, ...) {
  attr(object, 'label') <- lab
}

#' @rdname get_labels
#' @export

set_labels.data.frame <- function(object, lab = list(), ...) {
  lab <- c(as.list(lab), list(...))
  lab <- utils::modifyList(get_labels(object), lab)

  for (n in names(lab)) {
    if (! is.null(object[[n]])) {
      attr(object[[n]], "label") <- lab[[n]]
    }
  }
  object
}

#' Modify plot labeling
#'
#' Some packages like expss provide mechanisms for providing longer labels to R objects.
#' These labels can be used when labeling plots and tables, for example, without requiring
#' long or awkward variable names.  This is an experimental feature and currently only supports
#' expss or any other system that stores a label in the `label` attribute of a vector.
#'
#' @param plot A ggplot.
#' @param labels A named list of labels.
#' @param ... Additional named labels. See examples.
#' @return A plot with potentially modified labels.
#' @examples
#'
#' # labeling using a list
#' labels <- list(width = "width of foot (cm)", length = "length of foot (cm)",
#'   domhand = "dominant hand")
#' gf_point(length ~ width, color = ~domhand, data = mosaicData::KidsFeet) %>%
#'   gf_relabel(labels)
#'
#' # labeling using ...
#' gf_point(length ~ width, color = ~domhand, data = mosaicData::KidsFeet) %>%
#'   gf_relabel(
#'     width = "width of foot (cm)",
#'    length = "length of foot (cm)",
#'    domhand = "dominant hand")
#'
#' # Alternatively, we can store labels with data.
#' KF <- mosaicData::KidsFeet %>%
#'   set_labels(
#'     length = 'foot length (cm)',
#'     width = 'foot width (cm)'
#'   )
#' gf_point(length ~ width, data = KF)
#' gf_density2d(length ~ width, data = KF)
#' get_labels(KF)
#'
#'
#' @export
gf_relabel <- function(plot, labels = get_labels(plot$data), ...) {
  labels <- utils::modifyList(as.list(labels), list(...))
  for (label_name in names(plot$labels)) {
    plot$labels[[label_name]] <-
      labels[[plot$labels[[label_name]]]] %||% plot$labels[[label_name]]
  }
  plot
}

#' @rdname get_labels
#' @param x A ggplot.
#' @export

print.gf_ggplot <- function(x, lab = get_labels(x$data), ...) {
  x <- gf_relabel(x, lab)
  NextMethod()
}

#  #
#  #' Use expss labels to relabel a ggplot.
#  #'
#  #' @param object A ggplot.
#  #' @param ... Additional arguments passed along `expss::use_labels
#  #' @export
#  #'
#  use_labels <- function(object, ...) {
#    UseMethod('use_labels')
#  }
#
#  #' @export
#  use_labels.default <- function(object, ...) {
#    expss::use_labels(object, ...)
#  }
#
#  #' @export
#  use_labels.ggplot <- function(object, ...) {
#    gf_relabel(object, ...)
#  }