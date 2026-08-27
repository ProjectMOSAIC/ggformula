# Formula interface to geom_col()

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
gf_col(
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
  ylab,
  title,
  subtitle,
  caption,
  geom = "col",
  stat = "identity",
  position = "stack",
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

[`ggplot2::geom_col()`](https://ggplot2.tidyverse.org/reference/geom_bar.html)

## Examples

``` r
SomeData <- data.frame(
  group = LETTERS[1:3],
  count = c(20, 25, 18)
)
gf_col(count ~ group, data = SomeData)


# A Pareto chart

if (require(dplyr) && require(mosaicData)) {
  HELPrct |>
    group_by(substance) |>
    summarise(count = n()) |>
    ungroup() |>
    dplyr::arrange(-count) |>
    mutate(
      cumcount = cumsum(count),
      substance = reorder(substance, -count)
    ) |>
    gf_col(count ~ substance, fill = "skyblue") |>
    gf_point(cumcount ~ substance) |>
    gf_line(cumcount ~ substance, group = 1) |>
    gf_refine(
      scale_y_continuous(sec.axis = sec_axis(~ . / nrow(HELPrct)))
    )
}
```
