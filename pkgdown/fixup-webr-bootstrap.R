# Run this after pkgdown::build_site() (or build_articles()) to fix a
# conflict between pkgdown's own Bootstrap 5.3.8 and the Bootstrap that
# quarto bundles for every OJS/quarto-live ("format: live-html")
# article. See AGENTS.md for the full explanation. In short:
#
# quarto emits its own <link id="quarto-bootstrap" ...> and
# <script src=".../libs/bootstrap/bootstrap.min.js"> for any document
# using the OJS engine (which quarto-live requires). pkgdown's article
# extraction keeps these verbatim in <head>, so the page ends up with
# two independent copies of Bootstrap:
#
#   - the duplicate CSS overrides pkgdown's site theme colors (e.g. the
#     navbar turns steelblue instead of matching the rest of the site)
#   - the duplicate JS registers a second, independent set of
#     document-level Bootstrap Dropdown click handlers, which fight
#     with pkgdown's own and leave the navbar's Articles/Tutorials
#     dropdowns non-functional
#
# `theme: none` in the qmd front matter does NOT fix this -- it changes
# quarto's document structure so that <main> ends up essentially empty,
# and pkgdown's article extraction (which only keeps xpath "//main")
# then drops all the real content, including the exercises.
#
# Because quarto's bootstrap.min.js is a plain (non-module, non-defer)
# <script> in <head>, it executes synchronously while the page is still
# being parsed -- before any of our own body/main content can run --
# so this cannot be fixed client-side (there's nothing to intercept
# after the fact: by the time any of our JS runs, the conflicting event
# listeners are already attached). It has to be removed from the built
# HTML before it's served. Confirmed empirically that removing both
# tags has no effect on the webR exercises themselves (quarto-live's
# UI doesn't use Bootstrap's JS components).
#
# Usage:
#   Rscript pkgdown/fixup-webr-bootstrap.R
# or, from R:
#   source("pkgdown/fixup-webr-bootstrap.R")

files <- list.files("docs/articles", pattern = "\\.html$", full.names = TRUE)

quarto_bootstrap_link <- '<link href="[^"]*" rel="stylesheet" append-hash="true" id="quarto-bootstrap" data-mode="[^"]*">\n?'
quarto_bootstrap_script <- '<script src="[^"]*_files/libs/bootstrap/bootstrap\\.min\\.js"></script>\n?'

for (f in files) {
  html <- readChar(f, file.info(f)$size, useBytes = TRUE)
  fixed <- gsub(quarto_bootstrap_link, "", html, perl = TRUE)
  fixed <- gsub(quarto_bootstrap_script, "", fixed, perl = TRUE)
  if (!identical(fixed, html)) {
    writeChar(fixed, f, useBytes = TRUE, eos = NULL)
    message("Fixed up: ", f)
  }
}
