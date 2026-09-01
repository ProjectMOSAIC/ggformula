# Regression test for a real-world failure mode: {mosaic} lists {ggformula}
# under its own `Imports:` (not `Depends:`), so `library(mosaic)` loads
# ggformula's *namespace* without going through the top-level
# library()/require() path that would attach ggformula's own `Depends`
# (ggplot2, scales, ggiraph, ggridges) to the search path. A later,
# explicit `library(ggformula)` finds the namespace already loaded and
# does not retroactively attach those Depends, so {ggiraph} never ends up
# on the search path.
#
# ggformula used to paper over this by calling `library()` from
# `.onAttach()`. It no longer does (see `R/zzz.R`): instead, the
# interactive machinery resolves ggiraph's constructors and ggproto
# objects in ggiraph's *namespace* (`ggiraph_fun()`,
# `find_global_ggiraph()`), so {ggiraph} need only be installed. These
# tests therefore assert what actually matters -- that interactive layers
# build and render in that state -- rather than asserting that a
# particular package got attached.
#
# These have to run in a fresh subprocess (rather than inline in the
# current testthat session), because attachment order/hooks can only be
# observed faithfully via a real, from-scratch `library()` sequence --
# not via `devtools::load_all()`, and not in a session where {ggformula}
# and/or {mosaic} may already be attached. They therefore reflect the
# *installed* copy of ggformula, not uncommitted source edits -- run
# `devtools::install()` (or let `R CMD check` build+install it, as it
# always does) before trusting a change here.

run_rscript <- function(code) {
  rscript <- file.path(R.home("bin"), "Rscript")
  output <- system2(
    rscript,
    c("--vanilla", "-e", shQuote(paste(code, collapse = "; "))),
    stdout = TRUE,
    stderr = FALSE
  )
  output <- trimws(output)
  tail(output[nzchar(output)], 1)
}

test_that("interactive layers work with ggiraph installed but not attached", {
  skip_on_cran()
  skip_if_not_installed("ggiraph")

  # Nothing is attached here at all: ggformula is reached only via `::`,
  # which loads its namespace without attaching it or its Depends.
  result <- run_rscript(c(
    "p <- ggformula::gf_point_interactive(mpg ~ wt, data = mtcars, tooltip = ~ mpg)",
    'stopifnot(!("package:ggiraph" %in% search()))',
    'cat(class(p$layers[[1]]$geom)[1], inherits(ggformula::gf_girafe(p), "girafe"))'
  ))

  expect_equal(result, "GeomInteractivePoint TRUE")
})

test_that("library(mosaic) then library(ggformula) leaves interactive layers usable", {
  skip_on_cran()
  skip_if_not_installed("mosaic")
  skip_if_not_installed("ggiraph")

  result <- run_rscript(c(
    "suppressPackageStartupMessages(library(mosaic))",
    "suppressPackageStartupMessages(library(ggformula))",
    "p <- gf_point_interactive(mpg ~ wt, data = mtcars, tooltip = ~ mpg)",
    'cat(class(p$layers[[1]]$geom)[1], inherits(gf_girafe(p), "girafe"))'
  ))

  expect_equal(result, "GeomInteractivePoint TRUE")
})

test_that("a plain library(ggformula) still attaches the Depends as usual", {
  skip_on_cran()
  skip_if_not_installed("ggiraph")

  # ggformula does not attach these itself; R does, because they are
  # Depends and this is a normal first-time `library()` call. This test
  # documents that ordinary use is unchanged.
  result <- run_rscript(c(
    "suppressPackageStartupMessages(library(ggformula))",
    'cat(all(paste0("package:", c("ggplot2", "scales", "ggiraph", "ggridges")) %in% search()))'
  ))

  expect_equal(result, "TRUE")
})
