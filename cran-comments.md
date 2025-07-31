## Submission notes

This is a relatively minor update to the package. The main issues addressed are

* updating documentation to new CRAN standards
* bug fix in GeomLm
* moving some deprecated functions to defunct (to avoid ggstance, which is no longer supported)
* adding two new (simple) auxiliary functions: gf_annotate() and gf_guides() which thinly wrap ggplot2::annotate() and ggplot2::guides()


## Test environments

* local
  * R version 4.5.1 (2025-06-13)
  * os: macOS Sonoma 14.4
  * system: aarch64, darwin23.6.0

* WinBuilder
  * `devtools::check_win_devel()`
  * `devtools::check_win_release()`
