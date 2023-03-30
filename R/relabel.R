#' Set and extract labels from a labeled object
#'
#' Some packages like expss provide mechanisms for providing longer labels to R objects.
#' These labels can be used when labeling plots and tables, for example, without requiring
#' long or awkward variable names.  This is an experimental feature and currently only supports
#' expss or any other system that stores a label in the `label` attribute of a vector.
#'
#' `get_variable_labels()` is a synonym of [labelled::var_label()].
#'
#' @rdname labels
#' @param ... passed to [labelled::var_label()]
#' @seealso [labelled::var_label()], [labelled::set_variable_labels()]
#' @export
#' @examples
#' KF <-
#'   mosaicData::KidsFeet %>%
#'   set_variable_labels(
#'       length      = 'foot length (cm)',
#'       width       = 'foot width (cm)',
#'       birthmonth  = 'birth month',
#'       birthyear   = 'birth year',
#'       biggerfoot  = 'bigger foot',
#'       domhand     = 'dominant hand'
#'   )
#' KF %>%
#'   gf_point(length ~ width, color = ~ domhand)
#' get_variable_labels(KF)
get_variable_labels <- function(...)
  labelled::var_label(...)

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
#'   set_variable_labels(
#'     length = 'foot length (cm)',
#'     width = 'foot width (cm)'
#'   )
#' gf_point(length ~ width, data = KF)
#' gf_density2d(length ~ width, data = KF)
#' get_variable_labels(KF)
#'
#'
#' @export
gf_relabel <- function(plot, labels = get_variable_labels(plot$data), ...) {
  labels <- utils::modifyList(as.list(labels), list(...))
  for (label_name in names(plot$labels)) {
    if (is.character(plot$labels[[label_name]])) {
      plot$labels[[label_name]] <-
        labels[[plot$labels[[label_name]]]] %||% plot$labels[[label_name]]
    }
  }
  plot
}

#' @rdname gf_relabel
#' @param x A ggplot.
#' @export
print.gf_ggplot <- function(x, labels = get_variable_labels(x$data), ...) {
  x <- gf_relabel(x, labels)
  NextMethod()
}
