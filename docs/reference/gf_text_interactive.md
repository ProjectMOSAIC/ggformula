# Interactive text annotations

Creates an interactive plot using ggiraph. This function extends
[`gf_text()`](gf_text.md) with interactive features like tooltips and
clickable elements.

## Usage

``` r
gf_text_interactive(
  object = NULL,
  gformula = NULL,
  data = NULL,
  ...,
  label,
  alpha,
  angle,
  color,
  family,
  fontface,
  group,
  hjust,
  lineheight,
  size,
  vjust,
  parse = FALSE,
  nudge_x = 0,
  nudge_y = 0,
  check_overlap = FALSE,
  xlab,
  ylab,
  title,
  subtitle,
  caption,
  stat = "identity",
  position = "nudge",
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

- label:

  The text to be displayed.

- alpha:

  Opacity (0 = invisible, 1 = opaque).

- angle:

  An angle for rotating the text.

- color:

  A color or a formula used for mapping color.

- family:

  A font family.

- fontface:

  One of `"plain"`, `"bold"`, `"italic"`, or `"bold italic"`.

- group:

  Used for grouping.

- hjust:

  Numbers between 0 and 1 indicating how to justify text relative the
  the specified location.

- lineheight:

  Line height.

- size:

  A numeric size or a formula used for mapping size.

- vjust:

  Numbers between 0 and 1 indicating how to justify text relative the
  the specified location.

- parse:

  If `TRUE`, the labels will be parsed into expressions and displayed as
  described in [`?plotmath`](https://rdrr.io/r/grDevices/plotmath.html).

- nudge_x:

  Passed to
  [`ggplot2::position_nudge()`](https://ggplot2.tidyverse.org/reference/position_nudge.html)
  to nudge text or labels horizontally or vertically.

- nudge_y:

  Passed to
  [`ggplot2::position_nudge()`](https://ggplot2.tidyverse.org/reference/position_nudge.html)
  to nudge text or labels horizontally or vertically.

- check_overlap:

  If `TRUE`, text that overlaps previous text in the same layer will not
  be plotted. `check_overlap` happens at draw time and in the order of
  the data. Therefore data should be arranged by the label column before
  calling
  [`geom_text()`](https://ggplot2.tidyverse.org/reference/geom_text.html).
  Note that this argument is not supported by
  [`geom_label()`](https://ggplot2.tidyverse.org/reference/geom_text.html).

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

[`gf_text()`](gf_text.md), [`gf_girafe()`](gf_girafe.md)

## Examples

``` r
gf_point_interactive(
  mpg ~ wt, data = mtcars, alpha = 0.4, size = 3,
  tooltip = ~ rownames(mtcars),
  data_id = 1:nrow(mtcars)
) |>
  gf_text_interactive(mpg ~ wt, data = mtcars[1:5, ],
                     label = ~ rownames(mtcars)[1:5],
                     size = 3,
                     angle = 20,
                     data_id = 1:5,
                     tooltip = ~ paste(rownames(mtcars)[1:5], "\nmpg:", mpg, "wt: ", wt)
  ) |>
  gf_girafe()

{"x":{"html":"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='ggiraph-svg' role='graphics-document' id='svg_cc61452c5eca677c' viewBox='0 0 432 360'>\n <defs id='svg_cc61452c5eca677c_defs'>\n  <clipPath id='svg_cc61452c5eca677c_c1'>\n   <rect x='0' y='0' width='432' height='360'/>\n  <\/clipPath>\n  <clipPath id='svg_cc61452c5eca677c_c2'>\n   <rect x='32.79' y='5.48' width='393.73' height='323.64'/>\n  <\/clipPath>\n <\/defs>\n <g id='svg_cc61452c5eca677c_rootg' class='ggiraph-svg-rootg'>\n  <g clip-path='url(#svg_cc61452c5eca677c_c1)'>\n   <rect x='0' y='0' width='432' height='360' fill='#FFFFFF' fill-opacity='1' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.75' stroke-linejoin='round' stroke-linecap='round' class='ggiraph-svg-bg'/>\n   <rect x='0' y='0' width='432' height='360' fill='#FFFFFF' fill-opacity='1' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='round'/>\n  <\/g>\n  <g clip-path='url(#svg_cc61452c5eca677c_c2)'>\n   <rect x='32.79' y='5.48' width='393.73' height='323.64' fill='#FFFFFF' fill-opacity='1' stroke='none'/>\n   <polyline points='32.79,288.11 426.52,288.11' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,225.51 426.52,225.51' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,162.92 426.52,162.92' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,100.32 426.52,100.32' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,37.72 426.52,37.72' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='49.50,329.12 49.50,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='141.02,329.12 141.02,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='232.54,329.12 232.54,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='324.06,329.12 324.06,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='415.58,329.12 415.58,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='0.53' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,319.41 426.52,319.41' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,256.81 426.52,256.81' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,194.22 426.52,194.22' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,131.62 426.52,131.62' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,69.02 426.52,69.02' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='32.79,6.42 426.52,6.42' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='95.26,329.12 95.26,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='186.78,329.12 186.78,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='278.30,329.12 278.30,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='369.82,329.12 369.82,5.48' fill='none' stroke='#EBEBEB' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <circle id='svg_cc61452c5eca677c_e1' cx='152' cy='181.7' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Mazda RX4' data-id='1'/>\n   <circle id='svg_cc61452c5eca677c_e2' cx='175.34' cy='181.7' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Mazda RX4 Wag' data-id='2'/>\n   <circle id='svg_cc61452c5eca677c_e3' cx='124.55' cy='159.16' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Datsun 710' data-id='3'/>\n   <circle id='svg_cc61452c5eca677c_e4' cx='206.46' cy='176.69' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Hornet 4 Drive' data-id='4'/>\n   <circle id='svg_cc61452c5eca677c_e5' cx='227.05' cy='210.49' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Hornet Sportabout' data-id='5'/>\n   <circle id='svg_cc61452c5eca677c_e6' cx='228.88' cy='218' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Valiant' data-id='6'/>\n   <circle id='svg_cc61452c5eca677c_e7' cx='238.95' cy='265.58' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Duster 360' data-id='7'/>\n   <circle id='svg_cc61452c5eca677c_e8' cx='204.17' cy='139.13' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Merc 240D' data-id='8'/>\n   <circle id='svg_cc61452c5eca677c_e9' cx='200.51' cy='159.16' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Merc 230' data-id='9'/>\n   <circle id='svg_cc61452c5eca677c_e10' cx='227.05' cy='204.23' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Merc 280' data-id='10'/>\n   <circle id='svg_cc61452c5eca677c_e11' cx='227.05' cy='221.76' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Merc 280C' data-id='11'/>\n   <circle id='svg_cc61452c5eca677c_e12' cx='284.71' cy='239.29' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Merc 450SE' data-id='12'/>\n   <circle id='svg_cc61452c5eca677c_e13' cx='253.59' cy='228.02' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Merc 450SL' data-id='13'/>\n   <circle id='svg_cc61452c5eca677c_e14' cx='258.16' cy='254.31' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Merc 450SLC' data-id='14'/>\n   <circle id='svg_cc61452c5eca677c_e15' cx='392.7' cy='314.4' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Cadillac Fleetwood' data-id='15'/>\n   <circle id='svg_cc61452c5eca677c_e16' cx='408.62' cy='314.4' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Lincoln Continental' data-id='16'/>\n   <circle id='svg_cc61452c5eca677c_e17' cx='401.39' cy='260.57' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Chrysler Imperial' data-id='17'/>\n   <circle id='svg_cc61452c5eca677c_e18' cx='113.56' cy='38.97' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Fiat 128' data-id='18'/>\n   <circle id='svg_cc61452c5eca677c_e19' cx='60.02' cy='64.01' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Honda Civic' data-id='19'/>\n   <circle id='svg_cc61452c5eca677c_e20' cx='80.16' cy='20.19' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Toyota Corolla' data-id='20'/>\n   <circle id='svg_cc61452c5eca677c_e21' cx='137.82' cy='175.44' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Toyota Corona' data-id='21'/>\n   <circle id='svg_cc61452c5eca677c_e22' cx='234.37' cy='250.55' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Dodge Challenger' data-id='22'/>\n   <circle id='svg_cc61452c5eca677c_e23' cx='226.59' cy='254.31' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='AMC Javelin' data-id='23'/>\n   <circle id='svg_cc61452c5eca677c_e24' cx='263.66' cy='278.1' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Camaro Z28' data-id='24'/>\n   <circle id='svg_cc61452c5eca677c_e25' cx='264.11' cy='204.23' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Pontiac Firebird' data-id='25'/>\n   <circle id='svg_cc61452c5eca677c_e26' cx='89.31' cy='102.82' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Fiat X1-9' data-id='26'/>\n   <circle id='svg_cc61452c5eca677c_e27' cx='108.07' cy='119.1' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Porsche 914-2' data-id='27'/>\n   <circle id='svg_cc61452c5eca677c_e28' cx='50.69' cy='64.01' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Lotus Europa' data-id='28'/>\n   <circle id='svg_cc61452c5eca677c_e29' cx='202.34' cy='246.8' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Ford Pantera L' data-id='29'/>\n   <circle id='svg_cc61452c5eca677c_e30' cx='165.73' cy='197.97' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Ferrari Dino' data-id='30'/>\n   <circle id='svg_cc61452c5eca677c_e31' cx='238.95' cy='256.81' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Maserati Bora' data-id='31'/>\n   <circle id='svg_cc61452c5eca677c_e32' cx='166.64' cy='176.69' r='2.67pt' fill='#000000' fill-opacity='0.4' stroke='#000000' stroke-opacity='0.4' stroke-width='0.71' stroke-linejoin='round' stroke-linecap='round' title='Volvo 142E' data-id='32'/>\n   <text id='svg_cc61452c5eca677c_e33' transform='translate(132.06,192.08) rotate(-20.00)' font-size='6.4pt' font-family='Liberation Sans' title='Mazda RX4 &amp;lt;br/&amp;gt;mpg: 21 wt:  2.62' data-id='1'>Mazda RX4<\/text>\n   <text id='svg_cc61452c5eca677c_e34' transform='translate(146.19,195.43) rotate(-20.00)' font-size='6.4pt' font-family='Liberation Sans' title='Mazda RX4 Wag &amp;lt;br/&amp;gt;mpg: 21 wt:  2.875' data-id='2'>Mazda RX4 Wag<\/text>\n   <text id='svg_cc61452c5eca677c_e35' transform='translate(105.05,169.38) rotate(-20.00)' font-size='6.4pt' font-family='Liberation Sans' title='Datsun 710 &amp;lt;br/&amp;gt;mpg: 22.8 wt:  2.32' data-id='3'>Datsun 710<\/text>\n   <text id='svg_cc61452c5eca677c_e36' transform='translate(181.61,188.85) rotate(-20.00)' font-size='6.4pt' font-family='Liberation Sans' title='Hornet 4 Drive &amp;lt;br/&amp;gt;mpg: 21.4 wt:  3.215' data-id='4'>Hornet 4 Drive<\/text>\n   <text id='svg_cc61452c5eca677c_e37' transform='translate(195.30,225.17) rotate(-20.00)' font-size='6.4pt' font-family='Liberation Sans' title='Hornet Sportabout &amp;lt;br/&amp;gt;mpg: 18.7 wt:  3.44' data-id='5'>Hornet Sportabout<\/text>\n   <rect x='32.79' y='5.48' width='393.73' height='323.64' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='round'/>\n  <\/g>\n  <g clip-path='url(#svg_cc61452c5eca677c_c1)'>\n   <text x='18.07' y='322.44' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>10<\/text>\n   <text x='18.07' y='259.84' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>15<\/text>\n   <text x='18.07' y='197.24' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>20<\/text>\n   <text x='18.07' y='134.64' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>25<\/text>\n   <text x='18.07' y='72.04' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>30<\/text>\n   <text x='18.07' y='9.45' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>35<\/text>\n   <polyline points='30.05,319.41 32.79,319.41' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='30.05,256.81 32.79,256.81' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='30.05,194.22 32.79,194.22' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='30.05,131.62 32.79,131.62' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='30.05,69.02 32.79,69.02' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='30.05,6.42 32.79,6.42' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='95.26,331.86 95.26,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='186.78,331.86 186.78,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='278.30,331.86 278.30,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <polyline points='369.82,331.86 369.82,329.12' fill='none' stroke='#333333' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n   <text x='92.81' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>2<\/text>\n   <text x='184.33' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>3<\/text>\n   <text x='275.85' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>4<\/text>\n   <text x='367.37' y='340.1' font-size='6.6pt' font-family='Liberation Sans' fill='#4D4D4D' fill-opacity='1'>5<\/text>\n   <text x='224.16' y='352.24' font-size='8.25pt' font-family='Liberation Sans'>wt<\/text>\n   <text transform='translate(13.05,178.00) rotate(-90.00)' font-size='8.25pt' font-family='Liberation Sans'>mpg<\/text>\n  <\/g>\n <\/g>\n<\/svg>","js":null,"uid":"svg_cc61452c5eca677c","ratio":1.2,"settings":{"tooltip":{"css":".tooltip_SVGID_ { padding:5px;background:black;color:white;border-radius:2px;text-align:left; ; position:absolute;pointer-events:none;z-index:9999;}","placement":"doc","opacity":0.9,"offx":10,"offy":10,"use_cursor_pos":true,"use_fill":false,"use_stroke":false,"delay_over":200,"delay_out":500},"hover":{"css":".hover_data_SVGID_ { fill:orange;stroke:black;cursor:pointer; }\ntext.hover_data_SVGID_ { stroke:none;fill:orange; }\ncircle.hover_data_SVGID_ { fill:orange;stroke:black; }\nline.hover_data_SVGID_, polyline.hover_data_SVGID_ { fill:none;stroke:orange; }\nrect.hover_data_SVGID_, polygon.hover_data_SVGID_, path.hover_data_SVGID_ { fill:orange;stroke:none; }\nimage.hover_data_SVGID_ { stroke:orange; }","reactive":true,"nearest_distance":null,"linked":false},"hover_inv":{"css":""},"hover_key":{"css":".hover_key_SVGID_ { fill:orange;stroke:black;cursor:pointer; }\ntext.hover_key_SVGID_ { stroke:none;fill:orange; }\ncircle.hover_key_SVGID_ { fill:orange;stroke:black; }\nline.hover_key_SVGID_, polyline.hover_key_SVGID_ { fill:none;stroke:orange; }\nrect.hover_key_SVGID_, polygon.hover_key_SVGID_, path.hover_key_SVGID_ { fill:orange;stroke:none; }\nimage.hover_key_SVGID_ { stroke:orange; }","reactive":true},"hover_theme":{"css":".hover_theme_SVGID_ { fill:orange;stroke:black;cursor:pointer; }\ntext.hover_theme_SVGID_ { stroke:none;fill:orange; }\ncircle.hover_theme_SVGID_ { fill:orange;stroke:black; }\nline.hover_theme_SVGID_, polyline.hover_theme_SVGID_ { fill:none;stroke:orange; }\nrect.hover_theme_SVGID_, polygon.hover_theme_SVGID_, path.hover_theme_SVGID_ { fill:orange;stroke:none; }\nimage.hover_theme_SVGID_ { stroke:orange; }","reactive":true},"select":{"css":".select_data_SVGID_ { fill:red;stroke:black;cursor:pointer; }\ntext.select_data_SVGID_ { stroke:none;fill:red; }\ncircle.select_data_SVGID_ { fill:red;stroke:black; }\nline.select_data_SVGID_, polyline.select_data_SVGID_ { fill:none;stroke:red; }\nrect.select_data_SVGID_, polygon.select_data_SVGID_, path.select_data_SVGID_ { fill:red;stroke:none; }\nimage.select_data_SVGID_ { stroke:red; }","type":"multiple","only_shiny":true,"selected":[],"linked":false},"select_inv":{"css":""},"select_key":{"css":".select_key_SVGID_ { fill:red;stroke:black;cursor:pointer; }\ntext.select_key_SVGID_ { stroke:none;fill:red; }\ncircle.select_key_SVGID_ { fill:red;stroke:black; }\nline.select_key_SVGID_, polyline.select_key_SVGID_ { fill:none;stroke:red; }\nrect.select_key_SVGID_, polygon.select_key_SVGID_, path.select_key_SVGID_ { fill:red;stroke:none; }\nimage.select_key_SVGID_ { stroke:red; }","type":"single","only_shiny":true,"selected":[]},"select_theme":{"css":".select_theme_SVGID_ { fill:red;stroke:black;cursor:pointer; }\ntext.select_theme_SVGID_ { stroke:none;fill:red; }\ncircle.select_theme_SVGID_ { fill:red;stroke:black; }\nline.select_theme_SVGID_, polyline.select_theme_SVGID_ { fill:none;stroke:red; }\nrect.select_theme_SVGID_, polygon.select_theme_SVGID_, path.select_theme_SVGID_ { fill:red;stroke:none; }\nimage.select_theme_SVGID_ { stroke:red; }","type":"single","only_shiny":true,"selected":[]},"zoom":{"min":1,"max":1,"duration":300,"default_on":false},"toolbar":{"position":"topright","pngname":"diagram","tooltips":null,"fixed":false,"hidden":[],"delay_over":200,"delay_out":500},"sizing":{"rescale":true,"width":1}}},"evals":[],"jsHooks":[]}
```
