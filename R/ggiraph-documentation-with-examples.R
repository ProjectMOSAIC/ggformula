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
#' mtcars |>
#'   gf_point(mpg ~ wt) |>
#'   gf_abline_interactive(
#'     slope = ~ -2,
#'     intercept = ~ 35,
#'     tooltip = ~ "slope: -2; intercept: 35",
#'   ) |>
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
#' Huron <-
#'   data.frame(
#'     year = 1875:1972,
#'     level = as.vector(LakeHuron)
#'   )
#'
#' Huron |>
#'   gf_area_interactive(
#'     level ~ year,
#'     tooltip = ~ "This is the area.",
#'     data_id = "id:area",
#'     fill = "skyblue"
#'     ) |>
#'   gf_line_interactive(
#'     tooltip = ~ "This is the line.",
#'     data_id = "id:line"
#'   ) |>
#'   gf_girafe(
#'     list(
#'       options = list(opts_tooltip(css = "fill: steelblue;"))
#'     )
#'   )
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
#'
#' diamonds |>
#'   gf_bar_interactive(
#'     ~color,
#'     fill = ~cut,
#'     tooltip = ~ stage(
#'       start = glue::glue("color: {color}; cut: {cut}"),
#'       after_stat = glue::glue("{tooltip}; count = {count}")
#'     ),
#'     data_id = ~ glue::glue("{cut} -- {color}"),
#'     size = 3
#'   ) |>
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
#' mtcars |>
#'   gf_boxplot_interactive(
#'     mpg ~ factor(cyl),
#'     tooltip = ~ paste("Cylinders:", cyl)
#'   ) |> 
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
#' if (require(dplyr)) {
#'   library(dplyr)
#'   diamonds |>
#'     group_by(color, cut) |>
#'     summarise(count = n()) |>
#'     gf_col_interactive(
#'       count ~ color,
#'       fill = ~cut,
#'       tooltip = ~ glue::glue("color: {color}, cut: {cut}, count: {count}"),
#'       data_id = ~ glue::glue("{cut} - {color}")
#'     ) |>
#'   gf_girafe()
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

#' Interactive 2-demensional contour plots
#'
#' Creates an interactive plot using ggiraph. These functions extend
#' [gf_contour()] and
#' [gf_contour_filled()]
#' with interactive features like tooltips and clickable elements.
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
#' faithfuld |>
#'   gf_contour_interactive(
#'     density ~ waiting + eruptions,
#'     color = ~ after_stat(level),
#'     tooltip = ~ after_stat(paste0("density: ", level)),
#'     data_id = ~ after_stat(level),
#'     hover_css = "stroke: red;",
#'     hover_nearest = TRUE,
#'     bins = 10, show.legend = FALSE) |>
#'   gf_girafe()
#'
#' faithfuld |>
#'   gf_contour_filled_interactive(
#'     density ~ waiting + eruptions,
#'     fill = ~ after_stat(level),
#'     tooltip = ~ after_stat(paste0("density: ", level)),
#'     data_id = ~ after_stat(level),
#'     hover_css = "fill: red; opacity: 0.5",
#'     hover_nearest = TRUE,
#'     bins = 10, show.legend = FALSE) |>
#'   gf_girafe()
#
#' @rdname gf_contour_interactive
#' @name gf_contour_filled_interactive
#' @export

gf_contour_filled_interactive


#' @rdname gf_contour_interactive
#' @name gf_contour_interactive
#' @export

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
#' diamonds |>
#'   gf_count_interactive(
#'     clarity ~ cut,
#'     size = ~ after_stat(n),
#'     tooltip = ~ after_stat(paste0("count: ", n)),
#'     show.legend = FALSE
#'   ) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_count()], [gf_density2d_interactive()], [gf_girafe()]
#' @export
#' @rdname gf_count_interactive
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
#'
#' diamonds |>
#'   dplyr::filter(carat < 1.1, carat > 0.9) |>
#'   dplyr::group_by(color, cut) |>
#'   dplyr::summarise(
#'     median_price = median(price) |> round(),
#'     lower = quantile(price, 0.25) |> round(),
#'     upper = quantile(price, 0.75) |> round(),
#'     iqr = upper - lower
#'   ) |>
#'   gf_crossbar_interactive(
#'     cut ~ median_price + lower + upper | color,
#'     color = ~ cut,
#'     tooltip = ~ paste0(
#'       "75th percentile: ", upper,
#'       "\nmedian: ", median_price,
#'       "\n25th percentile: ", lower
#'       )
#'   ) |>
#'   gf_girafe()
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_crossbar()], [gf_girafe()]
#' @export
#' @name gf_crossbar_interactive
#' @rdname gf_crossbar_interactive

gf_crossbar_interactive

#' Interactive curve plots
#'
#' Creates an interactive plot using ggiraph. These functions extend
#' [gf_segment()] and  [gf_curve()] with interactive features like tooltips and
#' clickable elements.
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
#'   gf_curve_interactive(
#'     1 + 2 ~ 0 + 4, color = "red", curvature = - 0.2,
#'     tooltip = ~ "curvature: -0.2",
#'     data_id = 0.2
#'   ) |>
#'   gf_curve_interactive(
#'     1 + 2 ~ 0 + 4, color = "blue", curvature = 0.4,
#'     tooltip = ~ "curvature: 0.4",
#'     data_id = 0.4) |>
#'   gf_segment_interactive(
#'     1 + 2 ~ 0 + 4, color = "green",
#'     tooltip = ~ "curvature: 0",
#'     data_id = 0
#'   ) |>
#'   gf_girafe(
#'     options = list(
#'       opts_hover(css = "stroke: black; stroke-width: 3;", nearest_distance = 10)
#'     )
#'   )
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_curve()], [gf_girafe()]
#' @export
#' @name gf_curve_interactive

gf_curve_interactive

#' Interactive 2-demensional density plots
#'
#' Creates an interactive plot using ggiraph. These functions extend
#' [gf_density2d()],
#' [gf_density_2d()],
#' [gf_density2d_filled()], and
#' [gf_density_2d_filled()]
#' with interactive features like tooltips and clickable elements.
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
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @return A gg object that can be displayed with [gf_girafe()].
#' @seealso [gf_density_2d_filled()], [gf_density_2d()], [gf_contour_interactive()],
#'   [gf_girafe()]
#'
#' @examples
#' faithful |>
#'   gf_density2d_filled_interactive(
#'     eruptions ~ waiting,
#'     tooltip = ~ after_stat(level),
#'     data_id = ~ after_stat(level),
#'     show.legend = FALSE
#'   ) |>
#'   gf_girafe()
#'
#' faithful |>
#'   gf_density2d_interactive(
#'     eruptions ~ waiting,
#'     tooltip = ~ after_stat(level),
#'     data_id = ~ after_stat(level),
#'     show.legend = FALSE
#'   ) |>
#'   gf_girafe()
#'
#' @rdname gf_density2d_interactive
#' @name gf_density_2d_filled_interactive
#' @export

gf_density_2d_filled_interactive

#' @rdname gf_density2d_interactive
#' @name gf_density_2d_interactive
#' @export

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
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_density()], [gf_girafe()]

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
#' @export
#' @rdname gf_density_interactive
#' @name gf_density_interactive

gf_density_interactive

#' @rdname gf_density2d_interactive
#' @name gf_density2d_filled_interactive
#' @export

gf_density2d_filled_interactive

#' @rdname gf_density2d_interactive
#' @name gf_density2d_interactive
#' @export

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
# TODO: Example here
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
#' @param ... Additional arguments passed to the underlying geom, plus any
#'   [ggiraph::interactive_parameters](interactive parameters).
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
#'   dplyr::filter(carat < 1.1, carat > 0.9) |>
#'   dplyr::group_by(color, cut) |>
#'   dplyr::summarise(
#'     median_price = median(price) |> round(),
#'     lower = quantile(price, 0.25) |> round(),
#'     upper = quantile(price, 0.75) |> round(),
#'     iqr = upper - lower
#'   ) |>
#'   gf_errorbar_interactive(
#'     cut ~ lower + upper | color,
#'     color = ~ cut,
#'     tooltip = ~ paste0(
#'       "75th percentile: ", upper,
#'       "\nmedian: ", median_price,
#'       "\n25th percentile: ", lower
#'       )
#'   ) |>
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
#'     tooltip = ~ paste0('Min: ', round(after_stat(xmin), 1),
#'                      '; Max: ', round(after_stat(xmax),1),
#'                      '; Count: ', after_stat(count)),
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
#' mtcars |>
#'   gf_label_interactive(
#'     mpg ~ wt,
#'     label = rownames(mtcars),
#'     size = 3,
#'     tooltip = ~ paste("MPG:", mpg)) |>
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
#' if (require(mosaicData)) {
#'   Weather |>
#'   gf_line_interactive(
#'     high_temp ~ date,
#'     color = ~city,
#'     show.legend = FALSE,
#'     tooltip = ~city,
#'     data_id = ~city
#'   ) |>
#'   gf_girafe(
#'     width = 8, height = 3,
#'     options = list(
#'       opts_hover_inv(css = "opacity:0.4;"),
#'       opts_hover(css = "stroke-width:2;", nearest_distance = 40),
#'       opts_tooltip(use_cursor_pos = FALSE, offx = 0, offy = -10)
#'     )
#'   )
#' }
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
#' diamonds |>
#'   dplyr::filter(carat < 1.1, carat > 0.9) |>
#'   dplyr::group_by(color, cut) |>
#'   dplyr::summarise(
#'     median_price = median(price) |> round(),
#'     lower = quantile(price, 0.25) |> round(),
#'     upper = quantile(price, 0.75) |> round(),
#'     iqr = upper - lower
#'   ) |>
#'   gf_linerange_interactive(
#'     cut ~ lower + upper | color,
#'     color = ~ cut,
#'     tooltip = ~ paste0(
#'       "75th percentile: ", upper,
#'       "\nmedian: ", median_price,
#'       "\n25th percentile: ", lower
#'       )
#'   ) |>
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
#' diamonds |>
#'   dplyr::filter(carat < 1.1, carat > 0.9) |>
#'   dplyr::group_by(color, cut) |>
#'   dplyr::summarise(
#'     median_price = median(price) |> round(),
#'     lower = quantile(price, 0.25) |> round(),
#'     upper = quantile(price, 0.75) |> round(),
#'     iqr = upper - lower
#'   ) |>
#'   gf_pointrange_interactive(
#'     cut ~ median_price + lower + upper | color,
#'     color = ~ cut,
#'     tooltip = ~ paste0(
#'       "75th percentile: ", upper,
#'       "\nmedian: ", median_price,
#'       "\n25th percentile: ", lower
#'       )
#'   ) |>
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
#' rect_data <-
#'   data.frame(
#'     x1 = c(1, 3, 1, 5, 4),
#'     x2 = c(2, 4, 3, 6, 6),
#'     y1 = c(1, 1, 4, 1, 3),
#'     y2 = c(2, 2, 5, 3, 5),
#'     t = c('a', 'a', 'a', 'b', 'b'),
#'     r = c(1, 2, 3, 4, 5),
#'     tooltip = c("ID 1", "ID 2", "ID 3", "ID 4", "ID 5"),
#'     uid = c("ID 1", "ID 2", "ID 3", "ID 4", "ID 5"),
#'     oc = rep("alert(this.getAttribute(\"data-id\"))", 5)
#'   )
#'
#' p <- rect_data |>
#'   gf_rect_interactive(
#'     y1 + y2 ~ x1 + x2,
#'     fill = t,
#'     tooltip = ~ tooltip,
#'     onclick = ~ oc,
#'     data_id = ~ uid,
#'     color = "black",
#'     alpha = 0.5,
#'     linejoin = "bevel",
#'     lineend = "round"
#'   ) |>
#'   gf_text(
#'     (y1 + (y2 - y1) / 2) ~ (x1 + (x2 - x1) / 2),
#'     label = ~ r,
#'     size = 4
#'     )
#'
#' if (interactive()) {
#'  p |> gf_girafe()
#' }
#'
#'
# @examples
# gf_rect_interactive(mpg ~ wt, data = mtcars,
#                    tooltip = ~ paste("MPG:", mpg)) |>
#   gf_girafe()
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
#'
#' Huron <-
#'   data.frame(
#'     year = 1875:1972,
#'     level = as.vector(LakeHuron)
#'   )
#'
#' Huron |>
#'   gf_ribbon_interactive(
#'     (level - 1) + (level + 1) ~ year,
#'     tooltip = ~ "This is the ribbon.",
#'     fill = "skyblue",
#'     data_id = "id:ribbon"
#'     ) |>
#'   gf_line_interactive(
#'     level  ~ year,
#'     tooltip = ~ "This is the line.",
#'     data_id = "id:line"
#'   ) |>
#'   gf_girafe()
#'
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
#' @rdname gf_curve_interactive
#'
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
#' mtcars |>
#'   gf_point_interactive(mpg ~ wt, alpha = 0.5) |>
#'   gf_smooth_interactive(tooltip = ~ "loess line with confidence band", se = TRUE, alpha = 0.5) |>
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
#' if (require(dplyr)) {
#'   expand.grid(x = 0:10, y = 0:10) |>
#'     mutate(
#'       direction = round(x * y / 100 * 2 * pi, 1),
#'       size = (20 + x + y) / 50
#'       ) |>
#'     gf_spoke_interactive(
#'       y ~ x, angle = ~ direction, radius = ~ size,
#'       tooltip = ~ paste(
#'         "angle:", round(direction / 2 / pi * 360, 1),
#'         "degrees; size =", size),
#'       data_id = ~ paste(x, "-", y),
#'       hover_nearest = TRUE
#'       ) |>
#'     gf_point() |>
#'     gf_girafe(
#'       options = list(
#'         opts_hover(css = "stroke: red; stroke-width: 2;", nearest_distance = 10)
#'       )
#'     )
#' }
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
#' if (require(dplyr)) {
#'   mtcars |>
#'     group_by(cyl) |>
#'     mutate(ecdf = ecdf(mpg)(mpg)) |>
#'     gf_step_interactive(
#'       ecdf ~ mpg,
#'       group = ~ cyl,
#'       color = ~ factor(cyl),
#'       tooltip = ~ paste(cyl, "cylinders"),
#'       data_id = ~ mpg,
#'       hover_nearest = TRUE) |>
#'     gf_labs(color = "cylinders") |>
#'     gf_girafe()
#' }
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
#' gf_point_interactive(
#'   mpg ~ wt, data = mtcars, alpha = 0.4, size = 3,
#'   tooltip = ~ rownames(mtcars),
#'   data_id = 1:nrow(mtcars)
#' ) |>
#'   gf_text_interactive(mpg ~ wt, data = mtcars[1:5, ],
#'                      label = ~ rownames(mtcars)[1:5],
#'                      size = 3,
#'                      angle = 20,
#'                      data_id = 1:5,
#'                      tooltip = ~ paste(rownames(mtcars)[1:5], "\nmpg:", mpg, "wt: ", wt)
#'   ) |>
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
#' expand.grid(x = 1:10, y = 1:10) |>
#'   gf_tile_interactive(
#'     (x+y) ~ x + y,
#'     tooltip = ~ paste("x + y =", x + y)
#'   ) |>
#'   gf_labs(fill = "sum") |>
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
#' p <-
#'   mtcars |>
#'   gf_violin_interactive(
#'     mpg ~ factor(cyl),
#'     alpha = 0.5,
#'     fill = "skyblue",
#'     tooltip = ~ paste("Cylinders:", cyl)
#'   )
#'
#' if (require(ggforce)) {
#'   p |> gf_sina(color = "red", alpha = 0.8) |> gf_girafe()
#' } else {
#'   p |> gf_girafe()
#' }
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
#' gf_point(mpg ~ wt, data = mtcars, alpha = 0.7) |>
#'   gf_vline_interactive(xintercept = ~ mean(wt),
#'                       tooltip = ~ paste("Mean Weight:", round(mean(wt), 1)),
#'                       color = "blue", linetype = "dashed",
#'                       data_id = 1,
#'                       hover_nearest = TRUE) |>
#'   gf_girafe(
#'     options =
#'       list(
#'         opts_hover(nearest_distance = 10, css = "stroke: red; stroke-width: 3")
#'   ))
#'
#' @section Additional interactive features:
#' * `onclick`: JavaScript code (as character string) executed when clicking elements.
#' * Additional ggiraph aesthetics may be available depending on the geom.
#'
#' @seealso [gf_vline()], [gf_girafe()]
#' @export
#' @name gf_vline_interactive

gf_vline_interactive

