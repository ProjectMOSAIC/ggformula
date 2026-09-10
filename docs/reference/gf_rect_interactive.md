# Interactive rect plots

Creates an interactive plot using ggiraph. This function extends
[`gf_rect()`](gf_rect.md) with interactive features like tooltips and
clickable elements.

## Usage

``` r
gf_rect_interactive(
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

  A formula with shape `ymin + ymax ~ xmin + xmax`. Faceting can be
  achieved by including `|` in the formula.

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

- linetype:

  A linetype (numeric or "dashed", "dotted", etc.) or a formula used for
  mapping linetype.

- linewidth:

  A numerical line width or a formula used for mapping linewidth.

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

A gg object that can be displayed with [`gf_girafe()`](gf_girafe.md).

## Additional interactive features

- `onclick`: JavaScript code (as character string) executed when
  clicking elements.

- Additional ggiraph aesthetics may be available depending on the geom.

## See also

[`gf_rect()`](gf_rect.md), [`gf_girafe()`](gf_girafe.md)

## Examples

``` r
rect_data <-
  data.frame(
    x1 = c(1, 3, 1, 5, 4),
    x2 = c(2, 4, 3, 6, 6),
    y1 = c(1, 1, 4, 1, 3),
    y2 = c(2, 2, 5, 3, 5),
    t = c('a', 'a', 'a', 'b', 'b'),
    r = c(1, 2, 3, 4, 5),
    tooltip = c("ID 1", "ID 2", "ID 3", "ID 4", "ID 5"),
    uid = c("ID 1", "ID 2", "ID 3", "ID 4", "ID 5"),
    oc = rep("alert(this.getAttribute(\"data-id\"))", 5)
  )

p <- rect_data |>
  gf_rect_interactive(
    y1 + y2 ~ x1 + x2,
    fill = t,
    tooltip = ~ tooltip,
    onclick = ~ oc,
    data_id = ~ uid,
    color = "black",
    alpha = 0.5,
    linejoin = "bevel",
    lineend = "round"
  ) |>
  gf_text(
    (y1 + (y2 - y1) / 2) ~ (x1 + (x2 - x1) / 2),
    label = ~ r,
    size = 4
    )

if (interactive()) {
 p |> gf_girafe()
}


```
