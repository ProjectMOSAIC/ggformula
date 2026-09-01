# Formula interface to ggplot2

Provides a formula interface to 'ggplot2' graphics.

## The ggformula system

The functions in ggformula provide a formula interface to ggplot2 layer
functions and a system for working with pipes to create multi-layer
plots and to refine plots. For plots with just one layer, the formula
interface is more compact than native ggplot2 code and is consistent
with modeling functions like
[`stats::lm()`](https://rdrr.io/r/stats/lm.html) that use a formula
interface and with the numerical summary functions in the mosaic
package.

## Specifying plot attributes

Positional attributes (a.k.a aesthetics) are typically specified using a
formula (see the `gformula` argument). Setting and mapping of additional
attributes can be done through the use of additional arguments.
Attributes can be set can be set using arguments of the form
`attribute = value` or mapped using arguments of the form
`attribute = ~ expression`. A (sometimes partial) list of available
attributes can be obtained by executing plotting functions with no
arguments.

In formulas of the form `A | B`, `B` will be used to form facets using
[`ggplot2::facet_wrap()`](https://ggplot2.tidyverse.org/reference/facet_wrap.html)
or
[`ggplot2::facet_grid()`](https://ggplot2.tidyverse.org/reference/facet_grid.html).
This provides an alternative to [`gf_facet_wrap()`](gf_facet_grid.md)
and [`gf_facet_grid()`](gf_facet_grid.md) that is terser and may feel
more familiar to users of lattice.

## Evaluation

Evaluation of the ggplot2 code occurs in the environment specified by
`environment`. This will typically do the right thing, but is exposed in
case some non-standard behavior is desired. In earlier versions, the
environment of the formula was used, but since some functions in the
package do not require a formula, a separate argument is used now.

## See also

Useful links:

- <https://github.com/ProjectMOSAIC/ggformula>

- Report bugs at <https://github.com/ProjectMOSAIC/ggformula/issues>

## Author

**Maintainer**: Randall Pruim <rpruim@gmail.com>

Authors:

- Randall Pruim <rpruim@gmail.com>

- Daniel Kaplan <kaplan@macalester.edu>

## Examples

``` r
apropos("gf_")
#>   [1] "gf_abline"                        "gf_abline_interactive"           
#>   [3] "gf_annotate"                      "gf_area"                         
#>   [5] "gf_area_interactive"              "gf_ash"                          
#>   [7] "gf_bar"                           "gf_bar_interactive"              
#>   [9] "gf_barh"                          "gf_bin2d"                        
#>  [11] "gf_bin2d_interactive"             "gf_bin_2d"                       
#>  [13] "gf_bin_2d_interactive"            "gf_blank"                        
#>  [15] "gf_boxplot"                       "gf_boxplot_interactive"          
#>  [17] "gf_boxploth"                      "gf_coefline"                     
#>  [19] "gf_col"                           "gf_col_interactive"              
#>  [21] "gf_colh"                          "gf_contour"                      
#>  [23] "gf_contour_filled"                "gf_contour_filled_interactive"   
#>  [25] "gf_contour_interactive"           "gf_count"                        
#>  [27] "gf_count_interactive"             "gf_counts"                       
#>  [29] "gf_countsh"                       "gf_crossbar"                     
#>  [31] "gf_crossbar_interactive"          "gf_crossbarh"                    
#>  [33] "gf_curve"                         "gf_curve_interactive"            
#>  [35] "gf_dens"                          "gf_dens2"                        
#>  [37] "gf_density"                       "gf_density2d"                    
#>  [39] "gf_density2d_filled"              "gf_density2d_filled_interactive" 
#>  [41] "gf_density2d_interactive"         "gf_density_2d"                   
#>  [43] "gf_density_2d_filled"             "gf_density_2d_filled_interactive"
#>  [45] "gf_density_2d_interactive"        "gf_density_interactive"          
#>  [47] "gf_density_ridgeline_gradient"    "gf_density_ridges"               
#>  [49] "gf_density_ridges2"               "gf_density_ridges_gradient"      
#>  [51] "gf_dhistogram"                    "gf_dist"                         
#>  [53] "gf_dotplot"                       "gf_dotplot_interactive"          
#>  [55] "gf_ecdf"                          "gf_ellipse"                      
#>  [57] "gf_empty"                         "gf_errorbar"                     
#>  [59] "gf_errorbar_interactive"          "gf_errorbarh"                    
#>  [61] "gf_facet_grid"                    "gf_facet_grid_interactive"       
#>  [63] "gf_facet_wrap"                    "gf_facet_wrap_interactive"       
#>  [65] "gf_fitdistr"                      "gf_frame"                        
#>  [67] "gf_freqpoly"                      "gf_freqpoly_interactive"         
#>  [69] "gf_fun"                           "gf_fun2d"                        
#>  [71] "gf_fun_2d"                        "gf_fun_contour"                  
#>  [73] "gf_fun_tile"                      "gf_function"                     
#>  [75] "gf_function2d"                    "gf_function_2d"                  
#>  [77] "gf_function_contour"              "gf_function_tile"                
#>  [79] "gf_girafe"                        "gf_guides"                       
#>  [81] "gf_hex"                           "gf_hex_interactive"              
#>  [83] "gf_histogram"                     "gf_histogram_interactive"        
#>  [85] "gf_hline"                         "gf_hline_interactive"            
#>  [87] "gf_jitter"                        "gf_jitter_interactive"           
#>  [89] "gf_label"                         "gf_label_interactive"            
#>  [91] "gf_labeller_interactive"          "gf_labs"                         
#>  [93] "gf_lims"                          "gf_line"                         
#>  [95] "gf_line_interactive"              "gf_linerange"                    
#>  [97] "gf_linerange_interactive"         "gf_linerangeh"                   
#>  [99] "gf_lm"                            "gf_path"                         
#> [101] "gf_path_interactive"              "gf_percents"                     
#> [103] "gf_percentsh"                     "gf_plot"                         
#> [105] "gf_point"                         "gf_point_interactive"            
#> [107] "gf_pointrange"                    "gf_pointrange_interactive"       
#> [109] "gf_pointrangeh"                   "gf_polygon"                      
#> [111] "gf_polygon_interactive"           "gf_props"                        
#> [113] "gf_propsh"                        "gf_qq"                           
#> [115] "gf_qqline"                        "gf_qqstep"                       
#> [117] "gf_quantile"                      "gf_quantile_interactive"         
#> [119] "gf_raster"                        "gf_raster_interactive"           
#> [121] "gf_rect"                          "gf_rect_interactive"             
#> [123] "gf_refine"                        "gf_relabel"                      
#> [125] "gf_ribbon"                        "gf_ribbon_interactive"           
#> [127] "gf_ridgeline"                     "gf_rug"                          
#> [129] "gf_rugx"                          "gf_rugy"                         
#> [131] "gf_segment"                       "gf_segment_interactive"          
#> [133] "gf_sf"                            "gf_sf_interactive"               
#> [135] "gf_sina"                          "gf_smooth"                       
#> [137] "gf_smooth_interactive"            "gf_spline"                       
#> [139] "gf_spoke"                         "gf_spoke_interactive"            
#> [141] "gf_step"                          "gf_step_interactive"             
#> [143] "gf_summary"                       "gf_text"                         
#> [145] "gf_text_interactive"              "gf_theme"                        
#> [147] "gf_tile"                          "gf_tile_interactive"             
#> [149] "gf_violin"                        "gf_violin_interactive"           
#> [151] "gf_violinh"                       "gf_vline"                        
#> [153] "gf_vline_interactive"            
gf_point()
#> gf_point() uses 
#>     * a formula with shape y ~ x. 
#>     * geom:  point 
#>     * key attributes:  alpha, color, size, shape, fill, group, stroke
#> 
#> For more information, try ?gf_point
```
