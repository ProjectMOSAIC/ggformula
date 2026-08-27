# Add facets to a plot

These functions provide more control over faceting than is possible
using the formula interface.

## Usage

``` r
gf_facet_wrap(object, ...)

gf_facet_grid(object, ...)
```

## Arguments

- object:

  A ggplot object

- ...:

  Additional arguments passed to
  [`ggplot2::facet_wrap()`](https://ggplot2.tidyverse.org/reference/facet_wrap.html)
  or
  [`ggplot2::facet_grid()`](https://ggplot2.tidyverse.org/reference/facet_grid.html).
  This typically includes an unnamed formula argument describing the
  facets. `scales` and `space` are additional useful arguments. See the
  examples.

## See also

[`ggplot2::facet_grid()`](https://ggplot2.tidyverse.org/reference/facet_grid.html),
[`ggplot2::facet_wrap()`](https://ggplot2.tidyverse.org/reference/facet_wrap.html).

## Examples

``` r
gf_histogram(~avg_drinks, data = mosaicData::HELPrct, bins =25) |>
  gf_facet_grid(~substance)

gf_histogram(~avg_drinks, data = mosaicData::HELPrct, bins =25) |>
  gf_facet_grid(~substance, scales = "free")

gf_histogram(~avg_drinks, data = mosaicData::HELPrct, bins =25) |>
  gf_facet_grid(~substance, scales = "free", space = "free")

gf_line(births ~ date, data = mosaicData::Births, color = ~wday) |>
  gf_facet_wrap(~year, scales = "free_x", nrow = 5) |>
  gf_theme(
    axis.title.x = element_blank(),
    axis.text.x = element_blank(), 
    axis.ticks.x = element_blank()
  ) |>
  gf_labs(color = "Day")
```
