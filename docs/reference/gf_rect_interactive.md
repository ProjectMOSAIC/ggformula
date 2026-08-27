# Interactive rect plots

Creates an interactive plot using ggiraph. This function extends
[`gf_rect()`](gf_rect.md) with interactive features like tooltips and
clickable elements.

## Arguments

- object:

  When chaining, this holds an object produced in the earlier portions
  of the chain. Most users can safely ignore this argument.

- gformula:

  A formula with shape `y ~ x`. Faceting can be achieved by including
  `|` in the formula.

- data:

  The data to be displayed in this layer.

- tooltip:

  A formula specifying a variable for tooltips, or a character vector.

- data_id:

  A formula or character vector specifying data identifiers for
  interactive selection.

- ...:

  Additional arguments passed to the underlying geom.

- alpha, color, size, shape, fill, group, stroke:

  Aesthetics passed to the geom.

- xlab, ylab, title, subtitle, caption:

  Labels for the plot.

- show.legend:

  Logical. Should this layer be included in the legends?

- show.help:

  Logical. If `TRUE`, display some minimal help.

- inherit:

  Logical. If `TRUE`, inherit aesthetics from previous layers.

- environment:

  An environment in which to evaluate the formula.

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
