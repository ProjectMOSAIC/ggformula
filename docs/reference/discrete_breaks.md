# Discrete Breaks

Creates a function that can be passed to scales for creating discrete
breaks at multilples of `resolution`.

## Usage

``` r
discrete_breaks(resolution = 1)
```

## Arguments

- resolution:

  Resolution of the breaks

## Value

A function that can be passed to scales functions as the `breaks`
argument.

## Examples

``` r
x <- rbinom(100, 100, 0.4)
p <- gf_bar( ~ x)
p |> gf_refine(scale_x_continuous(breaks = discrete_breaks()))

p |> gf_refine(scale_x_continuous(breaks = discrete_breaks(5)))

p |> gf_refine(scale_x_continuous(breaks = discrete_breaks(2)))
```
