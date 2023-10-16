#' @importFrom stats setNames
NULL

formula2aes <- function(formula, template) {
  fs <- f_formula_slots(formula) |> unlist()
  ts <- f_formula_slots(template) |> unlist()
  names(fs) <-
    sapply(ts, function(x) as.character(rlang::f_rhs(x)))
  # names(fs) <- sapply(ts, as.character)
  do.call(aes_, fs)
}

list2aes <- function(l) {
  mapping <- aes()
  for (i in 1:length(l)) {
    new_mapping <- aes(a = !!l[[i]][[2]]) |> setNames(names(l)[i])
    mapping <- modifyList(mapping, new_mapping)
  }
  mapping
}

# formula2aes( lenth ~ foo(width + girth), y ~ x)

# foo <- function(formula, l, template = y ~ x) {
#   modifyList(formula2aes(formula, template), list2aes(l))
# }
#
# list2aes( list(a = ~ sex, b = ~ foo(group + color)))
#
# foo(length ~ width, list(color = ~ sex), template = y ~ x)
