test_that("ggformula_spec() returns the arguments a gf_* function was built with", {
  spec <- ggformula_spec(gf_point)

  expect_type(spec, "list")
  expect_true(all(
    c(
      "geom",
      "stat",
      "position",
      "aes_form",
      "extras",
      "pre",
      "aesthetics",
      "inherit.aes",
      "check.aes",
      "required_packages",
      "installed_packages"
    ) %in%
      names(spec)
  ))
  expect_equal(spec$geom, "point")
  expect_true(spec$inherit.aes)
})

test_that("printing a gf_* function does not dump its spec", {
  # The spec lives in the function's enclosing environment rather than in
  # an attribute on the function, because `print.function()` displays
  # attributes -- typing `gf_point` at the console used to print the whole
  # spec after the closure.
  printed <- paste(utils::capture.output(print(gf_point)), collapse = "\n")

  expect_false(grepl("ggformula_spec", printed, fixed = TRUE))
  expect_false(grepl("attr(,", printed, fixed = TRUE))
})

test_that("ggformula_spec() returns NULL for functions not built by layer_factory()", {
  expect_null(ggformula_spec(mean))
  expect_null(ggformula_spec(function(x) x))
  expect_null(ggformula_spec(sum)) # a primitive: no environment at all
  expect_null(ggformula_spec("gf_point")) # not a function
})

test_that("ggformula_spec() ignores an unrelated .ggformula_spec binding", {
  local({
    .ggformula_spec <- "not a spec"
    f <- function(x) x
    expect_null(ggformula_spec(f))
  })
})

test_that("interactive_layer_factory() can still read a spec", {
  skip_if_not_installed("ggiraph")

  # gf_point_interactive() is built from gf_point()'s spec at build time;
  # if the spec were unreadable it would be NULL rather than a function.
  expect_true(is.function(gf_point_interactive))
  expect_equal(ggformula_spec(gf_point_interactive)$geom, "point")
})
