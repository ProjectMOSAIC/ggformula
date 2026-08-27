# Formula interface to geom_text() and geom_label()

Text geoms are useful for labeling plots. They can be used by themselves
as scatterplots or in combination with other geoms, for example, for
labeling points or for annotating the height of bars.
[`geom_text()`](https://ggplot2.tidyverse.org/reference/geom_text.html)
adds only text to the plot.
[`geom_label()`](https://ggplot2.tidyverse.org/reference/geom_text.html)
draws a rectangle behind the text, making it easier to read.

## Usage

``` r
gf_text(
  object = NULL,
  gformula = NULL,
  data = NULL,
  ...,
  label,
  alpha,
  angle,
  color,
  family,
  fontface,
  group,
  hjust,
  lineheight,
  size,
  vjust,
  parse = FALSE,
  nudge_x = 0,
  nudge_y = 0,
  check_overlap = FALSE,
  xlab,
  ylab,
  title,
  subtitle,
  caption,
  geom = "text",
  stat = "identity",
  position = "nudge",
  show.legend = NA,
  show.help = NULL,
  inherit = TRUE,
  environment = parent.frame()
)

gf_label(
  object = NULL,
  gformula = NULL,
  data = NULL,
  ...,
  label,
  alpha,
  angle,
  color,
  family,
  fontface,
  group,
  hjust,
  vjust,
  size,
  parse,
  nudge_x = 0,
  nudge_y = 0,
  label.padding = unit(0.25, "lines"),
  label.r = unit(0.15, "lines"),
  xlab,
  ylab,
  title,
  subtitle,
  caption,
  stat = "identity",
  position = "nudge",
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

- label:

  The text to be displayed.

- alpha:

  Opacity (0 = invisible, 1 = opaque).

- angle:

  An angle for rotating the text.

- color:

  A color or a formula used for mapping color.

- family:

  A font family.

- fontface:

  One of `"plain"`, `"bold"`, `"italic"`, or `"bold italic"`.

- group:

  Used for grouping.

- hjust, vjust:

  Numbers between 0 and 1 indicating how to justify text relative the
  the specified location.

- lineheight:

  Line height.

- size:

  A numeric size or a formula used for mapping size.

- parse:

  If `TRUE`, the labels will be parsed into expressions and displayed as
  described in [`?plotmath`](https://rdrr.io/r/grDevices/plotmath.html).

- nudge_x, nudge_y:

  Passed to
  [`ggplot2::position_nudge()`](https://ggplot2.tidyverse.org/reference/position_nudge.html)
  to nudge text or labels horizontally or vertically.

- check_overlap:

  If `TRUE`, text that overlaps previous text in the same layer will not
  be plotted. `check_overlap` happens at draw time and in the order of
  the data. Therefore data should be arranged by the label column before
  calling
  [`geom_text()`](https://ggplot2.tidyverse.org/reference/geom_text.html).
  Note that this argument is not supported by
  [`geom_label()`](https://ggplot2.tidyverse.org/reference/geom_text.html).

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

- label.padding:

  Amount of padding around label. Defaults to 0.25 lines.

- label.r:

  Radius of rounded corners. Defaults to 0.15 lines.

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

[`ggplot2::geom_text()`](https://ggplot2.tidyverse.org/reference/geom_text.html)

## Examples

``` r
data(penguins, package = "palmerpenguins")
gf_text(bill_length_mm ~ bill_depth_mm,
  data = penguins,
  label = ~species, color = ~species, size = 2, angle = 30
)
#> Warning: Removed 2 rows containing missing values or values outside the scale range
#> (`geom_text()`).

penguins |>
gf_point(bill_length_mm ~ bill_depth_mm, color = ~species, alpha = 0.5) |>
  gf_text(bill_length_mm ~ bill_depth_mm,
    label = ~species, color = ~species,
    size = 2, angle = 0, hjust = 0, nudge_x = 0.1, nudge_y = 0.1
  )
#> Warning: Removed 2 rows containing missing values or values outside the scale range
#> (`geom_point()`).
#> Warning: Removed 2 rows containing missing values or values outside the scale range
#> (`geom_text()`).

if (require(dplyr)) {
  data(penguins, package = "palmerpenguins")
  penguins_means <-
    penguins |>
    group_by(species) |>
    summarise(bill_length_mm = mean(bill_length_mm), bill_depth_mm = mean(bill_depth_mm))
  gf_point(bill_length_mm ~ bill_depth_mm, data = penguins, color = ~species) |>
    gf_label(bill_length_mm ~ bill_depth_mm,
      data = penguins_means,
      label = ~species, color = ~species, size = 2, alpha = 0.7
    )
}
#> Warning: Removed 2 rows containing missing values or values outside the scale range
#> (`geom_point()`).
#> Warning: Removed 2 rows containing missing values or values outside the scale range
#> (`geom_label()`).
```
