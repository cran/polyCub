\name{discpoly}
\alias{discpoly}
\title{Polygonal Approximation of a Disc/Circle}
\usage{
  discpoly(center, radius, npoly = 64,
    class = c("Polygon", "owin", "gpc.poly"), hole = FALSE)
}
\arguments{
  \item{center}{numeric vector of length 2 (center
  coordinates of the circle).}

  \item{radius}{single numeric value (radius of the
  circle).}

  \item{npoly}{single integer. Number of edges of the
  polygonal approximation.}

  \item{class}{class of the resulting polygon (partial name
  matching applies). For \code{"owin"}, this is just a
  wrapper around \pkg{spatstat}'s own
  \code{\link[spatstat]{disc}} function.}

  \item{hole}{logical. Does the resulting polygon represent
  a hole?}
}
\value{
  A polygon of class \code{class} representing a
  circle/disc with \code{npoly} edges accuracy.
}
\description{
  Generates a polygon representing a disc/circle (in planar
  coordinates) as an object of one of three possible
  classes: \code{"\link[rgeos:gpc.poly-class]{gpc.poly}"},
  \code{"\link[spatstat]{owin}"}, or
  \code{"\link[sp:Polygon-class]{Polygon}"}.
}
\examples{
## Construct circles with increasing accuracy and of different spatial classes
disc1 <- discpoly(c(0,0), 5, npoly=4, class = "owin")
disc2 <- discpoly(c(0,0), 5, npoly=16, class = "Polygon")
disc3 <- discpoly(c(0,0), 5, npoly=64, class = "gpc.poly")

## Look at the results
library("spatstat") # for the "owin" print- and plot-methods
print(disc1)
plot(disc1, axes=TRUE, main="", border=2)

print(disc2)
lines(disc2, col=3)

library("rgeos") # for the "gpc.poly" print- and plot-methods
print(disc3)
plot(disc3, add=TRUE, poly.args=list(border=4))

## if one only wants to _draw_ a circle without an object behind
symbols(0, 0, circles=5, inches=FALSE, add=TRUE, fg=5)
}
\author{
  Sebastian Meyer\cr This function is inspired by the
  \code{\link[spatstat]{disc}} function from package
  \pkg{spatstat} authored by Adrian Baddeley and Rolf
  Turner.
}
\seealso{
  \link[spatstat]{disc} in package \pkg{spatstat}.
}
\keyword{datagen}
\keyword{spatial}

