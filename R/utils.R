## Functions not exported from ggplot2

# describe object x
obj_desc <-
  function (x)
  {
    if (isS4(x)) {
      paste0("an S4 object with class ", class(x)[[1]])
    }
    else if (is.object(x)) {
      if (is.data.frame(x)) {
        "a data frame"
      }
      else if (is.factor(x)) {
        "a factor"
      }
      else {
        paste0("an S3 object with class ", paste(class(x),
                                                 collapse = "/"))
      }
    }
    else {
      switch(typeof(x), `NULL` = "a NULL", character = "a character vector",
             integer = "an integer vector", logical = "a logical vector",
             double = "a numeric vector", list = "a list", closure = "a function",
             paste0("a base object of type", typeof(x)))
    }
  }

# modified to add search in ggformula namespace

find_global <-
  function (name, env, mode = "any")
  {
    if (exists(name, envir = env, mode = mode)) {
      return(get(name, envir = env, mode = mode))
    }
    nsenv <- asNamespace("ggformula")
    if (exists(name, envir = nsenv, mode = mode)) {
      return(get(name, envir = nsenv, mode = mode))
    }
    nsenv <- asNamespace("ggplot2")
    if (exists(name, envir = nsenv, mode = mode)) {
      return(get(name, envir = nsenv, mode = mode))
    }
    NULL
  }

check_subclass <-
  function (x, subclass, argname = tolower(subclass), env = parent.frame())
  {
    if (inherits(x, subclass)) {
      x
    }
    else if (is.character(x) && length(x) == 1) {
      name <-  paste0(subclass, camelize(x, first = TRUE))
        paste0(subclass, camelize(x, first = TRUE))
      obj <- find_global(name, env = env)
      if (is.null(obj) || !inherits(obj, subclass)) {
        stop("Can't find `", argname, "` called \"", x, "\"",
             call. = FALSE)
      }
      else {
        obj
      }
    }
    else {
      stop("`", argname, "` must be either a string or a ",
           subclass, " object, ", "not ", obj_desc(x), call. = FALSE)
    }
  }

camelize <-
  function (x, first = FALSE)
  {
    x <- gsub("_(.)", "\\U\\1", x, perl = TRUE)
    if (first)
      x <- firstUpper(x)
    x
  }

firstUpper <-
  function (s)
  {
    paste(toupper(substring(s, 1, 1)), substring(s, 2), sep = "")
  }

## Use above to create below

get_aesthetics <- function(x, subclass, env = parent.frame()) {
  obj <- find_geom_or_stat(x, subclass, env)
  if (is.null(obj)) {
    stop(paste("No", tolower(subclass), "named", tolower(x)))
  }
  obj$aesthetics()
}

get_parameters <- function(x, subclass, env = parent.frame()) {
  obj <- find_geom_or_stat(x, subclass, env)
  if (is.null(obj)) {
    stop(paste("No", subclass, "named", x))
  }
  obj$parameters()
}

get_args <- function(x, subclass, env = parent.frame()) {
  union(
    get_aesthetics(x, subclass, env),
    get_parameters(x, subclass, env)
  )
}

find_geom_or_stat <-
  function(x, subclass, env = parent.frame()) {
    # check_subclass(x, subclass, env = env)
    find_global(paste0(firstUpper(subclass), firstUpper(x)), env)
  }

### other utils

cull_list <- function(x, names) {
  x[intersect(names(x), names)]
}

remove_from_list <- function(x, names) {
  for (n in names) {
    x[[n]] <- NULL
  }
  x
}

# A vector of integers from 1:n if n >= 1, else an empty vector.

one_upto <- function(n) {
  if (n > 0) 1:n else integer(0)
}

# slightly modified version of similar function in ggplot2
# using tibble() directly rather than wrapping as data_frame0

#' @importFrom tibble tibble

ensure_nonempty_data <- function (data)
{
  if (empty(data)) {
    tibble::tibble(group = 1, .size = 1, .name_repair = "minimal")
  }
  else {
    data
  }
}

empty <- function (df)
{
  is.null(df) || nrow(df) == 0 || ncol(df) == 0 || inherits(df, "waiver")
}

