# Runs when the package is built, not when it is loaded: report any
# interactive geom {ggiraph} exports that ggformula doesn't wrap. Defined
# in R/ggiraph.R but called here because zzz.R is collated last, after the
# `gf_*_interactive()` assignments in
# R/ggiraph-documentation-with-examples.R. Silent when coverage is
# complete.
report_interactive_coverage()

.onAttach <- function(libname, pkgname) {
  # Note: ggformula deliberately does *not* attach its Depends
  # (ggplot2, scales, ggiraph, ggridges) from here.
  #
  # It used to, to work around this: {mosaic} lists ggformula under its
  # own `Imports:`, so `library(mosaic)` loads ggformula's namespace
  # without going through the top-level `library()` path that attaches
  # ggformula's Depends. A later `library(ggformula)` finds the namespace
  # already loaded and does not retroactively attach them, leaving
  # {ggiraph} off the search path -- which used to break
  # `gf_*_interactive()`, because those layers resolved ggiraph's
  # constructors and ggproto objects by name via the search path.
  #
  # Calling `library()` from `.onAttach()` fixes the symptom but is
  # discouraged (see "Writing R Extensions": packages should not modify
  # the search path), and it imposes four attachments on every user to
  # compensate for one downstream package's DESCRIPTION choice. The cause
  # is now addressed directly instead: interactive layers look ggiraph up
  # in its namespace (see `ggiraph_fun()` and `find_global_ggiraph()`),
  # so ggiraph need only be installed. ggplot2, scales, and ggridges are
  # `import()`ed wholesale in NAMESPACE, so ggformula's own code has
  # never depended on their being attached either.

  packageStartupMessage(
    paste(
      "\nNew to ggformula?  Try the tutorials: ",
      '\tlearnr::run_tutorial("introduction", package = "ggformula")',
      '\tlearnr::run_tutorial("refining", package = "ggformula")',
      collapse = "\n",
      sep = "\n"
    ),
    appendLF = TRUE
  )
}
