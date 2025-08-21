# Roxygen generated with examples

#' Interactive reference lines
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_abline()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_abline_interactive(mpg ~ wt, data = mtcars,
#'                      tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_abline()], [gf_girafe()]
#' @export
#' @name gf_abline_interactive

gf_abline_interactive

#' Interactive area plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_area()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_area_interactive(mpg ~ wt, data = mtcars,
#'                    tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_area()], [gf_girafe()]
#' @export
#' @name gf_area_interactive

gf_area_interactive

#' Interactive bar charts
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_bar()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Interactive bar chart with counts
#' gf_bar_interactive(
#'   ~ cyl, data = mtcars,
#'   tooltip = ~ paste("Cylinders:", x, "Count:", after_stat(count))) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_bar()], [gf_girafe()]
#' @export
#' @name gf_bar_interactive

gf_bar_interactive

#' Interactive bin_2d plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_bin_2d()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_bin_2d_interactive(mpg ~ wt, data = mtcars,
#'                      tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_bin_2d()], [gf_girafe()]
#' @export
#' @name gf_bin_2d_interactive

gf_bin_2d_interactive

#' Interactive bin2d plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_bin2d()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_bin2d_interactive(mpg ~ wt, data = mtcars,
#'                     tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_bin2d()], [gf_girafe()]
#' @export
#' @name gf_bin2d_interactive

gf_bin2d_interactive

#' Interactive box plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_boxplot()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Interactive boxplot with group information
#' gf_boxplot_interactive(mpg ~ factor(cyl), data = mtcars,
#'                       tooltip = ~ paste("Cylinders:", cyl)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_boxplot()], [gf_girafe()]
#' @export
#' @name gf_boxplot_interactive

gf_boxplot_interactive

#' Interactive column charts
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_col()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Interactive column chart with pre-computed values
#' if (require(dplyr)) {#'   mtcars |> 
#'     group_by(cyl) |>
#'     summarise(avg_mpg = mean(mpg)) |>
#'     gf_col_interactive(avg_mpg ~ factor(cyl),
#'                       tooltip = ~ paste("Avg MPG:", round(avg_mpg, 1))) |>
#'     gf_girafe()
#' }
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_col()], [gf_girafe()]
#' @export
#' @name gf_col_interactive

gf_col_interactive

#' Interactive contour_filled plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_contour_filled()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_contour_filled_interactive(mpg ~ wt, data = mtcars,
#'                              tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_contour_filled()], [gf_girafe()]
#' @export
#' @name gf_contour_filled_interactive

gf_contour_filled_interactive

#' Interactive contour plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_contour()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_contour_interactive(mpg ~ wt, data = mtcars,
#'                       tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_contour()], [gf_girafe()]
#' @export
#' @name gf_contour_interactive

gf_contour_interactive

#' Interactive count plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_count()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_count_interactive(mpg ~ wt, data = mtcars,
#'                     tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_count()], [gf_girafe()]
#' @export
#' @name gf_count_interactive

gf_count_interactive

#' Interactive crossbar plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_crossbar()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_crossbar_interactive(mpg ~ wt, data = mtcars,
#'                        tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_crossbar()], [gf_girafe()]
#' @export
#' @name gf_crossbar_interactive

gf_crossbar_interactive

#' Interactive curve plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_curve()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_curve_interactive(mpg ~ wt, data = mtcars,
#'                     tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_curve()], [gf_girafe()]
#' @export
#' @name gf_curve_interactive

gf_curve_interactive

#' Interactive density_2d_filled plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_density_2d_filled()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_density_2d_filled_interactive(mpg ~ wt, data = mtcars,
#'                                 tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_density_2d_filled()], [gf_girafe()]
#' @export
#' @name gf_density_2d_filled_interactive

gf_density_2d_filled_interactive

#' Interactive density_2d plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_density_2d()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_density_2d_interactive(mpg ~ wt, data = mtcars,
#'                          tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_density_2d()], [gf_girafe()]
#' @export
#' @name gf_density_2d_interactive

gf_density_2d_interactive

#' Interactive density plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_density()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'

#' @examples
#' diamonds |>
#'   gf_density_interactive(
#'     ~ carat, 
#'     fill = ~ cut, 
#'     color = ~ cut, 
#'     data_id = ~ cut, 
#'     tooltip = ~ cut) |> 
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_density()], [gf_girafe()]
#' @export
#' @name gf_density_interactive

gf_density_interactive

#' Interactive density2d_filled plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_density2d_filled()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_density2d_filled_interactive(mpg ~ wt, data = mtcars,
#'                                tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_density2d_filled()], [gf_girafe()]
#' @export
#' @name gf_density2d_filled_interactive

gf_density2d_filled_interactive

#' Interactive density2d plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_density2d()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_density2d_interactive(mpg ~ wt, data = mtcars,
#'                         tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_density2d()], [gf_girafe()]
#' @export
#' @name gf_density2d_interactive

gf_density2d_interactive

#' Interactive dotplot plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_dotplot()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_dotplot_interactive(mpg ~ wt, data = mtcars,
#'                       tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_dotplot()], [gf_girafe()]
#' @export
#' @name gf_dotplot_interactive

gf_dotplot_interactive

#' Interactive errorbar plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_errorbar()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_errorbar_interactive(mpg ~ wt, data = mtcars,
#'                        tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_errorbar()], [gf_girafe()]
#' @export
#' @name gf_errorbar_interactive

gf_errorbar_interactive

#' Interactive freqpoly plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_freqpoly()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_freqpoly_interactive(mpg ~ wt, data = mtcars,
#'                        tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_freqpoly()], [gf_girafe()]
#' @export
#' @name gf_freqpoly_interactive

gf_freqpoly_interactive

#' Interactive hex plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_hex()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_hex_interactive(mpg ~ wt, data = mtcars,
#'                   tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_hex()], [gf_girafe()]
#' @export
#' @name gf_hex_interactive

gf_hex_interactive

#' Interactive histograms
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_histogram()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Interactive histogram with bin information
#' mtcars |> 
#'   gf_histogram_interactive(
#'     ~ mpg, 
#'     tooltip = ~ paste0('Min: ', round(after_stat(xmin), 1), '; Max: ', round(after_stat(xmax),1), '; Count: ', after_stat(count)),
#'     bins = 15) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_histogram()], [gf_girafe()]
#' @export
#' @name gf_histogram_interactive

gf_histogram_interactive

#' Interactive horizontal lines
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_hline()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Interactive horizontal reference line
#' gf_point_interactive(mpg ~ wt, data = mtcars, alpha = 0.7) |>
#'   gf_hline_interactive(yintercept = ~ mean(mpg),
#'                       tooltip = ~ paste("Mean MPG:", round(mean(mpg), 1)),
#'                       color = "red", linetype = "dashed") |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_hline()], [gf_girafe()]
#' @export
#' @name gf_hline_interactive

gf_hline_interactive

#' Interactive jitter plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_jitter()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Interactive jittered points
#' gf_jitter_interactive(mpg ~ factor(cyl), data = mtcars,
#'                      tooltip = ~ paste0(rownames(mtcars), ": ", mpg, "mpg"),
#'                      width = 0.2) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_jitter()], [gf_girafe()]
#' @export
#' @name gf_jitter_interactive

gf_jitter_interactive

#' Interactive text labels
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_label()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_label_interactive(mpg ~ wt, data = mtcars,
#'                     tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_label()], [gf_girafe()]
#' @export
#' @name gf_label_interactive

gf_label_interactive

#' Interactive line plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_line()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Interactive line plot with tooltips
#' economics |>
#'   gf_line_interactive(unemploy ~ date,
#'                      tooltip = ~ paste("Date:", date, "Unemployed:", unemploy)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_line()], [gf_girafe()]
#' @export
#' @name gf_line_interactive

gf_line_interactive

#' Interactive linerange plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_linerange()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_linerange_interactive(mpg ~ wt, data = mtcars,
#'                         tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_linerange()], [gf_girafe()]
#' @export
#' @name gf_linerange_interactive

gf_linerange_interactive

#' Interactive path plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_path()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_path_interactive(mpg ~ wt, data = mtcars,
#'                    tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_path()], [gf_girafe()]
#' @export
#' @name gf_path_interactive

gf_path_interactive

#' Interactive scatter plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_point()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive scatter plot
#' gf_point_interactive(mpg ~ wt, data = mtcars,
#'                     tooltip = ~ paste("Model:", rownames(mtcars))) |>
#'   gf_girafe()
#'   
#' # With color mapping and data_id for selection
#' gf_point_interactive(mpg ~ wt, data = mtcars,
#'                     color = ~ factor(cyl),
#'                     tooltip = ~ paste(rownames(mtcars), ":", mpg, "mpg"),
#'                     data_id = ~ rownames(mtcars)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_point()], [gf_girafe()]
#' @export
#' @name gf_point_interactive

gf_point_interactive

#' Interactive pointrange plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_pointrange()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_pointrange_interactive(mpg ~ wt, data = mtcars,
#'                          tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_pointrange()], [gf_girafe()]
#' @export
#' @name gf_pointrange_interactive

gf_pointrange_interactive

#' Interactive polygon plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_polygon()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_polygon_interactive(mpg ~ wt, data = mtcars,
#'                       tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_polygon()], [gf_girafe()]
#' @export
#' @name gf_polygon_interactive

gf_polygon_interactive

#' Interactive quantile plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_quantile()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_quantile_interactive(mpg ~ wt, data = mtcars,
#'                        tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_quantile()], [gf_girafe()]
#' @export
#' @name gf_quantile_interactive

gf_quantile_interactive

#' Interactive raster plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_raster()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_raster_interactive(mpg ~ wt, data = mtcars,
#'                      tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_raster()], [gf_girafe()]
#' @export
#' @name gf_raster_interactive

gf_raster_interactive

#' Interactive rect plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_rect()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_rect_interactive(mpg ~ wt, data = mtcars,
#'                    tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_rect()], [gf_girafe()]
#' @export
#' @name gf_rect_interactive

gf_rect_interactive

#' Interactive ribbon plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_ribbon()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_ribbon_interactive(mpg ~ wt, data = mtcars,
#'                      tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_ribbon()], [gf_girafe()]
#' @export
#' @name gf_ribbon_interactive

gf_ribbon_interactive

#' Interactive segment plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_segment()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_segment_interactive(mpg ~ wt, data = mtcars,
#'                       tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_segment()], [gf_girafe()]
#' @export
#' @name gf_segment_interactive

gf_segment_interactive

#' Interactive sf plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_sf()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_sf_interactive(mpg ~ wt, data = mtcars,
#'                  tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_sf()], [gf_girafe()]
#' @export
#' @name gf_sf_interactive

gf_sf_interactive

#' Interactive smoothed conditional means
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_smooth()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Interactive smooth line with confidence band
#' gf_point_interactive(mpg ~ wt, data = mtcars, alpha = 0.5, se = TRUE) |>
#'   gf_smooth_interactive(tooltip = ~ "loess line") |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_smooth()], [gf_girafe()]
#' @export
#' @name gf_smooth_interactive

gf_smooth_interactive

#' Interactive spoke plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_spoke()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_spoke_interactive(mpg ~ wt, data = mtcars,
#'                     tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_spoke()], [gf_girafe()]
#' @export
#' @name gf_spoke_interactive

gf_spoke_interactive

#' Interactive step plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_step()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_step_interactive(mpg ~ wt, data = mtcars,
#'                    tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_step()], [gf_girafe()]
#' @export
#' @name gf_step_interactive

gf_step_interactive

#' Interactive text annotations
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_text()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Interactive text annotations
#' gf_point_interactive(mpg ~ wt, data = mtcars, alpha = 0.7) |>
#'   gf_text_interactive(mpg ~ wt, data = mtcars[1:5, ],
#'                      label = ~ rownames(mtcars)[1:5],
#'                      tooltip = ~ paste("Car:", rownames(mtcars)[1:5])) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_text()], [gf_girafe()]
#' @export
#' @name gf_text_interactive

gf_text_interactive

#' Interactive tile plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_tile()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Basic interactive plot
#' gf_tile_interactive(mpg ~ wt, data = mtcars,
#'                    tooltip = ~ paste("MPG:", mpg)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_tile()], [gf_girafe()]
#' @export
#' @name gf_tile_interactive

gf_tile_interactive

#' Interactive violin plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_violin()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Interactive violin plot
#' gf_violin_interactive(mpg ~ factor(cyl), data = mtcars,
#'                      tooltip = ~ paste("Cylinders:", cyl)) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_violin()], [gf_girafe()]
#' @export
#' @name gf_violin_interactive

gf_violin_interactive

#' Interactive vertical lines
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_vline()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the earlier portions
#'   of the chain. Most users can safely ignore this argument.
#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by
#'   including `|` in the formula.
#' @param data The data to be displayed in this layer.
#' @param tooltip A formula specifying a variable for tooltips, or a character vector.
#' @param data_id A formula or character vector specifying data identifiers
#'   for interactive selection.
#' @param ... Additional arguments passed to the underlying geom.
#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.
#' @param xlab,ylab,title,subtitle,caption Labels for the plot.
#' @param show.legend Logical. Should this layer be included in the legends?
#' @param show.help Logical. If `TRUE`, display some minimal help.
#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.
#' @param environment An environment in which to evaluate the formula.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#'
#' @examples
#' # Interactive vertical reference line
#' gf_point_interactive(mpg ~ wt, data = mtcars, alpha = 0.7) |>
#'   gf_vline_interactive(xintercept = ~ mean(wt),
#'                       tooltip = ~ paste("Mean Weight:", round(mean(wt), 1)),
#'                       color = "blue", linetype = "dashed") |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_vline()], [gf_girafe()]
#' @export
#' @name gf_vline_interactive

gf_vline_interactive

