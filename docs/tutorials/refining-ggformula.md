# Refining ggformula plots

# Refining ggformula plots

[← Back to the ggformula package
site](https://www.mosaic-web.org/ggformula/)

## Refining ggformula plots

If you are fussy about your plots, you may be wondering how to have more
control over things like:

- the colors, shapes, and sizes chosen when mapping attributes
- labeling, including titles and axis labels
- fonts, colors, and sizes of text
- color of plot elements like background, gridlines, facet labels, etc.

As you can imagine, all of these things can be adjusted pretty much
however you like. This tutorial will introduce you to refining plots in
`ggformula`.

## A quick anatomy lesson

Not biological anatomy, rather plot anotomy. In order to talk about
plots, it is handy to have words for their various components.

- A **frame** is the bounding rectangle in which the plot is
  constructed. This is essentially what you may think of as the x- and
  y- axes, but the plot isn’t actually required to have visible “axes”.

- **glyphs** or **marks** are the particular symbols placed on the plot
  (examples: dots, lines, smiley faces, your favorite emoji, or whatever
  gets drawn).

- Each glyph has a number of **attributes** or **properties**.

  - These always include position (you have to put them somewhere).
  - Other attributes incude things like size, color, shape.
  - Not all glyphs have the same attributes (points have shape, but
    lines do not, for example).

- **facets** are coordinated subplots.

- **scales** map raw data over to attributes of the plot.

- **guides** go in the other direction and help the human map graphical
  attributes back to the raw data. Guides include what you might call a
  legend, but also things like axis labeling.

- **coordinates** are something like scales for positional attributes
  and define the coordinate system for the frame.

- **statistics** (stats) transform data before the plot is generated. A
  common example is the use of `stat_bin()` to bin raw data before
  generating a histogram.

## Glyphs that use more than two positions

In addition to functions like `gf_histogram()` that require only a
single position variable and like `gf_point()` that require two, there
are several `gf_` functions that require more than two position
variables. How these positions are communicated via slots in the formula
is described by the “shape” listed in the quick help for these
functions.

**Exercise 1** Edit the code below to reveal the formula shape for some
of the following: `gf_linerange()`, `gf_errorbar()`, `gf_errorbarh()`,
`gf_ribbon()`, `gf_crossbar()`.

**Exercise 2** The `Weather` data set has temperature information for
five cities for each day in 2016 and 2017. Edit the code below to use
`gf_linerange()` or `gf_pointrange()`. For a fancier plot, map the color
to one of the three temperature variables.

## Annotation

### Titles and axis labels

Plot titles and axis labels can be set using `gf_labs()`. Text can be
provied for `title`, `subtitle`, `caption`, and the positional
attributes (`x` and `y`).

**Exercise 3** Edit some of the labels of this plot as you see fit.
Notice that labels can be turned off by setting them to ““. (We’ll learn
how to improve the color scheme shortly.)

### Text and other labels

Arbitrary text can be placed on a plot using `gf_text()` or
`gf_label()`.

**Exercise 4**  

1.  Run the code below.

2.  Then change `gf_text()` to `gf_label()` to see how these differ.

3.  Now change things so that the text or labels (your choice) are red.

## gf_refine()

`gf_refine()` converts plot elements from native `ggplot2` into a form
that makes them chainable with `ggformula`. Those familiar with
`ggplot2` can replace

``` r
p + foo(...)
```

``` r
p |> gf_refine(foo(...))
```

For those not already familiar with `ggplot2`, in the remainder of this
tutorial, we illustrate some of the most common uses of `gf_refine()`.

## Controlling Scales

### How scales work

When we include `color = ~ avg_temp` to out plot code, each value of the
variable `avg_temp` is assigned a color. It is the job of the color
scale to determine which values get mapped to which colors. (A guide can
be used so that humans can map back from colors to values when
interpreting the plot.) If we don’t like the default color choices, we
can tell R to use a different scale.

The situation is similar for other attributes (shape, size, fill, etc.),
each of which has its own scale.

### Color and fill

The colors in our temperature map have two problems.

- First, the differences are a bit subtle.
- Second, the blues don’t communicate “hot” very well.

We can fix this by selecting a scale for color. This is done by passing
the desired scale as an argument to `gf_refine()`, a general purpose
function for refining our plots.

In the example below, we choose a rainbow of colors (and reverse the
order) so warmer temperatures have warmer colors.
`scale_color_gradientn()` creates a scale by interpolating between
several colors – in this case five colors selected using the `rainbow()`
function.

**Exercise 5** You can also use `scale_color_gradientn()` with colors
you enter manually. Add a few colors between navy and red to make
something more like the rainbow colors above.

### Discrete colors

Discrete variables can also be mapped to colors. If you want to
determine which values are assigned to which colors, you can do this
with `scale_color_manual()`

**Exercise 6** Refine this plot using `scale_fill_manual()`. Replace the
five colors in the example with five of your own choosing. (Use
`colors()` to list the possible color names.)

### ColorBrewer scales

ColorBrewer, by Cynthia Brewer, Mark Harrower, and The Pennsylvania
State University, is a collection of nice looking color palettes
especially designed for use with maps, but useful for many other
purposes as well.

There are 3 types of ColorBrewer palettes, sequential, diverging, and
qualitative.

1.  Sequential (`type = "seq"`) palettes are suited to ordered data that
    progress from low to high. Lightness steps dominate the look of
    these schemes, with light colors for low data values to dark colors
    for high data values.

2.  Diverging (`type = "div"`) palettes put equal emphasis on mid-range
    critical values and extremes at both ends of the data range. The
    critical class or break in the middle of the legend is emphasized
    with light colors and low and high extremes are emphasized with dark
    colors that have contrasting hues.

3.  Qualitative (`type = "qual"`) palettes do not imply magnitude
    differences between legend classes, and hues are used to create the
    primary visual differences between classes. Qualitative schemes are
    best suited to representing nominal or categorical data.

To use a ColorBrewer palette, select `scale_color_brewer()` for discrete
data or `scale_color_distiller()` for continuous data. The latter
interpolates colors within one of the categorical palettes from
ColorBrewer.

**Exercise 7** Experiment with different colors by choosing different
values for `type` and `palette`.

### Adjusing other scales

Other scales work similarly.

## Coordinates

### coord_flip()

As the name suggests, `coord_flip()` reverses the roles of the x- and
y-axes. This is most useful for glyphs that `ggplot2` only provides in a
“vertical” version, such as boxplots and violin plots.

**Exercise 8** Make horizontal violin plots by inserting `coord_flip()`
into `gf_refine()`. Change the plot to boxplots if you prefer those.

Tip`coord_flip()` often not needed.

Many `ggplot2` geoms determine whether to draw horizontal or vertical
version based on the types of data supplied in the variables, so
`ccord_flip()` can often be avoid by simply reversing which variable
goes where.

If the default orientation isn’t the desired one, the `orientation`
argument can be used to clarify.

### coord_equal()

When the x- and y-axes are on the same scale, it is sometimes good to
force both scales to be rendered at the same size. This also forces an
identity line to have a true 45 degree slope.

**Exercise 9** Use `coord_equal()` to force equally-sized coordinate
scales in the plot below.

### coord_trans()

`coord_trans()` is used to construct scales with a transformation built
in.

#### Example

The example below isn’t very useful, but demonstrates two of the
transformations that are available. Find out more with `?coord_trans()`.

Built-in transformations include `asn_trans()`, `atanh_trans()`,
`boxcox_trans()`, `date_trans()`, `exp_trans()`, `hms_trans()`,
`identity_trans()`, `log10_trans()`, `log1p_trans()`, `log2_trans()`,
`log_trans()`, `logit_trans()`, `probability_trans()`, `probit_trans()`,
`reciprocal_trans()`, `reverse_trans()`, `sqrt_trans()`, and
`time_trans()`. New transformations can be created using `trans_new()`
in the `scales` package.

## Controlling the view

Often it is useful to limit or expand the view of the data presented in
a plot. There are three ways this can be done.

1.  Filter the data and build the plot only from the resulting (smaller)
    data set.

2.  Use `gf_lim()` to set limits for the x- and y-axes.

3.  Use scales for x and y to set the limits.

In this section we will use a different data set. `penguins` contains
data collected by Palmer recording measurements of some penguins.

    # A tibble: 3 × 8
      species island    bill_length_mm bill_depth_mm flipper_length_mm body_mass_g
      <fct>   <fct>              <dbl>         <dbl>             <int>       <int>
    1 Adelie  Torgersen           39.1          18.7               181        3750
    2 Adelie  Torgersen           39.5          17.4               186        3800
    3 Adelie  Torgersen           40.3          18                 195        3250
    # ℹ 2 more variables: sex <fct>, year <int>

    Warning: Removed 2 rows containing non-finite outside the scale range
    (`stat_lm()`).

    Warning: Removed 2 rows containing missing values or values outside the scale range
    (`geom_point()`).

![](refining-ggformula_files/figure-html/penguins-1.png)

### Filtering the data

### gf_lims()

### Using scales to limit the view

## Themes

### Using predefined themes

A number of predefined themes exist that control the appearance of
non-data elements of plots. In this tutorial, we set the default theme
using

``` r
theme_set(theme_bw())
```

Other themes include `theme_minimal()`, `theme_classic()`,
`theme_gray()`, `theme_light()`, `theme_map()`, and `theme_quickmap()`.
The `ggthemes` package includes some additional themes, including
`theme_economist()`, `theme_economist_white()`, `theme_excel()`,
`theme_fivethirtyeight()`, `theme_stata()`, `theme_tufte()`, and
`theme_wsj()`. Many of these themes mimic the look of other software
packages or of popular publications.

The theme can be set for an individual plot using `gf_theme()`.

**Exercise 10**  

1.  Run the code below.

2.  Choose a different theme in place of `theme_fivethirtyeight()`

3.  Themes have optional arguments. Try
    `theme_fivethrityeight(base_size = 8)`. Experiment with different
    sizes and themes.

### Adjusting theme elements

Individual theme elements can also be adjusted.

**Exercise 11** Edit the code below to adjust theme elements. See
`?theme` for details regarding the elements and how to change them.

## Stats

Most often, users will have little need to adust the stat used to make
layer of a plot since the default stat is usually what you need. For
example, the default stat for `gf_histogram()` is `stat_bin()`, which
bins the data before plotting the rectangular bars. So the following are
equivalent.

This also explains why the message reported when you create a histogram
without setting `binwidth` is coming from `stat_bin`. Notice that the
stat can be specified by a quoted string that names the part after
`stat_` or it can be specified by providing the function (potentially
with optional arguments included).

Other non-identity stats that get used with particular functions include

- `stat_density()` gets used with `gf_density()` and `gf_dens()`
- `stat_density2d()` gets used with `gf_density2d()`
- `stat_count()` gets used with `gf_bar()` (`gf_col()` uses
  `stat_identity()`)

Occasionally it is useful to use a non-default stat. In particular,
`stat_summary()` and `stat_summary_bin()` can be used to avoid common
data transformation situations where a function is used to aggregate
over unique values of `x` or over bins of `x` values.

These stats are designed to work with `gf_linerange()` and
`gf_pointrange()`, so three summary functions can be specified.\
`fun.ymin` and `fun.ymax` return results that are available in
`after_stat(ymin)` and `after_stat(ymax)`.

The default summary function is `mean_se` which computes the mean, and
the mean one standard errors added and subtracted.

We can create our own functions for use with `stat_summary`. The
funcition is easiest to use if we write the function to take a vector
`x` as input and to produce a data frame with columns `y`, `ymin`, and
`ymax`. Here is an example that creates a “3-number summary” that can be
used to present the median and first and third quartiles.
