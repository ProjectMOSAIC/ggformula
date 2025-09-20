## Submission notes

This release

* addresses issues caused by the update of {ggplot2}
* adds interactive features based on {ggiraph}, which has also been updated subsequent to {ggplot2}.

I am aware of the use of ::: to access ggiraph:::layer_interactive().  
I have a request out for that function to be exported by the package.
I'm hoping that will happen soonish. If it does not, I'll likely just copy
the function into {ggformula}, but I'd rather not do that if it can be 
avoided.

## Test environments

* local
  * R version 4.5.1 (2025-06-13)
  * os: macOS Sonoma 14.4
  * system: aarch64, darwin23.6.0

* WinBuilder
  * `devtools::check_win_devel()`
