# Formula interface to ggplot()

Create a new ggplot and (optionally) set default dataset aesthetics
mapping.

## Usage

``` r
gf_plot(...)
```

## Arguments

- ...:

  arguments that can include `data` (a data frame or something that can
  be
  [`ggplot2::fortify()`](https://ggplot2.tidyverse.org/reference/fortify.html)ed
  to become one) and aesthetics specified using the following formula
  notation: `aesthetic = ~ expression`. See examples.

## Value

a gg object

## Examples

``` r
gf_plot(mtcars, x = ~ wt, y = ~ mpg, color = ~ factor(cyl)) |>
  gf_density_2d() |>
  gf_point()

```
