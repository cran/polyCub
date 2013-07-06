\name{coerce-methods}
\alias{coerce,Polygon,gpc.poly-method}
\alias{coerce,Polygons,gpc.poly-method}
\alias{coerce,gpc.poly,Polygons-method}
\alias{coerce,gpc.poly,owin-method}
\alias{coerce,owin,gpc.poly-method}
\alias{coerce-methods}
\alias{xylist}
\alias{xylist.Polygon}
\alias{xylist.Polygons}
\alias{xylist.SpatialPolygons}
\alias{xylist.default}
\alias{xylist.gpc.poly}
\alias{xylist.owin}
\title{Polygon Coercion Between Different Spatial Classes}
\usage{
  xylist(object, ...)

  \method{xylist}{owin} (object, ...)

  \method{xylist}{gpc.poly} (object, ...)

  \method{xylist}{SpatialPolygons} (object, ...)

  \method{xylist}{Polygons} (object, ...)

  \method{xylist}{Polygon} (object, ...)

  \method{xylist}{default} (object, ...)
}
\arguments{
  \item{object}{an object of one of the supported spatial
  classes.}

  \item{...}{(unused) argument of the generic.}
}
\value{
  Applying \code{xylist} to a polygon object, one gets a
  simple list, where each component (polygon) is a list of
  \code{"x"} and \code{"y"} coordinates, which give the
  coordinates of the vertices of the polygon following
  \pkg{spatstat}'s \code{"owin"} convention (anticlockwise
  order without repeating any vertex). Additional elements
  like \code{"area"} and \code{"hole"} in each component
  are retained. The (somehow useless) default
  \code{xylist}-method does not perform any transformation
  but only checks that the polygons are not closed (first
  vertex not repeated).
}
\description{
  Different packages concerned with spatial data use
  different polygon specifications. The package
  \pkg{polyCub} offers \code{coerce}-methods
  (\code{as(object, Class)}) to convert
  \code{"\link[sp:Polygons-class]{Polygons}"} of the
  \pkg{sp} package, and
  \code{"\link[spatstat:owin.object]{owin}"} objects of the
  \pkg{spatstat} package to and from the
  \code{"\link[rgeos:gpc.poly-class]{gpc.poly}"} class of
  the \pkg{rgeos} package (originally from \pkg{gpclib}),
  as well as from \code{"\link[sp:Polygon-class]{Polygon}"}
  to \code{"gpc.poly"}. Note that conversions from and to
  the \code{"owin"} class are also available as functions
  \code{\link[spatstat]{owin2gpc}} and
  \code{\link[spatstat]{gpc2owin}} in package
  \pkg{spatstat}, and conversions from and to the
  \code{"\link[sp:SpatialPolygons-class]{SpatialPolygons}"}
  class are included in the \pkg{rgeos} package.
  Furthermore, the (internal) \code{xylist} methods break
  down (convert) polygons from these classes to their core
  feature, a list of vertex coordinates.
}
\details{
  Different packages concerned with spatial data use
  different polygon specifications with respect to:
  \itemize{ \item{do we repeat the first vertex?}
  \item{which direction represents holes?} } Package
  overview: \describe{ \item{\pkg{sp}:}{\emph{Repeat} first
  vertex at the end (closed), anticlockwise = hole,
  clockwise = normal boundary} \item{\pkg{spatstat}:}{do
  \emph{not repeat} first vertex, anticlockwise = normal
  boundary, clockwise = hole. This convention is also used
  in \code{xylist}.} \item{\pkg{gpclib}:}{Unfortunately,
  there seems to be no convention for the specification of
  polygons of class \code{"gpc.poly"}. The
  \code{coerce}-methods defined here produce vertices
  ordered according to the \pkg{sp} convention, i.e.
  clockwise for normal boundaries and anticlockwise for
  holes; however, the first vertex is \emph{not} repeated!}
  }
}
\author{
  Sebastian Meyer; the implementation of the
  \code{"gpc.poly"}-method of \code{xylist} borrows large
  parts from \code{\link[spatstat]{gpc2owin}} and depends
  on functionality of the \pkg{spatstat} package authored
  by Adrian Baddeley and Rolf Turner.
}
\keyword{methods}
\keyword{spatial}

