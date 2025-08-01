% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gf_functions.R
\name{gf_sf}
\alias{gf_sf}
\title{Mapping with shape files}
\usage{
gf_sf(
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
  geometry,
  xlab,
  ylab,
  title,
  subtitle,
  caption,
  stat = "sf",
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

\item{gformula}{A formula with shape \code{y ~ x}.
Faceting can be achieved by including \code{|} in the formula.}

\item{data}{A data frame with the variables to be plotted.}

\item{...}{Additional arguments.  Typically these are
(a) ggplot2 aesthetics to be set with \code{attribute = value},
(b) ggplot2 aesthetics to be mapped with \code{attribute = ~ expression},
(c) attributes of the layer as a whole, which are set with \code{attribute = value}, or
(d) arguments for the geom, stat, or position function.}

\item{alpha}{Opacity (0 = invisible, 1 = opaque).}

\item{color}{A color or a formula used for mapping color.}

\item{fill}{A color for filling, or a formula used for mapping fill.}

\item{group}{Used for grouping.}

\item{linetype}{A linetype (numeric or "dashed", "dotted", etc.) or a formula used
for mapping linetype.}

\item{linewidth}{A numerical line width or a formula used for mapping linewidth.}

\item{geometry}{A column of class sfc containing simple features data. (Another option
is that \code{data} may contain a column named \code{geometry}.)  \code{geometry} is never
inherited.}

\item{xlab}{Label for x-axis. See also \code{\link[=gf_labs]{gf_labs()}}.}

\item{ylab}{Label for y-axis. See also \code{\link[=gf_labs]{gf_labs()}}.}

\item{title, subtitle, caption}{Title, sub-title, and caption for the plot.
See also \code{\link[=gf_labs]{gf_labs()}}.}

\item{stat}{A character string naming the stat used to make the layer.}

\item{position}{Either a character string naming the position function used
for the layer or a position object returned from a call to a position function.}

\item{show.legend}{A logical indicating whether this layer should be included in
the legends.  \code{NA}, the default, includes layer in the legends if any
of the attributes of the layer are mapped.}

\item{show.help}{If \code{TRUE}, display some minimal help.}

\item{inherit}{A logical indicating whether default attributes are inherited.}

\item{environment}{An environment in which to look for variables not found in \code{data}.}
}
\value{
a gg object
}
\description{
Mapping with shape files
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

if (requireNamespace('maps', quietly = TRUE)) {
  library(maps)
  world1 <- sf::st_as_sf(map('world', plot = FALSE, fill = TRUE))
  gf_sf(data = world1)
}

if (requireNamespace('maps', quietly = TRUE)) {
  world2 <- sf::st_transform(
    world1,
    "+proj=laea +y_0=0 +lon_0=155 +lat_0=-90 +ellps=WGS84 +no_defs"
  )
  gf_sf(data = world2)
}
}
\seealso{
\code{\link[ggplot2:geom_path]{ggplot2::geom_line()}}, \code{\link[=gf_point]{gf_point()}}
}
