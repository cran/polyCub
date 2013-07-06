\name{plotpolyf}
\alias{plotpolyf}
\title{Plot Polygonal Domain on an Image of a Bivariate Function}
\usage{
  plotpolyf(polyregion, f, ..., npixel = 100, cuts = 15,
    col = rev(heat.colors(cuts + 1)), lwd = 3, xlim = NULL,
    ylim = NULL, use.lattice = TRUE)
}
\arguments{
  \item{npixel}{numeric vector of length 1 or 2 setting the
  number of pixels in each dimension.}

  \item{cuts}{number of cut points in the \eqn{z}
  dimension. The range of function values will be divided
  into \code{cuts+1} levels.}

  \item{col}{colour vector used for the function levels.}

  \item{lwd}{line width of the polygon edges.}

  \item{xlim,ylim}{numeric vectors of length 2 setting the
  axis limits. \code{NULL} means using the bounding box of
  \code{polyregion}.}

  \item{use.lattice}{logical indicating if \pkg{lattice}
  graphics (\code{\link[lattice]{levelplot}}) should be
  used.}

  \item{polyregion}{a polygonal integration domain. The
  following classes are supported:
  \code{"\link[spatstat]{owin}"},
  \code{"\link[rgeos:gpc.poly-class]{gpc.poly}"},
  \code{"\linkS4class{SpatialPolygons}"},
  \code{"\linkS4class{Polygons}"}, and
  \code{"\linkS4class{Polygon}"} (for these we have an
  internal \code{\link{xylist}} method).}

  \item{f}{two-dimensional function. As its first argument
  it must take a coordinate matrix, i.e. a numeric matrix
  with two columns.}

  \item{...}{further arguments for \code{f}.}
}
\description{
  Produces a combined plot of a polygonal domain and an
  image of a bivariate function, using either
  \code{\link[lattice:levelplot]{lattice::levelplot}} or
  \code{\link{image}}.
}
\examples{
### a polygonal domain
polycenter <- c(3,2)
mypoly <- discpoly(center=polycenter, radius=5, npoly=5)

### f: isotropic exponential decay
fr <- function(r, rate=1) dexp(r, rate=rate)
fcenter <- c(1,5)
f <- function (s, rate=1) fr(sqrt(rowSums(t(t(s)-fcenter)^2)), rate=rate)

### plot
plotpolyf(mypoly, f)
}
\author{
  Sebastian Meyer
}
\keyword{hplot}

