# Formula interface to geom_freqpoly()

Visualise the distribution of a single continuous variable by dividing
the x axis into bins and counting the number of observations in each
bin. Histograms
([`geom_histogram()`](https://ggplot2.tidyverse.org/reference/geom_histogram.html))
display the counts with bars; frequency polygons
([`geom_freqpoly()`](https://ggplot2.tidyverse.org/reference/geom_histogram.html))
display the counts with lines. Frequency polygons are more suitable when
you want to compare the distribution across the levels of a categorical
variable.

## Usage

``` r
gf_freqpoly(
  object = NULL,
  gformula = NULL,
  data = NULL,
  ...,
  alpha,
  color,
  group,
  linetype,
  linewidth,
  binwidth,
  bins,
  center,
  boundary,
  xlab,
  ylab,
  title,
  subtitle,
  caption,
  geom = "path",
  stat = "bin",
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

  A formula with shape `~ x` or `y ~ x`. Faceting can be achieved by
  including `|` in the formula.

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

- binwidth:

  The width of the bins. Can be specified as a numeric value or as a
  function that takes x after scale transformation as input and returns
  a single numeric value. When specifying a function along with a
  grouping structure, the function will be called once per group. The
  default is to use the number of bins in `bins`, covering the range of
  the data. You should always override this value, exploring multiple
  widths to find the best to illustrate the stories in your data.

  The bin width of a date variable is the number of days in each time;
  the bin width of a time variable is the number of seconds.

- bins:

  Number of bins. Overridden by `binwidth`. Defaults to 30.

- center, boundary:

  bin position specifiers. Only one, `center` or `boundary`, may be
  specified for a single plot. `center` specifies the center of one of
  the bins. `boundary` specifies the boundary between two bins. Note
  that if either is above or below the range of the data, things will be
  shifted by the appropriate integer multiple of `binwidth`. For
  example, to center on integers use `binwidth = 1` and `center = 0`,
  even if `0` is outside the range of the data. Alternatively, this same
  alignment can be specified with `binwidth = 1` and `boundary = 0.5`,
  even if `0.5` is outside the range of the data.

- xlab:

  Label for x-axis. See also [`gf_labs()`](gf_aux.md).

- ylab:

  Label for y-axis. See also [`gf_labs()`](gf_aux.md).

- title, subtitle, caption:

  Title, sub-title, and caption for the plot. See also
  [`gf_labs()`](gf_aux.md).

- geom, stat:

  Use to override the default connection between
  [`geom_histogram()`](https://ggplot2.tidyverse.org/reference/geom_histogram.html)/[`geom_freqpoly()`](https://ggplot2.tidyverse.org/reference/geom_histogram.html)
  and
  [`stat_bin()`](https://ggplot2.tidyverse.org/reference/geom_histogram.html).
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

[`ggplot2::geom_freqpoly()`](https://ggplot2.tidyverse.org/reference/geom_histogram.html)

## Examples

``` r
data(penguins, package = "palmerpenguins")
gf_histogram(~ bill_length_mm | species, alpha = 0.2, data = penguins, bins = 20) |>
  gf_freqpoly(~bill_length_mm, data = penguins, color = ~species, bins = 20)
#> Warning: Removed 2 rows containing non-finite outside the scale range (`stat_bin()`).
#> Warning: Removed 2 rows containing non-finite outside the scale range (`stat_bin()`).

gf_freqpoly(~bill_length_mm, color = ~species, data = penguins, bins = 20)
#> Warning: Removed 2 rows containing non-finite outside the scale range (`stat_bin()`).

gf_dens(~bill_length_mm, data = penguins, color = "navy") |>
  gf_freqpoly(after_stat(density) ~ bill_length_mm,
    data = penguins,
    color = "red", bins = 20
  )
#> Warning: Ignoring unknown aesthetics: .
#> Warning: Removed 2 rows containing non-finite outside the scale range
#> (`stat_density()`).
#> Warning: Removed 2 rows containing non-finite outside the scale range (`stat_bin()`).
#> Warning: The following aesthetics were dropped during statistical transformation: ..
#> ℹ This can happen when ggplot fails to infer the correct grouping structure in
#>   the data.
#> ℹ Did you forget to specify a `group` aesthetic or to convert a numerical
#>   variable into a factor?
```
