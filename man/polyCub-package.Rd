\docType{package}
\name{polyCub-package}
\alias{polyCub-package}
\title{Cubature over Polygonal Domains}
\description{
  The \R package \pkg{polyCub} provides methods for
  cubature (numerical integration) over polygonal domains.
  The function \code{polyCub} is the main entry point of
  the package. It is a wrapper around the specific cubature
  methods available in the package.
}
\details{
  The following (non-adaptive) cubature methods are
  provided: \describe{
  \item{\code{\link{polyCub.midpoint}}:}{ Two-dimensional
  midpoint rule. Polygons are converted to binary pixel
  images using the \code{\link[spatstat]{as.im.function}}
  method from package \pkg{spatstat}. The integral is then
  obtained as the sum over (pixel area * f(pixel
  midpoint)). } \item{\code{\link{polyCub.SV}}:}{ Product
  Gauss cubature as proposed by Sommariva and Vianello
  (2007). } \item{\code{\link{polyCub.exact.Gauss}}:}{
  Quasi-exact method specific to the integration of the
  bivariate Gaussian density over polygonal domains. It is
  based on formulae from Chapter 26 of the Abramowitz and
  Stegun (1970) handbook, i.e. triangulation of the
  polygonal domain and appropriate evaluations of
  \code{\link[mvtnorm]{pmvnorm}} from package
  \pkg{mvtnorm}. } } See Section 3.2 of Meyer (2010) for a
  more detailed description and benchmark experiment of
  those three (among others).
}
\references{
  M. Abramowitz and I. A. Stegun (1970). Handbook of
  Mathematical Functions with Formulas, Graphs, and
  Mathematical Tables (9th ed.). New York: Dover
  Publications.

  A. Baddeley and R. Turner (2005). Spatstat: an R package
  for analyzing spatial point patterns. Journal of
  Statistical Software 12 (6), 1-42.

  S. Meyer (2010). Spatio-Temporal Infectious Disease
  Epidemiology based on Point Processes. Master's Thesis,
  LMU Munich. Available as
  \url{http://epub.ub.uni-muenchen.de/11703/}.

  A. Sommariva and M. Vianello (2007). Product Gauss
  cubature over polygons based on Green's integration
  formula. Bit Numerical Mathematics, 47 (2), 441-453.
}
\seealso{
  The packages \pkg{cubature} and \pkg{R2cuba}, which are
  more appropriate for cubature over simple hypercubes.
}

