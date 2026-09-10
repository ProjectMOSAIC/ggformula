# Interactive dotplot plots

Creates an interactive plot using ggiraph. This function extends
[`gf_dotplot()`](gf_dotplot.md) with interactive features like tooltips
and clickable elements.

## Usage

``` r
gf_dotplot_interactive(
  object = NULL,
  gformula = NULL,
  data = NULL,
  ...,
  alpha,
  color,
  fill,
  group,
  binwidth = NULL,
  binaxis = "x",
  method = "dotdensity",
  binpositions = "bygroup",
  stackdir = "up",
  stackratio = 1,
  dotsize = 1,
  stackgroups = FALSE,
  origin = NULL,
  right = TRUE,
  width = 0.9,
  drop = FALSE,
  xlab,
  ylab,
  title,
  subtitle,
  caption,
  stat = rlang::quo(ggplot2::StatBin),
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

  A data frame with the variables to be plotted.

- ...:

  Additional arguments passed to the underlying interactive geom. This
  is where ggiraph's interactive aesthetics are supplied, including
  `tooltip` (text shown on hover), `data_id` (identifiers used for
  interactive selection), and `onclick` (JavaScript run on click).

- alpha:

  Opacity (0 = invisible, 1 = opaque).

- color:

  A color or a formula used for mapping color.

- fill:

  A color for filling, or a formula used for mapping fill.

- group:

  Used for grouping.

- binwidth:

  When `method` is "dotdensity", this specifies maximum bin width. When
  `method` is "histodot", this specifies bin width. Defaults to 1/30 of
  the range of the data

- binaxis:

  The axis to bin along, "x" (default) or "y"

- method:

  "dotdensity" (default) for dot-density binning, or "histodot" for
  fixed bin widths (like stat_bin)

- binpositions:

  When `method` is "dotdensity", "bygroup" (default) determines
  positions of the bins for each group separately. "all" determines
  positions of the bins with all the data taken together; this is used
  for aligning dot stacks across multiple groups.

- stackdir:

  which direction to stack the dots. "up" (default), "down", "center",
  "centerwhole" (centered, but with dots aligned)

- stackratio:

  how close to stack the dots. Default is 1, where dots just touch. Use
  smaller values for closer, overlapping dots.

- dotsize:

  The diameter of the dots relative to `binwidth`, default 1.

- stackgroups:

  should dots be stacked across groups? This has the effect that
  `position = "stack"` should have, but can't (because this geom has
  some odd properties).

- origin:

  When `method` is "histodot", origin of first bin

- right:

  When `method` is "histodot", should intervals be closed on the right
  (a, b\], or not \[a, b)

- width:

  When `binaxis` is "y", the spacing of the dot stacks for dodging.

- drop:

  If TRUE, remove all bins with zero counts

- xlab:

  Label for x-axis. See also [`gf_labs()`](gf_aux.md).

- ylab:

  Label for y-axis. See also [`gf_labs()`](gf_aux.md).

- title:

  Title, sub-title, and caption for the plot. See also
  [`gf_labs()`](gf_aux.md).

- subtitle:

  Title, sub-title, and caption for the plot. See also
  [`gf_labs()`](gf_aux.md).

- caption:

  Title, sub-title, and caption for the plot. See also
  [`gf_labs()`](gf_aux.md).

- stat:

  Use to override the default connection between `geom_lm` and
  `stat_lm`.

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

A gg object that can be displayed with [`gf_girafe()`](gf_girafe.md).

## Additional interactive features

- `onclick`: JavaScript code (as character string) executed when
  clicking elements.

- Additional ggiraph aesthetics may be available depending on the geom.

## See also

[`gf_dotplot()`](gf_dotplot.md), [`gf_girafe()`](gf_girafe.md)
