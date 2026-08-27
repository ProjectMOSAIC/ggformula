# Guides for ggformula

Guides for each scale can be set scale-by-scale with the `guide`
argument, or en masse with `gf_guides()`.

## Usage

``` r
gf_guides(object, ...)
```

## Arguments

- object:

  a gg object

- ...:

  arguments passed to
  [`ggplot2::guides()`](https://ggplot2.tidyverse.org/reference/guides.html).

## Value

a modified gg object

## See also

[`ggplot2::guides()`](https://ggplot2.tidyverse.org/reference/guides.html)

## Examples

``` r

dat <-
  data.frame(
    x = 1:5, y = 1:5,
    p = 1:5, q = factor(1:5), r = factor(1:5)
 )

p <-
  dat |>
  gf_point( y ~ x, colour = ~ p, size = ~ q, shape = ~r)

# without guide specification
p
#> Warning: Using size for a discrete variable is not advised.


# Show colorbar guide for colour.
# All these examples below have a same effect.

p |> gf_guides(colour = "colorbar", size = "legend", shape = "legend")
#> Warning: Using size for a discrete variable is not advised.

p |> gf_guides(colour = guide_colorbar(), size = guide_legend(),
           shape = guide_legend())
#> Warning: Using size for a discrete variable is not advised.

p +
  scale_colour_continuous(guide = "colorbar") +
  scale_size_discrete(guide = "legend") +
  scale_shape(guide = "legend")
#> Warning: Using size for a discrete variable is not advised.


# Remove some guides
p |> gf_guides(colour = "none")
#> Warning: Using size for a discrete variable is not advised.

p |> gf_guides(colour = "colorbar",size = "none")
#> Warning: Using size for a discrete variable is not advised.


# Guides are integrated where possible

p |>
  gf_guides(
    colour = guide_legend("title"),
    size = guide_legend("title"),
    shape = guide_legend("title")
  )
#> Warning: Using size for a discrete variable is not advised.

g <- guide_legend("title")
p |> gf_guides(colour = g, size = g, shape = g)
#> Warning: Using size for a discrete variable is not advised.


p |> gf_theme(legend.position = "bottom")
#> Warning: Using size for a discrete variable is not advised.


# position of guides

# Set order for multiple guides
mpg |>
  gf_point(cty ~ displ, size = ~hwy, shape = ~ drv) |>
  gf_guides(
    colour = guide_colourbar(order = 1),
    shape = guide_legend(order = 2),
    size = guide_legend(order = 3)
  )
```
