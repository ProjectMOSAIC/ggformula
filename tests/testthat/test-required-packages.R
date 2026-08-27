context("layer_factory(required_packages = ...)")

# These tests avoid palmerpenguins/mosaic so they always run.

test_that("required_packages defaults to no restriction", {
  expect_equal(ggformula_spec(gf_point)$required_packages, character(0))
  # gf_point() has no required packages, so nothing should error
  expect_no_error(gf_point(mpg ~ wt, data = mtcars))
})

test_that("required_packages is recorded in ggformula_spec()", {
  expect_equal(ggformula_spec(gf_sina)$required_packages, "ggforce")
})

test_that("check_required_packages() errors informatively when a package isn't attached", {
  skip_if_not_installed("ggforce")
  was_attached <- "package:ggforce" %in% search()
  if (was_attached) {
    suppressWarnings(detach("package:ggforce"))
  }
  on.exit(if (was_attached) library(ggforce), add = TRUE)

  expect_error(
    ggformula:::check_required_packages("ggforce", "gf_sina"),
    "gf_sina.*ggforce package must be loaded"
  )
})

test_that("check_required_packages() errors informatively when a package isn't installed", {
  expect_error(
    ggformula:::check_required_packages("not.a.real.package", "gf_fake"),
    "not.a.real.package package is required for gf_fake"
  )
})

test_that("check_required_packages() is a no-op when the package is attached", {
  skip_if_not_installed("ggforce")
  library(ggforce)
  expect_no_error(ggformula:::check_required_packages("ggforce", "gf_sina"))
})

test_that("gf_sina() errors when ggforce isn't attached, and works once it is", {
  skip_if_not_installed("ggforce")
  was_attached <- "package:ggforce" %in% search()
  if (was_attached) {
    suppressWarnings(detach("package:ggforce"))
  }
  on.exit(if (was_attached) library(ggforce), add = TRUE)

  expect_error(
    gf_sina(mpg ~ factor(cyl), data = mtcars),
    "gf_sina.*ggforce package must be loaded"
  )

  library(ggforce)
  expect_no_error(gf_sina(mpg ~ factor(cyl), data = mtcars))
})
