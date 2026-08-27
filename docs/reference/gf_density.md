# Formula interface to stat_density()

Computes and draws a kernel density estimate, which is a smoothed
version of the histogram and is a useful alternative when the data come
from an underlying smooth distribution. The only difference between
`gf_dens()` and `gf_density()` is the default geom used to show the
density curve: `gf_density()` uses an area geom (which can be filled).
`gf_dens()` using a line geom (which cannot be filled).

## Usage

``` r
gf_density(
  object = NULL,
  gformula = NULL,
  data = NULL,
  ...,
  alpha = 0.5,
  color,
  fill,
  group,
  linetype,
  linewidth,
  kernel = "gaussian",
  n = 512,
  trim = FALSE,
  xlab,
  ylab,
  title,
  subtitle,
  caption,
  geom = "area",
  stat = "density",
  position = "identity",
  show.legend = NA,
  show.help = NULL,
  inherit = TRUE,
  environment = parent.frame()
)

gf_dens(
  object = NULL,
  gformula = NULL,
  data = NULL,
  ...,
  alpha = 0.5,
  color,
  fill = NA,
  group,
  linetype,
  linewidth,
  kernel = "gaussian",
  n = 512,
  trim = FALSE,
  xlab,
  ylab,
  title,
  subtitle,
  caption,
  geom = "line",
  stat = "density",
  position = "identity",
  show.legend = NA,
  show.help = NULL,
  inherit = TRUE,
  environment = parent.frame()
)

gf_dens2(
  object = NULL,
  gformula = NULL,
  data = NULL,
  ...,
  alpha = 0.5,
  color,
  fill = NA,
  group,
  linetype,
  linewidth,
  kernel = "gaussian",
  n = 512,
  trim = FALSE,
  xlab,
  ylab,
  title,
  subtitle,
  caption,
  geom = "density_line",
  stat = "density",
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

  A formula with shape `~ x`. Faceting can be achieved by including `|`
  in the formula.

- data:

  The data to be displayed in this layer. There are three options:

  If `NULL`, the default, the data is inherited from the plot data as
  specified in the call to
  [`ggplot()`](https://ggplot2.tidyverse.org/reference/ggplot.html).

  A `data.frame`, or other object, will override the plot data. All
  objects will be fortified to produce a data frame. See
  [`fortify()`](https://ggplot2.tidyverse.org/reference/fortify.html)
  for which variables will be created.

  A `function` will be called with a single argument, the plot data. The
  return value must be a `data.frame`, and will be used as the layer
  data. A `function` can be created from a `formula` (e.g.
  `~ head(.x, 10)`).

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

- kernel:

  Kernel. See list of available kernels in
  [`density()`](https://rdrr.io/r/stats/density.html).

- n:

  number of equally spaced points at which the density is to be
  estimated, should be a power of two, see
  [`density()`](https://rdrr.io/r/stats/density.html) for details

- trim:

  If `FALSE`, the default, each density is computed on the full range of
  the data. If `TRUE`, each density is computed over the range of that
  group: this typically means the estimated x values will not line-up,
  and hence you won't be able to stack density values. This parameter
  only matters if you are displaying multiple densities in one plot or
  if you are manually adjusting the scale limits.

- xlab:

  Label for x-axis. See also [`gf_labs()`](gf_aux.md).

- ylab:

  Label for y-axis. See also [`gf_labs()`](gf_aux.md).

- title, subtitle, caption:

  Title, sub-title, and caption for the plot. See also
  [`gf_labs()`](gf_aux.md).

- geom, stat:

  Use to override the default connection between
  [`geom_density()`](https://ggplot2.tidyverse.org/reference/geom_density.html)
  and
  [`stat_density()`](https://ggplot2.tidyverse.org/reference/geom_density.html).
  For more information about overriding these connections, see how the
  [stat](https://ggplot2.tidyverse.org/reference/layer_stats.html) and
  [geom](https://ggplot2.tidyverse.org/reference/layer_geoms.html)
  arguments work.

- position:

  A position adjustment to use on the data for this layer. This can be
  used in various ways, including to prevent overplotting and improving
  the display. The `position` argument accepts the following:

  - The result of calling a position function, such as
    [`position_jitter()`](https://ggplot2.tidyverse.org/reference/position_jitter.html).
    This method allows for passing extra arguments to the position.

  - A string naming the position adjustment. To give the position as a
    string, strip the function name of the `position_` prefix. For
    example, to use
    [`position_jitter()`](https://ggplot2.tidyverse.org/reference/position_jitter.html),
    give the position as `"jitter"`.

  - For more information and other ways to specify the position, see the
    [layer
    position](https://ggplot2.tidyverse.org/reference/layer_positions.html)
    documentation.

- show.legend:

  logical. Should this layer be included in the legends? `NA`, the
  default, includes if any aesthetics are mapped. `FALSE` never
  includes, and `TRUE` always includes. It can also be a named logical
  vector to finely select the aesthetics to display. To include legend
  keys for all levels, even when no data exists, use `TRUE`. If `NA`,
  all levels are shown in legend, but unobserved levels are omitted.

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

[`gf_ash()`](gf_ash.md),
[`ggplot2::geom_density()`](https://ggplot2.tidyverse.org/reference/geom_density.html)

## Examples

``` r
gf_dens()
#> gf_dens() uses 
#>     * a formula with shape ~x or y ~ .. 
#>     * geom:  line 
#>     * stat:  density 
#>     * key attributes:  alpha = 0.5, color, fill = NA, group, linetype, linewidth,
#>                    kernel = "gaussian", n = 512, trim =
#>                    FALSE
#> 
#> For more information, try ?gf_dens
data(penguins, package = "palmerpenguins")
gf_density(~bill_length_mm, fill = ~species, data = penguins)
#> Warning: Removed 2 rows containing non-finite outside the scale range
#> (`stat_density()`).

gf_dens(~bill_length_mm, color = ~species, data = penguins)
#> Warning: Removed 2 rows containing non-finite outside the scale range
#> (`stat_density()`).

gf_dens2(~bill_length_mm, color = ~species, fill = ~species, data = penguins)
#> Warning: Removed 2 rows containing non-finite outside the scale range
#> (`stat_density()`).

gf_freqpoly(~bill_length_mm, color = ~species, data = penguins, bins = 15)
#> Warning: Removed 2 rows containing non-finite outside the scale range (`stat_bin()`).

# Chaining in the data
data(penguins, package = "palmerpenguins")
penguins |> gf_dens(~bill_length_mm, color = ~species)
#> Warning: Removed 2 rows containing non-finite outside the scale range
#> (`stat_density()`).

# horizontal orientation
penguins |> gf_dens(bill_length_mm ~ ., color = ~species)
#> Warning: Removed 2 rows containing non-finite outside the scale range
#> (`stat_density()`).
```
