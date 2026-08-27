# Formula interface to geom_crossbar()

Various ways of representing a vertical interval defined by `x`, `ymin`
and `ymax`. Each case draws a single graphical object.

## Usage

``` r
gf_crossbar(
  object = NULL,
  gformula = NULL,
  data = NULL,
  ...,
  alpha,
  color,
  group,
  middle.linetype,
  middle.colour = NULL,
  middle.color = NULL,
  middle.linewidth = NULL,
  box.colour = NULL,
  box.color = NULL,
  box.linetype = NULL,
  box.linewidth = NULL,
  na.rm = FALSE,
  inherit.aes = TRUE,
  xlab,
  ylab,
  title,
  subtitle,
  caption,
  geom = "crossbar",
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

  A formula with shape `y + ymin + ymax ~ x`. Faceting can be achieved
  by including `|` in the formula.

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

- middle.linetype, middle.colour, middle.color, middle.linewidth:

  Arguments to control the middle line.

- box.colour, box.color, box.linetype, box.linewidth:

  Arguments to control the box.

- na.rm:

  If `FALSE`, the default, missing values are removed with a warning. If
  `TRUE`, missing values are silently removed.

- inherit.aes:

  If `FALSE`, overrides the default aesthetics, rather than combining
  with them. This is most useful for helper functions that define both
  data and aesthetics and shouldn't inherit behaviour from the default
  plot specification, e.g.
  [`annotation_borders()`](https://ggplot2.tidyverse.org/reference/annotation_borders.html).

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

  The statistical transformation to use on the data for this layer. When
  using a `geom_*()` function to construct a layer, the `stat` argument
  can be used to override the default coupling between geoms and stats.
  The `stat` argument accepts the following:

  - A `Stat` ggproto subclass, for example `StatCount`.

  - A string naming the stat. To give the stat as a string, strip the
    function name of the `stat_` prefix. For example, to use
    [`stat_count()`](https://ggplot2.tidyverse.org/reference/geom_bar.html),
    give the stat as `"count"`.

  - For more information and other ways to specify the stat, see the
    [layer
    stat](https://ggplot2.tidyverse.org/reference/layer_stats.html)
    documentation.

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

[`ggplot2::geom_crossbar()`](https://ggplot2.tidyverse.org/reference/geom_linerange.html)

## Examples

``` r
if (require(mosaicData) && require(dplyr)) {
  HELP2 <- HELPrct |>
    summarise(.by = c(substance, sex),
      mean.age   = mean(age),
      median.age = median(age),
      max.age    = max(age),
      min.age    = min(age),
      sd.age     = sd(age),
      lo         = mean.age - sd.age,
      hi         = mean.age + sd.age
    )

  gf_jitter(age ~ substance, data = HELPrct,
      alpha = 0.7, width = 0.2, height = 0, color = "skyblue") |>
    gf_pointrange(mean.age + lo + hi ~ substance, data = HELP2) |>
    gf_facet_grid(~sex)

  gf_jitter(age ~ substance, data = HELPrct,
      alpha = 0.7, width = 0.2, height = 0, color = "skyblue")  |>
    gf_errorbar(lo + hi ~ substance, data = HELP2, inherit = FALSE) |>
    gf_facet_grid(~sex)

  gf_jitter(age ~ substance, data = HELPrct,
      alpha = 0.7, width = 0.2, height = 0, color = "skyblue") |>
    gf_crossbar(mean.age + lo + hi ~ substance, data = HELP2,
      fill = "transparent", middle.linewidth = 1, middle.color = "red") |>
    gf_facet_grid(~sex)

  gf_jitter(substance ~ age, data = HELPrct,
      alpha = 0.7, height = 0.2, width = 0, color = "skyblue") |>
    gf_crossbar(substance ~ mean.age + lo + hi, data = HELP2,
      fill = "transparent", color = "red") |>
    gf_facet_grid(~sex)
}

```
