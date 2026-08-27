.onAttach <- function(libname, pkgname) {
  # Make sure our Depends packages are actually attached (on the search
  # path), not merely loaded. Normally R attaches a package's Depends
  # automatically the first time that package's namespace is loaded via
  # library()/require(). But if something else has already loaded
  # ggformula's namespace as one of *its own* Imports (e.g. loading
  # {mosaic}, which imports {ggformula}), that first-time Depends
  # attachment never happens -- only ggformula's own namespace gets
  # loaded, not attached, and none of *its* Depends get attached either.
  # A later, explicit library(ggformula) then finds the namespace already
  # loaded and doesn't retroactively attach ggformula's Depends. Since
  # .onAttach() runs every time ggformula itself is attached (regardless
  # of how/when its namespace was first loaded), re-attaching here is a
  # reliable, idempotent fix: `library()` on an already-attached package
  # is a no-op, so this is safe to run unconditionally.
  for (pkg in c("scales", "ggiraph", "ggridges", "ggplot2")) {
    search_term <- paste0("package:", pkg)
    if (!search_term %in% search()) {
      do.call(
        "library",
        list(pkg, character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE)
      )
    }
  }

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
