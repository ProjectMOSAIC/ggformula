# Deprecated horizontal plotting functions

These functions were wrappers around functions from `ggstance` from an
era before `ggplot2` supported horizonally oriented geoms. `ggstance`
has not been updated to comply with the current version of `ggplot2`,
and since the functionalilty is now available by other means, these
functions have been deprecated.

## Usage

``` r
gf_barh(...)

gf_countsh(...)

gf_colh(...)

gf_propsh(...)

gf_percentsh(...)

gf_boxploth(...)

gf_linerangeh(...)

gf_pointrangeh(...)

gf_crossbarh(...)

gf_violinh(...)

gf_errorbarh(...)
```

## Arguments

- ...:

  additional arguments

## Examples

``` r
gf_violin(carat ~ color, data = diamonds)

gf_violin(carat ~ color, data = diamonds) |>
  gf_refine(coord_flip())

gf_violin(color ~ carat, data = diamonds)

gf_density(~ carat, data = diamonds)

gf_density(carat ~ ., data = diamonds)
```
