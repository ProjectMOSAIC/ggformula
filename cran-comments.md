## Submission notes

This is a relatively minor update to the package.

This submission was prompeted by the maintainer of `labelled` who is planning a CRAN submission
and was getting some warnings due to documentations issues due to a planned update to functions
in that package which are used in `ggformula`. The changes needed to address this were minor.

As long as I'm submitting, I've also modified some things to avoid some deprecation
notices due to changes in `ggplot2`.

Previous submission had a few examples that ran long.  I've not been able to recreate this
on my local machine or with `devtools`, but I added some `\dontrun{}`s in hopes that it will
shorten the running time sufficiently.

## Test environments

* local
  * R version: 4.2.1 (2022-06-23)
  * macOS: Monterey 12.5.1
  * system:  x86_64, darwin17.0

* WinBuilder

  * `devtools::check_win_devel()`
  * `devtools::check_win_release()`

## revdep_check()

`revdep_check()` reported no errors in reverse dependencies, but was unable to install
`MESS`.  (It appears that it was unable to compile some fortran code in that package.)

### Failed to check (1)

|package |version |error |warning |note |
|:-------|:-------|:-----|:-------|:----|
|MESS    |0.5.9   |1     |        |     |

