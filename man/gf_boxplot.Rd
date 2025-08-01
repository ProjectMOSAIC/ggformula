% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gf_functions.R
\name{gf_boxplot}
\alias{gf_boxplot}
\title{Formula interface to geom_boxplot()}
\usage{
gf_boxplot(
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
  orientation = NA,
  xlab,
  ylab,
  title,
  subtitle,
  caption,
  geom = "boxplot",
  stat = "boxplot",
  position = "dodge",
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

\item{gformula}{A formula with shape \code{y ~ x}.
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

\item{fill}{A color for filling, or a formula used for mapping fill.}

\item{group}{Used for grouping.}

\item{linetype}{A linetype (numeric or "dashed", "dotted", etc.) or a formula used
for mapping linetype.}

\item{linewidth}{A numerical line width or a formula used for mapping linewidth.}

\item{coef}{Length of the whiskers as multiple of IQR. Defaults to 1.5.}

\item{outlier.color, outlier.fill, outlier.shape, outlier.size, outlier.stroke, outlier.alpha}{Default aesthetics for outliers.
Set to NULL to inherit from the aesthetics used for the box.
In the unlikely event you specify both US and UK spellings of colour,
the US spelling will take precedence.
Sometimes it can be useful to hide the outliers, for example when overlaying the
raw data points on top of the boxplot. Hiding the outliers can be achieved by
setting outlier.shape = NA. Importantly, this does not remove the outliers, it only
hides them, so the range calculated for the y-axis will be the same with outliers shown
and outliers hidden.}

\item{notch}{If \code{FALSE} (default) make a standard box plot. If
\code{TRUE}, make a notched box plot. Notches are used to compare groups;
if the notches of two boxes do not overlap, this suggests that the medians
are significantly different.}

\item{notchwidth}{For a notched box plot, width of the notch relative to
the body (defaults to \code{notchwidth = 0.5}).}

\item{varwidth}{If \code{FALSE} (default) make a standard box plot. If
\code{TRUE}, boxes are drawn with widths proportional to the
square-roots of the number of observations in the groups (possibly
weighted, using the \code{weight} aesthetic).}

\item{orientation}{The orientation of the layer. The default (\code{NA})
automatically determines the orientation from the aesthetic mapping. In the
rare event that this fails it can be given explicitly by setting \code{orientation}
to either \code{"x"} or \code{"y"}. See the \emph{Orientation} section for more detail.}

\item{xlab}{Label for x-axis. See also \code{\link[=gf_labs]{gf_labs()}}.}

\item{ylab}{Label for y-axis. See also \code{\link[=gf_labs]{gf_labs()}}.}

\item{title, subtitle, caption}{Title, sub-title, and caption for the plot.
See also \code{\link[=gf_labs]{gf_labs()}}.}

\item{geom, stat}{Use to override the default connection between
\code{geom_boxplot()} and \code{stat_boxplot()}. For more information about
overriding these connections, see how the \link[ggplot2:layer_stats]{stat} and
\link[ggplot2:layer_geoms]{geom} arguments work.}

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
\value{
a gg object
}
\description{
The boxplot compactly displays the distribution of a continuous variable.
It visualises five summary statistics (the median, two hinges
and two whiskers), and all "outlying" points individually.
}
\section{Specifying plot attributes}{


Positional attributes (a.k.a, aesthetics) are specified using the formula in \code{gformula}.
Setting and mapping of additional attributes can be done through the
use of additional arguments.
Attributes can be set can be set using arguments of the form \code{attribute = value} or
mapped using arguments of the form \code{attribute = ~ expression}.

In formulas of the form \code{A | B}, \code{B} will be used to form facets using
\code{\link[ggplot2:facet_wrap]{ggplot2::facet_wrap()}} or \code{\link[ggplot2:facet_grid]{ggplot2::facet_grid()}}.
This provides an alternative to
\code{\link[=gf_facet_wrap]{gf_facet_wrap()}} and
\code{\link[=gf_facet_grid]{gf_facet_grid()}} that is terser and may feel more familiar to users
of \pkg{lattice}.
}

\section{Evaluation}{


Evaluation of the \pkg{ggplot2} code occurs in the environment of \code{gformula}.
This will typically do the right thing when formulas are created on the fly, but might not
be the right thing if formulas created in one environment are used to create plots
in another.
}

\examples{
gf_boxplot(age ~ substance, data = mosaicData::HELPrct)
gf_boxplot(age ~ substance, data = mosaicData::HELPrct, varwidth = TRUE)
gf_boxplot(age ~ substance, data = mosaicData::HELPrct, color = ~sex)
gf_boxplot(age ~ substance,
  data = mosaicData::HELPrct,
  color = ~sex, outlier.color = "gray50"
)
# longer whiskers
gf_boxplot(age ~ substance,
  data = mosaicData::HELPrct,
  color = ~sex, coef = 2
)

# Note: width for boxplots is full width of box.
#       For jittering, it is the half-width.
gf_boxplot(age ~ substance | sex,
  data = mosaicData::HELPrct,
  coef = 5, width = 0.4
) |>
  gf_jitter(width = 0.2, alpha = 0.3)
# move boxplots away a bit by adjusting dodge
gf_boxplot(age ~ substance,
  data = mosaicData::HELPrct,
  color = ~sex, position = position_dodge(width = 0.9)
)
}
\references{
McGill, R., Tukey, J. W. and Larsen, W. A. (1978) Variations of
box plots. The American Statistician 32, 12-16.
}
\seealso{
\code{\link[ggplot2:geom_boxplot]{ggplot2::geom_boxplot()}}, \code{\link[=fivenum]{fivenum()}}, \code{\link[=df_stats]{df_stats()}}
}
