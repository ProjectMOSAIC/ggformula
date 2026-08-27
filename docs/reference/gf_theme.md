# Themes for ggformula

Themes for ggformula

## Usage

``` r
gf_theme(object, theme, ...)
```

## Arguments

- object:

  a gg object

- theme:

  a ggplot2 theme function like
  [`ggplot2::theme_minimal()`](https://ggplot2.tidyverse.org/reference/ggtheme.html).

- ...:

  If `theme` is missing, then these additional arguments are theme
  elements of the sort handled by
  [`ggplot2::theme()`](https://ggplot2.tidyverse.org/reference/theme.html).

## Value

a modified gg object
