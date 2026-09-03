## Submission notes

### Resubmission

This is a resubmission.  The previous submission was flagged (in some contexts) for

    Rd files without \usage:
       'gf_abline_interactive.Rd' 'gf_area_interactive.Rd'
       'gf_bar_interactive.Rd' ... (39 files in all)
    \arguments should not be documented without \usage.


All 41 `*_interactive` Rd files now have a `\usage` section, no Rd file in
the package has `\arguments` without `\usage`, and `tools::checkDocFiles()`
reports no problems.

### Email change

The change of email for the maintainer is intentional.

### This release

* refactors core code base to make maintenance and extension easier
* fixes a few bugs
* user-facing code and behavior is largely unchanged

## Test environments

* local
  * R version: 4.6.1 (2026-06-24)
  * os:  macOS Tahoe 26.5.1
  * system:  aarch64, darwin25.4.0

* WinBuilder
  * `devtools::check_win_devel()`

## ggformula reverse dependency check results (f6b86cb94c1c-meta-revdeps-of-ggformula) 

transmem package R CMD check diff 
notes: OK 
warnings: OK 
errors: OK 

mstATA package R CMD check diff 
notes: OK 
warnings: OK 
errors: OK 

mosaicData package R CMD check diff 
notes: OK 
warnings: OK 
errors: OK 

mosaicCore package R CMD check diff 
notes: OK 
warnings: OK 
errors: OK 

mosaicCalc package R CMD check diff 
notes: OK 
warnings: OK 
errors: OK 

mosaic package R CMD check diff 
notes: OK 
warnings: OK 
errors: OK 

MESS package R CMD check diff 
notes: OK 
warnings: OK 
errors: OK 

LMD package R CMD check diff 
notes: OK 
warnings: OK 
errors: OK 

fastR2 package R CMD check diff 
notes: OK 
warnings: OK 
errors: OK 

coursekata package R CMD check diff 
notes: OK 
warnings: OK 
errors: OK 

