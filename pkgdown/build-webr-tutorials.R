# Renders the standalone webR tutorials (tutorials/*.qmd) and copies
# their output into docs/tutorials/ for deployment alongside the
# pkgdown site.
#
# These pages are deliberately NOT part of pkgdown's article-building
# pipeline (pkgdown::build_articles()) -- they're rendered by plain
# `quarto render` and just copied into place. See AGENTS.md for why:
# pkgdown's HTML extraction for quarto articles doesn't compose
# cleanly with the OJS/webR-based "live-html" format used here (it
# drops the script that mounts the exercises, and produces two
# conflicting copies of Bootstrap). Rendering these standalone avoids
# that whole problem: they get quarto-live's own complete, working
# theme, plus a plain link back to the package site instead of the
# pkgdown navbar.
#
# Run this whenever tutorials/*.qmd changes, independently of
# pkgdown::build_site() (order doesn't matter between the two).
#
# Usage:
#   Rscript pkgdown/build-webr-tutorials.R

qmd_files <- list.files("tutorials", pattern = "\\.qmd$", full.names = TRUE)
dest_dir <- "docs/tutorials"
dir.create(dest_dir, showWarnings = FALSE, recursive = TRUE)

for (f in qmd_files) {
  message("Rendering: ", f)
  status <- system2("quarto", c("render", shQuote(f)))
  if (status != 0) {
    stop("quarto render failed for ", f, call. = FALSE)
  }
}

html_files <- list.files("tutorials", pattern = "\\.html$", full.names = TRUE)
file.copy(html_files, dest_dir, overwrite = TRUE)

resource_dirs <- list.files("tutorials", pattern = "_files$", full.names = TRUE)
for (d in resource_dirs) {
  file.copy(d, dest_dir, recursive = TRUE, overwrite = TRUE)
}

images_dir <- "tutorials/images"
if (dir.exists(images_dir)) {
  file.copy(images_dir, dest_dir, recursive = TRUE, overwrite = TRUE)
}

message("Copied ", length(html_files), " tutorial page(s) into ", dest_dir)
