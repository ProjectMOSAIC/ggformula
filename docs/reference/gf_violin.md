# Formula interface to geom_violin()

A violin plot is a compact display of a continuous distribution. It is a
blend of
[`geom_boxplot()`](https://ggplot2.tidyverse.org/reference/geom_boxplot.html)
and
[`geom_density()`](https://ggplot2.tidyverse.org/reference/geom_density.html):
a violin plot is a mirrored density plot displayed in the same way as a
boxplot.

## Usage

``` r
gf_violin(
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
  weight,
  quantile.colour = NULL,
  quantile.color = NULL,
  quantile.linetype = 0L,
  quantile.linewidth = NULL,
  quantile_gp = quantile_gp,
  trim = TRUE,
  scale = "area",
  bw,
  adjust = 1,
  kernel = "gaussian",
  xlab,
  ylab,
  title,
  subtitle,
  caption,
  geom = "violin",
  stat = "ydensity",
  position = "dodge",
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

- fill:

  A color for filling, or a formula used for mapping fill.

- group:

  Used for grouping.

- linetype:

  A linetype (numeric or "dashed", "dotted", etc.) or a formula used for
  mapping linetype.

- linewidth:

  A numerical line width or a formula used for mapping linewidth.

- weight:

  Useful for summarized data, `weight` provides a count of the number of
  values with the given combination of `x` and `y` values.

- quantile.colour, quantile.color, quantile.linewidth,
  quantile.linetype:

  Default aesthetics for the quantile lines. Set to `NULL` to inherit
  from the data's aesthetics. By default, quantile lines are hidden and
  can be turned on by changing `quantile.linetype`. Quantile values can
  be set using the `quantiles` argument when using `stat = "ydensity"`
  (default).

- trim:

  If `TRUE` (default), trim the tails of the violins to the range of the
  data. If `FALSE`, don't trim the tails.

- scale:

  if "area" (default), all violins have the same area (before trimming
  the tails). If "count", areas are scaled proportionally to the number
  of observations. If "width", all violins have the same maximum width.

- bw:

  The smoothing bandwidth to be used. If numeric, the standard deviation
  of the smoothing kernel. If character, a rule to choose the bandwidth,
  as listed in
  [`stats::bw.nrd()`](https://rdrr.io/r/stats/bandwidth.html). Note that
  automatic calculation of the bandwidth does not take weights into
  account.

- adjust:

  A multiplicate bandwidth adjustment. This makes it possible to adjust
  the bandwidth while still using the a bandwidth estimator. For
  example, `adjust = 1/2` means use half of the default bandwidth.

- kernel:

  Kernel. See list of available kernels in
  [`density()`](https://rdrr.io/r/stats/density.html).

- xlab:

  Label for x-axis. See also [`gf_labs()`](gf_aux.md).

- ylab:

  Label for y-axis. See also [`gf_labs()`](gf_aux.md).

- title, subtitle, caption:

  Title, sub-title, and caption for the plot. See also
  [`gf_labs()`](gf_aux.md).

- geom, stat:

  Use to override the default connection between
  [`geom_violin()`](https://ggplot2.tidyverse.org/reference/geom_violin.html)
  and
  [`stat_ydensity()`](https://ggplot2.tidyverse.org/reference/geom_violin.html).
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

## References

Hintze, J. L., Nelson, R. D. (1998) Violin Plots: A Box Plot-Density
Trace Synergism. The American Statistician 52, 181-184.

## See also

[`ggplot2::geom_violin()`](https://ggplot2.tidyverse.org/reference/geom_violin.html)

## Examples

``` r
gf_violin(age ~ substance, data = mosaicData::HELPrct)

gf_violin(age ~ substance, data = mosaicData::HELPrct, fill = ~sex)
```
