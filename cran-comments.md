## Test environments

* local
  * R version: 4.2.1 (2022-06-23)
  * macOS: Monterey 12.5.1
  * system:  x86_64, darwin17.0

* WinBuilder

  * `devtools::check_win_devel()`

## revdep_check()

|package   |old    |new    |Δ  |
|:---------|:------|:------|:--|
|ggformula |0.10.1 |0.10.2 |*  |

### Failed to check (1)

Not sure why this package fails to check in revdep_check()

|package |version |error |warning |note |
|:-------|:-------|:-----|:-------|:----|
|MESS    |0.5.9   |1     |        |     |

## Tandem submission

This package and mosaicData are being submitted together. All the examples in mosaicData
work without errors when I use both submitted versions.

## long executing examples

One time (of many) that I used check_win_devel(), there was a note about two examples
that used ~ 11 seconds.  They run faster than than on my laptop, and I didn't get
complaints other times, and these have not changed from previous CRAN releases. 
I'm going to leave as is for now, but I could consider shortening them or adding don't run
to some of them in the future.