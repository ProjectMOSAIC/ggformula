context("ggformula attaches its own Depends even when loaded via another package's Imports")

# Regression test for a real-world failure mode: {mosaic} lists {ggformula}
# under its own `Imports:` (not `Depends:`), so `library(mosaic)` loads
# ggformula's *namespace* without going through the normal top-level
# library()/require() path that would attach ggformula's own `Depends`
# (ggplot2, scales, ggiraph, ggridges) to the search path. A later,
# explicit `library(ggformula)` then finds the namespace already loaded
# and does not retroactively attach those Depends -- so `ggiraph` (needed
# for `gf_girafe()`/`gf_*_interactive()`, and for calling ggiraph's own
# exported functions unqualified) silently never ends up on the search
# path. `R/zzz.R`'s `.onAttach()` is responsible for guarding against
# this; this test exists so that quietly reverting that guard (as
# happened once already -- see NEWS/git history around
# "Don't attach ggiraph in zzz.R") gets caught rather than silently
# reintroducing the bug.
#
# This has to run in a fresh subprocess (rather than inline in the
# current testthat session), because attachment order/hooks can only be
# observed faithfully via a real, from-scratch `library()` sequence --
# not via `devtools::load_all()`, and not in a session where {ggformula}
# and/or {mosaic} may already be attached. It therefore reflects the
# *installed* copy of ggformula, not uncommitted source edits -- run
# `devtools::install()` (or let `R CMD check` build+install it, as it
# always does) before trusting a change here.

test_that("library(mosaic) then library(ggformula) still attaches ggiraph", {
  skip_on_cran()
  skip_if_not_installed("mosaic")
  skip_if_not_installed("ggiraph")

  rscript <- file.path(R.home("bin"), "Rscript")
  code <- paste(
    "suppressPackageStartupMessages(library(mosaic))",
    "suppressPackageStartupMessages(library(ggformula))",
    "cat(\"package:ggiraph\" %in% search())",
    sep = "; "
  )

  output <- system2(
    rscript,
    c("--vanilla", "-e", shQuote(code)),
    stdout = TRUE,
    stderr = FALSE
  )
  output <- trimws(output)
  output <- output[nzchar(output)]

  expect_equal(tail(output, 1), "TRUE")
})
