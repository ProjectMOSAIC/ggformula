# Interactive curve plots

Creates an interactive plot using ggiraph. These functions extend
[`gf_segment()`](gf_segment.md) and [`gf_curve()`](gf_curve.md) with
interactive features like tooltips and clickable elements.

Creates an interactive plot using ggiraph. This function extends
[`gf_segment()`](gf_segment.md) with interactive features like tooltips
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

A gg object that can be displayed with [`gf_girafe()`](gf_girafe.md).

## Additional interactive features

- `onclick`: JavaScript code (as character string) executed when
  clicking elements.

- Additional ggiraph aesthetics may be available depending on the geom.

&nbsp;

- `onclick`: JavaScript code (as character string) executed when
  clicking elements.

- Additional ggiraph aesthetics may be available depending on the geom.

## See also

[`gf_curve()`](gf_curve.md), [`gf_girafe()`](gf_girafe.md)

[`gf_segment()`](gf_segment.md), [`gf_girafe()`](gf_girafe.md)

## Examples

``` r
  gf_curve_interactive(
    1 + 2 ~ 0 + 4, color = "red", curvature = - 0.2,
    tooltip = ~ "curvature: -0.2",
    data_id = 0.2
  ) |>
  gf_curve_interactive(
    1 + 2 ~ 0 + 4, color = "blue", curvature = 0.4,
    tooltip = ~ "curvature: 0.4",
    data_id = 0.4) |>
  gf_segment_interactive(
    1 + 2 ~ 0 + 4, color = "green",
    tooltip = ~ "curvature: 0",
    data_id = 0
  ) |>
  gf_girafe(
    options = list(
      opts_hover(css = "stroke: black; stroke-width: 3;", nearest_distance = 10)
    )
  )

{"x":{"html":"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='ggiraph-svg' role='graphics-document' id='svg_d67ddf96bf8a1986' viewBox='0 0 432 360'>\n <defs id='svg_d67ddf96bf8a1986_defs'>\n  <clipPath id='svg_d67ddf96bf8a1986_c1'>\n   <rect x='0' y='0' width='432' height='360'/>\n  <\/clipPath>\n  <clipPath id='svg_d67ddf96bf8a1986_c2'>\n   <rect x='40.14' y='5.48' width='386.38' height='323.64'/>\n  <\/clipPath>\n <\/defs>\n <g id='svg_d67ddf96bf8a1986_rootg' class='ggiraph-svg-rootg'>\n  <g clip-path='url(#svg_d67ddf96bf8a1986_c1)'>\n   <rect x='0' y='0' width='432' height='360' fill='#FFFFFF' fill-opacity='1' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.75' stroke-linejoin='round' stroke-linecap='round' class='ggiraph-svg-bg'/>\n   <rect x='0' y='0' width='432' height='360' fill='#FFFFFF' fill-opacity='1' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='round'/>\n  <\/g>\n  <g clip-path='url(#svg_d67ddf96bf8a1986_c2)'>\n   <rect x='40.14' y='5.48' width='386.38' height='323.64' fill='#EBEBEB' fill-opacity='1' stroke='none'/>\n   <polyline points='40.14,277.63 426.52,277.63' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='40.14,204.07 426.52,204.07' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='40.14,130.52 426.52,130.52' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='40.14,56.97 426.52,56.97' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='101.61,329.12 101.61,5.48' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='189.42,329.12 189.42,5.48' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='277.24,329.12 277.24,5.48' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='365.05,329.12 365.05,5.48' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='40.14,314.40 426.52,314.40' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='40.14,240.85 426.52,240.85' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='40.14,167.30 426.52,167.30' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='40.14,93.74 426.52,93.74' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='40.14,20.19 426.52,20.19' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='57.70,329.12 57.70,5.48' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='145.51,329.12 145.51,5.48' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='233.33,329.12 233.33,5.48' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='321.14,329.12 321.14,5.48' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='408.96,329.12 408.96,5.48' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline id='svg_d67ddf96bf8a1986_e1' points='57.70,314.40 57.75,314.32 58.08,313.77 58.89,312.43 60.30,310.11 62.31,306.78 64.85,302.59 67.77,297.77 70.90,292.62 74.05,287.40 77.13,282.33 80.10,277.46 82.96,272.80 85.73,268.36 88.43,264.11 91.08,260.02 93.70,256.04 96.35,252.13 99.02,248.26 99.18,248.04 101.89,244.19 104.63,240.40 107.37,236.68 110.08,233.06 112.74,229.57 115.34,226.23 117.86,223.02 120.32,219.94 122.73,216.93 125.14,213.92 127.61,210.86 130.19,207.71 132.89,204.46 135.71,201.10 138.65,197.68 141.68,194.20 144.79,190.71 147.95,187.22 148.11,187.05 151.30,183.60 154.51,180.20 157.71,176.87 160.88,173.64 163.97,170.53 166.99,167.55 169.91,164.71 172.75,161.97 175.53,159.31 178.32,156.64 181.17,153.93 184.14,151.14 187.24,148.27 190.48,145.32 193.84,142.31 197.31,139.26 200.85,136.20 204.44,133.16 204.61,133.02 208.23,130.01 211.86,127.06 215.47,124.18 219.03,121.39 222.51,118.72 225.89,116.16 229.16,113.72 232.33,111.39 235.44,109.11 238.56,106.83 241.74,104.52 245.05,102.15 248.50,99.71 252.10,97.20 255.82,94.66 259.66,92.09 263.57,89.53 267.53,86.98 267.72,86.86 271.71,84.36 275.69,81.91 279.65,79.53 283.54,77.23 287.34,75.04 291.03,72.95 294.59,70.96 298.04,69.06 301.42,67.21 304.81,65.36 308.27,63.49 311.86,61.57 315.60,59.60 319.49,57.59 323.52,55.56 327.66,53.52 331.87,51.49 336.13,49.48 336.34,49.39 340.62,47.43 344.93,45.51 349.30,43.62 353.78,41.73 358.43,39.83 363.28,37.88 368.35,35.88 373.65,33.82 379.18,31.68 384.86,29.49 390.49,27.32 395.78,25.28 400.40,23.49 404.09,22.07 406.69,21.07 408.21,20.48 408.85,20.23 408.96,20.19 408.96,20.19' fill='none' stroke='#FF0000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' title='curvature: -0.2' data-id='0.2'/>\n   <polyline id='svg_d67ddf96bf8a1986_e2' points='57.70,314.40 57.80,314.40 58.42,314.36 59.95,314.26 62.61,314.09 66.46,313.85 71.36,313.54 77.06,313.18 83.23,312.79 89.55,312.39 95.75,312.00 101.74,311.60 107.48,311.18 112.98,310.73 118.25,310.22 123.33,309.65 128.26,309.01 133.09,308.29 137.88,307.48 141.15,306.88 145.91,305.92 150.63,304.88 155.27,303.77 159.81,302.60 164.21,301.39 168.45,300.16 172.52,298.91 176.45,297.67 180.27,296.42 184.07,295.18 187.91,293.90 191.85,292.55 195.92,291.11 200.11,289.55 204.40,287.88 208.77,286.09 213.19,284.20 217.60,282.22 220.46,280.88 224.83,278.75 229.14,276.56 233.36,274.32 237.46,272.05 241.41,269.78 245.20,267.52 248.84,265.29 252.33,263.10 255.71,260.94 259.07,258.78 262.47,256.58 265.95,254.29 269.52,251.87 273.19,249.31 276.93,246.62 280.71,243.79 284.51,240.85 288.28,237.82 290.71,235.81 294.41,232.66 298.03,229.45 301.55,226.22 304.95,223.00 308.21,219.81 311.31,216.67 314.27,213.60 317.10,210.60 319.83,207.66 322.54,204.73 325.28,201.74 328.07,198.65 330.93,195.41 333.83,192.02 336.77,188.47 339.73,184.79 342.66,180.99 345.56,177.11 347.41,174.55 350.19,170.57 352.89,166.56 355.49,162.55 357.97,158.58 360.32,154.67 362.54,150.85 364.64,147.14 366.62,143.53 368.53,139.99 370.42,136.47 372.32,132.90 374.25,129.20 376.19,125.35 378.15,121.34 380.11,117.17 382.05,112.86 383.94,108.45 385.77,103.96 386.91,101.02 388.61,96.48 390.22,91.89 391.75,87.23 393.23,82.44 394.67,77.49 396.09,72.32 397.50,66.90 398.93,61.24 400.38,55.35 401.87,49.25 403.36,43.11 404.80,37.22 406.10,31.89 407.19,27.42 408.02,24.03 408.57,21.79 408.85,20.62 408.95,20.22 408.96,20.19' fill='none' stroke='#0000FF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' title='curvature: 0.4' data-id='0.4'/>\n   <line id='svg_d67ddf96bf8a1986_e3' x1='57.7' y1='314.4' x2='408.96' y2='20.19' stroke='#00FF00' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' title='curvature: 0' data-id='0'/>\n  <\/g>\n  <g clip-path='url(#svg_d67ddf96bf8a1986_c1)'>\n   <text x='18.07' y='317.43' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>1.00<\/text>\n   <text x='18.07' y='243.88' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>1.25<\/text>\n   <text x='18.07' y='170.33' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>1.50<\/text>\n   <text x='18.07' y='96.77' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>1.75<\/text>\n   <text x='18.07' y='23.22' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>2.00<\/text>\n   <polyline points='37.40,314.40 40.14,314.40' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='37.40,240.85 40.14,240.85' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='37.40,167.30 40.14,167.30' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='37.40,93.74 40.14,93.74' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='37.40,20.19 40.14,20.19' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='57.70,331.86 57.70,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='145.51,331.86 145.51,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='233.33,331.86 233.33,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='321.14,331.86 321.14,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='408.96,331.86 408.96,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <text x='55.25' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>0<\/text>\n   <text x='143.07' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>1<\/text>\n   <text x='230.88' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>2<\/text>\n   <text x='318.7' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>3<\/text>\n   <text x='406.51' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>4<\/text>\n   <text x='230.58' y='352.24' font-size='8.25pt' font-family='Liberation Sans'>x<\/text>\n   <text transform='translate(13.05,170.05) rotate(-90.00)' font-size='8.25pt' font-family='Liberation Sans'>y<\/text>\n  <\/g>\n <\/g>\n<\/svg>","js":null,"uid":"svg_d67ddf96bf8a1986","ratio":1.2,"settings":{"tooltip":{"css":".tooltip_SVGID_ { padding:5px;background:black;color:white;border-radius:2px;text-align:left; ; position:absolute;pointer-events:none;z-index:9999;}","placement":"doc","opacity":0.9,"offx":10,"offy":10,"use_cursor_pos":true,"use_fill":false,"use_stroke":false,"delay_over":200,"delay_out":500},"hover":{"css":".hover_data_SVGID_ { stroke: black; stroke-width: 3; }","reactive":true,"nearest_distance":10,"linked":false},"hover_inv":{"css":""},"hover_key":{"css":".hover_key_SVGID_ { fill:orange;stroke:black;cursor:pointer; }\ntext.hover_key_SVGID_ { stroke:none;fill:orange; }\ncircle.hover_key_SVGID_ { fill:orange;stroke:black; }\nline.hover_key_SVGID_, polyline.hover_key_SVGID_ { fill:none;stroke:orange; }\nrect.hover_key_SVGID_, polygon.hover_key_SVGID_, path.hover_key_SVGID_ { fill:orange;stroke:none; }\nimage.hover_key_SVGID_ { stroke:orange; }","reactive":true},"hover_theme":{"css":".hover_theme_SVGID_ { fill:orange;stroke:black;cursor:pointer; }\ntext.hover_theme_SVGID_ { stroke:none;fill:orange; }\ncircle.hover_theme_SVGID_ { fill:orange;stroke:black; }\nline.hover_theme_SVGID_, polyline.hover_theme_SVGID_ { fill:none;stroke:orange; }\nrect.hover_theme_SVGID_, polygon.hover_theme_SVGID_, path.hover_theme_SVGID_ { fill:orange;stroke:none; }\nimage.hover_theme_SVGID_ { stroke:orange; }","reactive":true},"select":{"css":".select_data_SVGID_ { fill:red;stroke:black;cursor:pointer; }\ntext.select_data_SVGID_ { stroke:none;fill:red; }\ncircle.select_data_SVGID_ { fill:red;stroke:black; }\nline.select_data_SVGID_, polyline.select_data_SVGID_ { fill:none;stroke:red; }\nrect.select_data_SVGID_, polygon.select_data_SVGID_, path.select_data_SVGID_ { fill:red;stroke:none; }\nimage.select_data_SVGID_ { stroke:red; }","type":"multiple","only_shiny":true,"selected":[],"linked":false},"select_inv":{"css":""},"select_key":{"css":".select_key_SVGID_ { fill:red;stroke:black;cursor:pointer; }\ntext.select_key_SVGID_ { stroke:none;fill:red; }\ncircle.select_key_SVGID_ { fill:red;stroke:black; }\nline.select_key_SVGID_, polyline.select_key_SVGID_ { fill:none;stroke:red; }\nrect.select_key_SVGID_, polygon.select_key_SVGID_, path.select_key_SVGID_ { fill:red;stroke:none; }\nimage.select_key_SVGID_ { stroke:red; }","type":"single","only_shiny":true,"selected":[]},"select_theme":{"css":".select_theme_SVGID_ { fill:red;stroke:black;cursor:pointer; }\ntext.select_theme_SVGID_ { stroke:none;fill:red; }\ncircle.select_theme_SVGID_ { fill:red;stroke:black; }\nline.select_theme_SVGID_, polyline.select_theme_SVGID_ { fill:none;stroke:red; }\nrect.select_theme_SVGID_, polygon.select_theme_SVGID_, path.select_theme_SVGID_ { fill:red;stroke:none; }\nimage.select_theme_SVGID_ { stroke:red; }","type":"single","only_shiny":true,"selected":[]},"zoom":{"min":1,"max":1,"duration":300,"default_on":false},"toolbar":{"position":"topright","pngname":"diagram","tooltips":null,"fixed":false,"hidden":[],"delay_over":200,"delay_out":500},"sizing":{"rescale":true,"width":1}}},"evals":[],"jsHooks":[]}
```
