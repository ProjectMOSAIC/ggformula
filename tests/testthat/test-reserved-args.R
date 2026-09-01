# Regression tests for the bug where argument names that ggplot2's
# geom_*()/stat_*() constructors happen to declare (data, mapping,
# position, show.legend, inherit.aes, geom, stat) leaked through as
# generic "extra" settable parameters, because those names also appear in
# formals(geom_hline) etc. This broke `data = NA` layers (e.g. gf_hline())
# and interactive layers built with position-related extras (e.g.
# gf_jitter_interactive(width = ...)).

test_that("reserved_layer_arg_names contains the structural layer arguments", {
  expect_setequal(
    ggformula:::reserved_layer_arg_names,
    c(
      "mapping",
      "data",
      "geom",
      "stat",
      "position",
      "show.legend",
      "inherit.aes"
    )
  )
})

test_that("create_extras_and_dots() drops reserved names even when the geom/stat constructor declares them", {
  # formals(geom_hline) includes data/position/show.legend/inherit.aes, so
  # naively unioning geom_formals into the "allowed extras" set would let
  # them through; they must always be dropped.
  geom_formals <- ggformula:::grab_formals("hline", "geom")
  expect_true(all(
    c("data", "position", "show.legend", "inherit.aes") %in% names(geom_formals)
  ))

  extras_and_dots <-
    ggformula:::create_extras_and_dots(
      args = list(yintercept = 5, color = "navy"),
      formals = c(
        list(data = NA, position = "identity", show.legend = NA),
        alist(yintercept = , color = )
      ),
      stat_formals = list(),
      geom_formals = geom_formals,
      extras = alist(yintercept = , color = ),
      env = environment()
    )

  expect_false("data" %in% names(extras_and_dots))
  expect_false("position" %in% names(extras_and_dots))
  expect_false("show.legend" %in% names(extras_and_dots))
  expect_true("yintercept" %in% names(extras_and_dots))
  expect_true("color" %in% names(extras_and_dots))
})

test_that("gf_hline() with data = NA no longer errors and has a clean mapping", {
  p <- gf_hline(color = "navy", yintercept = ~ c(20, 25), data = NA)

  expect_s3_class(p, "gg")
  expect_equal(names(p$mapping), "yintercept")
  expect_equal(rlang::get_expr(p$mapping$yintercept), quote(yintercept))
  expect_equal(names(p$layers[[1]]$aes_params), "colour")
  # none of the reserved/structural names should end up mapped or set as
  # layer parameters
  expect_false(any(ggformula:::reserved_layer_arg_names %in% names(p$mapping)))
  expect_false(any(
    ggformula:::reserved_layer_arg_names %in% names(p$layers[[1]]$aes_params)
  ))
})

test_that("gf_vline() with data = NA and a mapped color also works", {
  p <- gf_vline(color = ~"vertical", xintercept = ~ c(100, 200, 300), data = NA)

  expect_s3_class(p, "gg")
  expect_true("xintercept" %in% names(p$mapping))
  expect_false(any(ggformula:::reserved_layer_arg_names %in% names(p$mapping)))
})

test_that("gf_abline() with data = NA works", {
  p <- gf_abline(intercept = 0, slope = 1, data = NA)
  expect_s3_class(p, "gg")
})

test_that("gf_jitter_interactive() with width supplied does not duplicate `position`", {
  skip_if_not_installed("ggiraph")

  expect_no_error(
    p <- gf_jitter_interactive(
      mpg ~ factor(cyl),
      data = mtcars,
      tooltip = ~mpg,
      width = 0.2
    )
  )
  expect_s3_class(p, "gg")
})
