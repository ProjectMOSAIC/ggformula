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

test_that("interactive layers require ggiraph to be installed, not attached", {
  skip_if_not_installed("ggiraph")

  # Interactive layers look ggiraph's constructors and ggproto objects up
  # in its namespace, so installation is enough; the requirement is
  # recorded so that a missing ggiraph produces an informative error at
  # call time rather than a lookup failure deep in the layer machinery.
  expect_true(
    "ggiraph" %in% ggformula_spec(gf_point_interactive)$installed_packages
  )
  expect_equal(
    ggformula_spec(gf_point_interactive)$required_packages,
    character(0)
  )
})

test_that("every wrappable ggiraph interactive geom has a gf_* wrapper", {
  skip_on_cran()
  skip_if_not_installed("ggiraph")

  # The `gf_*_interactive()` functions are written out explicitly (so that
  # roxygen can generate their `\usage` sections), which means the list can
  # fall behind ggiraph. `report_interactive_coverage()` reports any gap at
  # build time; this makes the same invariant enforceable in CI. Skipped on
  # CRAN, where a new ggiraph release should not fail the checks.
  coverage <-
    ggformula:::report_interactive_coverage(asNamespace("ggformula"))

  expect_equal(coverage$missing, character(0))
  expect_true(length(coverage$wrapped) > 40)
})

test_that("ggiraph_fun() errors informatively for an unknown constructor", {
  skip_if_not_installed("ggiraph")

  expect_error(
    ggformula:::ggiraph_fun("geom_not_a_real_thing_interactive"),
    "does not export"
  )
  expect_true(is.function(ggformula:::ggiraph_fun("geom_point_interactive")))
})

# The point of `installed_packages` is that, unlike `required_packages`,
# it does *not* require the package to be attached. Showing that needs a
# package which is installed but not on the search path: {MASS} ships with
# R and nothing in ggformula or its tests attaches it. These tests skip
# (rather than detaching MASS, which can fail when another attached
# package depends on it) in the rare session where it is already attached.

test_that("check_installed_packages() does not require the package to be attached", {
  skip_if_not_installed("MASS")
  skip_if("package:MASS" %in% search(), "MASS is attached in this session")

  expect_no_error(ggformula:::check_installed_packages("MASS", "gf_fake"))
})

test_that("check_required_packages() additionally requires attachment", {
  skip_if_not_installed("MASS")
  skip_if("package:MASS" %in% search(), "MASS is attached in this session")

  expect_error(
    ggformula:::check_required_packages("MASS", "gf_fake"),
    "gf_fake.*MASS package must be loaded"
  )
})
