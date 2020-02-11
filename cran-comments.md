## Test environments

* local OS X install 
  * R version 3.6.2 (2019-12-12)
  * Platform: x86_64-apple-darwin15.6.0 (64-bit)
  * Running under: macOS Catalina 10.15.3

* win-builder via devtools::check_win_release()
* win-builder via devtools::check_win_devel()

## Context

The main reason for this update is that the sf package changed the names of some of 
objects it produces. This caused an example in one vignette to fail. I've updated 
to the new nomenclature, and that's good to go. I made a few other minor adjustments
since I'm making an update, but this is a relatively small update to the package.

## R CMD check results (local)

0 errors ✔ | 0 warnings ✔ | 0 notes ✔

R CMD check succeeded

## revdepcheck results

revdepcheck() reported only one problem: it was unable to build MESS.  But MESS builds
fine outside of revdepcheck and doesn't appear to have any issues.  I've contacted 
the author with some detials, just so he is aware.


