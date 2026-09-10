# Interactive box plots

Creates an interactive plot using ggiraph. This function extends
[`gf_boxplot()`](gf_boxplot.md) with interactive features like tooltips
and clickable elements.

## Usage

``` r
gf_boxplot_interactive(
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
  coef,
  outlier.color = NULL,
  outlier.fill = NULL,
  outlier.shape = 19,
  outlier.size = 1.5,
  outlier.stroke = 0.5,
  outlier.alpha = NULL,
  notch = FALSE,
  notchwidth = 0.5,
  varwidth = FALSE,
  xlab,
  ylab,
  title,
  subtitle,
  caption,
  stat = "boxplot",
  position = "dodge",
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

- coef:

  Length of the whiskers as multiple of IQR. Defaults to 1.5.

- outlier.color:

  Default aesthetics for outliers. Set to NULL to inherit from the
  aesthetics used for the box. In the unlikely event you specify both US
  and UK spellings of colour, the US spelling will take precedence.
  Sometimes it can be useful to hide the outliers, for example when
  overlaying the raw data points on top of the boxplot. Hiding the
  outliers can be achieved by setting outlier.shape = NA. Importantly,
  this does not remove the outliers, it only hides them, so the range
  calculated for the y-axis will be the same with outliers shown and
  outliers hidden.

- outlier.fill:

  Default aesthetics for outliers. Set to NULL to inherit from the
  aesthetics used for the box. In the unlikely event you specify both US
  and UK spellings of colour, the US spelling will take precedence.
  Sometimes it can be useful to hide the outliers, for example when
  overlaying the raw data points on top of the boxplot. Hiding the
  outliers can be achieved by setting outlier.shape = NA. Importantly,
  this does not remove the outliers, it only hides them, so the range
  calculated for the y-axis will be the same with outliers shown and
  outliers hidden.

- outlier.shape:

  Default aesthetics for outliers. Set to NULL to inherit from the
  aesthetics used for the box. In the unlikely event you specify both US
  and UK spellings of colour, the US spelling will take precedence.
  Sometimes it can be useful to hide the outliers, for example when
  overlaying the raw data points on top of the boxplot. Hiding the
  outliers can be achieved by setting outlier.shape = NA. Importantly,
  this does not remove the outliers, it only hides them, so the range
  calculated for the y-axis will be the same with outliers shown and
  outliers hidden.

- outlier.size:

  Default aesthetics for outliers. Set to NULL to inherit from the
  aesthetics used for the box. In the unlikely event you specify both US
  and UK spellings of colour, the US spelling will take precedence.
  Sometimes it can be useful to hide the outliers, for example when
  overlaying the raw data points on top of the boxplot. Hiding the
  outliers can be achieved by setting outlier.shape = NA. Importantly,
  this does not remove the outliers, it only hides them, so the range
  calculated for the y-axis will be the same with outliers shown and
  outliers hidden.

- outlier.stroke:

  Default aesthetics for outliers. Set to NULL to inherit from the
  aesthetics used for the box. In the unlikely event you specify both US
  and UK spellings of colour, the US spelling will take precedence.
  Sometimes it can be useful to hide the outliers, for example when
  overlaying the raw data points on top of the boxplot. Hiding the
  outliers can be achieved by setting outlier.shape = NA. Importantly,
  this does not remove the outliers, it only hides them, so the range
  calculated for the y-axis will be the same with outliers shown and
  outliers hidden.

- outlier.alpha:

  Default aesthetics for outliers. Set to NULL to inherit from the
  aesthetics used for the box. In the unlikely event you specify both US
  and UK spellings of colour, the US spelling will take precedence.
  Sometimes it can be useful to hide the outliers, for example when
  overlaying the raw data points on top of the boxplot. Hiding the
  outliers can be achieved by setting outlier.shape = NA. Importantly,
  this does not remove the outliers, it only hides them, so the range
  calculated for the y-axis will be the same with outliers shown and
  outliers hidden.

- notch:

  If `FALSE` (default) make a standard box plot. If `TRUE`, make a
  notched box plot. Notches are used to compare groups; if the notches
  of two boxes do not overlap, this suggests that the medians are
  significantly different.

- notchwidth:

  For a notched box plot, width of the notch relative to the body
  (defaults to `notchwidth = 0.5`).

- varwidth:

  If `FALSE` (default) make a standard box plot. If `TRUE`, boxes are
  drawn with widths proportional to the square-roots of the number of
  observations in the groups (possibly weighted, using the `weight`
  aesthetic).

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

  Use to override the default connection between
  [`geom_boxplot()`](https://ggplot2.tidyverse.org/reference/geom_boxplot.html)
  and
  [`stat_boxplot()`](https://ggplot2.tidyverse.org/reference/geom_boxplot.html).
  For more information about overriding these connections, see how the
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

A gg object that can be displayed with [`gf_girafe()`](gf_girafe.md).

## Additional interactive features

- `onclick`: JavaScript code (as character string) executed when
  clicking elements.

- Additional ggiraph aesthetics may be available depending on the geom.

## See also

[`gf_boxplot()`](gf_boxplot.md), [`gf_girafe()`](gf_girafe.md)

## Examples

``` r
mtcars |>
  gf_boxplot_interactive(
    mpg ~ factor(cyl),
    tooltip = ~ paste("Cylinders:", cyl)
  ) |> 
  gf_girafe()

{"x":{"html":"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='ggiraph-svg' role='graphics-document' id='svg_d49514ef52fbad8d' viewBox='0 0 432 360'>\n <defs id='svg_d49514ef52fbad8d_defs'>\n  <clipPath id='svg_d49514ef52fbad8d_c1'>\n   <rect x='0' y='0' width='432' height='360'/>\n  <\/clipPath>\n  <clipPath id='svg_d49514ef52fbad8d_c2'>\n   <rect x='32.79' y='5.48' width='393.73' height='323.64'/>\n  <\/clipPath>\n <\/defs>\n <g id='svg_d49514ef52fbad8d_rootg' class='ggiraph-svg-rootg'>\n  <g clip-path='url(#svg_d49514ef52fbad8d_c1)'>\n   <rect x='0' y='0' width='432' height='360' fill='#FFFFFF' fill-opacity='1' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.75' stroke-linejoin='round' stroke-linecap='round' class='ggiraph-svg-bg'/>\n   <rect x='0' y='0' width='432' height='360' fill='#FFFFFF' fill-opacity='1' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='round'/>\n  <\/g>\n  <g clip-path='url(#svg_d49514ef52fbad8d_c2)'>\n   <rect x='32.79' y='5.48' width='393.73' height='323.64' fill='#EBEBEB' fill-opacity='1' stroke='none'/>\n   <polyline points='32.79,288.11 426.52,288.11' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,225.51 426.52,225.51' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,162.92 426.52,162.92' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,100.32 426.52,100.32' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,37.72 426.52,37.72' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,319.41 426.52,319.41' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,256.81 426.52,256.81' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,194.22 426.52,194.22' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,131.62 426.52,131.62' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,69.02 426.52,69.02' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,6.42 426.52,6.42' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='106.62,329.12 106.62,5.48' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='229.66,329.12 229.66,5.48' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='352.70,329.12 352.70,5.48' fill='none' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <line id='svg_d49514ef52fbad8d_e1' x1='106.62' y1='64.01' x2='106.62' y2='20.19' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' title='Cylinders: 4'/>\n   <line id='svg_d49514ef52fbad8d_e2' x1='106.62' y1='159.16' x2='106.62' y2='176.69' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' title='Cylinders: 4'/>\n   <polygon id='svg_d49514ef52fbad8d_e3' points='60.48,64.01 60.48,159.16 152.76,159.16 152.76,64.01 60.48,64.01' fill='#FFFFFF' fill-opacity='1' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='miter' stroke-linecap='butt' title='Cylinders: 4'/>\n   <line id='svg_d49514ef52fbad8d_e4' x1='60.48' y1='119.1' x2='152.76' y2='119.1' stroke='#333333' stroke-opacity='1' stroke-width='2.13' stroke-linejoin='miter' stroke-linecap='butt' title='Cylinders: 4'/>\n   <line id='svg_d49514ef52fbad8d_e5' x1='229.66' y1='181.7' x2='229.66' y2='176.69' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' title='Cylinders: 6'/>\n   <line id='svg_d49514ef52fbad8d_e6' x1='229.66' y1='211.12' x2='229.66' y2='221.76' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' title='Cylinders: 6'/>\n   <polygon id='svg_d49514ef52fbad8d_e7' points='183.52,181.70 183.52,211.12 275.80,211.12 275.80,181.70 183.52,181.70' fill='#FFFFFF' fill-opacity='1' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='miter' stroke-linecap='butt' title='Cylinders: 6'/>\n   <line id='svg_d49514ef52fbad8d_e8' x1='183.52' y1='197.97' x2='275.8' y2='197.97' stroke='#333333' stroke-opacity='1' stroke-width='2.13' stroke-linejoin='miter' stroke-linecap='butt' title='Cylinders: 6'/>\n   <circle cx='352.7' cy='314.4' r='1.47pt' fill='#333333' fill-opacity='1' stroke='#333333' stroke-opacity='1' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round'/>\n   <circle cx='352.7' cy='314.4' r='1.47pt' fill='#333333' fill-opacity='1' stroke='#333333' stroke-opacity='1' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round'/>\n   <circle cx='352.7' cy='204.23' r='1.47pt' fill='#333333' fill-opacity='1' stroke='#333333' stroke-opacity='1' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round'/>\n   <line id='svg_d49514ef52fbad8d_e9' x1='352.7' y1='241.16' x2='352.7' y2='210.49' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' title='Cylinders: 8'/>\n   <line id='svg_d49514ef52fbad8d_e10' x1='352.7' y1='264.33' x2='352.7' y2='278.1' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' title='Cylinders: 8'/>\n   <polygon id='svg_d49514ef52fbad8d_e11' points='306.56,241.16 306.56,264.33 398.84,264.33 398.84,241.16 306.56,241.16' fill='#FFFFFF' fill-opacity='1' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='miter' stroke-linecap='butt' title='Cylinders: 8'/>\n   <line id='svg_d49514ef52fbad8d_e12' x1='306.56' y1='254.31' x2='398.84' y2='254.31' stroke='#333333' stroke-opacity='1' stroke-width='2.13' stroke-linejoin='miter' stroke-linecap='butt' title='Cylinders: 8'/>\n  <\/g>\n  <g clip-path='url(#svg_d49514ef52fbad8d_c1)'>\n   <text x='18.07' y='322.44' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>10<\/text>\n   <text x='18.07' y='259.84' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>15<\/text>\n   <text x='18.07' y='197.24' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>20<\/text>\n   <text x='18.07' y='134.64' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>25<\/text>\n   <text x='18.07' y='72.04' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>30<\/text>\n   <text x='18.07' y='9.45' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>35<\/text>\n   <polyline points='30.05,319.41 32.79,319.41' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='30.05,256.81 32.79,256.81' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='30.05,194.22 32.79,194.22' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='30.05,131.62 32.79,131.62' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='30.05,69.02 32.79,69.02' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='30.05,6.42 32.79,6.42' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='106.62,331.86 106.62,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='229.66,331.86 229.66,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='352.70,331.86 352.70,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <text x='104.17' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>4<\/text>\n   <text x='227.21' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>6<\/text>\n   <text x='350.25' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>8<\/text>\n   <text x='205.51' y='352.24' font-size='8.25pt' font-family='Liberation Sans'>factor(cyl)<\/text>\n   <text transform='translate(13.05,178.00) rotate(-90.00)' font-size='8.25pt' font-family='Liberation Sans'>mpg<\/text>\n  <\/g>\n <\/g>\n<\/svg>","js":null,"uid":"svg_d49514ef52fbad8d","ratio":1.2,"settings":{"tooltip":{"css":".tooltip_SVGID_ { padding:5px;background:black;color:white;border-radius:2px;text-align:left; ; position:absolute;pointer-events:none;z-index:9999;}","placement":"doc","opacity":0.9,"offx":10,"offy":10,"use_cursor_pos":true,"use_fill":false,"use_stroke":false,"delay_over":200,"delay_out":500},"hover":{"css":".hover_data_SVGID_ { fill:orange;stroke:black;cursor:pointer; }\ntext.hover_data_SVGID_ { stroke:none;fill:orange; }\ncircle.hover_data_SVGID_ { fill:orange;stroke:black; }\nline.hover_data_SVGID_, polyline.hover_data_SVGID_ { fill:none;stroke:orange; }\nrect.hover_data_SVGID_, polygon.hover_data_SVGID_, path.hover_data_SVGID_ { fill:orange;stroke:none; }\nimage.hover_data_SVGID_ { stroke:orange; }","reactive":true,"nearest_distance":null,"linked":false},"hover_inv":{"css":""},"hover_key":{"css":".hover_key_SVGID_ { fill:orange;stroke:black;cursor:pointer; }\ntext.hover_key_SVGID_ { stroke:none;fill:orange; }\ncircle.hover_key_SVGID_ { fill:orange;stroke:black; }\nline.hover_key_SVGID_, polyline.hover_key_SVGID_ { fill:none;stroke:orange; }\nrect.hover_key_SVGID_, polygon.hover_key_SVGID_, path.hover_key_SVGID_ { fill:orange;stroke:none; }\nimage.hover_key_SVGID_ { stroke:orange; }","reactive":true},"hover_theme":{"css":".hover_theme_SVGID_ { fill:orange;stroke:black;cursor:pointer; }\ntext.hover_theme_SVGID_ { stroke:none;fill:orange; }\ncircle.hover_theme_SVGID_ { fill:orange;stroke:black; }\nline.hover_theme_SVGID_, polyline.hover_theme_SVGID_ { fill:none;stroke:orange; }\nrect.hover_theme_SVGID_, polygon.hover_theme_SVGID_, path.hover_theme_SVGID_ { fill:orange;stroke:none; }\nimage.hover_theme_SVGID_ { stroke:orange; }","reactive":true},"select":{"css":".select_data_SVGID_ { fill:red;stroke:black;cursor:pointer; }\ntext.select_data_SVGID_ { stroke:none;fill:red; }\ncircle.select_data_SVGID_ { fill:red;stroke:black; }\nline.select_data_SVGID_, polyline.select_data_SVGID_ { fill:none;stroke:red; }\nrect.select_data_SVGID_, polygon.select_data_SVGID_, path.select_data_SVGID_ { fill:red;stroke:none; }\nimage.select_data_SVGID_ { stroke:red; }","type":"multiple","only_shiny":true,"selected":[],"linked":false},"select_inv":{"css":""},"select_key":{"css":".select_key_SVGID_ { fill:red;stroke:black;cursor:pointer; }\ntext.select_key_SVGID_ { stroke:none;fill:red; }\ncircle.select_key_SVGID_ { fill:red;stroke:black; }\nline.select_key_SVGID_, polyline.select_key_SVGID_ { fill:none;stroke:red; }\nrect.select_key_SVGID_, polygon.select_key_SVGID_, path.select_key_SVGID_ { fill:red;stroke:none; }\nimage.select_key_SVGID_ { stroke:red; }","type":"single","only_shiny":true,"selected":[]},"select_theme":{"css":".select_theme_SVGID_ { fill:red;stroke:black;cursor:pointer; }\ntext.select_theme_SVGID_ { stroke:none;fill:red; }\ncircle.select_theme_SVGID_ { fill:red;stroke:black; }\nline.select_theme_SVGID_, polyline.select_theme_SVGID_ { fill:none;stroke:red; }\nrect.select_theme_SVGID_, polygon.select_theme_SVGID_, path.select_theme_SVGID_ { fill:red;stroke:none; }\nimage.select_theme_SVGID_ { stroke:red; }","type":"single","only_shiny":true,"selected":[]},"zoom":{"min":1,"max":1,"duration":300,"default_on":false},"toolbar":{"position":"topright","pngname":"diagram","tooltips":null,"fixed":false,"hidden":[],"delay_over":200,"delay_out":500},"sizing":{"rescale":true,"width":1}}},"evals":[],"jsHooks":[]}
```
