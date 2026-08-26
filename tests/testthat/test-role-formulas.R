context("role-formula arguments (x = ~var, y = ~var, ...)")

# These tests cover the `x = ~var1, y = ~var2` (and generalized role=)
# mechanism described in NEWS.md. They intentionally avoid palmerpenguins/
# mosaic so they always run.

test_that("x = ~var1, y = ~var2 is equivalent to the formula form", {
  df <- data.frame(v1 = 1:5, v2 = c(2, 4, 1, 5, 3))

  p_named <- gf_point(x = ~v1, y = ~v2, data = df)
  p_formula <- gf_point(v2 ~ v1, data = df)

  expect_equal(p_named$mapping, p_formula$mapping)
})

test_that("x =/y = syntax renders identically to the formula syntax", {
  skip_if_not_installed("vdiffr")
  df <- data.frame(v1 = 1:5, v2 = c(2, 4, 1, 5, 3))

  # A regular snapshot test for the canonical formula-based plot (guards
  # against future regressions in rendering).
  wrapped_expect_doppelganger(
    "gf-point-role-syntax",
    gf_point(v2 ~ v1, data = df)
  )

  # vdiffr requires snapshot names to be unique within a test run, so we
  # can't call `expect_doppelganger()` a second time with the same title
  # to compare the `x =`/`y =` version against it. Instead, render both
  # versions to SVG using vdiffr's own machinery and compare the SVG text
  # directly -- this demonstrates the two call styles produce pixel-for-
  # pixel identical output, not just equal `mapping`s.
  svg_formula <- tempfile(fileext = ".svg")
  svg_named <- tempfile(fileext = ".svg")
  on.exit(unlink(c(svg_formula, svg_named)), add = TRUE)

  vdiffr::write_svg(gf_point(v2 ~ v1, data = df), svg_formula)
  vdiffr::write_svg(gf_point(x = ~v1, y = ~v2, data = df), svg_named)

  expect_equal(readLines(svg_formula), readLines(svg_named))
})

test_that("a single named role (x =) works like a one-sided formula", {
  df <- data.frame(v = c(1, 2, 2, 3, 3, 3, 4))

  p_named <- gf_dhistogram(x = ~v, data = df)
  p_formula <- gf_dhistogram(~v, data = df)

  expect_equal(p_named$mapping, p_formula$mapping)
})

test_that("role= generalizes beyond x/y to multi-role formulas (gf_ribbon)", {
  df <- data.frame(t = 1:5, lo = c(1, 1, 2, 2, 3), hi = c(3, 4, 4, 5, 6))

  p_named <- gf_ribbon(ymin = ~lo, ymax = ~hi, x = ~t, data = df)
  p_formula <- gf_ribbon(lo + hi ~ t, data = df)

  expect_equal(p_named$mapping, p_formula$mapping)
  expect_setequal(names(p_named$mapping), c("x", "ymin", "ymax"))
})

test_that("named role arguments override an overlapping literal formula, with a warning", {
  df <- data.frame(
    v1 = 1:5,
    v2 = c(2, 4, 1, 5, 3),
    g = c("a", "a", "b", "b", "a")
  )

  expect_warning(
    p <- gf_point(v2 ~ v1, x = ~g, data = df),
    "x.*specified in both the formula and as named argument"
  )
  expect_equal(rlang::get_expr(p$mapping$x), quote(g))
  expect_equal(rlang::get_expr(p$mapping$y), quote(v2))
})

test_that("overriding roles that don't overlap the matched template produces no warning", {
  # gf_dhistogram()'s formula shape is one-sided (~x); a role= for `y`
  # does not overlap with that template's roles, so no warning should fire
  # even though a literal formula was also supplied.
  df <- data.frame(v = c(1, 2, 2, 3, 3, 3, 4))

  expect_no_warning(p <- gf_dhistogram(~v, y = ~ after_stat(count)))
  expect_equal(rlang::get_expr(p$mapping$x), quote(v))
  expect_equal(rlang::get_expr(p$mapping$y), quote(after_stat(count)))
})

test_that("role arguments that don't fully cover any template still error", {
  df <- data.frame(t = 1:5, lo = 1:5, hi = 2:6)

  # gf_ribbon() has no template using `x` alone; ymin/ymax are also
  # required, so this should fail exactly as the analogous incomplete
  # formula would.
  expect_error(gf_ribbon(x = ~t, data = df), "Invalid formula type")
})

test_that("non-role formula-valued arguments (e.g. color = ~group) are unaffected", {
  df <- data.frame(v1 = 1:6, v2 = c(2, 4, 1, 5, 3, 6), g = rep(c("a", "b"), 3))

  p <- gf_point(v2 ~ v1, color = ~g, data = df)

  expect_equal(rlang::get_expr(p$mapping$x), quote(v1))
  expect_equal(rlang::get_expr(p$mapping$y), quote(v2))
  expect_equal(rlang::get_expr(p$mapping$colour), quote(g))
})

test_that("existing pure-formula calls are unaffected by the new mechanism", {
  df <- data.frame(v1 = 1:5, v2 = c(2, 4, 1, 5, 3))

  p <- gf_point(v2 ~ v1, data = df)

  expect_equal(rlang::get_expr(p$mapping$x), quote(v1))
  expect_equal(rlang::get_expr(p$mapping$y), quote(v2))
})

test_that("formula_role_names() collects roles across candidate templates", {
  roles <- ggformula:::formula_role_names(list(ggplot2::aes()$x, y ~ x))
  expect_setequal(ggformula:::formula_role_names(list(y ~ x)), c("y", "x"))
  expect_setequal(
    ggformula:::formula_role_names(list(~x, y ~ x)),
    c("x", "y")
  )
  expect_setequal(
    ggformula:::formula_role_names(list(ymin + ymax ~ x, y ~ xmin + xmax)),
    c("ymin", "ymax", "x", "y", "xmin", "xmax")
  )
  expect_equal(ggformula:::formula_role_names(list(NULL)), character(0))
})

test_that("extract_role_formula_args() pulls out only matching one-sided-formula args", {
  args <- list(
    x = ~v1,
    y = ~v2,
    color = "red", # not a formula -> left alone
    fill = ~g, # a formula, but not a candidate role -> left alone
    data = quote(df) # not a formula -> left alone
  )

  extracted <- ggformula:::extract_role_formula_args(args, c("x", "y"))

  expect_equal(names(extracted$role_exprs), c("x", "y"))
  expect_equal(extracted$role_exprs$x, quote(v1))
  expect_equal(extracted$role_exprs$y, quote(v2))
  expect_setequal(names(extracted$args), c("color", "fill", "data"))
})

test_that("extract_role_formula_args() handles no matching arguments", {
  args <- list(color = "red", data = quote(df))
  extracted <- ggformula:::extract_role_formula_args(args, c("x", "y"))

  expect_length(extracted$role_exprs, 0)
  expect_equal(extracted$args, args)
})
