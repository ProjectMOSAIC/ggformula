## Submission notes

This is a relatively minor update to the package.

This submission was prompeted by the maintainer of `labelled` who is planning a CRAN submission
and was getting some warnings due to documentations issues due to a planned update to functions
in that package which are used in `ggformula`. The changes needed to address this were minor.

As long as I'm submitting, I've also modified some things to avoid some deprecation
notices due to changes in `ggplot2`.

Regarding long-running examples.

* I've not see this in my testing, and the examples are the same as in previous CRAN submissions.
* The examples appear to run slightly more slowly on CRAN's machines.
* Since I'm unable to test, I added some `\dontruns{}`s.
* This is a second resubmission (with a couple more `\dontruns{}`s). 
* Since the note indicates a time just a tick over 10 seconds, this should take care of the 
problem if the timing is close to stable.
* Hoping the third time is the charm.

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

