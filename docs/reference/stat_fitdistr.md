# A stat for fitting distributions

This stat computes points for plotting a distribution function. Fitting
is done using
[`MASS::fitdistr()`](https://rdrr.io/pkg/MASS/man/fitdistr.html) when
analytic solutions are not available.

## Usage

``` r
stat_fitdistr(
  mapping = NULL,
  data = NULL,
  geom = "path",
  position = "identity",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE,
  dist = "dnorm",
  start = NULL,
  ...
)
```

## Arguments

- mapping:

  Aesthetics created using
  [`aes()`](https://ggplot2.tidyverse.org/reference/aes.html) or
  [`aes_string()`](https://ggplot2.tidyverse.org/reference/aes_.html).

- data:

  A data frame.

- geom:

  A character string naming the geom used to make the layer.

- position:

  Either a character string naming the position function used for the
  layer or a position object returned from a call to a position
  function.

- na.rm:

  If TRUE, do not emit a warning about missing data.

- show.legend:

  A logical. Should this layer be included in the legends? `NA`, the
  default, includes if any aesthetics are mapped. `FALSE` never
  includes, and `TRUE` always includes.

- inherit.aes:

  If `FALSE`, overrides the default aesthetics, rather than combining
  with them.

- dist:

  A character string indicating the distribution to fit. Examples
  include `"dnorm"`, `"dgamma"`, etc.

- start:

  A list of starting values used by
  [`MASS::fitdistr()`](https://rdrr.io/pkg/MASS/man/fitdistr.html) when
  numerically approximating the maximum likelihood estimate.

- ...:

  Additional arguments.

## Value

A gg object
