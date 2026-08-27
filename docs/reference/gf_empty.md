# Create an "empty" plot

This is primarily useful as a way to start a sequence of piped plot
layers.

## Usage

``` r
gf_empty(environment = parent.frame())
```

## Arguments

- environment:

  An environment passed to
  [`ggplot2::ggplot()`](https://ggplot2.tidyverse.org/reference/ggplot.html)

## Value

A plot with now layers.

## Examples

``` r
gf_empty()

data(penguins, package = "palmerpenguins")
gf_empty() |>
  gf_point(bill_length_mm ~ bill_depth_mm, data = penguins, color = ~species)
#> Warning: Removed 2 rows containing missing values or values outside the scale range
#> (`geom_point()`).
```
