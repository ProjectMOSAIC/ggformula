% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gf_functions.R
\name{gf_errorbar}
\alias{gf_errorbar}
\title{Formula interface to geom_errorbar()}
\usage{
gf_errorbar(
  object = NULL,
  gformula = NULL,
  data = NULL,
  ...,
  alpha,
  color,
  group,
  linetype,
  linewidth,
  xlab,
  ylab,
  title,
  subtitle,
  caption,
  geom = "errorbar",
  stat = "identity",
  position = "identity",
  show.legend = NA,
  show.help = NULL,
  inherit = TRUE,
  environment = parent.frame()
)
}
\arguments{
\item{object}{When chaining, this holds an object produced in the earlier portions
of the chain.  Most users can safely ignore this argument.
See details and examples.}

\item{gformula}{A formula with shape \code{ymin + ymax ~ x}.
Faceting can be achieved by including \code{|} in the formula.}

\item{data}{The data to be displayed in this layer. There are three
options:

If \code{NULL}, the default, the data is inherited from the plot
data as specified in the call to \code{\link[ggplot2:ggplot]{ggplot()}}.

A \code{data.frame}, or other object, will override the plot
data. All objects will be fortified to produce a data frame. See
\code{\link[ggplot2:fortify]{fortify()}} for which variables will be created.

A \code{function} will be called with a single argument,
the plot data. The return value must be a \code{data.frame}, and
will be used as the layer data. A \code{function} can be created
from a \code{formula} (e.g. \code{~ head(.x, 10)}).}

\item{...}{Additional arguments.  Typically these are
(a) ggplot2 aesthetics to be set with \code{attribute = value},
(b) ggplot2 aesthetics to be mapped with \code{attribute = ~ expression}, or
(c) attributes of the layer as a whole, which are set with \code{attribute = value}.}

\item{alpha}{Opacity (0 = invisible, 1 = opaque).}

\item{color}{A color or a formula used for mapping color.}

\item{group}{Used for grouping.}

\item{linetype}{A linetype (numeric or "dashed", "dotted", etc.) or a formula used
for mapping linetype.}

\item{linewidth}{A numerical line width or a formula used for mapping linewidth.}

\item{xlab}{Label for x-axis. See also \code{\link[=gf_labs]{gf_labs()}}.}

\item{ylab}{Label for y-axis. See also \code{\link[=gf_labs]{gf_labs()}}.}

\item{title, subtitle, caption}{Title, sub-title, and caption for the plot.
See also \code{\link[=gf_labs]{gf_labs()}}.}

\item{geom}{The geometric object to use to display the data for this layer.
When using a \verb{stat_*()} function to construct a layer, the \code{geom} argument
can be used to override the default coupling between stats and geoms. The
\code{geom} argument accepts the following:
\itemize{
\item A \code{Geom} ggproto subclass, for example \code{GeomPoint}.
\item A string naming the geom. To give the geom as a string, strip the
function name of the \code{geom_} prefix. For example, to use \code{geom_point()},
give the geom as \code{"point"}.
\item For more information and other ways to specify the geom, see the
\link[ggplot2:layer_geoms]{layer geom} documentation.
}}

\item{stat}{The statistical transformation to use on the data for this layer.
When using a \verb{geom_*()} function to construct a layer, the \code{stat}
argument can be used the override the default coupling between geoms and
stats. The \code{stat} argument accepts the following:
\itemize{
\item A \code{Stat} ggproto subclass, for example \code{StatCount}.
\item A string naming the stat. To give the stat as a string, strip the
function name of the \code{stat_} prefix. For example, to use \code{stat_count()},
give the stat as \code{"count"}.
\item For more information and other ways to specify the stat, see the
\link[ggplot2:layer_stats]{layer stat} documentation.
}}

\item{position}{A position adjustment to use on the data for this layer. This
can be used in various ways, including to prevent overplotting and
improving the display. The \code{position} argument accepts the following:
\itemize{
\item The result of calling a position function, such as \code{position_jitter()}.
This method allows for passing extra arguments to the position.
\item A string naming the position adjustment. To give the position as a
string, strip the function name of the \code{position_} prefix. For example,
to use \code{position_jitter()}, give the position as \code{"jitter"}.
\item For more information and other ways to specify the position, see the
\link[ggplot2:layer_positions]{layer position} documentation.
}}

\item{show.legend}{logical. Should this layer be included in the legends?
\code{NA}, the default, includes if any aesthetics are mapped.
\code{FALSE} never includes, and \code{TRUE} always includes.
It can also be a named logical vector to finely select the aesthetics to
display.}

\item{show.help}{If \code{TRUE}, display some minimal help.}

\item{inherit}{A logical indicating whether default attributes are inherited.}

\item{environment}{An environment in which to look for variables not found in \code{data}.}
}
\description{
For each x value, \code{geom_ribbon()} displays a y interval defined
by \code{ymin} and \code{ymax}. \code{geom_area()} is a special case of
\code{geom_ribbon()}, where the \code{ymin} is fixed to 0 and \code{y} is used instead
of \code{ymax}.
}
\examples{
if (require(mosaicData) && require(dplyr)) {
  HELP2 <- HELPrct |>
    group_by(substance, sex) |>
    summarise(
      mean.age = mean(age),
      median.age = median(age),
      max.age = max(age),
      min.age = min(age),
      sd.age = sd(age),
      lo = mean.age - sd.age,
      hi = mean.age + sd.age
    )

  gf_jitter(age ~ substance, data = HELPrct,
      alpha = 0.5, width = 0.2, height = 0, color = "skyblue") |>
    gf_pointrange(mean.age + lo + hi ~ substance, data = HELP2,
      inherit = FALSE) |>
    gf_facet_grid(~sex)

  gf_jitter(age ~ substance, data = HELPrct,
      alpha = 0.5, width = 0.2, height = 0, color = "skyblue") |>
    gf_errorbar(lo + hi ~ substance, data = HELP2, inherit = FALSE) |>
    gf_facet_grid(~sex)
  gf_jitter(age ~ substance, data = HELPrct,
      alpha = 0.5, width = 0.2, height = 0, color = "skyblue") |>
    gf_boxplot(age ~ substance, data = HELPrct, color = "red") |>
    gf_crossbar(mean.age + lo + hi ~ substance, data = HELP2) |>
    gf_facet_grid(~sex)
}
}
\seealso{
\code{\link[ggplot2:geom_linerange]{ggplot2::geom_errorbar()}}
}
