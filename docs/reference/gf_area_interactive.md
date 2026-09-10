# Interactive area plots

Creates an interactive plot using ggiraph. This function extends
[`gf_area()`](gf_area.md) with interactive features like tooltips and
clickable elements.

## Usage

``` r
gf_area_interactive(
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

  A formula with shape `y ~ x`. Faceting can be achieved by including
  `|` in the formula.

- data:

  The data to be displayed in this layer. There are three options: If
  `NULL`, the default, the data is inherited from the plot data as
  specified in the call to
  [`ggplot()`](https://ggplot2.tidyverse.org/reference/ggplot.html). A
  `data.frame`, or other object, will override the plot data. All
  objects will be fortified to produce a data frame. See
  [`fortify()`](https://ggplot2.tidyverse.org/reference/fortify.html)
  for which variables will be created. A `function` will be called with
  a single argument, the plot data. The return value must be a
  `data.frame`, and will be used as the layer data. A `function` can be
  created from a `formula` (e.g. `~ head(.x, 10)`).

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

A gg object that can be displayed with [`gf_girafe()`](gf_girafe.md).

## Additional interactive features

- `onclick`: JavaScript code (as character string) executed when
  clicking elements.

- Additional ggiraph aesthetics may be available depending on the geom.

## See also

[`gf_area()`](gf_area.md), [`gf_girafe()`](gf_girafe.md)

## Examples

``` r
Huron <-
  data.frame(
    year = 1875:1972,
    level = as.vector(LakeHuron)
  )

Huron |>
  gf_area_interactive(
    level ~ year,
    tooltip = ~ "This is the area.",
    data_id = "id:area",
    fill = "skyblue"
    ) |>
  gf_line_interactive(
    tooltip = ~ "This is the line.",
    data_id = "id:line"
  ) |>
  gf_girafe(
    list(
      options = list(opts_tooltip(css = "fill: steelblue;"))
    )
  )

{"x":{"html":"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='ggiraph-svg' role='graphics-document' id='svg_1c18eca156cc321e' viewBox='0 0 432 360'>\n <defs id='svg_1c18eca156cc321e_defs'>\n  <clipPath id='svg_1c18eca156cc321e_c1'>\n   <rect x='0' y='0' width='432' height='360'/>\n  <\/clipPath>\n  <clipPath id='svg_1c18eca156cc321e_c2'>\n   <rect x='37.69' y='5.48' width='388.83' height='323.64'/>\n  <\/clipPath>\n <\/defs>\n <g id='svg_1c18eca156cc321e_rootg' class='ggiraph-svg-rootg'>\n  <g clip-path='url(#svg_1c18eca156cc321e_c1)'>\n   <rect x='0' y='0' width='432' height='360' fill='#FFFFFF' fill-opacity='1' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.75' stroke-linejoin='round' stroke-linecap='round' class='ggiraph-svg-bg'/>\n   <rect x='0' y='0' width='432' height='360' fill='#FFFFFF' fill-opacity='1' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='round'/>\n  <\/g>\n  <g clip-path='url(#svg_1c18eca156cc321e_c2)'>\n   <rect x='37.69' y='5.48' width='388.83' height='323.64' fill='#EBEBEB' fill-opacity='1' stroke='none'/>\n   <polyline points='37.69,263.84 426.52,263.84' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='37.69,162.71 426.52,162.71' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='37.69,61.58 426.52,61.58' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='100.91,329.12 100.91,5.48' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='192.02,329.12 192.02,5.48' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='283.12,329.12 283.12,5.48' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='374.23,329.12 374.23,5.48' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='37.69,314.40 426.52,314.40' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='37.69,213.28 426.52,213.28' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='37.69,112.15 426.52,112.15' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='37.69,11.02 426.52,11.02' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='55.36,329.12 55.36,5.48' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='146.47,329.12 146.47,5.48' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='237.57,329.12 237.57,5.48' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='328.67,329.12 328.67,5.48' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='419.78,329.12 419.78,5.48' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polygon id='svg_1c18eca156cc321e_e1' points='55.36,20.94 59.01,20.19 62.65,20.64 66.29,20.73 69.94,21.24 73.58,20.93 77.23,20.92 80.87,20.72 84.52,20.42 88.16,20.46 91.80,20.40 95.45,20.28 99.09,20.54 102.74,20.86 106.38,21.13 110.02,21.18 113.67,21.57 117.31,21.56 120.96,21.36 124.60,21.30 128.25,21.92 131.89,22.02 135.53,21.59 139.18,21.59 142.82,21.46 146.47,21.73 150.11,21.47 153.75,21.63 157.40,21.64 161.04,21.23 164.69,21.22 168.33,21.27 171.98,21.19 175.62,21.13 179.26,21.45 182.91,21.79 186.55,22.05 190.20,21.80 193.84,21.36 197.48,21.68 201.13,22.10 204.77,21.45 208.42,21.06 212.06,21.06 215.71,21.38 219.35,21.51 222.99,21.81 226.64,21.71 230.28,22.12 233.93,22.25 237.57,22.77 241.21,22.77 244.86,22.23 248.50,21.82 252.15,20.84 255.79,21.39 259.44,22.46 263.08,22.70 266.72,22.68 270.37,23.03 274.01,22.73 277.66,22.72 281.30,22.70 284.94,22.25 288.59,22.05 292.23,22.39 295.88,22.53 299.52,21.93 303.17,21.33 306.81,21.61 310.45,21.50 314.10,21.53 317.74,21.44 321.39,21.59 325.03,22.17 328.67,22.08 332.32,21.26 335.96,20.70 339.61,20.92 343.25,21.15 346.90,21.33 350.54,21.76 354.18,22.05 357.83,22.54 361.47,22.58 365.12,21.59 368.76,22.02 372.40,22.19 376.05,22.70 379.69,23.17 383.34,22.75 386.98,22.30 390.63,21.95 394.27,21.88 397.91,21.26 401.56,21.48 405.20,21.19 408.85,21.15 408.85,314.40 405.20,314.40 401.56,314.40 397.91,314.40 394.27,314.40 390.63,314.40 386.98,314.40 383.34,314.40 379.69,314.40 376.05,314.40 372.40,314.40 368.76,314.40 365.12,314.40 361.47,314.40 357.83,314.40 354.18,314.40 350.54,314.40 346.90,314.40 343.25,314.40 339.61,314.40 335.96,314.40 332.32,314.40 328.67,314.40 325.03,314.40 321.39,314.40 317.74,314.40 314.10,314.40 310.45,314.40 306.81,314.40 303.17,314.40 299.52,314.40 295.88,314.40 292.23,314.40 288.59,314.40 284.94,314.40 281.30,314.40 277.66,314.40 274.01,314.40 270.37,314.40 266.72,314.40 263.08,314.40 259.44,314.40 255.79,314.40 252.15,314.40 248.50,314.40 244.86,314.40 241.21,314.40 237.57,314.40 233.93,314.40 230.28,314.40 226.64,314.40 222.99,314.40 219.35,314.40 215.71,314.40 212.06,314.40 208.42,314.40 204.77,314.40 201.13,314.40 197.48,314.40 193.84,314.40 190.20,314.40 186.55,314.40 182.91,314.40 179.26,314.40 175.62,314.40 171.98,314.40 168.33,314.40 164.69,314.40 161.04,314.40 157.40,314.40 153.75,314.40 150.11,314.40 146.47,314.40 142.82,314.40 139.18,314.40 135.53,314.40 131.89,314.40 128.25,314.40 124.60,314.40 120.96,314.40 117.31,314.40 113.67,314.40 110.02,314.40 106.38,314.40 102.74,314.40 99.09,314.40 95.45,314.40 91.80,314.40 88.16,314.40 84.52,314.40 80.87,314.40 77.23,314.40 73.58,314.40 69.94,314.40 66.29,314.40 62.65,314.40 59.01,314.40 55.36,314.40' fill='#87CEEB' fill-opacity='1' stroke='none' title='This is the area.' data-id='id:area'/>\n   <polyline id='svg_1c18eca156cc321e_e2' points='55.36,20.94 59.01,20.19 62.65,20.64 66.29,20.73 69.94,21.24 73.58,20.93 77.23,20.92 80.87,20.72 84.52,20.42 88.16,20.46 91.80,20.40 95.45,20.28 99.09,20.54 102.74,20.86 106.38,21.13 110.02,21.18 113.67,21.57 117.31,21.56 120.96,21.36 124.60,21.30 128.25,21.92 131.89,22.02 135.53,21.59 139.18,21.59 142.82,21.46 146.47,21.73 150.11,21.47 153.75,21.63 157.40,21.64 161.04,21.23 164.69,21.22 168.33,21.27 171.98,21.19 175.62,21.13 179.26,21.45 182.91,21.79 186.55,22.05 190.20,21.80 193.84,21.36 197.48,21.68 201.13,22.10 204.77,21.45 208.42,21.06 212.06,21.06 215.71,21.38 219.35,21.51 222.99,21.81 226.64,21.71 230.28,22.12 233.93,22.25 237.57,22.77 241.21,22.77 244.86,22.23 248.50,21.82 252.15,20.84 255.79,21.39 259.44,22.46 263.08,22.70 266.72,22.68 270.37,23.03 274.01,22.73 277.66,22.72 281.30,22.70 284.94,22.25 288.59,22.05 292.23,22.39 295.88,22.53 299.52,21.93 303.17,21.33 306.81,21.61 310.45,21.50 314.10,21.53 317.74,21.44 321.39,21.59 325.03,22.17 328.67,22.08 332.32,21.26 335.96,20.70 339.61,20.92 343.25,21.15 346.90,21.33 350.54,21.76 354.18,22.05 357.83,22.54 361.47,22.58 365.12,21.59 368.76,22.02 372.40,22.19 376.05,22.70 379.69,23.17 383.34,22.75 386.98,22.30 390.63,21.95 394.27,21.88 397.91,21.26 401.56,21.48 405.20,21.19 408.85,21.15' fill='none' stroke='none' title='This is the area.' data-id='id:area'/>\n   <polyline id='svg_1c18eca156cc321e_e3' points='55.36,20.94 59.01,20.19 62.65,20.64 66.29,20.73 69.94,21.24 73.58,20.93 77.23,20.92 80.87,20.72 84.52,20.42 88.16,20.46 91.80,20.40 95.45,20.28 99.09,20.54 102.74,20.86 106.38,21.13 110.02,21.18 113.67,21.57 117.31,21.56 120.96,21.36 124.60,21.30 128.25,21.92 131.89,22.02 135.53,21.59 139.18,21.59 142.82,21.46 146.47,21.73 150.11,21.47 153.75,21.63 157.40,21.64 161.04,21.23 164.69,21.22 168.33,21.27 171.98,21.19 175.62,21.13 179.26,21.45 182.91,21.79 186.55,22.05 190.20,21.80 193.84,21.36 197.48,21.68 201.13,22.10 204.77,21.45 208.42,21.06 212.06,21.06 215.71,21.38 219.35,21.51 222.99,21.81 226.64,21.71 230.28,22.12 233.93,22.25 237.57,22.77 241.21,22.77 244.86,22.23 248.50,21.82 252.15,20.84 255.79,21.39 259.44,22.46 263.08,22.70 266.72,22.68 270.37,23.03 274.01,22.73 277.66,22.72 281.30,22.70 284.94,22.25 288.59,22.05 292.23,22.39 295.88,22.53 299.52,21.93 303.17,21.33 306.81,21.61 310.45,21.50 314.10,21.53 317.74,21.44 321.39,21.59 325.03,22.17 328.67,22.08 332.32,21.26 335.96,20.70 339.61,20.92 343.25,21.15 346.90,21.33 350.54,21.76 354.18,22.05 357.83,22.54 361.47,22.58 365.12,21.59 368.76,22.02 372.40,22.19 376.05,22.70 379.69,23.17 383.34,22.75 386.98,22.30 390.63,21.95 394.27,21.88 397.91,21.26 401.56,21.48 405.20,21.19 408.85,21.15' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' title='This is the line.' data-id='id:line'/>\n  <\/g>\n  <g clip-path='url(#svg_1c18eca156cc321e_c1)'>\n   <text x='27.86' y='317.43' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>0<\/text>\n   <text x='18.07' y='216.3' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>200<\/text>\n   <text x='18.07' y='115.17' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>400<\/text>\n   <text x='18.07' y='14.05' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>600<\/text>\n   <polyline points='34.95,314.40 37.69,314.40' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='34.95,213.28 37.69,213.28' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='34.95,112.15 37.69,112.15' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='34.95,11.02 37.69,11.02' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='55.36,331.86 55.36,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='146.47,331.86 146.47,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='237.57,331.86 237.57,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='328.67,331.86 328.67,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='419.78,331.86 419.78,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <text x='45.57' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>1875<\/text>\n   <text x='136.67' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>1900<\/text>\n   <text x='227.78' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>1925<\/text>\n   <text x='318.88' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>1950<\/text>\n   <text x='409.99' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>1975<\/text>\n   <text x='221.4' y='352.24' font-size='8.25pt' font-family='Liberation Sans'>year<\/text>\n   <text transform='translate(13.05,178.61) rotate(-90.00)' font-size='8.25pt' font-family='Liberation Sans'>level<\/text>\n  <\/g>\n <\/g>\n<\/svg>","js":null,"uid":"svg_1c18eca156cc321e","ratio":1.2,"settings":{"tooltip":{"css":".tooltip_SVGID_ { padding:5px;background:black;color:white;border-radius:2px;text-align:left; ; position:absolute;pointer-events:none;z-index:9999;}","placement":"doc","opacity":0.9,"offx":10,"offy":10,"use_cursor_pos":true,"use_fill":false,"use_stroke":false,"delay_over":200,"delay_out":500},"hover":{"css":".hover_data_SVGID_ { fill:orange;stroke:black;cursor:pointer; }\ntext.hover_data_SVGID_ { stroke:none;fill:orange; }\ncircle.hover_data_SVGID_ { fill:orange;stroke:black; }\nline.hover_data_SVGID_, polyline.hover_data_SVGID_ { fill:none;stroke:orange; }\nrect.hover_data_SVGID_, polygon.hover_data_SVGID_, path.hover_data_SVGID_ { fill:orange;stroke:none; }\nimage.hover_data_SVGID_ { stroke:orange; }","reactive":true,"nearest_distance":null,"linked":false},"hover_inv":{"css":""},"hover_key":{"css":".hover_key_SVGID_ { fill:orange;stroke:black;cursor:pointer; }\ntext.hover_key_SVGID_ { stroke:none;fill:orange; }\ncircle.hover_key_SVGID_ { fill:orange;stroke:black; }\nline.hover_key_SVGID_, polyline.hover_key_SVGID_ { fill:none;stroke:orange; }\nrect.hover_key_SVGID_, polygon.hover_key_SVGID_, path.hover_key_SVGID_ { fill:orange;stroke:none; }\nimage.hover_key_SVGID_ { stroke:orange; }","reactive":true},"hover_theme":{"css":".hover_theme_SVGID_ { fill:orange;stroke:black;cursor:pointer; }\ntext.hover_theme_SVGID_ { stroke:none;fill:orange; }\ncircle.hover_theme_SVGID_ { fill:orange;stroke:black; }\nline.hover_theme_SVGID_, polyline.hover_theme_SVGID_ { fill:none;stroke:orange; }\nrect.hover_theme_SVGID_, polygon.hover_theme_SVGID_, path.hover_theme_SVGID_ { fill:orange;stroke:none; }\nimage.hover_theme_SVGID_ { stroke:orange; }","reactive":true},"select":{"css":".select_data_SVGID_ { fill:red;stroke:black;cursor:pointer; }\ntext.select_data_SVGID_ { stroke:none;fill:red; }\ncircle.select_data_SVGID_ { fill:red;stroke:black; }\nline.select_data_SVGID_, polyline.select_data_SVGID_ { fill:none;stroke:red; }\nrect.select_data_SVGID_, polygon.select_data_SVGID_, path.select_data_SVGID_ { fill:red;stroke:none; }\nimage.select_data_SVGID_ { stroke:red; }","type":"multiple","only_shiny":true,"selected":[],"linked":false},"select_inv":{"css":""},"select_key":{"css":".select_key_SVGID_ { fill:red;stroke:black;cursor:pointer; }\ntext.select_key_SVGID_ { stroke:none;fill:red; }\ncircle.select_key_SVGID_ { fill:red;stroke:black; }\nline.select_key_SVGID_, polyline.select_key_SVGID_ { fill:none;stroke:red; }\nrect.select_key_SVGID_, polygon.select_key_SVGID_, path.select_key_SVGID_ { fill:red;stroke:none; }\nimage.select_key_SVGID_ { stroke:red; }","type":"single","only_shiny":true,"selected":[]},"select_theme":{"css":".select_theme_SVGID_ { fill:red;stroke:black;cursor:pointer; }\ntext.select_theme_SVGID_ { stroke:none;fill:red; }\ncircle.select_theme_SVGID_ { fill:red;stroke:black; }\nline.select_theme_SVGID_, polyline.select_theme_SVGID_ { fill:none;stroke:red; }\nrect.select_theme_SVGID_, polygon.select_theme_SVGID_, path.select_theme_SVGID_ { fill:red;stroke:none; }\nimage.select_theme_SVGID_ { stroke:red; }","type":"single","only_shiny":true,"selected":[]},"zoom":{"min":1,"max":1,"duration":300,"default_on":false},"toolbar":{"position":"topright","pngname":"diagram","tooltips":null,"fixed":false,"hidden":[],"delay_over":200,"delay_out":500},"sizing":{"rescale":true,"width":1}}},"evals":[],"jsHooks":[]}
```
