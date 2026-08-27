# Average Shifted Histograms

An ASH plot is the average over all histograms of a fixed bin width.
`geom_ash()` and `gf_ash()` provide ways to create ASH plots using
ggplot2 or ggformula.

## Usage

``` r
gf_ash(
  object = NULL,
  gformula = NULL,
  data = NULL,
  ...,
  alpha,
  color,
  group,
  linetype,
  linewidth,
  xlab,
  ylab,
  title,
  subtitle,
  caption,
  geom = "line",
  stat = "ash",
  position = "identity",
  show.legend = NA,
  show.help = NULL,
  inherit = TRUE,
  environment = parent.frame()
)

stat_ash(
  mapping = NULL,
  data = NULL,
  geom = "line",
  position = "identity",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE,
  binwidth = NULL,
  adjust = 1,
  ...
)

geom_ash(
  mapping = NULL,
  data = NULL,
  stat = "ash",
  position = "identity",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE,
  binwidth = NULL,
  adjust = 1,
  ...
)
```

## Arguments

- object:

  When chaining, this holds an object produced in the earlier portions
  of the chain. Most users can safely ignore this argument. See details
  and examples.

- gformula:

  A formula with shape `~x` or `y ~ x`. `y` may be `stat(density)` or
  `stat(count)` or `stat(ndensity)` or `stat(ncount)`. Faceting can be
  achieved by including `|` in the formula.

- data:

  A data frame with the variables to be plotted.

- ...:

  Additional arguments. Typically these are (a) ggplot2 aesthetics to be
  set with `attribute = value`, (b) ggplot2 aesthetics to be mapped with
  `attribute = ~ expression`, or (c) attributes of the layer as a whole,
  which are set with `attribute = value`.

- alpha:

  Opacity (0 = invisible, 1 = opaque).

- color:

  A color or a formula used for mapping color.

- group:

  Used for grouping.

- linetype:

  A linetype (numeric or "dashed", "dotted", etc.) or a formula used for
  mapping linetype.

- linewidth:

  A numerical line width or a formula used for mapping linewidth.

- xlab:

  Label for x-axis. See also [`gf_labs()`](gf_aux.md).

- ylab:

  Label for y-axis. See also [`gf_labs()`](gf_aux.md).

- title, subtitle, caption:

  Title, sub-title, and caption for the plot. See also
  [`gf_labs()`](gf_aux.md).

- geom:

  A character string naming the geom used to make the layer.

- stat:

  A character string naming the stat used to make the layer.

- position:

  Either a character string naming the position function used for the
  layer or a position object returned from a call to a position
  function.

- show.legend:

  A logical indicating whether this layer should be included in the
  legends. `NA`, the default, includes layer in the legends if any of
  the attributes of the layer are mapped.

- show.help:

  If `TRUE`, display some minimal help.

- inherit:

  A logical indicating whether default attributes are inherited.

- environment:

  An environment in which to look for variables not found in `data`.

- mapping:

  set of aesthetic mappings created by ggplot2::aes()\] or
  [`ggplot2::aes_()`](https://ggplot2.tidyverse.org/reference/aes_.html).

- na.rm:

  If FALSE (the default), removes missing values with a warning. If TRUE
  silently removes missing values.

- inherit.aes:

  A logical indicating whether default aesthetics are inherited.

- binwidth:

  the width of the histogram bins. If `NULL` (the default) the binwidth
  will be chosen so that approximately 10 bins cover the data. `adjust`
  can be used to to increase or decrease `binwidth`.

- adjust:

  a numeric adjustment to `binwidth`. Primarily useful when `binwidth`
  is not specified. Increasing `adjust` makes the plot smoother.

## Value

a gg object

## Specifying plot attributes

Positional attributes (a.k.a, aesthetics) are specified using the
formula in `gformula`. Setting and mapping of additional attributes can
be done through the use of additional arguments. Attributes can be set
can be set using arguments of the form `attribute = value` or mapped
using arguments of the form `attribute = ~ expression`.

In formulas of the form `A | B`, `B` will be used to form facets using
[`ggplot2::facet_wrap()`](https://ggplot2.tidyverse.org/reference/facet_wrap.html)
or
[`ggplot2::facet_grid()`](https://ggplot2.tidyverse.org/reference/facet_grid.html).
This provides an alternative to [`gf_facet_wrap()`](gf_facet_grid.md)
and [`gf_facet_grid()`](gf_facet_grid.md) that is terser and may feel
more familiar to users of lattice.

## Evaluation

Evaluation of the ggplot2 code occurs in the environment of `gformula`.
This will typically do the right thing when formulas are created on the
fly, but might not be the right thing if formulas created in one
environment are used to create plots in another.

## See also

[`ggplot2::geom_histogram()`](https://ggplot2.tidyverse.org/reference/geom_histogram.html),
[`gf_histogram()`](gf_histogram.md).

## Examples

``` r
data(penguins, package = "palmerpenguins")
gf_ash(~bill_length_mm, color = ~species, data = penguins)
#> Warning: Removed 2 rows containing non-finite outside the scale range (`stat_ash()`).

gf_ash(~bill_length_mm, color = ~species, data = penguins, adjust = 2)
#> Warning: Removed 2 rows containing non-finite outside the scale range (`stat_ash()`).

gf_ash(~bill_length_mm, color = ~species, data = penguins, binwidth = 1)
#> Warning: Removed 2 rows containing non-finite outside the scale range (`stat_ash()`).

gf_ash(~bill_length_mm, color = ~species, data = penguins, binwidth = 1, adjust = 2)
#> Warning: Removed 2 rows containing non-finite outside the scale range (`stat_ash()`).

ggplot(faithful, aes(x = eruptions)) +
  geom_histogram(aes(y = stat(density)),
    fill = "lightskyblue", colour = "gray50", alpha = 0.2
  ) +
  geom_ash(colour = "red") +
  geom_ash(colour = "forestgreen", adjust = 2) +
  geom_ash(colour = "navy", adjust = 1 / 2) +
  theme_minimal()
#> Warning: `stat(density)` was deprecated in ggplot2 3.4.0.
#> ℹ Please use `after_stat(density)` instead.
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
```
