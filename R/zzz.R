.onAttach <- function(libname, pkgname) {
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
