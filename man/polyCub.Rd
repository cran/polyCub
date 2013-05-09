\name{polyCub}
\alias{polyCub}
\title{Wrapper Function for the Various Cubature Methods}
\usage{
  polyCub(polyregion, f,
    method = c("SV", "midpoint", "exact.Gauss"), ...,
    plot = FALSE)
}
\arguments{
  \item{polyregion}{a polygonal integration domain. The
  supported classes depend on the specific method, however,
  the \code{"\link[spatstat]{owin}"} class from package
  \pkg{spatstat} works for all methods, as well should a
  \code{"\link[rgeos:gpc.poly-class]{gpc.poly}"} polygon
  (but see the comments in
  \code{help("\link{coerce-methods}")}).}

  \item{f}{two-dimensional function to be integrated. As
  its first argument the function must take a coordinate
  matrix, i.e. a numeric matrix with two columns. For the
  \code{"exact.Gauss"} \code{method}, \code{f} is ignored
  since it is specific to the bivariate normal density.}

  \item{method}{choose one of the implemented cubature
  methods (partial argument matching is applied). Defaults
  to using the product Gauss cubature implemented in
  \code{\link{polyCub.SV}}.}

  \item{...}{arguments of \code{f} or of the specific
  \code{method}.}

  \item{plot}{logical indicating if an illustrative plot of
  the numerical integration should be produced.}
}
\value{
  The approximated value of the integral of \code{f} over
  \code{polyregion}.
}
\description{
  Instead of calling one of the specific cubature methods
  of this package, the wrapper function \code{polyCub} may
  be used together with the \code{method} argument.
}
\examples{
### Short comparison of the different cubature methods

## 2D-function to integrate (here: isotropic zero-mean Gaussian density)
f <- function (s, sigma = 5) exp(-rowSums(s^2)/2/sigma^2) / (2*pi*sigma^2)

## simple polygonal integration domain
library("spatstat")
disc.owin <- disc(radius=5, centre=c(3,2), npoly=8)

## plot image of the function and integration domain
gr <- seq(-8, 8, by=0.2)
vals <- matrix(f(expand.grid(gr,gr)), nrow=length(gr))
image(x=gr, y=gr, z=vals)
plot.owin(disc.owin, hatch=TRUE, add=TRUE)


### Quasi-exact cubature of the bivariate Gaussian density
### using gpclib::tristrip and mvtnorm::pmvnorm()

if (requireNamespace("mvtnorm") && gpclibPermit()) {
    print(polyCub.exact.Gauss(disc.owin, mean=c(0,0), Sigma=5^2*diag(2),
                              plot=TRUE), digits=16)
}


### Two-dimensional midpoint rule

testmidpoint <- function (eps, main=paste("2D midpoint rule with eps =",eps))
{
    image(x=gr, y=gr, z=vals, main=main)
    plot.owin(disc.owin, hatch=TRUE, add=TRUE)
    ## add binary mask to plot
    #plot(as.mask(disc.owin, eps=eps), add=TRUE, box=FALSE)
    ## add evaluation points to plot
    with(as.mask(disc.owin, eps=eps),
         points(expand.grid(xcol, yrow), col=m, pch=20))
    polyCub.midpoint(disc.owin, f, eps=eps)
}
testmidpoint(5)
testmidpoint(3)
testmidpoint(0.5)
testmidpoint(0.2)


### Product Gauss cubature using an increasing number of nodes

for (nGQ in c(1:5,10,20,60)) {
    cat("nGQ =", sprintf("\%2i",nGQ), ": ",
        format(polyCub.SV(disc.owin, f, nGQ=nGQ), digits=16),
        "\\n")
}

## baseline 'alpha' effects location of nodes (may fall outside the polygon)
polyCub.SV(disc.owin, f, nGQ=2, alpha=0, plot=TRUE)
op <- par(new=TRUE, col=2)
polyCub.SV(disc.owin, f, nGQ=2, alpha=3, plot=TRUE)
par(op)
}
\seealso{
  Other polyCub.methods: \code{\link{polyCub.exact.Gauss}},
  \code{\link{polyCub.midpoint}}, \code{\link{polyCub.SV}}
}
\keyword{math}
\keyword{spatial}

