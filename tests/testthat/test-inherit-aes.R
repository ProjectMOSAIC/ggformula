# Regression tests for a bug in which `gf_*(inherit = FALSE)` was silently
# ignored by any `gf_*()` function built with an explicit
# `layer_fun = quo(ggplot2::geom_*)` (rather than the default
# `ggplot2::layer()`). `build_layer_args()` assembled two different
# argument lists depending on whether `layer_fun` had a `params` formal,
# and the non-`layer()` branch omitted `inherit.aes` entirely -- an
# assumption inherited from `geom_abline()`/`geom_hline()`/`geom_vline()`,
# which historically did not accept it. `gf_violin()` later adopted
# `layer_fun = quo(ggplot2::geom_violin)` (to get correct `quantile_gp`
# handling) and so fell into that branch, losing `inherit = FALSE`.
#
# `inherit.aes` is now forwarded whenever `layer_fun` declares it. The
# abline family is unaffected: those geoms default to
# `inherit.aes = FALSE`, and the matching `gf_*()` functions are built
# with `layer_factory(inherit.aes = FALSE)`, so the forwarded value
# agrees with the geom's own default.

test_that("gf_violin() honors inherit = FALSE (layer_fun = geom_violin)", {
  p <- gf_point(mpg ~ factor(cyl), data = mtcars) |>
    gf_violin(hp ~ factor(gear), data = mtcars, inherit = FALSE)

  expect_false(p$layers[[2]]$inherit.aes)
})

test_that("gf_violin() still inherits aesthetics by default", {
  p <- gf_point(mpg ~ factor(cyl), data = mtcars) |>
    gf_violin(hp ~ factor(gear), data = mtcars)

  expect_true(p$layers[[2]]$inherit.aes)
})

test_that("the ggplot2::layer() path (e.g. gf_boxplot()) is unchanged", {
  p <- gf_point(mpg ~ factor(cyl), data = mtcars) |>
    gf_boxplot(hp ~ factor(gear), data = mtcars, inherit = FALSE)

  expect_false(p$layers[[2]]$inherit.aes)
})

test_that("gf_*_interactive() honors inherit = FALSE", {
  skip_if_not_installed("ggiraph")

  # Interactive layers go through `layer_interactive()` rather than
  # `ggplot2::layer()`; it declares `inherit.aes` so that
  # `build_layer_args()` forwards it on to ggiraph's `...`-passthrough
  # `geom_*_interactive()` wrappers.
  p <- gf_point(mpg ~ wt, data = mtcars) |>
    gf_point_interactive(
      hp ~ disp,
      data = mtcars,
      tooltip = ~hp,
      inherit = FALSE
    )

  expect_false(p$layers[[2]]$inherit.aes)
})

test_that("gf_*_interactive() still inherits aesthetics by default", {
  skip_if_not_installed("ggiraph")

  p <- gf_point(mpg ~ wt, data = mtcars) |>
    gf_point_interactive(hp ~ disp, data = mtcars, tooltip = ~hp)

  expect_true(p$layers[[2]]$inherit.aes)
})

test_that("gf_hline_interactive() keeps inherit.aes = FALSE by default", {
  skip_if_not_installed("ggiraph")

  # Built from gf_hline()'s spec, so `inherit` defaults to FALSE, matching
  # geom_hline()'s own default.
  p <- gf_point(mpg ~ wt, data = mtcars) |>
    gf_hline_interactive(yintercept = 20, tooltip = "cutoff")

  expect_false(p$layers[[2]]$inherit.aes)
})

test_that("a range of interactive layers still build", {
  skip_if_not_installed("ggiraph")

  # `layer_interactive()` forwards an explicit `inherit.aes` to every
  # interactive layer now, so check a spread of geoms/stats/positions
  # rather than just gf_point_interactive().
  expect_no_error(
    gf_boxplot_interactive(mpg ~ factor(cyl), data = mtcars, tooltip = ~mpg)
  )
  expect_no_error(
    gf_violin_interactive(mpg ~ factor(cyl), data = mtcars, tooltip = ~mpg)
  )
  expect_no_error(
    gf_jitter_interactive(
      mpg ~ factor(cyl),
      data = mtcars,
      tooltip = ~mpg,
      width = 0.2
    )
  )
  expect_no_error(
    gf_histogram_interactive(~mpg, data = mtcars, tooltip = ~ after_stat(count))
  )
  expect_no_error(
    gf_line_interactive(mpg ~ wt, data = mtcars, tooltip = ~mpg)
  )
  expect_no_error(
    gf_smooth_interactive(mpg ~ wt, data = mtcars, tooltip = ~mpg)
  )
  expect_no_error(
    gf_text_interactive(
      mpg ~ wt,
      label = ~ rownames(mtcars),
      data = mtcars,
      tooltip = ~mpg
    )
  )
  expect_no_error(
    gf_point(mpg ~ wt, data = mtcars) |>
      gf_abline_interactive(slope = 0, intercept = 20, tooltip = "flat")
  )
})

test_that("gf_abline() and friends keep inherit.aes = FALSE by default", {
  # These are built with `layer_factory(inherit.aes = FALSE)` to match
  # `geom_abline()`'s own default; forwarding `inherit.aes` by signature
  # must not flip that to TRUE.
  expect_false(ggformula_spec(gf_abline)$inherit.aes)
  expect_false(ggformula_spec(gf_hline)$inherit.aes)
  expect_false(ggformula_spec(gf_vline)$inherit.aes)

  p <- gf_point(mpg ~ wt, data = mtcars) |>
    gf_hline(yintercept = 20)
  expect_false(p$layers[[2]]$inherit.aes)

  p2 <- gf_point(mpg ~ wt, data = mtcars) |>
    gf_abline(slope = 0, intercept = 20)
  expect_false(p2$layers[[2]]$inherit.aes)
})
