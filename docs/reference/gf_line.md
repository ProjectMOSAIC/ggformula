# Formula interface to geom_line() and geom_path()

Line plots in `ggformula`. `gf_path()` differs from `gf_line()` in that
points are connected in the order in which they appear in `data`.

## Usage

``` r
gf_line(
  object = NULL,
  gformula = NULL,
  data = NULL,
  ...,
  alpha,
  color,
  fill,
  group,
  linetype,
  linewidth,
  lineend,
  linejoin,
  linemitre,
  arrow,
  xlab,
  ylab,
  title,
  subtitle,
  caption,
  geom = "line",
  stat = "identity",
  position = "identity",
  show.legend = NA,
  show.help = NULL,
  inherit = TRUE,
  environment = parent.frame()
)

gf_path(
  object = NULL,
  gformula = NULL,
  data = NULL,
  ...,
  alpha,
  color,
  group,
  linetype,
  linewidth,
  lineend = "butt",
  linejoin = "round",
  linemitre = 1,
  arrow = NULL,
  xlab,
  ylab,
  title,
  subtitle,
  caption,
  geom = "path",
  stat = "identity",
  position = "identity",
  show.legend = NA,
  show.help = NULL,
  inherit = TRUE,
  environment = parent.frame()
)
```

## Arguments

- object:

  When chaining, this holds an object produced in the earlier portions
  of the chain. Most users can safely ignore this argument. See details
  and examples.

- gformula:

  A formula with shape `y ~ x`. Faceting can be achieved by including
  `|` in the formula.

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

- fill:

  A color for filling, or a formula used for mapping fill.

- group:

  Used for grouping.

- linetype:

  A linetype (numeric or "dashed", "dotted", etc.) or a formula used for
  mapping linetype.

- linewidth:

  A numerical line width or a formula used for mapping linewidth.

- lineend:

  Line end style (round, butt, square).

- linejoin:

  Line join style (round, mitre, bevel).

- linemitre:

  Line mitre limit (number greater than 1).

- arrow:

  Arrow specification, as created by
  [`grid::arrow()`](https://rdrr.io/r/grid/arrow.html).

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

[`ggplot2::geom_line()`](https://ggplot2.tidyverse.org/reference/geom_path.html),
[`gf_point()`](gf_point.md)

## Examples

``` r
gf_line()
#> gf_line() uses 
#>     * a formula with shape y ~ x. 
#>     * geom:  line 
#>     * key attributes:  alpha, color, fill, group, linetype, linewidth, lineend,
#>                    linejoin, linemitre, arrow
#> 
#> For more information, try ?gf_line
gf_point(age ~ sex, alpha = 0.25, data = mosaicData::HELPrct)

gf_point(births ~ date, color = ~wday, data = mosaicData::Births78)

# lines make the exceptions stand out more prominently
gf_line(births ~ date, color = ~wday, data = mosaicData::Births78)

gf_path()
#> gf_path() uses 
#>     * a formula with shape y ~ x. 
#>     * geom:  path 
#>     * key attributes:  alpha, color, group, linetype, linewidth, lineend = "butt",
#>                    linejoin = "round", linemitre = 1, arrow
#>                    = NULL
#> 
#> For more information, try ?gf_path
if (require(dplyr)) {
  data.frame(t = seq(1, 10 * pi, length.out = 400)) |>
    mutate(x = t * cos(t), y = t * sin(t)) |>
    gf_path(y ~ x, color = ~t)
}
```
