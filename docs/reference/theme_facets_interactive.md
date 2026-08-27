# Interactive theme for ggiraph facets

A theme that enables interactive strip text and backgrounds for faceted
plots using ggiraph. This theme ensures that facet labels can receive
hover events and tooltips.

## Usage

``` r
theme_facets_interactive(
  base_theme = theme_bw(),
  interactive_text = TRUE,
  interactive_rects = TRUE,
  strip_text_color = NULL,
  strip_background_color = NULL,
  strip_text_size = NULL
)
```

## Arguments

- base_theme:

  A theme that will will be modified

- interactive_text:

  A logical indicating whether text elements of strips should be
  interactive.

- interactive_rects:

  A logical indicating whether rect elements of strips should be
  interactive.

- strip_text_color:

  Color for strip text (or NULL to retain settings from `base_theme`)

- strip_background_color:

  Color for strip background (or NULL to retain settings from
  `base_theme`)

- strip_text_size:

  Size for strip text (or NULL to retain settings from `base_theme`)

## Value

A ggplot2 theme object
