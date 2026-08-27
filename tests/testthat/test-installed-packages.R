context("layer_factory(installed_packages = ...)")

# These tests avoid palmerpenguins/mosaic so they always run.

test_that("installed_packages defaults to no restriction", {
  expect_equal(ggformula_spec(gf_point)$installed_packages, character(0))
  expect_no_error(gf_point(mpg ~ wt, data = mtcars))
})

test_that("installed_packages is recorded in ggformula_spec()", {
  expect_equal(ggformula_spec(gf_sf)$installed_packages, "sf")
})

test_that("check_installed_packages() errors informatively when a package isn't installed", {
  expect_error(
    ggformula:::check_installed_packages("not.a.real.package", "gf_fake"),
    "not.a.real.package package is required for gf_fake"
  )
})

# test_that("check_installed_packages() does not require the package to be attached", {
#   skip_if_not_installed("MASS")
#   was_attached <- "package:MASS" %in% search()
#   if (was_attached) {
#     suppressWarnings(detach("package:MASS"))
#   }
#   on.exit(if (was_attached) library(MASS), add = TRUE)

#   expect_false("package:MASS" %in% search())
#   expect_no_error(ggformula:::check_installed_packages("MASS", "gf_fake"))
# })

# test_that("check_required_packages() and check_installed_packages() differ on attachment", {
#   skip_if_not_installed("MASS")
#   was_attached <- "package:MASS" %in% search()
#   if (was_attached) {
#     suppressWarnings(detach("package:MASS"))
#   }
#   on.exit(if (was_attached) library(MASS), add = TRUE)

#   expect_no_error(ggformula:::check_installed_packages("MASS", "gf_fake"))
#   expect_error(
#     ggformula:::check_required_packages("MASS", "gf_fake"),
#     "gf_fake.*MASS package must be loaded"
#   )
# })
