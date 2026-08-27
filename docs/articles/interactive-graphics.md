# Interactive graphics with {ggformula}

## 1 Interactive geoms, scales, and facets

### 1.1 Interactive geoms

The {ggiraph} package provides a number of interactive geoms.
{ggformula} makes these available via `gf_*_interactive()` functions.
Interactive geoms provide several types of interaction.

- hover actions
  - easy tooltips using `tooltip =`
  - restyling elements upon hover
- selection of multiple elements at once
- linking items across multiple plots
- custom javascript to be applied when clicking on a graphical element
  with `onclick =`.

Each type of interaction can be customized for both behavior and style.

Although not discussed here, {ggiraph} transforms graphics into reactive
objects, making various events and selections [available for shiny
apps](https://www.ardata.fr/ggiraph-book/shiny.html).

### 1.2 First example: Scatter plot with tooltips

Interactive geoms provide two new aesthetics that can be used used to
help identify or provide additional information about individual points
or sets of points.

- `tooltip` provides the text (or HTML) to be displayed in the tooltip.
- `data_id` provides and identifier for a selection.

``` r

library(ggformula)
theme_set(theme_bw())
```

``` r

data(mtcars)
mtcars2 <- mtcars |>
  tibble::rownames_to_column(var = "carname")

cars_scatter <-
  mtcars2 |>
  gf_point_interactive(
    wt ~ drat,
    color = ~mpg,
    tooltip = ~carname, # show carname when hovering on a point
    data_id = ~carname, # unique identifier -- selection is a single point
    hover_nearest = TRUE,
    size = 3
  )

# to display the graph with interactive components enabled, use
# gf_girafe() to convert it to an HTML widget.

gf_girafe(cars_scatter)
```

In the previous example, `data_id` was a unique identifier for the
points. In the next example, `data_id` identifies groups of cars (those
with the same number of cylinders). The hover text identifies both the
car name and the number of cylinders.

``` r

cars_scatter_tooltip <-
  mtcars2 |>
  gf_point_interactive(
    qsec ~ disp,
    tooltip = ~ glue::glue("{carname} ({cyl} cylinders)"),
    data_id = ~cyl,
    size = 3,
    hover_nearest = TRUE
  )

gf_girafe(cars_scatter_tooltip)
```

### 1.3 Dealing with stats in interactive bar graphs

Many graphics – bar graphs, histograms, boxplots, density plots, etc. –
are built not from our original data but from some transformation of the
data. Understanding the role of data transformations computed by
statistics and scales can be important to creating graphics.

Here is an example where tooltips allow us to see how many items are
represented in each segment of a stacked bar plot.

``` r

data(diamonds)
diamonds_bargraph <-
  diamonds |>
  gf_bar_interactive(
    ~color,
    fill = ~cut,
    tooltip = ~ after_stat(count),
    data_id = ~ as.character(cut)
  )

diamonds_bargraph |> gf_girafe()
```

> **[`after_stat()`](https://ggplot2.tidyverse.org/reference/aes_eval.html)**
>
> By default, when we map variables, the mapping uses the original data
> we provide for the layer. When a layer is created from summarised data
> (bars defined by counts, boxplots defined by 5-number summaries,
> densities for density plots, etc.), we have the option to do mapping
> after the summarising statistic as been applied. That’s what
> [`after_stat()`](https://ggplot2.tidyverse.org/reference/aes_eval.html)
> is doing here.
>
> We don’t have a column named `count` in our data, but the stat used by
> [`gf_bar()`](../reference/gf_bar.md) and
> [`gf_bar_interactive()`](../reference/gf_bar_interactive.md) computes
> these counts (and some additional things), storing the counts in a
> column called `count`, which is only available after the statistic has
> been computed. `tooltip = ~ after_stat(count)` creates the tooltip
> variable after `count` has been calculated.
>
> In examples like this, it can be handy to know what data are available
> after the summarising statistic has been applied. We can inspect this
> with
> [`layer_data()`](https://ggplot2.tidyverse.org/reference/ggplot_build.html).[^1]
>
> ``` r
>
> diamonds_bargraph |> layer_data() |> head(3)
> #>   count prop x flipped_aes      fill data_id PANEL group tooltip    y ymin ymax
> #> 1   163    1 1       FALSE #440154FF    Fair     1     1     163 6775 6612 6775
> #> 2   224    1 2       FALSE #440154FF    Fair     1     2     224 9797 9573 9797
> #> 3   312    1 3       FALSE #440154FF    Fair     1     3     312 9542 9230 9542
> #>   xmin xmax colour linewidth linetype alpha width
> #> 1 0.55 1.45     NA       0.5        1    NA   0.9
> #> 2 1.55 2.45     NA       0.5        1    NA   0.9
> #> 3 2.55 3.45     NA       0.5        1    NA   0.9
> ```
>
> Some things to notice:
>
> - There is one row for each of the bars.
> - We have access to some new columns that provide information about
>   each of our bars: `count`, `ymin`, `ymax`, `xmin`, `xmax`. These
>   have been computed by the stat.
> - We can see that our `tooltip` and `data_id` also appear here.
> - We no longer have access to columns like `color` (it has been mapped
>   to `x` with values 1, 2, 3, …) or `cut` (instead we have `fill`
>   which shows that actual color being used to fill the bars). These
>   values are computed by scales in a third stage of data
>   transformation.

> **Warning**
>
> Note that in the previous graphic, the count displayed when hovering
> is the count for a single segment, not for all of the segments that
> change color. The latter is determined by `data_id`, which
> `after_stat(count)` does not know about. If this is not desirable, we
> will need to refine either `tooltip` or `data_id` to make them match.
> See [Section 1.3.1](#sec-finer-control).

#### 1.3.1 Finer control

There are several ways to get finer control over what is highlighted and
what information appears in the tooltip when we hover.

##### Method 1: Summarising before plotting

Sometimes it is better to summarise the data ourselves before creating a
graphic. [`gf_col_interactive()`](../reference/gf_col_interactive.md) is
similar to `gf_bar_interacive()`, but is designed to work with data that
have already been summarised.

``` r

library(dplyr)
diamonds |>
  group_by(color, cut) |>
  summarise(count = n()) |>
  gf_col_interactive(
    count ~ color,
    fill = ~cut,
    tooltip = ~ glue::glue("color: {color}, cut: {cut}, count: {count}"),
    data_id = ~ glue::glue("{cut} - {color}")
  ) |>
  gf_girafe()
#> `summarise()` has regrouped the output.
#> ℹ Summaries were computed grouped by color and cut.
#> ℹ Output is grouped by color.
#> ℹ Use `summarise(.groups = "drop_last")` to silence this message.
#> ℹ Use `summarise(.by = c(color, cut))` for per-operation grouping
#>   (`?dplyr::dplyr_by`) instead.
```

Our use of `data_id` here limits the hover highlighting to one bar
segment (defined by cut and color). If we omit `data_id` in the previous
example, we still get the hover text, but the bar segment we are
hovering on does not change color.

``` r

diamonds |>
  group_by(color, cut) |>
  summarise(count = n()) |>
  gf_col_interactive(
    count ~ color,
    fill = ~cut,
    tooltip = ~ glue::glue("color: {color}, cut: {cut}, count: {count}")
  ) |>
  gf_girafe()
#> `summarise()` has regrouped the output.
#> ℹ Summaries were computed grouped by color and cut.
#> ℹ Output is grouped by color.
#> ℹ Use `summarise(.groups = "drop_last")` to silence this message.
#> ℹ Use `summarise(.by = c(color, cut))` for per-operation grouping
#>   (`?dplyr::dplyr_by`) instead.
```

##### Method 2: Using `stage()`

Alternatively, we might prefer to let
[`gf_bar_interactive()`](../reference/gf_bar_interactive.md) take care
of the data summarising for us, but still have finer control over the
highlighting and tooltip text.

``` r

diamonds_bargraph_2 <-
  diamonds |>
  gf_bar_interactive(
    ~color,
    fill = ~cut,
    tooltip = ~ stage(
      start = glue::glue("color: {color}; cut: {cut}"),
      after_stat = glue::glue("{tooltip}; count = {count}")
    ),
    data_id = ~ glue::glue("{cut} -- {color}"),
    size = 3
  )
#> Warning in (function (mapping = NULL, data = NULL, stat = "count", position =
#> "stack", : Ignoring unknown parameters: `size`
diamonds_bargraph_2 |>
  gf_girafe()
```

> **[`stage()`](https://ggplot2.tidyverse.org/reference/aes_eval.html)**
>
> As mentioned above, when ggplot2 graphics are built, the data goes
> through a sequence of transformations. We can do mapping at three
> **stages** along the way.
>
> 1.  **start**: The process begins with the original data that we
>     provide. By default, this is where mapping happens.
>
> 2.  **after_stat**: The starting data are transformed by a statistic
>     (or stat) that computes any summaries of the data.
>
> 3.  **after_scale**: The after_stat data is further transformed by
>     scales that compute the specific positions, colors, etc. that are
>     used.
>
> The use of
> [`stage()`](https://ggplot2.tidyverse.org/reference/aes_eval.html)
> allows us to map the same quantity to different values at different
> stages in this process. In our example,
>
> - `start = glue::glue("color: {color}; cut: {cut}"),` creates a column
>   named `tooltip` that contains the text identifying the color and cut
>   of a diamond.
>
> - `after_stat = glue::glue("cut: {tooltip}; count = {count}"))` uses
>   `tooltip` value created at the start stage to create a new `tooltip`
>   column after the stat has been calculated and `count` is available.
>
> If you have not encountered
> [`stage()`](https://ggplot2.tidyverse.org/reference/aes_eval.html)
> before, you can learn more in the [documentation for
> `stage()`](https://ggplot2.tidyverse.org/reference/aes_eval.html).

### 1.4 Interactive scales

Interactive scales can be used inside
[`gf_refine()`](../reference/gf_aux.md) and generate interactive guides
(legends, axes, etc.).

``` r

diamonds_bargraph_3 <-
  diamonds_bargraph |>
  gf_refine(
    scale_fill_viridis_d_interactive(
      begin = 0.1,
      end = 0.7,
      option = "D",
      data_id = function(breaks) as.character(breaks),
      tooltip = function(breaks) glue::glue("break: {as.character(breaks)}")
    )
  )

diamonds_bargraph_3 |>
  gf_girafe()
```

By themselves, interactive scales are not that interesting. But key
selections can be turned into reactive values for use in things like
shiny apps. See <https://www.ardata.fr/ggiraph-book/shiny.html>.

### 1.5 Interactive faceting

Interactive faceting requires three things:

1.  The use of `gf_facet_wrap_interacive()` or
    [`gf_facet_grid_interactive()`](../reference/interactive_facets.md),
    in place of [`gf_facet_wrap()`](../reference/gf_facet_grid.md) or
    [`gf_facet_grid()`](../reference/gf_facet_grid.md);
2.  The use of an interactive labeller
    (`labeller = gf_labeller_interactive()`) to create the labels; and
3.  A theme that enables facet text and/or strips to be interactive.

``` r

diamonds_bargraph_4 <-
  diamonds_bargraph_3 |>
  gf_theme(
    strip.text = element_text_interactive(),
    strip.background = element_rect_interactive()
  ) |>
  gf_facet_wrap_interactive(
    ~clarity, # or vars(clarity)
    interactive_on = "both",
    ncol = 2,
    labeller = gf_labeller_interactive(
      tooltip = ~ paste("this is clarity", clarity),
      data_id = ~clarity
    )
  ) 

  diamonds_bargraph_4 |> gf_girafe()
```

> **Warning**
>
> Now that we have added facets, we again have the situation where the
> counts displayed are for an individual bar segment, even though
> segments in other facets are also being highlighted. This is because
> faceting further partitions the data before the stat is applied. This
> is required so that each facet knows the size of the bar segments to
> display.
>
> Note the `PANEL` and `group` columns in the layer data.
>
> ``` r
>
> diamonds_bargraph_4 |> layer_data() |> slice_sample(n=4)
> #>   count prop x flipped_aes      fill data_id PANEL group tooltip   y ymin ymax
> #> 1    41    1 4       FALSE #3B528BFF    Good     7    11      41 996  955  996
> #> 2     1    1 7       FALSE #3B528BFF    Good     7    14       1  73   72   73
> #> 3    53    1 7       FALSE #3B528BFF    Good     2    14      53 452  399  452
> #> 4   879    1 3       FALSE #43BF71FF   Ideal     4    31     879 879    0  879
> #>   xmin xmax colour linewidth linetype alpha width
> #> 1 3.55 4.45     NA       0.5        1    NA   0.9
> #> 2 6.55 7.45     NA       0.5        1    NA   0.9
> #> 3 6.55 7.45     NA       0.5        1    NA   0.9
> #> 4 2.55 3.45     NA       0.5        1    NA   0.9
> ```

### 1.6 Interactive themes

{ggiraph} provides 3 interactive elements for use in interactive themes:

- [`element_text_interactive()`](https://davidgohel.github.io/ggiraph/reference/element_interactive.html)
- [`element_rect_interactive()`](https://davidgohel.github.io/ggiraph/reference/element_interactive.html)
- [`element_line_interactive()`](https://davidgohel.github.io/ggiraph/reference/element_interactive.html)

These are drop-in replacements for their non-interactive counterparts.

- They can be used with [`gf_theme()`](../reference/gf_theme.md) to add
  interactive theme elements to an individual plot, as was done the
  previous example;

- They can be used with
  [`set_girafe_defaults()`](https://davidgohel.github.io/ggiraph/reference/set_girafe_defaults.html);
  or

- They can be included in custom theme functions.

  {ggformula} provides
  [`theme_facets_interactive()`](../reference/theme_facets_interactive.md)
  for adding interactive elements for faceting to a theme of your
  choice.

``` r

diamonds_bargraph_3 |>
  gf_theme(theme_facets_interactive(theme_minimal())) |>
  gf_facet_wrap_interactive(
    ~clarity, # or vars(clarity)
    interactive_on = "both",
    ncol = 2,
    labeller = gf_labeller_interactive(
      tooltip = ~ paste("this is clarity", clarity),
      data_id = ~clarity
    )
  ) |>
  gf_girafe()
```

We’ll return to this example in [Section 2](#sec-customizing) to see how
to improve the hover interaction.

### 1.7 Interacting with multiple plots using {patchwork}

If we use {patchwork} to arrange multiple plots into a grid, selecting
points in one plot will highlight them in both.

``` r

library(patchwork)


cars_scatter_2 <-
  mtcars2 |>
  gf_point_interactive(
    disp ~ qsec,
    color = ~mpg,
    tooltip = ~carname,
    data_id = ~carname,
    hover_nearest = TRUE,
    size = 3
  )

gf_girafe(cars_scatter / cars_scatter_2)
```

### 1.8 Click actions with JavaScript

If you know some JavaScript, you can create click actions for
interactive plot elements by passing the JavaScript that should be
executed as `onclick`. In this section we include just two example uses
of JavaScript.

#### 1.8.1 Alerts

``` r

  mtcars2 |>
  gf_point_interactive(
    wt ~ drat,
    color = ~mpg,
    data_id = ~carname, 
    onclick = ~glue::glue('alert("Here is some info for {carname} ...")'),
    size = 3
  ) |>
    gf_girafe()
```

#### 1.8.2 Opening another webpage

In the example below, we use this to open a webpage with related
information.

``` r

  mtcars2 |>
  gf_point_interactive(
    wt ~ drat,
    color = ~ mpg,
    data_id = ~ carname, 
    tooltip = ~ carname,
    onclick = ~ glue::glue('window.open("https://en.wikipedia.org/w/index.php?search={carname}")'),
    size = 3
  ) |>
    gf_girafe()
```

## 2 Customizing girafe animations

We can customize the interactive features of our plots in one of two
ways:

1.  Setting `options = list( ... )` in the call to
    [`gf_girafe()`](../reference/gf_girafe.md), or
2.  Using `set_girafe_defaults( ... )`.

In either case we replace `...` with calls to one or more of the
following:

- `fonts = list(...)`
- `opts_sizing = opts_sizing(...)`
- `opts_tooltip = opts_tooltip(...)`
- `opts_hover = opts_hover(...)`
- `opts_hover_key = opts_hover_key(...)`
- `opts_hover_inv = opts_hover_inv(...)`
- `opts_hover_theme = opts_hover_theme(...)`
- `opts_selection = opts_selection(...)`
- `opts_selection_inv = opts_selection_inv(...)`
- `opts_selection_key = opts_selection_key(...)`
- `opts_selection_theme = opts_selection_theme(...)`
- `opts_zoom = opts_zoom(...)`
- `opts_toolbar = opts_toolbar(...)`

Girafe animations are produced in SVG (scalable vector graphics) format.
We can customize how SVGs appear using CSS (cascading style sheets). So
many of these functions are utilities to help us create the correct CSS.
Some options require the user to provide some CSS as a string of
semi-colon separated key-value pairs, where key-value pairs are
separated by colons. But for many options we can avoid writing CSS
directly using these helper functions.

### 2.1 CSS styling

The style of many interactive elements is determined by a character
string containing CSS styling. Each CSS declaration includes a property
name and an associated value. Property names and values are separated by
colons and name-value pairs always end with a semicolon. Spaces can be
added around delimiters to improve readability. For example
`color:gray; text-align:center;"`.

Common CSS properties include:

- `color`: color for points, etc.
- `stroke`: color for lines, text, etc.
- `background-color`: background color for text
- `fill`: fill color for points, rectangles, etc.
- `border-style`, `border-width`, `border-color`: border properties for
  rectangles, can be combined as in `border: 5px solid red;`
- `width`, `height`: size (of tooltip, for example)
- `padding`: space around content
- `opacity`: opacity (a number between 0 and 1)

> **Color keys**
>
> Notice that the names of the keys for setting color vary among the
> various kinds of elements. To make things more confusing, text
> elements have both stroke and fill. Text will often look better if the
> stroke is removed, unless is is large enough to have substantial space
> within the stroke.

> **Don’t include curly braces**
>
> If you are familiar with CSS, you might be tempted to wrap your CSS
> string in curly braces. [`gf_girafe()`](../reference/gf_girafe.md)
> takes care of adding those for you, so don’t include them in your
> string.

### 2.2 Hover options

#### 2.2.1 Hover CSS

Use `opts_hover` to style hovered data elements, `opts_hover_inv` to
style non-hovered data elements, and `opts_hover_key` to style hovered
guide elements. Common CSS properties for styling these elements include

- `fill`: background color
- `stroke`: color
- `stroke-width`: border width
- `r`: circle radius
- `opacity`: opacity (a number between 0 and 1)

We can use opacity to improve our interactive facets.

``` r

diamonds_bargraph_3 |>
  gf_theme(theme_facets_interactive(theme_minimal())) |>
  gf_facet_wrap_interactive(
    ~clarity, # or vars(clarity)
    interactive_on = "both",
    ncol = 2,
    labeller = gf_labeller_interactive(
      tooltip = ~ paste("this is clarity", clarity),
      data_id = ~clarity
    )
  ) |>
  gf_girafe(
    options = list(
      opts_hover("fill:red; opacity: 0.5")
    )
  )
```

This still leaves room for some improvement as our hover option is
affecting both the strip rectangle and the strip text.

#### 2.2.2 `girafe_css()`

Sometimes we need finer control over what gets styled by our css. For
example, when using interactive facets or
[`gf_label_interactive()`](../reference/gf_label_interactive.md), the
interactive elements include both text and rectangles, which we may wish
to style differently.
[`girafe_css()`](https://davidgohel.github.io/ggiraph/reference/girafe_css.html)
provides this finer control. The `css` argument provides a starting
point which can be overridden with the subsequent arguments: `text`,
`point`, `line`, `area` (used for rects, polygons, and paths), and
`image`.

``` r

diamonds_bargraph_3 |>
  gf_theme(theme_facets_interactive(theme_minimal())) |>
  gf_facet_wrap_interactive(
    ~clarity, # or vars(clarity)
    interactive_on = "both",
    ncol = 2,
    labeller = gf_labeller_interactive(
      tooltip = ~ paste("this is clarity", clarity),
      data_id = ~clarity
    )
  ) |>
  gf_girafe(
    options = list(
      opts_hover(
        css = girafe_css(
          css = "fill:red; opacity:0.7; stroke:black; stroke-width:3px;",
          text = "stroke:none; fill:white; opacity:0.9;"
        )
      )
    )
  )
```

Here is another example, this time using
[`gf_label_interactive()`](../reference/gf_label_interactive.md).

``` r

mtcars2[1:6, ] |>
  gf_label_interactive(qsec ~ disp, label = ~carname, data_id = ~carname) |>
  gf_girafe(
    options = list(
      opts_hover(
        css = girafe_css(
          css = "fill:yellow;",
          text = "stroke:none; fill:red;"
        )
      )
    )
  )
```

#### 2.2.3 Key and inverse hovering

Styling hovering on a guide element (part of the legend or key) is
handled with
[`opts_hover_key()`](https://davidgohel.github.io/ggiraph/reference/opts_hover.html)
in the same way we used
[`opts_hover()`](https://davidgohel.github.io/ggiraph/reference/opts_hover.html).
We can also style the non-selected elements with
[`opts_hover_inv()`](https://davidgohel.github.io/ggiraph/reference/opts_hover.html).

> **Use low opacity in non-selected elements to make highlighted
> elements stand out.**
>
> The use of low opacity in non-hovered elements can be used to
> highlight the selected elements.

``` r

mosaicData::Weather |>
  gf_line_interactive(
    high_temp ~ date,
    color = ~city,
    show.legend = FALSE,
    tooltip = ~city,
    data_id = ~city
  ) |>
  gf_facet_wrap_interactive(
    ~year,
    ncol = 1,
    scales = "free_x",
    labeller = gf_labeller_interactive(
      data_id = ~year,
      tooltip = ~ glue::glue("This is the year {year}")
    )
  ) |>
  gf_theme(theme_facets_interactive()) |>
  gf_girafe(
    options = list(
      opts_hover_inv(css = "opacity:0.2;"),
      opts_hover(css = "stroke-width:2;", nearest_distance = 40),
      opts_tooltip(use_cursor_pos = FALSE, offx = 0, offy = -30)
    )
  )
```

### 2.3 Tooltip options

#### 2.3.1 Position

[`opts_tooltip()`](https://davidgohel.github.io/ggiraph/reference/opts_tooltip.html)
has three arguments for determining the position of the tooltip:

- `use_cursor_pos` – a logical indicating whether the tooltip position
  is relative to the cursor position (default) or to the upper left
  corner of the plot.
- `offx`, `offy` – the number of pixels to offset the tooltip from this
  base position.

``` r

cars_scatter |>
  gf_girafe(
    options = list(
      opts_tooltip(offx = 0, offy = -30, use_cursor_pos = FALSE)
    )
  )
```

#### 2.3.2 Autocoloring

If we set `use_fill = TRUE`, then the fill color of the tooltip will
match the color of the plot element it is associated to.

``` r

diamonds_bargraph_3 |>
  gf_girafe(
    options = list(
      opts_tooltip(
        use_fill = TRUE,
        offx = 0,
        offy = 0,
        use_cursor_pos = FALSE,
        css = "border: 2px solid black; color: aliceblue; border-radius: 4px; padding: 6px;"
      )
    )
  )
```

> **A downside of `use_fill = TRUE`**
>
> Depending on your color scheme, you may find it hard to find a text
> color that works well over all the different fill colors.

### 2.4 Zoom options

We can enable panning and zooming by choosing a value of `max` greater
than 1 in
[`opts_zoom()`](https://davidgohel.github.io/ggiraph/reference/opts_zoom.html).

``` r

cars_scatter |>
  gf_girafe(
    options = list(opts_zoom(max = 5))
  )
```

### 2.5 Global options

We can set options globally using
[`set_girafe_defaults()`](https://davidgohel.github.io/ggiraph/reference/set_girafe_defaults.html)

``` r

set_girafe_defaults(
  # set colors for
  opts_hover = opts_hover(
    css = "fill:yellow;stroke:black;stroke-width:3px;r:10px;"
  ),
  opts_hover_inv = opts_hover_inv(css = "opacity:0.5"),
  # allow zooming/panning up to 4x size
  opts_zoom = opts_zoom(min = 1, max = 4),
  opts_tooltip = opts_tooltip(
    css = "padding: 2px; border: 4px solid navy; background-color: steelblue; color: white; border-radius: 8px"
  ),
  opts_sizing = opts_sizing(rescale = TRUE),
  opts_toolbar = opts_toolbar(
    saveaspng = FALSE,
    position = "bottom",
    delay_mouseout = 5000
  )
)

cars_scatter |>
  gf_girafe()
```

``` r


cars_scatter |>
  gf_girafe(
    options = list(
      opts_tooltip(offx = 0, offy = -25, use_cursor_pos = FALSE)
    )
  )
```

> **Warning**
>
> Notice that using
> [`opts_tooltip()`](https://davidgohel.github.io/ggiraph/reference/opts_tooltip.html)
> in the `options` argument of
> [`gf_girafe()`](../reference/gf_girafe.md) not only changes `offx`,
> `offy`, and `use_cursor_pos`, but also causes `css` to revert to the
> package defaults rather than to the session defaults we set.

[^1]: Technically, we are seeing the data after both the statistic and
    the scale have been applied. See below.
