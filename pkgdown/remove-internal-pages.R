# pkgdown::build_home() auto-publishes every top-level *.md file it
# finds (pkgdown:::package_mds()) except a small hardcoded exemption
# list (README.md, LICENSE.md, NEWS.md, and a few CI-related files).
# AGENTS.md isn't on that list and has no way to be added to it via
# _pkgdown.yml -- there's no config-level exclusion mechanism. It has
# to stay at the repo root (that's where agents look for it by
# convention), so instead we just remove the page it produces after
# each build.
#
# Run this after pkgdown::build_site() / build_home().
#
# Usage:
#   Rscript pkgdown/remove-internal-pages.R

internal_pages <- c("docs/AGENTS.html", "docs/AGENTS.md")

removed <- internal_pages[file.exists(internal_pages)]
if (length(removed)) {
  file.remove(removed)
  message("Removed: ", paste(removed, collapse = ", "))
}

# build_site() also lists the page in sitemap.xml before we get a
# chance to remove it above; strip that entry too so nothing points at
# a 404.
sitemap <- "docs/sitemap.xml"
if (file.exists(sitemap)) {
  lines <- readLines(sitemap, warn = FALSE)
  fixed <- lines[!grepl("<loc>/AGENTS\\.html</loc>", lines)]
  if (!identical(fixed, lines)) {
    writeLines(fixed, sitemap)
    message("Removed AGENTS.html entry from ", sitemap)
  }
}
