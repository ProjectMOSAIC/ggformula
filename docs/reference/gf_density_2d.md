# Formula interface to geom_density_2d() and geom_density_2d_filled()

Perform a 2D kernel density estimation using
[`MASS::kde2d()`](https://rdrr.io/pkg/MASS/man/kde2d.html) and display
the results with contours. This can be useful for dealing with
overplotting. This is a 2D version of
[`geom_density()`](https://ggplot2.tidyverse.org/reference/geom_density.html).
[`geom_density_2d()`](https://ggplot2.tidyverse.org/reference/geom_density_2d.html)
draws contour lines, and
[`geom_density_2d_filled()`](https://ggplot2.tidyverse.org/reference/geom_density_2d.html)
draws filled contour bands.

## Usage

``` r
gf_density_2d(
  object = NULL,
  gformula = NULL,
  data = NULL,
  ...,
  alpha,
  color,
  group,
  linetype,
  linewidth,
  contour = TRUE,
  n = 100,
  h = NULL,
  lineend = "butt",
  linejoin = "round",
  linemitre = 1,
  xlab,
  ylab,
  title,
  subtitle,
  caption,
  geom = "density_2d",
  stat = "density_2d",
  position = "identity",
  show.legend = NA,
  show.help = NULL,
  inherit = TRUE,
  environment = parent.frame()
)

gf_density_2d_filled(
  object = NULL,
  gformula = NULL,
  data = NULL,
  ...,
  alpha,
  color,
  group,
  linetype,
  linewidth,
  contour = TRUE,
  n = 100,
  h = NULL,
  lineend = "butt",
  linejoin = "round",
  linemitre = 1,
  xlab,
  ylab,
  title,
  subtitle,
  caption,
  geom = "density_2d_filled",
  stat = "density_2d_filled",
  position = "identity",
  show.legend = NA,
  show.help = NULL,
  inherit = TRUE,
  environment = parent.frame()
)

gf_density2d(
  object = NULL,
  gformula = NULL,
  data = NULL,
  ...,
  alpha,
  color,
  group,
  linetype,
  linewidth,
  contour = TRUE,
  n = 100,
  h = NULL,
  lineend = "butt",
  linejoin = "round",
  linemitre = 1,
  xlab,
  ylab,
  title,
  subtitle,
  caption,
  geom = "density2d",
  stat = "density2d",
  position = "identity",
  show.legend = NA,
  show.help = NULL,
  inherit = TRUE,
  environment = parent.frame()
)

gf_density2d_filled(
  object = NULL,
  gformula = NULL,
  data = NULL,
  ...,
  alpha,
  color,
  group,
  linetype,
  linewidth,
  contour = TRUE,
  n = 100,
  h = NULL,
  lineend = "butt",
  linejoin = "round",
  linemitre = 1,
  xlab,
  ylab,
  title,
  subtitle,
  caption,
  geom = "density2d_filled",
  stat = "density_2d_filled",
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

- group:

  Used for grouping.

- linetype:

  A linetype (numeric or "dashed", "dotted", etc.) or a formula used for
  mapping linetype.

- linewidth:

  A numerical line width or a formula used for mapping linewidth.

- contour:

  If `TRUE`, contour the results of the 2d density estimation.

- n:

  Number of grid points in each direction.

- h:

  Bandwidth (vector of length two). If `NULL`, estimated using
  [`MASS::bandwidth.nrd()`](https://rdrr.io/pkg/MASS/man/bandwidth.nrd.html).

- lineend:

  Line end style (round, butt, square).

- linejoin:

  Line join style (round, mitre, bevel).

- linemitre:

  Line mitre limit (number greater than 1).

- xlab:

  Label for x-axis. See also [`gf_labs()`](gf_aux.md).

- ylab:

  Label for y-axis. See also [`gf_labs()`](gf_aux.md).

- title, subtitle, caption:

  Title, sub-title, and caption for the plot. See also
  [`gf_labs()`](gf_aux.md).

- geom, stat:

  Use to override the default connection between
  [`geom_density_2d()`](https://ggplot2.tidyverse.org/reference/geom_density_2d.html)
  and
  [`stat_density_2d()`](https://ggplot2.tidyverse.org/reference/geom_density_2d.html).
  For more information at overriding these connections, see how the
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

[`ggplot2::geom_density_2d()`](https://ggplot2.tidyverse.org/reference/geom_density_2d.html)

## Examples

``` r
gf_jitter(avg_drinks ~ age,
  alpha = 0.2, data = mosaicData::HELPrct,
  width = 0.4, height = 0.4
) |>
  gf_density_2d(avg_drinks ~ age, data = mosaicData::HELPrct)

gf_density_2d_filled(avg_drinks ~ age, data = mosaicData::HELPrct, show.legend = FALSE) |>
  gf_jitter(avg_drinks ~ age,
    alpha = 0.3, data = mosaicData::HELPrct,
    width = 0.4, height = 0.4,
    color = "white"
)

gf_jitter(avg_drinks ~ age,
  alpha = 0.2, data = mosaicData::HELPrct,
  width = 0.4, height = 0.4
) |>
  gf_density2d(avg_drinks ~ age, data = mosaicData::HELPrct)

gf_density2d_filled(avg_drinks ~ age, data = mosaicData::HELPrct, show.legend = FALSE) |>
  gf_jitter(avg_drinks ~ age,
    alpha = 0.4, data = mosaicData::HELPrct,
    width = 0.4, height = 0.4,
    color = "white"
)
```
