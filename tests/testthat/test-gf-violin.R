context("gf_violin() quantile lines")

# Regression tests for a bug where gf_violin()'s quantile.colour/
# quantile.color/quantile.linetype/quantile.linewidth extras were
# silently ignored (no quantile lines drawn), because gf_violin() used
# the low-level ggplot2::layer() path (geom = "violin", stat =
# "ydensity") which bypasses ggplot2::geom_violin()'s own logic for
# turning those four arguments into the `quantile_gp` grid graphical
# parameters that GeomViolin$draw_group() actually reads. A parallel,
# hand-written `quantile_gp` computation in `pre` masked the missing
# rendering for plain gf_violin() (since it fed `quantile_gp` in
# directly), but caused a "Duplicated aesthetics after name
# standardisation: quantile_gp" warning for gf_violin_interactive()
# (whose path *does* go through ggplot2::geom_violin() internally, which
# computes its own quantile_gp from the same four arguments). Both are
# now fixed by having gf_violin() use `layer_fun = quo(ggplot2::geom_violin)`
# directly, so there is exactly one, correct computation of `quantile_gp`
# for both the interactive and non-interactive versions.

test_that("gf_violin() computes quantile_gp from quantile.* arguments", {
  p <- gf_violin(
    mpg ~ factor(cyl),
    data = mtcars,
    quantiles = c(0.25, 0.5, 0.75),
    quantile.colour = "red",
    quantile.linetype = "solid",
    quantile.linewidth = 1
  )

  quantile_gp <- p$layers[[1]]$geom_params$quantile_gp
  expect_type(quantile_gp, "list")
  expect_equal(quantile_gp$colour, "red")
  expect_equal(quantile_gp$linetype, "solid")
  expect_equal(quantile_gp$linewidth, 1)

  # and the quantiles themselves should have reached stat_ydensity()
  expect_equal(p$layers[[1]]$stat_params$quantiles, c(0.25, 0.5, 0.75))
})

test_that("gf_violin() without quantile.* arguments still has sensible defaults", {
  p <- gf_violin(mpg ~ factor(cyl), data = mtcars)

  quantile_gp <- p$layers[[1]]$geom_params$quantile_gp
  expect_type(quantile_gp, "list")
  expect_null(quantile_gp$colour)
  expect_equal(quantile_gp$linetype, 0L)
})

test_that("gf_violin() and gf_violin_interactive() do not warn about duplicated aesthetics", {
  expect_no_warning(
    gf_violin(
      mpg ~ factor(cyl),
      data = mtcars,
      quantile.colour = "red",
      quantile.linetype = "solid"
    )
  )
  expect_no_warning(
    mtcars |>
      gf_violin_interactive(
        mpg ~ factor(cyl),
        alpha = 0.5,
        fill = "skyblue",
        tooltip = ~ paste("Cylinders:", cyl)
      )
  )
})
