context("inherit = is honored regardless of which layer function is used")

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
