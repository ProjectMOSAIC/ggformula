# Create interactive labeller

Create interactive labeller

## Usage

``` r
gf_labeller_interactive(..., .mapping)
```

## Arguments

- ...:

  Arguments of the form `name = ~ expr` are used to create `.mapping`
  (if `.mapping` is missing). Other arguments (or all arguments if
  `.mapping` is not missing) are passed through to
  [`ggplot2::labeller()`](https://ggplot2.tidyverse.org/reference/labeller.html).

- .mapping:

  An aesthetic mapping as could be created with
  [`ggplot2::aes()`](https://ggplot2.tidyverse.org/reference/aes.html)
  or
  [`ggplot2::aes_()`](https://ggplot2.tidyverse.org/reference/aes_.html).
  If missing (the typical use case), `.mapping` is created from the
  arguments in `...` that have the form `name = ~ expr`.

## Value

a labeller
