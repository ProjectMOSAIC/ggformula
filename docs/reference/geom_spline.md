# Geoms and stats for spline smoothing

Similar to
[ggplot2::geom_smooth](https://ggplot2.tidyverse.org/reference/geom_smooth.html),
this adds spline fits to plots.

## Usage

``` r
stat_spline(
  mapping = NULL,
  data = NULL,
  geom = "line",
  position = "identity",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE,
  weight = NULL,
  df = NULL,
  spar = NULL,
  cv = FALSE,
  all.knots = FALSE,
  nknots = stats::.nknots.smspl,
  df.offset = 0,
  penalty = 1,
  control.spar = list(),
  tol = NULL,
  ...
)

geom_spline(
  mapping = NULL,
  data = NULL,
  stat = "spline",
  position = "identity",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE,
  weight = NULL,
  df = NULL,
  spar = NULL,
  cv = FALSE,
  all.knots = FALSE,
  nknots = stats::.nknots.smspl,
  df.offset = 0,
  penalty = 1,
  control.spar = list(),
  tol = NULL,
  ...
)
```

## Arguments

- mapping:

  An aesthetic mapping produced with ggplot2::aes()\] or
  ggplot2::aes_string()\].

- data:

  A data frame.

- geom:

  A geom.

- position:

  A position object.

- na.rm:

  A logical indicating whether a warning should be issued when missing
  values are removed before plotting.

- show.legend:

  A logical indicating whether legends should be included for this
  layer. If `NA`, legends will be included for each aesthetic that is
  mapped.

- inherit.aes:

  A logical indicating whether aesthetics should be inherited. When
  `FALSE`, the supplied `mapping` will be the only aesthetics used.

- weight:

  An optional vector of weights. See
  [`smooth.spline()`](https://rdrr.io/r/stats/smooth.spline.html).

- df:

  desired equivalent degrees of freedom. See
  [`smooth.spline()`](https://rdrr.io/r/stats/smooth.spline.html) for
  details.

- spar:

  A smoothing parameter, typically in (0,1\]. See
  [`smooth.spline()`](https://rdrr.io/r/stats/smooth.spline.html) for
  details.

- cv:

  A logical. See
  [`smooth.spline()`](https://rdrr.io/r/stats/smooth.spline.html) for
  details.

- all.knots:

  A logical. See
  [`smooth.spline()`](https://rdrr.io/r/stats/smooth.spline.html) for
  details.

- nknots:

  An integer or function giving the number of knots to use when
  `all.knots = FALSE`. See
  [`smooth.spline()`](https://rdrr.io/r/stats/smooth.spline.html) for
  details.

- df.offset:

  A numerical value used to increase the degrees of freedom when using
  GVC. See
  [`smooth.spline()`](https://rdrr.io/r/stats/smooth.spline.html) for
  details.

- penalty:

  the coefficient of the penalty for degrees of freedom in the GVC
  criterion. See
  [`smooth.spline()`](https://rdrr.io/r/stats/smooth.spline.html) for
  details.

- control.spar:

  An optional list used to control root finding when the parameter
  `spar` is computed. See
  [`smooth.spline()`](https://rdrr.io/r/stats/smooth.spline.html) for
  details.

- tol:

  A tolerance for sameness or uniqueness of the `x` values. The values
  are binned into bins of size tol and values which fall into the same
  bin are regarded as the same. Must be strictly positive (and finite).
  When `NULL`, `IQR(x) * 10e-6` is used.

- ...:

  Additional arguments

- stat:

  A stat.

## Examples

``` r
if (require(mosaicData)) {
  ggplot(Births) + geom_spline(aes(x = date, y = births, colour = wday))
  ggplot(Births) + geom_spline(aes(x = date, y = births, colour = wday), nknots = 10)
}
#> Loading required package: mosaicData
```
