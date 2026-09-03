# Roxygen generated with examples

#' Interactive reference lines
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_abline()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula Must be \code{NULL}.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param slope Parameters that control the position of the line. If these
#'   are set, \code{data}, \code{mapping} and \code{show.legend} are
#'   overridden.
#' @param intercept Parameters that control the position of the line. If
#'   these are set, \code{data}, \code{mapping} and \code{show.legend} are
#'   overridden.
#' @param color A color or a formula used for mapping color.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat The statistical transformation to use on the data for this
#'   layer. When using a \verb{geom_*()} function to construct a layer, the
#'   \code{stat} argument can be used to override the default coupling
#'   between geoms and stats. The \code{stat} argument accepts the
#'   following: \itemize{ \item A \code{Stat} ggproto subclass, for example
#'   \code{StatCount}. \item A string naming the stat. To give the stat as
#'   a string, strip the function name of the \code{stat_} prefix. For
#'   example, to use \code{stat_count()}, give the stat as \code{"count"}.
#'   \item For more information and other ways to specify the stat, see the
#'   \link[ggplot2:layer_stats]{layer stat} documentation. }
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_abline_interactive <- interactive_layer_factory("geom_abline_interactive")

#' Interactive area plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_area()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param fill A color for filling, or a formula used for mapping fill.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat The statistical transformation to use on the data for this
#'   layer. When using a \verb{geom_*()} function to construct a layer, the
#'   \code{stat} argument can be used to override the default coupling
#'   between geoms and stats. The \code{stat} argument accepts the
#'   following: \itemize{ \item A \code{Stat} ggproto subclass, for example
#'   \code{StatCount}. \item A string naming the stat. To give the stat as
#'   a string, strip the function name of the \code{stat_} prefix. For
#'   example, to use \code{stat_count()}, give the stat as \code{"count"}.
#'   \item For more information and other ways to specify the stat, see the
#'   \link[ggplot2:layer_stats]{layer stat} documentation. }
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_area_interactive <- interactive_layer_factory("geom_area_interactive")

#' Interactive bar charts
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_bar()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula, typically with shape \code{~ x}. (\code{y ~
#'   x} is also possible, but typically using one of
#'   \code{\link[=gf_col]{gf_col()}}, \code{\link[=gf_props]{gf_props()}},
#'   or \code{\link[=gf_percents]{gf_percents()}} is preferable to using
#'   this formula shape.) Faceting can be achieved by including \code{|} in
#'   the formula.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param fill A color for filling, or a formula used for mapping fill.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param width Width of the bars.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat Override the default connection between \code{geom_bar()}
#'   and \code{stat_count()}. For more information about overriding these
#'   connections, see how the \link[ggplot2:layer_stats]{stat} and
#'   \link[ggplot2:layer_geoms]{geom} arguments work.
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_bar_interactive <- interactive_layer_factory("geom_bar_interactive")

#' Interactive bin_2d plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_bin_2d()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data A data frame with the variables to be plotted.
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param fill A color for filling, or a formula used for mapping fill.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat A character string naming the stat used to make the layer.
#' @param position Either a character string naming the position function
#'   used for the layer or a position object returned from a call to a
#'   position function.
#' @param show.legend A logical indicating whether this layer should be
#'   included in the legends. \code{NA}, the default, includes layer in the
#'   legends if any of the attributes of the layer are mapped.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_bin_2d_interactive <- interactive_layer_factory("geom_bin_2d_interactive")

#' Interactive bin2d plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_bin2d()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data A data frame with the variables to be plotted.
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param fill A color for filling, or a formula used for mapping fill.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat A character string naming the stat used to make the layer.
#' @param position Either a character string naming the position function
#'   used for the layer or a position object returned from a call to a
#'   position function.
#' @param show.legend A logical indicating whether this layer should be
#'   included in the legends. \code{NA}, the default, includes layer in the
#'   legends if any of the attributes of the layer are mapped.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_bin2d_interactive <- interactive_layer_factory("geom_bin2d_interactive")

#' Interactive box plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_boxplot()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param fill A color for filling, or a formula used for mapping fill.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param coef Length of the whiskers as multiple of IQR. Defaults to 1.5.
#' @param outlier.color Default aesthetics for outliers. Set to NULL to
#'   inherit from the aesthetics used for the box. In the unlikely event
#'   you specify both US and UK spellings of colour, the US spelling will
#'   take precedence. Sometimes it can be useful to hide the outliers, for
#'   example when overlaying the raw data points on top of the boxplot.
#'   Hiding the outliers can be achieved by setting outlier.shape = NA.
#'   Importantly, this does not remove the outliers, it only hides them, so
#'   the range calculated for the y-axis will be the same with outliers
#'   shown and outliers hidden.
#' @param outlier.fill Default aesthetics for outliers. Set to NULL to
#'   inherit from the aesthetics used for the box. In the unlikely event
#'   you specify both US and UK spellings of colour, the US spelling will
#'   take precedence. Sometimes it can be useful to hide the outliers, for
#'   example when overlaying the raw data points on top of the boxplot.
#'   Hiding the outliers can be achieved by setting outlier.shape = NA.
#'   Importantly, this does not remove the outliers, it only hides them, so
#'   the range calculated for the y-axis will be the same with outliers
#'   shown and outliers hidden.
#' @param outlier.shape Default aesthetics for outliers. Set to NULL to
#'   inherit from the aesthetics used for the box. In the unlikely event
#'   you specify both US and UK spellings of colour, the US spelling will
#'   take precedence. Sometimes it can be useful to hide the outliers, for
#'   example when overlaying the raw data points on top of the boxplot.
#'   Hiding the outliers can be achieved by setting outlier.shape = NA.
#'   Importantly, this does not remove the outliers, it only hides them, so
#'   the range calculated for the y-axis will be the same with outliers
#'   shown and outliers hidden.
#' @param outlier.size Default aesthetics for outliers. Set to NULL to
#'   inherit from the aesthetics used for the box. In the unlikely event
#'   you specify both US and UK spellings of colour, the US spelling will
#'   take precedence. Sometimes it can be useful to hide the outliers, for
#'   example when overlaying the raw data points on top of the boxplot.
#'   Hiding the outliers can be achieved by setting outlier.shape = NA.
#'   Importantly, this does not remove the outliers, it only hides them, so
#'   the range calculated for the y-axis will be the same with outliers
#'   shown and outliers hidden.
#' @param outlier.stroke Default aesthetics for outliers. Set to NULL to
#'   inherit from the aesthetics used for the box. In the unlikely event
#'   you specify both US and UK spellings of colour, the US spelling will
#'   take precedence. Sometimes it can be useful to hide the outliers, for
#'   example when overlaying the raw data points on top of the boxplot.
#'   Hiding the outliers can be achieved by setting outlier.shape = NA.
#'   Importantly, this does not remove the outliers, it only hides them, so
#'   the range calculated for the y-axis will be the same with outliers
#'   shown and outliers hidden.
#' @param outlier.alpha Default aesthetics for outliers. Set to NULL to
#'   inherit from the aesthetics used for the box. In the unlikely event
#'   you specify both US and UK spellings of colour, the US spelling will
#'   take precedence. Sometimes it can be useful to hide the outliers, for
#'   example when overlaying the raw data points on top of the boxplot.
#'   Hiding the outliers can be achieved by setting outlier.shape = NA.
#'   Importantly, this does not remove the outliers, it only hides them, so
#'   the range calculated for the y-axis will be the same with outliers
#'   shown and outliers hidden.
#' @param notch If \code{FALSE} (default) make a standard box plot. If
#'   \code{TRUE}, make a notched box plot. Notches are used to compare
#'   groups; if the notches of two boxes do not overlap, this suggests that
#'   the medians are significantly different.
#' @param notchwidth For a notched box plot, width of the notch relative to
#'   the body (defaults to \code{notchwidth = 0.5}).
#' @param varwidth If \code{FALSE} (default) make a standard box plot. If
#'   \code{TRUE}, boxes are drawn with widths proportional to the
#'   square-roots of the number of observations in the groups (possibly
#'   weighted, using the \code{weight} aesthetic).
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat Use to override the default connection between
#'   \code{geom_boxplot()} and \code{stat_boxplot()}. For more information
#'   about overriding these connections, see how the
#'   \link[ggplot2:layer_stats]{stat} and \link[ggplot2:layer_geoms]{geom}
#'   arguments work.
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_boxplot_interactive <- interactive_layer_factory("geom_boxplot_interactive")

#' Interactive column charts
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_col()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data A data frame with the variables to be plotted.
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param fill A color for filling, or a formula used for mapping fill.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat A character string naming the stat used to make the layer.
#' @param position Either a character string naming the position function
#'   used for the layer or a position object returned from a call to a
#'   position function.
#' @param show.legend A logical indicating whether this layer should be
#'   included in the legends. \code{NA}, the default, includes layer in the
#'   legends if any of the attributes of the layer are mapped.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_col_interactive <- interactive_layer_factory("geom_col_interactive")

#' Interactive 2-demensional contour plots
#'
#' Creates an interactive plot using ggiraph. These functions extend
#' [gf_contour()] and
#' [gf_contour_filled()]
#' with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat The statistical transformation to use on the data for this
#'   layer. When using a \verb{geom_*()} function to construct a layer, the
#'   \code{stat} argument can be used to override the default coupling
#'   between geoms and stats. The \code{stat} argument accepts the
#'   following: \itemize{ \item A \code{Stat} ggproto subclass, for example
#'   \code{StatCount}. \item A string naming the stat. To give the stat as
#'   a string, strip the function name of the \code{stat_} prefix. For
#'   example, to use \code{stat_count()}, give the stat as \code{"count"}.
#'   \item For more information and other ways to specify the stat, see the
#'   \link[ggplot2:layer_stats]{layer stat} documentation. }
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_contour_filled_interactive <- interactive_layer_factory("geom_contour_filled_interactive")


#' @rdname gf_contour_interactive
#' @name gf_contour_interactive
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat The statistical transformation to use on the data for this
#'   layer. When using a \verb{geom_*()} function to construct a layer, the
#'   \code{stat} argument can be used to override the default coupling
#'   between geoms and stats. The \code{stat} argument accepts the
#'   following: \itemize{ \item A \code{Stat} ggproto subclass, for example
#'   \code{StatCount}. \item A string naming the stat. To give the stat as
#'   a string, strip the function name of the \code{stat_} prefix. For
#'   example, to use \code{stat_count()}, give the stat as \code{"count"}.
#'   \item For more information and other ways to specify the stat, see the
#'   \link[ggplot2:layer_stats]{layer stat} documentation. }
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
#' @export

gf_contour_interactive <- interactive_layer_factory("geom_contour_interactive")


#' Interactive count plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_count()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data A data frame with the variables to be plotted.
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param fill A color for filling, or a formula used for mapping fill.
#' @param group Used for grouping.
#' @param shape An integer or letter shape or a formula used for mapping
#'   shape.
#' @param size A numeric size or a formula used for mapping size.
#' @param stroke A numeric size of the border or a formula used to map
#'   stroke.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat A character string naming the stat used to make the layer.
#' @param position Either a character string naming the position function
#'   used for the layer or a position object returned from a call to a
#'   position function.
#' @param show.legend A logical indicating whether this layer should be
#'   included in the legends. \code{NA}, the default, includes layer in the
#'   legends if any of the attributes of the layer are mapped.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_count_interactive <- interactive_layer_factory("geom_count_interactive")

#' Interactive crossbar plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_crossbar()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y + ymin + ymax ~ x}.
#'   Faceting can be achieved by including \code{|} in the formula.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param group Used for grouping.
#' @param middle.linetype Arguments to control the middle line.
#' @param middle.colour Arguments to control the middle line.
#' @param middle.color Arguments to control the middle line.
#' @param middle.linewidth Arguments to control the middle line.
#' @param box.colour Arguments to control the box.
#' @param box.color Arguments to control the box.
#' @param box.linetype Arguments to control the box.
#' @param box.linewidth Arguments to control the box.
#' @param na.rm If \code{FALSE}, the default, missing values are removed
#'   with a warning. If \code{TRUE}, missing values are silently removed.
#' @param inherit.aes If \code{FALSE}, overrides the default aesthetics,
#'   rather than combining with them. This is most useful for helper
#'   functions that define both data and aesthetics and shouldn't inherit
#'   behaviour from the default plot specification, e.g.
#'   \code{\link[ggplot2:annotation_borders]{annotation_borders()}}.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat The statistical transformation to use on the data for this
#'   layer. When using a \verb{geom_*()} function to construct a layer, the
#'   \code{stat} argument can be used to override the default coupling
#'   between geoms and stats. The \code{stat} argument accepts the
#'   following: \itemize{ \item A \code{Stat} ggproto subclass, for example
#'   \code{StatCount}. \item A string naming the stat. To give the stat as
#'   a string, strip the function name of the \code{stat_} prefix. For
#'   example, to use \code{stat_count()}, give the stat as \code{"count"}.
#'   \item For more information and other ways to specify the stat, see the
#'   \link[ggplot2:layer_stats]{layer stat} documentation. }
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_crossbar_interactive <- interactive_layer_factory("geom_crossbar_interactive")

#' Interactive curve plots
#'
#' Creates an interactive plot using ggiraph. These functions extend
#' [gf_segment()] and  [gf_curve()] with interactive features like tooltips and
#' clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y + yend ~ x + xend}.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param curvature A numeric value giving the amount of curvature.
#'   Negative values produce left-hand curves, positive values produce
#'   right-hand curves, and zero produces a straight line.
#' @param angle A numeric value between 0 and 180, giving an amount to skew
#'   the control points of the curve. Values less than 90 skew the curve
#'   towards the start point and values greater than 90 skew the curve
#'   towards the end point.
#' @param ncp The number of control points used to draw the curve. More
#'   control points creates a smoother curve.
#' @param arrow specification for arrow heads, as created by
#'   \code{\link[grid:arrow]{grid::arrow()}}.
#' @param lineend Line end style (round, butt, square).
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat The statistical transformation to use on the data for this
#'   layer. When using a \verb{geom_*()} function to construct a layer, the
#'   \code{stat} argument can be used to override the default coupling
#'   between geoms and stats. The \code{stat} argument accepts the
#'   following: \itemize{ \item A \code{Stat} ggproto subclass, for example
#'   \code{StatCount}. \item A string naming the stat. To give the stat as
#'   a string, strip the function name of the \code{stat_} prefix. For
#'   example, to use \code{stat_count()}, give the stat as \code{"count"}.
#'   \item For more information and other ways to specify the stat, see the
#'   \link[ggplot2:layer_stats]{layer stat} documentation. }
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_curve_interactive <- interactive_layer_factory("geom_curve_interactive")

#' Interactive 2-demensional density plots
#'
#' Creates an interactive plot using ggiraph. These functions extend
#' [gf_density2d()],
#' [gf_density_2d()],
#' [gf_density2d_filled()], and
#' [gf_density_2d_filled()]
#' with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param contour If \code{TRUE}, contour the results of the 2d density
#'   estimation.
#' @param n Number of grid points in each direction.
#' @param h Bandwidth (vector of length two). If \code{NULL}, estimated
#'   using \code{\link[MASS:bandwidth.nrd]{MASS::bandwidth.nrd()}}.
#' @param lineend Line end style (round, butt, square).
#' @param linejoin Line join style (round, mitre, bevel).
#' @param linemitre Line mitre limit (number greater than 1).
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat Use to override the default connection between
#'   \code{geom_density_2d()} and \code{stat_density_2d()}. For more
#'   information at overriding these connections, see how the
#'   \link[ggplot2:layer_stats]{stat} and \link[ggplot2:layer_geoms]{geom}
#'   arguments work.
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_density_2d_filled_interactive <- interactive_layer_factory("geom_density_2d_filled_interactive")

#' @rdname gf_density2d_interactive
#' @name gf_density_2d_interactive
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param contour If \code{TRUE}, contour the results of the 2d density
#'   estimation.
#' @param n Number of grid points in each direction.
#' @param h Bandwidth (vector of length two). If \code{NULL}, estimated
#'   using \code{\link[MASS:bandwidth.nrd]{MASS::bandwidth.nrd()}}.
#' @param lineend Line end style (round, butt, square).
#' @param linejoin Line join style (round, mitre, bevel).
#' @param linemitre Line mitre limit (number greater than 1).
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat Use to override the default connection between
#'   \code{geom_density_2d()} and \code{stat_density_2d()}. For more
#'   information at overriding these connections, see how the
#'   \link[ggplot2:layer_stats]{stat} and \link[ggplot2:layer_geoms]{geom}
#'   arguments work.
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
#' @export

gf_density_2d_interactive <- interactive_layer_factory("geom_density_2d_interactive")

#' Interactive density plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_density()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param fill A color for filling, or a formula used for mapping fill.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param kernel Kernel. See list of available kernels in
#'   \code{\link[=density]{density()}}.
#' @param n number of equally spaced points at which the density is to be
#'   estimated, should be a power of two, see
#'   \code{\link[=density]{density()}} for details
#' @param trim If \code{FALSE}, the default, each density is computed on
#'   the full range of the data. If \code{TRUE}, each density is computed
#'   over the range of that group: this typically means the estimated x
#'   values will not line-up, and hence you won't be able to stack density
#'   values. This parameter only matters if you are displaying multiple
#'   densities in one plot or if you are manually adjusting the scale
#'   limits.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat Use to override the default connection between
#'   \code{geom_density()} and \code{stat_density()}. For more information
#'   about overriding these connections, see how the
#'   \link[ggplot2:layer_stats]{stat} and \link[ggplot2:layer_geoms]{geom}
#'   arguments work.
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_density_interactive <- interactive_layer_factory("geom_density_interactive")

#' @rdname gf_density2d_interactive
#' @name gf_density2d_filled_interactive
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param contour If \code{TRUE}, contour the results of the 2d density
#'   estimation.
#' @param n Number of grid points in each direction.
#' @param h Bandwidth (vector of length two). If \code{NULL}, estimated
#'   using \code{\link[MASS:bandwidth.nrd]{MASS::bandwidth.nrd()}}.
#' @param lineend Line end style (round, butt, square).
#' @param linejoin Line join style (round, mitre, bevel).
#' @param linemitre Line mitre limit (number greater than 1).
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat Use to override the default connection between
#'   \code{geom_density_2d()} and \code{stat_density_2d()}. For more
#'   information at overriding these connections, see how the
#'   \link[ggplot2:layer_stats]{stat} and \link[ggplot2:layer_geoms]{geom}
#'   arguments work.
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
#' @export

gf_density2d_filled_interactive <- interactive_layer_factory("geom_density2d_filled_interactive")

#' @rdname gf_density2d_interactive
#' @name gf_density2d_interactive
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param contour If \code{TRUE}, contour the results of the 2d density
#'   estimation.
#' @param n Number of grid points in each direction.
#' @param h Bandwidth (vector of length two). If \code{NULL}, estimated
#'   using \code{\link[MASS:bandwidth.nrd]{MASS::bandwidth.nrd()}}.
#' @param lineend Line end style (round, butt, square).
#' @param linejoin Line join style (round, mitre, bevel).
#' @param linemitre Line mitre limit (number greater than 1).
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat Use to override the default connection between
#'   \code{geom_density_2d()} and \code{stat_density_2d()}. For more
#'   information at overriding these connections, see how the
#'   \link[ggplot2:layer_stats]{stat} and \link[ggplot2:layer_geoms]{geom}
#'   arguments work.
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
#' @export

gf_density2d_interactive <- interactive_layer_factory("geom_density2d_interactive")

#' Interactive dotplot plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_dotplot()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data A data frame with the variables to be plotted.
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param fill A color for filling, or a formula used for mapping fill.
#' @param group Used for grouping.
#' @param binwidth When \code{method} is "dotdensity", this specifies
#'   maximum bin width. When \code{method} is "histodot", this specifies
#'   bin width. Defaults to 1/30 of the range of the data
#' @param binaxis The axis to bin along, "x" (default) or "y"
#' @param method "dotdensity" (default) for dot-density binning, or
#'   "histodot" for fixed bin widths (like stat_bin)
#' @param binpositions When \code{method} is "dotdensity", "bygroup"
#'   (default) determines positions of the bins for each group separately.
#'   "all" determines positions of the bins with all the data taken
#'   together; this is used for aligning dot stacks across multiple groups.
#' @param stackdir which direction to stack the dots. "up" (default),
#'   "down", "center", "centerwhole" (centered, but with dots aligned)
#' @param stackratio how close to stack the dots. Default is 1, where dots
#'   just touch. Use smaller values for closer, overlapping dots.
#' @param dotsize The diameter of the dots relative to \code{binwidth},
#'   default 1.
#' @param stackgroups should dots be stacked across groups? This has the
#'   effect that \code{position = "stack"} should have, but can't (because
#'   this geom has some odd properties).
#' @param origin When \code{method} is "histodot", origin of first bin
#' @param right When \code{method} is "histodot", should intervals be
#'   closed on the right (a, b], or not [a, b)
#' @param width When \code{binaxis} is "y", the spacing of the dot stacks
#'   for dodging.
#' @param drop If TRUE, remove all bins with zero counts
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat Use to override the default connection between
#'   \code{geom_lm} and \code{stat_lm}.
#' @param position Either a character string naming the position function
#'   used for the layer or a position object returned from a call to a
#'   position function.
#' @param show.legend A logical indicating whether this layer should be
#'   included in the legends. \code{NA}, the default, includes layer in the
#'   legends if any of the attributes of the layer are mapped.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_dotplot_interactive <- interactive_layer_factory("geom_dotplot_interactive")

#' Interactive errorbar plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_errorbar()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{ymin + ymax ~ x}. Faceting
#'   can be achieved by including \code{|} in the formula.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat The statistical transformation to use on the data for this
#'   layer. When using a \verb{geom_*()} function to construct a layer, the
#'   \code{stat} argument can be used to override the default coupling
#'   between geoms and stats. The \code{stat} argument accepts the
#'   following: \itemize{ \item A \code{Stat} ggproto subclass, for example
#'   \code{StatCount}. \item A string naming the stat. To give the stat as
#'   a string, strip the function name of the \code{stat_} prefix. For
#'   example, to use \code{stat_count()}, give the stat as \code{"count"}.
#'   \item For more information and other ways to specify the stat, see the
#'   \link[ggplot2:layer_stats]{layer stat} documentation. }
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_errorbar_interactive <- interactive_layer_factory("geom_errorbar_interactive")

#' Interactive freqpoly plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_freqpoly()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{~ x} or \code{y ~ x}.
#'   Faceting can be achieved by including \code{|} in the formula.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param binwidth The width of the bins. Can be specified as a numeric
#'   value or as a function that takes x after scale transformation as
#'   input and returns a single numeric value. When specifying a function
#'   along with a grouping structure, the function will be called once per
#'   group. The default is to use the number of bins in \code{bins},
#'   covering the range of the data. You should always override this value,
#'   exploring multiple widths to find the best to illustrate the stories
#'   in your data. The bin width of a date variable is the number of days
#'   in each time; the bin width of a time variable is the number of
#'   seconds.
#' @param bins Number of bins. Overridden by \code{binwidth}. Defaults to
#'   30.
#' @param center bin position specifiers. Only one, \code{center} or
#'   \code{boundary}, may be specified for a single plot. \code{center}
#'   specifies the center of one of the bins. \code{boundary} specifies the
#'   boundary between two bins. Note that if either is above or below the
#'   range of the data, things will be shifted by the appropriate integer
#'   multiple of \code{binwidth}. For example, to center on integers use
#'   \code{binwidth = 1} and \code{center = 0}, even if \code{0} is outside
#'   the range of the data. Alternatively, this same alignment can be
#'   specified with \code{binwidth = 1} and \code{boundary = 0.5}, even if
#'   \code{0.5} is outside the range of the data.
#' @param boundary bin position specifiers. Only one, \code{center} or
#'   \code{boundary}, may be specified for a single plot. \code{center}
#'   specifies the center of one of the bins. \code{boundary} specifies the
#'   boundary between two bins. Note that if either is above or below the
#'   range of the data, things will be shifted by the appropriate integer
#'   multiple of \code{binwidth}. For example, to center on integers use
#'   \code{binwidth = 1} and \code{center = 0}, even if \code{0} is outside
#'   the range of the data. Alternatively, this same alignment can be
#'   specified with \code{binwidth = 1} and \code{boundary = 0.5}, even if
#'   \code{0.5} is outside the range of the data.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat Use to override the default connection between
#'   \code{geom_histogram()}/\code{geom_freqpoly()} and \code{stat_bin()}.
#'   For more information at overriding these connections, see how the
#'   \link[ggplot2:layer_stats]{stat} and \link[ggplot2:layer_geoms]{geom}
#'   arguments work.
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_freqpoly_interactive <- interactive_layer_factory("geom_freqpoly_interactive")

#' Interactive hex plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_hex()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param bins Number of bins. Overridden by \code{binwidth}. Defaults to
#'   30.
#' @param binwidth The width of the bins. Can be specified as a numeric
#'   value or as a function that takes x after scale transformation as
#'   input and returns a single numeric value. When specifying a function
#'   along with a grouping structure, the function will be called once per
#'   group. The default is to use the number of bins in \code{bins},
#'   covering the range of the data. You should always override this value,
#'   exploring multiple widths to find the best to illustrate the stories
#'   in your data. The bin width of a date variable is the number of days
#'   in each time; the bin width of a time variable is the number of
#'   seconds.
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param fill A color for filling, or a formula used for mapping fill.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat Override the default connection between \code{geom_hex()}
#'   and \code{stat_bin_hex()}. For more information about overriding these
#'   connections, see how the \link[ggplot2:layer_stats]{stat} and
#'   \link[ggplot2:layer_geoms]{geom} arguments work.
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_hex_interactive <- interactive_layer_factory("geom_hex_interactive")

#' Interactive histograms
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_histogram()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{~ x} (or \code{y ~ x}, but
#'   this shape is not generally needed).
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param bins Number of bins. Overridden by \code{binwidth}. Defaults to
#'   30.
#' @param binwidth The width of the bins. Can be specified as a numeric
#'   value or as a function that takes x after scale transformation as
#'   input and returns a single numeric value. When specifying a function
#'   along with a grouping structure, the function will be called once per
#'   group. The default is to use the number of bins in \code{bins},
#'   covering the range of the data. You should always override this value,
#'   exploring multiple widths to find the best to illustrate the stories
#'   in your data. The bin width of a date variable is the number of days
#'   in each time; the bin width of a time variable is the number of
#'   seconds.
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param fill A color for filling, or a formula used for mapping fill.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat Use to override the default connection between
#'   \code{geom_histogram()}/\code{geom_freqpoly()} and \code{stat_bin()}.
#'   For more information at overriding these connections, see how the
#'   \link[ggplot2:layer_stats]{stat} and \link[ggplot2:layer_geoms]{geom}
#'   arguments work.
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_histogram_interactive <- interactive_layer_factory("geom_histogram_interactive")

#' Interactive horizontal lines
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_hline()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula Must be \code{NULL}.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param yintercept Parameters that control the position of the line. If
#'   these are set, \code{data}, \code{mapping} and \code{show.legend} are
#'   overridden.
#' @param color A color or a formula used for mapping color.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat The statistical transformation to use on the data for this
#'   layer. When using a \verb{geom_*()} function to construct a layer, the
#'   \code{stat} argument can be used to override the default coupling
#'   between geoms and stats. The \code{stat} argument accepts the
#'   following: \itemize{ \item A \code{Stat} ggproto subclass, for example
#'   \code{StatCount}. \item A string naming the stat. To give the stat as
#'   a string, strip the function name of the \code{stat_} prefix. For
#'   example, to use \code{stat_count()}, give the stat as \code{"count"}.
#'   \item For more information and other ways to specify the stat, see the
#'   \link[ggplot2:layer_stats]{layer stat} documentation. }
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_hline_interactive <- interactive_layer_factory("geom_hline_interactive")

#' Interactive jitter plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_jitter()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data A data frame with the variables to be plotted.
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param size A numeric size or a formula used for mapping size.
#' @param shape An integer or letter shape or a formula used for mapping
#'   shape.
#' @param fill A color for filling, or a formula used for mapping fill.
#' @param width Amount of horizontal jitter.
#' @param height Amount of vertical jitter.
#' @param group Used for grouping.
#' @param stroke A numeric size of the border or a formula used to map
#'   stroke.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat A character string naming the stat used to make the layer.
#' @param position Either a character string naming the position function
#'   used for the layer or a position object returned from a call to a
#'   position function.
#' @param show.legend A logical indicating whether this layer should be
#'   included in the legends. \code{NA}, the default, includes layer in the
#'   legends if any of the attributes of the layer are mapped.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_jitter_interactive <- interactive_layer_factory("geom_jitter_interactive")

#' Interactive text labels
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_label()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param label The text to be displayed.
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param angle An angle for rotating the text.
#' @param color A color or a formula used for mapping color.
#' @param family A font family.
#' @param fontface One of \code{"plain"}, \code{"bold"}, \code{"italic"},
#'   or \code{"bold italic"}.
#' @param group Used for grouping.
#' @param hjust Numbers between 0 and 1 indicating how to justify text
#'   relative the the specified location.
#' @param vjust Numbers between 0 and 1 indicating how to justify text
#'   relative the the specified location.
#' @param size A numeric size or a formula used for mapping size.
#' @param parse If \code{TRUE}, the labels will be parsed into expressions
#'   and displayed as described in \code{?plotmath}.
#' @param nudge_x Passed to
#'   \code{\link[ggplot2:position_nudge]{ggplot2::position_nudge()}} to
#'   nudge text or labels horizontally or vertically.
#' @param nudge_y Passed to
#'   \code{\link[ggplot2:position_nudge]{ggplot2::position_nudge()}} to
#'   nudge text or labels horizontally or vertically.
#' @param label.padding Amount of padding around label. Defaults to 0.25
#'   lines.
#' @param label.r Radius of rounded corners. Defaults to 0.15 lines.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat The statistical transformation to use on the data for this
#'   layer. When using a \verb{geom_*()} function to construct a layer, the
#'   \code{stat} argument can be used to override the default coupling
#'   between geoms and stats. The \code{stat} argument accepts the
#'   following: \itemize{ \item A \code{Stat} ggproto subclass, for example
#'   \code{StatCount}. \item A string naming the stat. To give the stat as
#'   a string, strip the function name of the \code{stat_} prefix. For
#'   example, to use \code{stat_count()}, give the stat as \code{"count"}.
#'   \item For more information and other ways to specify the stat, see the
#'   \link[ggplot2:layer_stats]{layer stat} documentation. }
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_label_interactive <- interactive_layer_factory("geom_label_interactive")

#' Interactive line plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_line()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data A data frame with the variables to be plotted.
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param fill A color for filling, or a formula used for mapping fill.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param lineend Line end style (round, butt, square).
#' @param linejoin Line join style (round, mitre, bevel).
#' @param linemitre Line mitre limit (number greater than 1).
#' @param arrow Arrow specification, as created by
#'   \code{\link[grid:arrow]{grid::arrow()}}.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat A character string naming the stat used to make the layer.
#' @param position Either a character string naming the position function
#'   used for the layer or a position object returned from a call to a
#'   position function.
#' @param show.legend A logical indicating whether this layer should be
#'   included in the legends. \code{NA}, the default, includes layer in the
#'   legends if any of the attributes of the layer are mapped.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_line_interactive <- interactive_layer_factory("geom_line_interactive")

#' Interactive linerange plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_linerange()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{ymin + ymax ~ x}. Faceting
#'   can be achieved by including \code{|} in the formula.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color Set or map color.
#' @param group Use to set or map group.
#' @param linetype Set or map style of the line.
#' @param linewidth Set or map style of the line.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat The statistical transformation to use on the data for this
#'   layer. When using a \verb{geom_*()} function to construct a layer, the
#'   \code{stat} argument can be used to override the default coupling
#'   between geoms and stats. The \code{stat} argument accepts the
#'   following: \itemize{ \item A \code{Stat} ggproto subclass, for example
#'   \code{StatCount}. \item A string naming the stat. To give the stat as
#'   a string, strip the function name of the \code{stat_} prefix. For
#'   example, to use \code{stat_count()}, give the stat as \code{"count"}.
#'   \item For more information and other ways to specify the stat, see the
#'   \link[ggplot2:layer_stats]{layer stat} documentation. }
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_linerange_interactive <- interactive_layer_factory("geom_linerange_interactive")

#' Interactive path plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_path()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data A data frame with the variables to be plotted.
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param lineend Line end style (round, butt, square).
#' @param linejoin Line join style (round, mitre, bevel).
#' @param linemitre Line mitre limit (number greater than 1).
#' @param arrow Arrow specification, as created by
#'   \code{\link[grid:arrow]{grid::arrow()}}.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat A character string naming the stat used to make the layer.
#' @param position Either a character string naming the position function
#'   used for the layer or a position object returned from a call to a
#'   position function.
#' @param show.legend A logical indicating whether this layer should be
#'   included in the legends. \code{NA}, the default, includes layer in the
#'   legends if any of the attributes of the layer are mapped.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_path_interactive <- interactive_layer_factory("geom_path_interactive")

#' Interactive scatter plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_point()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data A data frame with the variables to be plotted.
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param size A numeric size or a formula used for mapping size.
#' @param shape An integer or letter shape or a formula used for mapping
#'   shape.
#' @param fill A color for filling, or a formula used for mapping fill.
#' @param group Used for grouping.
#' @param stroke A numeric size of the border or a formula used to map
#'   stroke.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat A character string naming the stat used to make the layer.
#' @param position Either a character string naming the position function
#'   used for the layer or a position object returned from a call to a
#'   position function.
#' @param show.legend A logical indicating whether this layer should be
#'   included in the legends. \code{NA}, the default, includes layer in the
#'   legends if any of the attributes of the layer are mapped.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_point_interactive <- interactive_layer_factory("geom_point_interactive")

#' Interactive pointrange plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_pointrange()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{ymin + ymax ~ x}. Faceting
#'   can be achieved by including \code{|} in the formula.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color Set or map color.
#' @param group Use to set or map group.
#' @param linetype Set or map style of the line.
#' @param linewidth Set or map style of the line.
#' @param size size aesthetic for points (\code{gf_pointrange()}).
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat The statistical transformation to use on the data for this
#'   layer. When using a \verb{geom_*()} function to construct a layer, the
#'   \code{stat} argument can be used to override the default coupling
#'   between geoms and stats. The \code{stat} argument accepts the
#'   following: \itemize{ \item A \code{Stat} ggproto subclass, for example
#'   \code{StatCount}. \item A string naming the stat. To give the stat as
#'   a string, strip the function name of the \code{stat_} prefix. For
#'   example, to use \code{stat_count()}, give the stat as \code{"count"}.
#'   \item For more information and other ways to specify the stat, see the
#'   \link[ggplot2:layer_stats]{layer stat} documentation. }
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_pointrange_interactive <- interactive_layer_factory("geom_pointrange_interactive")

#' Interactive polygon plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_polygon()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data A data frame with the variables to be plotted.
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param shape Aesthetics for polygons.
#' @param fill A color for filling, or a formula used for mapping fill.
#' @param group Used for grouping.
#' @param stroke Aesthetics for polygons.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat A character string naming the stat used to make the layer.
#' @param position Either a character string naming the position function
#'   used for the layer or a position object returned from a call to a
#'   position function.
#' @param show.legend A logical indicating whether this layer should be
#'   included in the legends. \code{NA}, the default, includes layer in the
#'   legends if any of the attributes of the layer are mapped.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_polygon_interactive <- interactive_layer_factory("geom_polygon_interactive")

#' Interactive quantile plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_quantile()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param lineend Line end style (round, butt, square).
#' @param linejoin Line join style (round, mitre, bevel).
#' @param linemitre Line mitre limit (number greater than 1).
#' @param quantiles conditional quantiles of y to calculate and display
#' @param formula formula relating y variables to x variables
#' @param method Quantile regression method to use. Available options are
#'   \code{"rq"} (for \code{\link[quantreg:rq]{quantreg::rq()}}) and
#'   \code{"rqss"} (for \code{\link[quantreg:rqss]{quantreg::rqss()}}).
#' @param method.args List of additional arguments passed on to the
#'   modelling function defined by \code{method}.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat Use to override the default connection between
#'   \code{geom_quantile()} and \code{stat_quantile()}. For more
#'   information about overriding these connections, see how the
#'   \link[ggplot2:layer_stats]{stat} and \link[ggplot2:layer_geoms]{geom}
#'   arguments work.
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_quantile_interactive <- interactive_layer_factory("geom_quantile_interactive")

#' Interactive raster plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_raster()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x} or \code{fill ~ x + y}
#' @param data A data frame with the variables to be plotted.
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param fill A color for filling, or a formula used for mapping fill.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param hjust horizontal and vertical justification of the grob. Each
#'   justification value should be a number between 0 and 1. Defaults to
#'   0.5 for both, centering each pixel over its data location.
#' @param vjust horizontal and vertical justification of the grob. Each
#'   justification value should be a number between 0 and 1. Defaults to
#'   0.5 for both, centering each pixel over its data location.
#' @param interpolate If \code{TRUE} interpolate linearly, if \code{FALSE}
#'   (the default) don't interpolate.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat A character string naming the stat used to make the layer.
#' @param position Either a character string naming the position function
#'   used for the layer or a position object returned from a call to a
#'   position function.
#' @param show.legend A logical indicating whether this layer should be
#'   included in the legends. \code{NA}, the default, includes layer in the
#'   legends if any of the attributes of the layer are mapped.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_raster_interactive <- interactive_layer_factory("geom_raster_interactive")

#' Interactive rect plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_rect()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{ymin + ymax ~ xmin + xmax}.
#'   Faceting can be achieved by including \code{|} in the formula.
#' @param data A data frame with the variables to be plotted.
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param fill A color for filling, or a formula used for mapping fill.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat A character string naming the stat used to make the layer.
#' @param position Either a character string naming the position function
#'   used for the layer or a position object returned from a call to a
#'   position function.
#' @param show.legend A logical indicating whether this layer should be
#'   included in the legends. \code{NA}, the default, includes layer in the
#'   legends if any of the attributes of the layer are mapped.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_rect_interactive <- interactive_layer_factory("geom_rect_interactive")

#' Interactive ribbon plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_ribbon()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{ymin + ymax ~ x}. Faceting
#'   can be achieved by including \code{|} in the formula.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat The statistical transformation to use on the data for this
#'   layer. When using a \verb{geom_*()} function to construct a layer, the
#'   \code{stat} argument can be used to override the default coupling
#'   between geoms and stats. The \code{stat} argument accepts the
#'   following: \itemize{ \item A \code{Stat} ggproto subclass, for example
#'   \code{StatCount}. \item A string naming the stat. To give the stat as
#'   a string, strip the function name of the \code{stat_} prefix. For
#'   example, to use \code{stat_count()}, give the stat as \code{"count"}.
#'   \item For more information and other ways to specify the stat, see the
#'   \link[ggplot2:layer_stats]{layer stat} documentation. }
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_ribbon_interactive <- interactive_layer_factory("geom_ribbon_interactive")

#' Interactive segment plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_segment()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y + yend ~ x + xend}.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param arrow specification for arrow heads, as created by
#'   \code{\link[grid:arrow]{grid::arrow()}}.
#' @param lineend Line end style (round, butt, square).
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat The statistical transformation to use on the data for this
#'   layer. When using a \verb{geom_*()} function to construct a layer, the
#'   \code{stat} argument can be used to override the default coupling
#'   between geoms and stats. The \code{stat} argument accepts the
#'   following: \itemize{ \item A \code{Stat} ggproto subclass, for example
#'   \code{StatCount}. \item A string naming the stat. To give the stat as
#'   a string, strip the function name of the \code{stat_} prefix. For
#'   example, to use \code{stat_count()}, give the stat as \code{"count"}.
#'   \item For more information and other ways to specify the stat, see the
#'   \link[ggplot2:layer_stats]{layer stat} documentation. }
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_segment_interactive <- interactive_layer_factory("geom_segment_interactive")

#' Interactive sf plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_sf()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data A data frame with the variables to be plotted.
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param fill A color for filling, or a formula used for mapping fill.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param geometry A column of class sfc containing simple features data.
#'   (Another option is that \code{data} may contain a column named
#'   \code{geometry}.) \code{geometry} is never inherited.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat A character string naming the stat used to make the layer.
#' @param position Either a character string naming the position function
#'   used for the layer or a position object returned from a call to a
#'   position function.
#' @param show.legend A logical indicating whether this layer should be
#'   included in the legends. \code{NA}, the default, includes layer in the
#'   legends if any of the attributes of the layer are mapped.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_sf_interactive <- interactive_layer_factory("geom_sf_interactive")

#' Interactive smoothed conditional means
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_smooth()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data A data frame with the variables to be plotted.
#' @param method Smoothing method (function) to use, accepts either
#'   \code{NULL} or a character vector, e.g. \code{"lm"}, \code{"glm"},
#'   \code{"gam"}, \code{"loess"} or a function, e.g. \code{MASS::rlm} or
#'   \code{mgcv::gam}, \code{stats::lm}, or \code{stats::loess}.
#'   \code{"auto"} is also accepted for backwards compatibility. It is
#'   equivalent to \code{NULL}. For \code{method = NULL} the smoothing
#'   method is chosen based on the size of the largest group (across all
#'   panels). \code{\link[stats:loess]{stats::loess()}} is used for less
#'   than 1,000 observations; otherwise \code{\link[mgcv:gam]{mgcv::gam()}}
#'   is used with \code{formula = y ~ s(x, bs = "cs")} with \code{method =
#'   "REML"}. Somewhat anecdotally, \code{loess} gives a better appearance,
#'   but is \eqn{O(N^{2})}{O(N^2)} in memory, so does not work for larger
#'   datasets. If you have fewer than 1,000 observations but want to use
#'   the same \code{gam()} model that \code{method = NULL} would use, then
#'   set \verb{method = "gam", formula = y ~ s(x, bs = "cs")}.
#' @param formula Formula to use in smoothing function, eg. \code{y ~ x},
#'   \code{y ~ poly(x, 2)}, \code{y ~ log(x)}. \code{NULL} by default, in
#'   which case \code{method = NULL} implies \code{formula = y ~ x} when
#'   there are fewer than 1,000 observations and \code{formula = y ~ s(x,
#'   bs = "cs")} otherwise.
#' @param se Display confidence band around smooth? (\code{TRUE} by
#'   default, see \code{level} to control.)
#' @param method.args List of additional arguments passed on to the
#'   modelling function defined by \code{method}.
#' @param n Number of points at which to evaluate smoother.
#' @param span Controls the amount of smoothing for the default loess
#'   smoother. Smaller numbers produce wigglier lines, larger numbers
#'   produce smoother lines. Only used with loess, i.e. when \code{method =
#'   "loess"}, or when \code{method = NULL} (the default) and there are
#'   fewer than 1,000 observations.
#' @param fullrange If \code{TRUE}, the smoothing line gets expanded to the
#'   range of the plot, potentially beyond the data. This does not extend
#'   the line into any additional padding created by \code{expansion}.
#' @param level Level of confidence band to use (0.95 by default).
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat A character string naming the stat used to make the layer.
#' @param position Either a character string naming the position function
#'   used for the layer or a position object returned from a call to a
#'   position function.
#' @param show.legend A logical indicating whether this layer should be
#'   included in the legends. \code{NA}, the default, includes layer in the
#'   legends if any of the attributes of the layer are mapped.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_smooth_interactive <- interactive_layer_factory("geom_smooth_interactive")

#' Interactive spoke plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_spoke()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param angle The angle at which segment leaves the point (x,y).
#' @param radius The length of the segment.
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat The statistical transformation to use on the data for this
#'   layer. When using a \verb{geom_*()} function to construct a layer, the
#'   \code{stat} argument can be used to override the default coupling
#'   between geoms and stats. The \code{stat} argument accepts the
#'   following: \itemize{ \item A \code{Stat} ggproto subclass, for example
#'   \code{StatCount}. \item A string naming the stat. To give the stat as
#'   a string, strip the function name of the \code{stat_} prefix. For
#'   example, to use \code{stat_count()}, give the stat as \code{"count"}.
#'   \item For more information and other ways to specify the stat, see the
#'   \link[ggplot2:layer_stats]{layer stat} documentation. }
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_spoke_interactive <- interactive_layer_factory("geom_spoke_interactive")

#' Interactive step plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_step()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param direction direction of stairs: 'vh' for vertical then horizontal,
#'   'hv' for horizontal then vertical, or 'mid' for step half-way between
#'   adjacent x-values.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat The statistical transformation to use on the data for this
#'   layer. When using a \verb{geom_*()} function to construct a layer, the
#'   \code{stat} argument can be used to override the default coupling
#'   between geoms and stats. The \code{stat} argument accepts the
#'   following: \itemize{ \item A \code{Stat} ggproto subclass, for example
#'   \code{StatCount}. \item A string naming the stat. To give the stat as
#'   a string, strip the function name of the \code{stat_} prefix. For
#'   example, to use \code{stat_count()}, give the stat as \code{"count"}.
#'   \item For more information and other ways to specify the stat, see the
#'   \link[ggplot2:layer_stats]{layer stat} documentation. }
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_step_interactive <- interactive_layer_factory("geom_step_interactive")

#' Interactive text annotations
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_text()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param label The text to be displayed.
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param angle An angle for rotating the text.
#' @param color A color or a formula used for mapping color.
#' @param family A font family.
#' @param fontface One of \code{"plain"}, \code{"bold"}, \code{"italic"},
#'   or \code{"bold italic"}.
#' @param group Used for grouping.
#' @param hjust Numbers between 0 and 1 indicating how to justify text
#'   relative the the specified location.
#' @param lineheight Line height.
#' @param size A numeric size or a formula used for mapping size.
#' @param vjust Numbers between 0 and 1 indicating how to justify text
#'   relative the the specified location.
#' @param parse If \code{TRUE}, the labels will be parsed into expressions
#'   and displayed as described in \code{?plotmath}.
#' @param nudge_x Passed to
#'   \code{\link[ggplot2:position_nudge]{ggplot2::position_nudge()}} to
#'   nudge text or labels horizontally or vertically.
#' @param nudge_y Passed to
#'   \code{\link[ggplot2:position_nudge]{ggplot2::position_nudge()}} to
#'   nudge text or labels horizontally or vertically.
#' @param check_overlap If \code{TRUE}, text that overlaps previous text in
#'   the same layer will not be plotted. \code{check_overlap} happens at
#'   draw time and in the order of the data. Therefore data should be
#'   arranged by the label column before calling \code{geom_text()}. Note
#'   that this argument is not supported by \code{geom_label()}.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat The statistical transformation to use on the data for this
#'   layer. When using a \verb{geom_*()} function to construct a layer, the
#'   \code{stat} argument can be used to override the default coupling
#'   between geoms and stats. The \code{stat} argument accepts the
#'   following: \itemize{ \item A \code{Stat} ggproto subclass, for example
#'   \code{StatCount}. \item A string naming the stat. To give the stat as
#'   a string, strip the function name of the \code{stat_} prefix. For
#'   example, to use \code{stat_count()}, give the stat as \code{"count"}.
#'   \item For more information and other ways to specify the stat, see the
#'   \link[ggplot2:layer_stats]{layer stat} documentation. }
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_text_interactive <- interactive_layer_factory("geom_text_interactive")

#' Interactive tile plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_tile()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data A data frame with the variables to be plotted.
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param fill A color for filling, or a formula used for mapping fill.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat A character string naming the stat used to make the layer.
#' @param position Either a character string naming the position function
#'   used for the layer or a position object returned from a call to a
#'   position function.
#' @param show.legend A logical indicating whether this layer should be
#'   included in the legends. \code{NA}, the default, includes layer in the
#'   legends if any of the attributes of the layer are mapped.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_tile_interactive <- interactive_layer_factory("geom_tile_interactive")

#' Interactive violin plots
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_violin()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula A formula with shape \code{y ~ x}. Faceting can be
#'   achieved by including \code{|} in the formula.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param color A color or a formula used for mapping color.
#' @param fill A color for filling, or a formula used for mapping fill.
#' @param group Used for grouping.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param weight Useful for summarized data, \code{weight} provides a count
#'   of the number of values with the given combination of \code{x} and
#'   \code{y} values.
#' @param quantile.colour Default aesthetics for the quantile lines. Set to
#'   \code{NULL} to inherit from the data's aesthetics. By default,
#'   quantile lines are hidden and can be turned on by changing
#'   \code{quantile.linetype}. Quantile values can be set using the
#'   \code{quantiles} argument when using \code{stat = "ydensity"}
#'   (default).
#' @param quantile.color Default aesthetics for the quantile lines. Set to
#'   \code{NULL} to inherit from the data's aesthetics. By default,
#'   quantile lines are hidden and can be turned on by changing
#'   \code{quantile.linetype}. Quantile values can be set using the
#'   \code{quantiles} argument when using \code{stat = "ydensity"}
#'   (default).
#' @param quantile.linetype Default aesthetics for the quantile lines. Set
#'   to \code{NULL} to inherit from the data's aesthetics. By default,
#'   quantile lines are hidden and can be turned on by changing
#'   \code{quantile.linetype}. Quantile values can be set using the
#'   \code{quantiles} argument when using \code{stat = "ydensity"}
#'   (default).
#' @param quantile.linewidth Default aesthetics for the quantile lines. Set
#'   to \code{NULL} to inherit from the data's aesthetics. By default,
#'   quantile lines are hidden and can be turned on by changing
#'   \code{quantile.linetype}. Quantile values can be set using the
#'   \code{quantiles} argument when using \code{stat = "ydensity"}
#'   (default).
#' @param trim If \code{TRUE} (default), trim the tails of the violins to
#'   the range of the data. If \code{FALSE}, don't trim the tails.
#' @param scale if "area" (default), all violins have the same area (before
#'   trimming the tails). If "count", areas are scaled proportionally to
#'   the number of observations. If "width", all violins have the same
#'   maximum width.
#' @param bw The smoothing bandwidth to be used. If numeric, the standard
#'   deviation of the smoothing kernel. If character, a rule to choose the
#'   bandwidth, as listed in
#'   \code{\link[stats:bandwidth]{stats::bw.nrd()}}. Note that automatic
#'   calculation of the bandwidth does not take weights into account.
#' @param adjust A multiplicate bandwidth adjustment. This makes it
#'   possible to adjust the bandwidth while still using the a bandwidth
#'   estimator. For example, \code{adjust = 1/2} means use half of the
#'   default bandwidth.
#' @param kernel Kernel. See list of available kernels in
#'   \code{\link[=density]{density()}}.
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat A character string naming the stat used to make the layer.
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_violin_interactive <- interactive_layer_factory("geom_violin_interactive")

#' Interactive vertical lines
#'
#' Creates an interactive plot using ggiraph. This function extends
#' [gf_vline()] with interactive features like tooltips and clickable elements.
#'
#' @param object When chaining, this holds an object produced in the
#'   earlier portions of the chain. Most users can safely ignore this
#'   argument. See details and examples.
#' @param gformula Must be \code{NULL}.
#' @param data The data to be displayed in this layer. There are three
#'   options: If \code{NULL}, the default, the data is inherited from the
#'   plot data as specified in the call to
#'   \code{\link[ggplot2:ggplot]{ggplot()}}. A \code{data.frame}, or other
#'   object, will override the plot data. All objects will be fortified to
#'   produce a data frame. See \code{\link[ggplot2:fortify]{fortify()}} for
#'   which variables will be created. A \code{function} will be called with
#'   a single argument, the plot data. The return value must be a
#'   \code{data.frame}, and will be used as the layer data. A
#'   \code{function} can be created from a \code{formula} (e.g. \code{~
#'   head(.x, 10)}).
#' @param xintercept Parameters that control the position of the line. If
#'   these are set, \code{data}, \code{mapping} and \code{show.legend} are
#'   overridden.
#' @param color A color or a formula used for mapping color.
#' @param linetype A linetype (numeric or "dashed", "dotted", etc.) or a
#'   formula used for mapping linetype.
#' @param linewidth A numerical line width or a formula used for mapping
#'   linewidth.
#' @param alpha Opacity (0 = invisible, 1 = opaque).
#' @param xlab Label for x-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param ylab Label for y-axis. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param title Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param subtitle Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param caption Title, sub-title, and caption for the plot. See also
#'   \code{\link[=gf_labs]{gf_labs()}}.
#' @param stat The statistical transformation to use on the data for this
#'   layer. When using a \verb{geom_*()} function to construct a layer, the
#'   \code{stat} argument can be used to override the default coupling
#'   between geoms and stats. The \code{stat} argument accepts the
#'   following: \itemize{ \item A \code{Stat} ggproto subclass, for example
#'   \code{StatCount}. \item A string naming the stat. To give the stat as
#'   a string, strip the function name of the \code{stat_} prefix. For
#'   example, to use \code{stat_count()}, give the stat as \code{"count"}.
#'   \item For more information and other ways to specify the stat, see the
#'   \link[ggplot2:layer_stats]{layer stat} documentation. }
#' @param position A position adjustment to use on the data for this layer.
#'   This can be used in various ways, including to prevent overplotting
#'   and improving the display. The \code{position} argument accepts the
#'   following: \itemize{ \item The result of calling a position function,
#'   such as \code{position_jitter()}. This method allows for passing extra
#'   arguments to the position. \item A string naming the position
#'   adjustment. To give the position as a string, strip the function name
#'   of the \code{position_} prefix. For example, to use
#'   \code{position_jitter()}, give the position as \code{"jitter"}. \item
#'   For more information and other ways to specify the position, see the
#'   \link[ggplot2:layer_positions]{layer position} documentation. }
#' @param show.legend logical. Should this layer be included in the
#'   legends? \code{NA}, the default, includes if any aesthetics are
#'   mapped. \code{FALSE} never includes, and \code{TRUE} always includes.
#'   It can also be a named logical vector to finely select the aesthetics
#'   to display. To include legend keys for all levels, even when no data
#'   exists, use \code{TRUE}. If \code{NA}, all levels are shown in legend,
#'   but unobserved levels are omitted.
#' @param show.help If \code{TRUE}, display some minimal help.
#' @param inherit A logical indicating whether default attributes are
#'   inherited.
#' @param environment An environment in which to look for variables not
#'   found in \code{data}.
#' @param ... Additional arguments passed to the underlying interactive
#'   geom. This is where ggiraph's interactive aesthetics are supplied,
#'   including \code{tooltip} (text shown on hover), \code{data_id}
#'   (identifiers used for interactive selection), and \code{onclick}
#'   (JavaScript run on click).
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

gf_vline_interactive <- interactive_layer_factory("geom_vline_interactive")

