# Formula interface to geom_bar()

There are two types of bar charts:
[`geom_bar()`](https://ggplot2.tidyverse.org/reference/geom_bar.html)
and
[`geom_col()`](https://ggplot2.tidyverse.org/reference/geom_bar.html).
[`geom_bar()`](https://ggplot2.tidyverse.org/reference/geom_bar.html)
makes the height of the bar proportional to the number of cases in each
group (or if the `weight` aesthetic is supplied, the sum of the
weights). If you want the heights of the bars to represent values in the
data, use
[`geom_col()`](https://ggplot2.tidyverse.org/reference/geom_bar.html)
instead.
[`geom_bar()`](https://ggplot2.tidyverse.org/reference/geom_bar.html)
uses
[`stat_count()`](https://ggplot2.tidyverse.org/reference/geom_bar.html)
by default: it counts the number of cases at each x position.
[`geom_col()`](https://ggplot2.tidyverse.org/reference/geom_bar.html)
uses
[`stat_identity()`](https://ggplot2.tidyverse.org/reference/stat_identity.html):
it leaves the data as is.

## Usage

``` r
gf_bar(
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
  width = NULL,
  xlab,
  ylab,
  title,
  subtitle,
  caption,
  geom = "bar",
  stat = "count",
  position = "stack",
  show.legend = NA,
  show.help = NULL,
  inherit = TRUE,
  environment = parent.frame()
)

gf_counts(
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
  width = NULL,
  xlab,
  ylab,
  title,
  subtitle,
  caption,
  geom = "bar",
  stat = "count",
  position = "stack",
  show.legend = NA,
  show.help = NULL,
  inherit = TRUE,
  environment = parent.frame()
)

gf_props(
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
  xlab,
  ylab = "proportion",
  title,
  subtitle,
  caption,
  geom = "bar",
  stat = "count",
  position = "stack",
  show.legend = NA,
  show.help = NULL,
  inherit = TRUE,
  environment = parent.frame(),
  denom = ~PANEL
)

gf_percents(
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
  xlab,
  ylab = "percent",
  title,
  subtitle,
  caption,
  geom = "bar",
  stat = "count",
  position = "stack",
  show.legend = NA,
  show.help = NULL,
  inherit = TRUE,
  environment = parent.frame(),
  denom = ~PANEL
)
```

## Arguments

- object:

  When chaining, this holds an object produced in the earlier portions
  of the chain. Most users can safely ignore this argument. See details
  and examples.

- gformula:

  A formula, typically with shape `~ x`. (`y ~ x` is also possible, but
  typically using one of [`gf_col()`](gf_col.md), `gf_props()`, or
  `gf_percents()` is preferable to using this formula shape.) Faceting
  can be achieved by including `|` in the formula.

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

- width:

  Width of the bars.

- xlab:

  Label for x-axis. See also [`gf_labs()`](gf_aux.md).

- ylab:

  Label for y-axis. See also [`gf_labs()`](gf_aux.md).

- title, subtitle, caption:

  Title, sub-title, and caption for the plot. See also
  [`gf_labs()`](gf_aux.md).

- geom, stat:

  Override the default connection between
  [`geom_bar()`](https://ggplot2.tidyverse.org/reference/geom_bar.html)
  and
  [`stat_count()`](https://ggplot2.tidyverse.org/reference/geom_bar.html).
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

- denom:

  A formula, the right hand side of which describes the denominators
  used for computing proportions and percents. These are computed after
  the stat has been applied to the data and should refer to variables
  available at that point. See the examples.

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

[`ggplot2::geom_bar()`](https://ggplot2.tidyverse.org/reference/geom_bar.html)

## Examples

``` r
gf_bar(~substance, data = mosaicData::HELPrct)

gf_bar(~substance, data = mosaicData::HELPrct, fill = ~sex)

gf_bar(~substance,
  data = mosaicData::HELPrct, fill = ~sex,
  position = position_dodge()
)

# gf_counts() is another name for gf_bar()
gf_counts(~substance,
  data = mosaicData::HELPrct, fill = ~sex,
  position = position_dodge()
)

# gf_props() and gf_percents() use proportions or percentages instead of counts
# use denom to control which denominators are used.
gf_props(~substance,
  data = mosaicData::HELPrct, fill = ~sex,
  position = position_dodge()
)

gf_props(substance ~ .,
  data = mosaicData::HELPrct, fill = ~sex,
  position = position_dodge(),
  orientation = 'y'
)

gf_props(substance ~ .,
  data = mosaicData::HELPrct, fill = ~sex,
  position = "dodge"
)


gf_percents(~substance,
  data = mosaicData::HELPrct, fill = ~sex,
  position = position_dodge()
)

gf_percents(~substance,
  data = mosaicData::HELPrct, fill = ~sex,
  position = position_dodge(),
  denom = ~x
)

gf_percents(~substance,
  data = mosaicData::HELPrct, fill = ~sex,
  position = position_dodge(),
  denom = ~fill
)

gf_percents(~substance | sex,
  data = mosaicData::HELPrct, fill = ~homeless,
  position = position_dodge()
)

gf_percents(~substance | sex,
  data = mosaicData::HELPrct,
  fill = ~homeless,
  denom = ~fill,
  position = position_dodge()
)

gf_percents(~substance | sex,
  data = mosaicData::HELPrct,
  fill = ~homeless,
  denom = ~interaction(fill, PANEL),
  position = position_dodge()
)

if (require(scales)) {
  gf_percents(~substance,
    data = mosaicData::HELPrct, fill = ~sex,
    position = position_dodge(),
    denom = ~ x,
  ) |>
    gf_refine(scale_y_continuous(labels = scales::percent))
}
```
