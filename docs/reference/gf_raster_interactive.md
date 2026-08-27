# Interactive raster plots

Creates an interactive plot using ggiraph. This function extends
[`gf_raster()`](gf_raster.md) with interactive features like tooltips
and clickable elements.

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

[`gf_raster()`](gf_raster.md), [`gf_girafe()`](gf_girafe.md)

## Examples

``` r
gf_raster_interactive(mpg ~ wt, data = mtcars,
                     tooltip = ~ paste("MPG:", mpg)) |>
  gf_girafe()
#> Warning: Raster pixels are placed at uneven horizontal intervals and will be shifted
#> ℹ Consider using `geom_tile()` instead.
#> Warning: Raster pixels are placed at uneven horizontal intervals and will be shifted
#> ℹ Consider using `geom_tile()` instead.

{"x":{"html":"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='ggiraph-svg' role='graphics-document' id='svg_a9957ce0903ff2a0' viewBox='0 0 432 360'>\n <defs id='svg_a9957ce0903ff2a0_defs'>\n  <clipPath id='svg_a9957ce0903ff2a0_c1'>\n   <rect x='0' y='0' width='432' height='360'/>\n  <\/clipPath>\n  <clipPath id='svg_a9957ce0903ff2a0_c2'>\n   <rect x='32.79' y='5.48' width='393.73' height='323.64'/>\n  <\/clipPath>\n <\/defs>\n <g id='svg_a9957ce0903ff2a0_rootg' class='ggiraph-svg-rootg'>\n  <g clip-path='url(#svg_a9957ce0903ff2a0_c1)'>\n   <rect x='0' y='0' width='432' height='360' fill='#FFFFFF' fill-opacity='1' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.75' stroke-linejoin='round' stroke-linecap='round' class='ggiraph-svg-bg'/>\n   <rect x='0' y='0' width='432' height='360' fill='#FFFFFF' fill-opacity='1' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='round'/>\n  <\/g>\n  <g clip-path='url(#svg_a9957ce0903ff2a0_c2)'>\n   <rect x='32.79' y='5.48' width='393.73' height='323.64' fill='#FFFFFF' fill-opacity='1' stroke='none'/>\n   <polyline points='32.79,287.60 426.52,287.60' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,225.27 426.52,225.27' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,162.93 426.52,162.93' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,100.60 426.52,100.60' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,38.27 426.52,38.27' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='49.73,329.12 49.73,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='141.13,329.12 141.13,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='232.54,329.12 232.54,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='323.94,329.12 323.94,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='415.34,329.12 415.34,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,318.77 426.52,318.77' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,256.43 426.52,256.43' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,194.10 426.52,194.10' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,131.77 426.52,131.77' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,69.43 426.52,69.43' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,7.10 426.52,7.10' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='95.43,329.12 95.43,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='186.83,329.12 186.83,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='278.24,329.12 278.24,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='369.64,329.12 369.64,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <image id='svg_a9957ce0903ff2a0_e1' x='50.69' y='20.19' width='357.93' height='294.21' preserveAspectRatio='none' image-rendering='pixelated' xlink:href='data:image/png;base64,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' xmlns:xlink='http://www.w3.org/1999/xlink' title='MPG: 21'/>\n   <rect x='32.79' y='5.48' width='393.73' height='323.64' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='round'/>\n  <\/g>\n  <g clip-path='url(#svg_a9957ce0903ff2a0_c1)'>\n   <text x='18.07' y='321.8' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>10<\/text>\n   <text x='18.07' y='259.46' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>15<\/text>\n   <text x='18.07' y='197.13' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>20<\/text>\n   <text x='18.07' y='134.8' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>25<\/text>\n   <text x='18.07' y='72.46' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>30<\/text>\n   <text x='18.07' y='10.13' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>35<\/text>\n   <polyline points='30.05,318.77 32.79,318.77' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='30.05,256.43 32.79,256.43' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='30.05,194.10 32.79,194.10' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='30.05,131.77 32.79,131.77' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='30.05,69.43 32.79,69.43' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='30.05,7.10 32.79,7.10' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='95.43,331.86 95.43,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='186.83,331.86 186.83,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='278.24,331.86 278.24,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='369.64,331.86 369.64,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <text x='92.98' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>2<\/text>\n   <text x='184.39' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>3<\/text>\n   <text x='275.79' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>4<\/text>\n   <text x='367.19' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>5<\/text>\n   <text x='224.16' y='352.24' font-size='8.25pt' font-family='Liberation Sans'>wt<\/text>\n   <text transform='translate(13.05,178.00) rotate(-90.00)' font-size='8.25pt' font-family='Liberation Sans'>mpg<\/text>\n  <\/g>\n <\/g>\n<\/svg>","js":null,"uid":"svg_a9957ce0903ff2a0","ratio":1.2,"settings":{"tooltip":{"css":".tooltip_SVGID_ { padding:5px;background:black;color:white;border-radius:2px;text-align:left; ; position:absolute;pointer-events:none;z-index:9999;}","placement":"doc","opacity":0.9,"offx":10,"offy":10,"use_cursor_pos":true,"use_fill":false,"use_stroke":false,"delay_over":200,"delay_out":500},"hover":{"css":".hover_data_SVGID_ { fill:orange;stroke:black;cursor:pointer; }\ntext.hover_data_SVGID_ { stroke:none;fill:orange; }\ncircle.hover_data_SVGID_ { fill:orange;stroke:black; }\nline.hover_data_SVGID_, polyline.hover_data_SVGID_ { fill:none;stroke:orange; }\nrect.hover_data_SVGID_, polygon.hover_data_SVGID_, path.hover_data_SVGID_ { fill:orange;stroke:none; }\nimage.hover_data_SVGID_ { stroke:orange; }","reactive":true,"nearest_distance":null,"linked":false},"hover_inv":{"css":""},"hover_key":{"css":".hover_key_SVGID_ { fill:orange;stroke:black;cursor:pointer; }\ntext.hover_key_SVGID_ { stroke:none;fill:orange; }\ncircle.hover_key_SVGID_ { fill:orange;stroke:black; }\nline.hover_key_SVGID_, polyline.hover_key_SVGID_ { fill:none;stroke:orange; }\nrect.hover_key_SVGID_, polygon.hover_key_SVGID_, path.hover_key_SVGID_ { fill:orange;stroke:none; }\nimage.hover_key_SVGID_ { stroke:orange; }","reactive":true},"hover_theme":{"css":".hover_theme_SVGID_ { fill:orange;stroke:black;cursor:pointer; }\ntext.hover_theme_SVGID_ { stroke:none;fill:orange; }\ncircle.hover_theme_SVGID_ { fill:orange;stroke:black; }\nline.hover_theme_SVGID_, polyline.hover_theme_SVGID_ { fill:none;stroke:orange; }\nrect.hover_theme_SVGID_, polygon.hover_theme_SVGID_, path.hover_theme_SVGID_ { fill:orange;stroke:none; }\nimage.hover_theme_SVGID_ { stroke:orange; }","reactive":true},"select":{"css":".select_data_SVGID_ { fill:red;stroke:black;cursor:pointer; }\ntext.select_data_SVGID_ { stroke:none;fill:red; }\ncircle.select_data_SVGID_ { fill:red;stroke:black; }\nline.select_data_SVGID_, polyline.select_data_SVGID_ { fill:none;stroke:red; }\nrect.select_data_SVGID_, polygon.select_data_SVGID_, path.select_data_SVGID_ { fill:red;stroke:none; }\nimage.select_data_SVGID_ { stroke:red; }","type":"multiple","only_shiny":true,"selected":[],"linked":false},"select_inv":{"css":""},"select_key":{"css":".select_key_SVGID_ { fill:red;stroke:black;cursor:pointer; }\ntext.select_key_SVGID_ { stroke:none;fill:red; }\ncircle.select_key_SVGID_ { fill:red;stroke:black; }\nline.select_key_SVGID_, polyline.select_key_SVGID_ { fill:none;stroke:red; }\nrect.select_key_SVGID_, polygon.select_key_SVGID_, path.select_key_SVGID_ { fill:red;stroke:none; }\nimage.select_key_SVGID_ { stroke:red; }","type":"single","only_shiny":true,"selected":[]},"select_theme":{"css":".select_theme_SVGID_ { fill:red;stroke:black;cursor:pointer; }\ntext.select_theme_SVGID_ { stroke:none;fill:red; }\ncircle.select_theme_SVGID_ { fill:red;stroke:black; }\nline.select_theme_SVGID_, polyline.select_theme_SVGID_ { fill:none;stroke:red; }\nrect.select_theme_SVGID_, polygon.select_theme_SVGID_, path.select_theme_SVGID_ { fill:red;stroke:none; }\nimage.select_theme_SVGID_ { stroke:red; }","type":"single","only_shiny":true,"selected":[]},"zoom":{"min":1,"max":1,"duration":300,"default_on":false},"toolbar":{"position":"topright","pngname":"diagram","tooltips":null,"fixed":false,"hidden":[],"delay_over":200,"delay_out":500},"sizing":{"rescale":true,"width":1}}},"evals":[],"jsHooks":[]}
```
