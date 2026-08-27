# Interactive histograms

Creates an interactive plot using ggiraph. This function extends
[`gf_histogram()`](gf_histogram.md) with interactive features like
tooltips and clickable elements.

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

[`gf_histogram()`](gf_histogram.md), [`gf_girafe()`](gf_girafe.md)

## Examples

``` r
# Interactive histogram with bin information
mtcars |>
  gf_histogram_interactive(
    ~ mpg,
    tooltip = ~ paste0('Min: ', round(after_stat(xmin), 1),
                     '; Max: ', round(after_stat(xmax),1),
                     '; Count: ', after_stat(count)),
    bins = 15) |>
  gf_girafe()

{"x":{"html":"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='ggiraph-svg' role='graphics-document' id='svg_a58f7bf90cafde16' viewBox='0 0 432 360'>\n <defs id='svg_a58f7bf90cafde16_defs'>\n  <clipPath id='svg_a58f7bf90cafde16_c1'>\n   <rect x='0' y='0' width='432' height='360'/>\n  <\/clipPath>\n  <clipPath id='svg_a58f7bf90cafde16_c2'>\n   <rect x='27.9' y='5.48' width='398.62' height='323.64'/>\n  <\/clipPath>\n <\/defs>\n <g id='svg_a58f7bf90cafde16_rootg' class='ggiraph-svg-rootg'>\n  <g clip-path='url(#svg_a58f7bf90cafde16_c1)'>\n   <rect x='0' y='0' width='432' height='360' fill='#FFFFFF' fill-opacity='1' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.75' stroke-linejoin='round' stroke-linecap='round' class='ggiraph-svg-bg'/>\n   <rect x='0' y='0' width='432' height='360' fill='#FFFFFF' fill-opacity='1' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='round'/>\n  <\/g>\n  <g clip-path='url(#svg_a58f7bf90cafde16_c2)'>\n   <rect x='27.9' y='5.48' width='398.62' height='323.64' fill='#FFFFFF' fill-opacity='1' stroke='none'/>\n   <polyline points='27.90,265.37 426.52,265.37' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='27.90,167.30 426.52,167.30' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='27.90,69.23 426.52,69.23' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='88.32,329.12 88.32,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='160.28,329.12 160.28,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='232.25,329.12 232.25,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='304.21,329.12 304.21,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='376.17,329.12 376.17,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='27.90,314.40 426.52,314.40' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='27.90,216.33 426.52,216.33' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='27.90,118.26 426.52,118.26' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='27.90,20.19 426.52,20.19' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='52.34,329.12 52.34,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='124.30,329.12 124.30,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='196.26,329.12 196.26,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='268.23,329.12 268.23,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='340.19,329.12 340.19,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='412.15,329.12 412.15,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <rect id='svg_a58f7bf90cafde16_e1' x='46.02' y='216.33' width='24.16' height='98.07' fill='#595959' fill-opacity='0.5' stroke='none' title='Min: 9.6; Max: 11.2; Count: 2'/>\n   <rect id='svg_a58f7bf90cafde16_e2' x='70.17' y='314.4' width='24.16' height='0' fill='#595959' fill-opacity='0.5' stroke='none' title='Min: 11.2; Max: 12.9; Count: 0'/>\n   <rect id='svg_a58f7bf90cafde16_e3' x='94.33' y='216.33' width='24.16' height='98.07' fill='#595959' fill-opacity='0.5' stroke='none' title='Min: 12.9; Max: 14.6; Count: 2'/>\n   <rect id='svg_a58f7bf90cafde16_e4' x='118.49' y='20.19' width='24.16' height='294.21' fill='#595959' fill-opacity='0.5' stroke='none' title='Min: 14.6; Max: 16.3; Count: 6'/>\n   <rect id='svg_a58f7bf90cafde16_e5' x='142.65' y='167.3' width='24.16' height='147.11' fill='#595959' fill-opacity='0.5' stroke='none' title='Min: 16.3; Max: 18; Count: 3'/>\n   <rect id='svg_a58f7bf90cafde16_e6' x='166.81' y='118.26' width='24.16' height='196.14' fill='#595959' fill-opacity='0.5' stroke='none' title='Min: 18; Max: 19.6; Count: 4'/>\n   <rect id='svg_a58f7bf90cafde16_e7' x='190.97' y='167.3' width='24.16' height='147.11' fill='#595959' fill-opacity='0.5' stroke='none' title='Min: 19.6; Max: 21.3; Count: 3'/>\n   <rect id='svg_a58f7bf90cafde16_e8' x='215.13' y='69.23' width='24.16' height='245.18' fill='#595959' fill-opacity='0.5' stroke='none' title='Min: 21.3; Max: 23; Count: 5'/>\n   <rect id='svg_a58f7bf90cafde16_e9' x='239.29' y='265.37' width='24.16' height='49.04' fill='#595959' fill-opacity='0.5' stroke='none' title='Min: 23; Max: 24.7; Count: 1'/>\n   <rect id='svg_a58f7bf90cafde16_e10' x='263.45' y='265.37' width='24.16' height='49.04' fill='#595959' fill-opacity='0.5' stroke='none' title='Min: 24.7; Max: 26.3; Count: 1'/>\n   <rect id='svg_a58f7bf90cafde16_e11' x='287.61' y='265.37' width='24.16' height='49.04' fill='#595959' fill-opacity='0.5' stroke='none' title='Min: 26.3; Max: 28; Count: 1'/>\n   <rect id='svg_a58f7bf90cafde16_e12' x='311.77' y='314.4' width='24.16' height='0' fill='#595959' fill-opacity='0.5' stroke='none' title='Min: 28; Max: 29.7; Count: 0'/>\n   <rect id='svg_a58f7bf90cafde16_e13' x='335.92' y='216.33' width='24.16' height='98.07' fill='#595959' fill-opacity='0.5' stroke='none' title='Min: 29.7; Max: 31.4; Count: 2'/>\n   <rect id='svg_a58f7bf90cafde16_e14' x='360.08' y='265.37' width='24.16' height='49.04' fill='#595959' fill-opacity='0.5' stroke='none' title='Min: 31.4; Max: 33.1; Count: 1'/>\n   <rect id='svg_a58f7bf90cafde16_e15' x='384.24' y='265.37' width='24.16' height='49.04' fill='#595959' fill-opacity='0.5' stroke='none' title='Min: 33.1; Max: 34.7; Count: 1'/>\n   <rect x='27.9' y='5.48' width='398.62' height='323.64' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='round'/>\n  <\/g>\n  <g clip-path='url(#svg_a58f7bf90cafde16_c1)'>\n   <text x='18.07' y='317.43' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>0<\/text>\n   <text x='18.07' y='219.36' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>2<\/text>\n   <text x='18.07' y='121.29' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>4<\/text>\n   <text x='18.07' y='23.22' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>6<\/text>\n   <polyline points='25.16,314.40 27.90,314.40' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='25.16,216.33 27.90,216.33' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='25.16,118.26 27.90,118.26' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='25.16,20.19 27.90,20.19' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='52.34,331.86 52.34,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='124.30,331.86 124.30,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='196.26,331.86 196.26,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='268.23,331.86 268.23,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='340.19,331.86 340.19,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='412.15,331.86 412.15,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <text x='47.44' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>10<\/text>\n   <text x='119.41' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>15<\/text>\n   <text x='191.37' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>20<\/text>\n   <text x='263.33' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>25<\/text>\n   <text x='335.29' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>30<\/text>\n   <text x='407.26' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>35<\/text>\n   <text x='216.51' y='352.24' font-size='8.25pt' font-family='Liberation Sans'>mpg<\/text>\n   <text transform='translate(13.05,180.76) rotate(-90.00)' font-size='8.25pt' font-family='Liberation Sans'>count<\/text>\n  <\/g>\n <\/g>\n<\/svg>","js":null,"uid":"svg_a58f7bf90cafde16","ratio":1.2,"settings":{"tooltip":{"css":".tooltip_SVGID_ { padding:5px;background:black;color:white;border-radius:2px;text-align:left; ; position:absolute;pointer-events:none;z-index:9999;}","placement":"doc","opacity":0.9,"offx":10,"offy":10,"use_cursor_pos":true,"use_fill":false,"use_stroke":false,"delay_over":200,"delay_out":500},"hover":{"css":".hover_data_SVGID_ { fill:orange;stroke:black;cursor:pointer; }\ntext.hover_data_SVGID_ { stroke:none;fill:orange; }\ncircle.hover_data_SVGID_ { fill:orange;stroke:black; }\nline.hover_data_SVGID_, polyline.hover_data_SVGID_ { fill:none;stroke:orange; }\nrect.hover_data_SVGID_, polygon.hover_data_SVGID_, path.hover_data_SVGID_ { fill:orange;stroke:none; }\nimage.hover_data_SVGID_ { stroke:orange; }","reactive":true,"nearest_distance":null,"linked":false},"hover_inv":{"css":""},"hover_key":{"css":".hover_key_SVGID_ { fill:orange;stroke:black;cursor:pointer; }\ntext.hover_key_SVGID_ { stroke:none;fill:orange; }\ncircle.hover_key_SVGID_ { fill:orange;stroke:black; }\nline.hover_key_SVGID_, polyline.hover_key_SVGID_ { fill:none;stroke:orange; }\nrect.hover_key_SVGID_, polygon.hover_key_SVGID_, path.hover_key_SVGID_ { fill:orange;stroke:none; }\nimage.hover_key_SVGID_ { stroke:orange; }","reactive":true},"hover_theme":{"css":".hover_theme_SVGID_ { fill:orange;stroke:black;cursor:pointer; }\ntext.hover_theme_SVGID_ { stroke:none;fill:orange; }\ncircle.hover_theme_SVGID_ { fill:orange;stroke:black; }\nline.hover_theme_SVGID_, polyline.hover_theme_SVGID_ { fill:none;stroke:orange; }\nrect.hover_theme_SVGID_, polygon.hover_theme_SVGID_, path.hover_theme_SVGID_ { fill:orange;stroke:none; }\nimage.hover_theme_SVGID_ { stroke:orange; }","reactive":true},"select":{"css":".select_data_SVGID_ { fill:red;stroke:black;cursor:pointer; }\ntext.select_data_SVGID_ { stroke:none;fill:red; }\ncircle.select_data_SVGID_ { fill:red;stroke:black; }\nline.select_data_SVGID_, polyline.select_data_SVGID_ { fill:none;stroke:red; }\nrect.select_data_SVGID_, polygon.select_data_SVGID_, path.select_data_SVGID_ { fill:red;stroke:none; }\nimage.select_data_SVGID_ { stroke:red; }","type":"multiple","only_shiny":true,"selected":[],"linked":false},"select_inv":{"css":""},"select_key":{"css":".select_key_SVGID_ { fill:red;stroke:black;cursor:pointer; }\ntext.select_key_SVGID_ { stroke:none;fill:red; }\ncircle.select_key_SVGID_ { fill:red;stroke:black; }\nline.select_key_SVGID_, polyline.select_key_SVGID_ { fill:none;stroke:red; }\nrect.select_key_SVGID_, polygon.select_key_SVGID_, path.select_key_SVGID_ { fill:red;stroke:none; }\nimage.select_key_SVGID_ { stroke:red; }","type":"single","only_shiny":true,"selected":[]},"select_theme":{"css":".select_theme_SVGID_ { fill:red;stroke:black;cursor:pointer; }\ntext.select_theme_SVGID_ { stroke:none;fill:red; }\ncircle.select_theme_SVGID_ { fill:red;stroke:black; }\nline.select_theme_SVGID_, polyline.select_theme_SVGID_ { fill:none;stroke:red; }\nrect.select_theme_SVGID_, polygon.select_theme_SVGID_, path.select_theme_SVGID_ { fill:red;stroke:none; }\nimage.select_theme_SVGID_ { stroke:red; }","type":"single","only_shiny":true,"selected":[]},"zoom":{"min":1,"max":1,"duration":300,"default_on":false},"toolbar":{"position":"topright","pngname":"diagram","tooltips":null,"fixed":false,"hidden":[],"delay_over":200,"delay_out":500},"sizing":{"rescale":true,"width":1}}},"evals":[],"jsHooks":[]}
```
