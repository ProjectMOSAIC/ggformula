# Interactive step plots

Creates an interactive plot using ggiraph. This function extends
[`gf_step()`](gf_step.md) with interactive features like tooltips and
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

[`gf_step()`](gf_step.md), [`gf_girafe()`](gf_girafe.md)

## Examples

``` r
if (require(dplyr)) {
  mtcars |>
    group_by(cyl) |>
    mutate(ecdf = ecdf(mpg)(mpg)) |>
    gf_step_interactive(
      ecdf ~ mpg,
      group = ~ cyl,
      color = ~ factor(cyl),
      tooltip = ~ paste(cyl, "cylinders"),
      data_id = ~ mpg,
      hover_nearest = TRUE) |>
    gf_labs(color = "cylinders") |>
    gf_girafe()
}

{"x":{"html":"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='ggiraph-svg' role='graphics-document' id='svg_e05e256c01d09335' viewBox='0 0 432 360'>\n <defs id='svg_e05e256c01d09335_defs'>\n  <clipPath id='svg_e05e256c01d09335_c1'>\n   <rect x='0' y='0' width='432' height='360'/>\n  <\/clipPath>\n  <clipPath id='svg_e05e256c01d09335_c2'>\n   <rect x='40.14' y='5.48' width='321.06' height='323.64'/>\n  <\/clipPath>\n <\/defs>\n <g id='svg_e05e256c01d09335_rootg' class='ggiraph-svg-rootg'>\n  <g clip-path='url(#svg_e05e256c01d09335_c1)'>\n   <rect x='0' y='0' width='432' height='360' fill='#FFFFFF' fill-opacity='1' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.75' stroke-linejoin='round' stroke-linecap='round' class='ggiraph-svg-bg'/>\n   <rect x='0' y='0' width='432' height='360' fill='#FFFFFF' fill-opacity='1' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='round'/>\n  <\/g>\n  <g clip-path='url(#svg_e05e256c01d09335_c2)'>\n   <rect x='40.14' y='5.48' width='321.06' height='323.64' fill='#FFFFFF' fill-opacity='1' stroke='none'/>\n   <polyline points='40.14,303.37 361.19,303.37' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='40.14,222.46 361.19,222.46' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='40.14,141.55 361.19,141.55' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='40.14,60.64 361.19,60.64' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='80.81,329.12 80.81,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='142.91,329.12 142.91,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='205.01,329.12 205.01,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='267.11,329.12 267.11,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='329.21,329.12 329.21,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='40.14,262.92 361.19,262.92' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='40.14,182.01 361.19,182.01' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='40.14,101.10 361.19,101.10' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='40.14,20.19 361.19,20.19' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='49.76,329.12 49.76,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='111.86,329.12 111.86,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='173.96,329.12 173.96,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='236.06,329.12 236.06,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='298.16,329.12 298.16,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='360.26,329.12 360.26,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline id='svg_e05e256c01d09335_e1' points='191.35,314.40 192.59,314.40 192.59,284.98 208.74,284.98 208.74,226.14 208.74,226.14 208.74,226.14 228.61,226.14 228.61,196.72 248.48,196.72 248.48,167.30 264.63,167.30 264.63,137.88 303.13,137.88 303.13,79.03 303.13,79.03 303.13,79.03 327.97,79.03 327.97,49.61 346.60,49.61 346.60,20.19' fill='none' stroke='#F8766D' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' title='4 cylinders' data-id='21.4' nearest='true'/>\n   <polyline id='svg_e05e256c01d09335_e2' points='146.64,297.59 150.36,297.59 150.36,251.36 164.03,251.36 164.03,205.13 170.24,205.13 170.24,158.89 186.38,158.89 186.38,66.42 186.38,66.42 186.38,66.42 191.35,66.42 191.35,20.19' fill='none' stroke='#00BA38' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' title='6 cylinders' data-id='17.8' nearest='true'/>\n   <polyline id='svg_e05e256c01d09335_e3' points='54.73,297.59 54.73,297.59 54.73,297.59 90.75,297.59 90.75,274.48 103.17,274.48 103.17,251.36 108.14,251.36 108.14,228.24 111.86,228.24 111.86,205.13 114.35,205.13 114.35,158.89 114.35,158.89 114.35,158.89 118.07,158.89 118.07,135.77 121.80,135.77 121.80,112.66 129.25,112.66 129.25,89.54 140.43,89.54 140.43,66.42 157.82,66.42 157.82,43.31 164.03,43.31 164.03,20.19' fill='none' stroke='#619CFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' title='8 cylinders' data-id='10.4' nearest='true'/>\n   <rect x='40.14' y='5.48' width='321.06' height='323.64' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='round'/>\n  <\/g>\n  <g clip-path='url(#svg_e05e256c01d09335_c1)'>\n   <text x='18.07' y='265.94' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>0.25<\/text>\n   <text x='18.07' y='185.04' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>0.50<\/text>\n   <text x='18.07' y='104.13' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>0.75<\/text>\n   <text x='18.07' y='23.22' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>1.00<\/text>\n   <polyline points='37.40,262.92 40.14,262.92' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='37.40,182.01 40.14,182.01' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='37.40,101.10 40.14,101.10' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='37.40,20.19 40.14,20.19' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='49.76,331.86 49.76,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='111.86,331.86 111.86,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='173.96,331.86 173.96,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='236.06,331.86 236.06,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='298.16,331.86 298.16,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='360.26,331.86 360.26,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <text x='44.87' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>10<\/text>\n   <text x='106.97' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>15<\/text>\n   <text x='169.07' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>20<\/text>\n   <text x='231.17' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>25<\/text>\n   <text x='293.27' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>30<\/text>\n   <text x='355.37' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>35<\/text>\n   <text x='189.96' y='352.24' font-size='8.25pt' font-family='Liberation Sans'>mpg<\/text>\n   <text transform='translate(13.05,177.70) rotate(-90.00)' font-size='8.25pt' font-family='Liberation Sans'>ecdf<\/text>\n   <rect x='372.15' y='128.23' width='54.37' height='78.13' fill='#FFFFFF' fill-opacity='1' stroke='none'/>\n   <text x='377.63' y='142.42' font-size='8.25pt' font-family='Liberation Sans'>cylinders<\/text>\n   <rect x='377.63' y='149.04' width='17.28' height='17.28' fill='#FFFFFF' fill-opacity='1' stroke='none'/>\n   <line id='svg_e05e256c01d09335_e4' x1='379.36' y1='157.68' x2='393.18' y2='157.68' stroke='#F8766D' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' nearest='true'/>\n   <rect x='377.63' y='166.32' width='17.28' height='17.28' fill='#FFFFFF' fill-opacity='1' stroke='none'/>\n   <line id='svg_e05e256c01d09335_e5' x1='379.36' y1='174.96' x2='393.18' y2='174.96' stroke='#00BA38' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' nearest='true'/>\n   <rect x='377.63' y='183.6' width='17.28' height='17.28' fill='#FFFFFF' fill-opacity='1' stroke='none'/>\n   <line id='svg_e05e256c01d09335_e6' x1='379.36' y1='192.24' x2='393.18' y2='192.24' stroke='#619CFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' nearest='true'/>\n   <text x='400.39' y='160.71' font-size='6.6pt' font-family='Liberation Sans'>4<\/text>\n   <text x='400.39' y='177.99' font-size='6.6pt' font-family='Liberation Sans'>6<\/text>\n   <text x='400.39' y='195.27' font-size='6.6pt' font-family='Liberation Sans'>8<\/text>\n  <\/g>\n <\/g>\n<\/svg>","js":null,"uid":"svg_e05e256c01d09335","ratio":1.2,"settings":{"tooltip":{"css":".tooltip_SVGID_ { padding:5px;background:black;color:white;border-radius:2px;text-align:left; ; position:absolute;pointer-events:none;z-index:9999;}","placement":"doc","opacity":0.9,"offx":10,"offy":10,"use_cursor_pos":true,"use_fill":false,"use_stroke":false,"delay_over":200,"delay_out":500},"hover":{"css":".hover_data_SVGID_ { fill:orange;stroke:black;cursor:pointer; }\ntext.hover_data_SVGID_ { stroke:none;fill:orange; }\ncircle.hover_data_SVGID_ { fill:orange;stroke:black; }\nline.hover_data_SVGID_, polyline.hover_data_SVGID_ { fill:none;stroke:orange; }\nrect.hover_data_SVGID_, polygon.hover_data_SVGID_, path.hover_data_SVGID_ { fill:orange;stroke:none; }\nimage.hover_data_SVGID_ { stroke:orange; }","reactive":true,"nearest_distance":null,"linked":false},"hover_inv":{"css":""},"hover_key":{"css":".hover_key_SVGID_ { fill:orange;stroke:black;cursor:pointer; }\ntext.hover_key_SVGID_ { stroke:none;fill:orange; }\ncircle.hover_key_SVGID_ { fill:orange;stroke:black; }\nline.hover_key_SVGID_, polyline.hover_key_SVGID_ { fill:none;stroke:orange; }\nrect.hover_key_SVGID_, polygon.hover_key_SVGID_, path.hover_key_SVGID_ { fill:orange;stroke:none; }\nimage.hover_key_SVGID_ { stroke:orange; }","reactive":true},"hover_theme":{"css":".hover_theme_SVGID_ { fill:orange;stroke:black;cursor:pointer; }\ntext.hover_theme_SVGID_ { stroke:none;fill:orange; }\ncircle.hover_theme_SVGID_ { fill:orange;stroke:black; }\nline.hover_theme_SVGID_, polyline.hover_theme_SVGID_ { fill:none;stroke:orange; }\nrect.hover_theme_SVGID_, polygon.hover_theme_SVGID_, path.hover_theme_SVGID_ { fill:orange;stroke:none; }\nimage.hover_theme_SVGID_ { stroke:orange; }","reactive":true},"select":{"css":".select_data_SVGID_ { fill:red;stroke:black;cursor:pointer; }\ntext.select_data_SVGID_ { stroke:none;fill:red; }\ncircle.select_data_SVGID_ { fill:red;stroke:black; }\nline.select_data_SVGID_, polyline.select_data_SVGID_ { fill:none;stroke:red; }\nrect.select_data_SVGID_, polygon.select_data_SVGID_, path.select_data_SVGID_ { fill:red;stroke:none; }\nimage.select_data_SVGID_ { stroke:red; }","type":"multiple","only_shiny":true,"selected":[],"linked":false},"select_inv":{"css":""},"select_key":{"css":".select_key_SVGID_ { fill:red;stroke:black;cursor:pointer; }\ntext.select_key_SVGID_ { stroke:none;fill:red; }\ncircle.select_key_SVGID_ { fill:red;stroke:black; }\nline.select_key_SVGID_, polyline.select_key_SVGID_ { fill:none;stroke:red; }\nrect.select_key_SVGID_, polygon.select_key_SVGID_, path.select_key_SVGID_ { fill:red;stroke:none; }\nimage.select_key_SVGID_ { stroke:red; }","type":"single","only_shiny":true,"selected":[]},"select_theme":{"css":".select_theme_SVGID_ { fill:red;stroke:black;cursor:pointer; }\ntext.select_theme_SVGID_ { stroke:none;fill:red; }\ncircle.select_theme_SVGID_ { fill:red;stroke:black; }\nline.select_theme_SVGID_, polyline.select_theme_SVGID_ { fill:none;stroke:red; }\nrect.select_theme_SVGID_, polygon.select_theme_SVGID_, path.select_theme_SVGID_ { fill:red;stroke:none; }\nimage.select_theme_SVGID_ { stroke:red; }","type":"single","only_shiny":true,"selected":[]},"zoom":{"min":1,"max":1,"duration":300,"default_on":false},"toolbar":{"position":"topright","pngname":"diagram","tooltips":null,"fixed":false,"hidden":[],"delay_over":200,"delay_out":500},"sizing":{"rescale":true,"width":1}}},"evals":[],"jsHooks":[]}
```
