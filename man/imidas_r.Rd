\name{imidas_r}
\alias{imidas_r}
\alias{imidas_r.default}
\title{Restricted MIDAS regression with I(1) regressors}
\usage{
imidas_r(x, ...)

\method{imidas_r}{default}(x, data, start, Ofunction = "optim",
  user.gradient = FALSE, ...)
}
\arguments{
  \item{x}{either formula for restricted MIDAS regression
  or \code{midas_r} object. Formula must include
  \code{\link{fmls}} function}

  \item{data}{a named list containing data with mixed
  frequencies}

  \item{start}{the starting values for optimisation. Must
  be a list with named elements.}

  \item{Ofunction}{the list with information which R
  function to use for optimisation. The list must have
  element named \code{Ofunction} which contains character
  string of chosen R function. Other elements of the list
  are the arguments passed to this function. The default
  optimisation function is \code{\link{optim}} with
  argument \code{method="BFGS"}. Other supported functions
  are \code{\link{nls}}}

  \item{user.gradient}{the default value is \code{FALSE},
  which means that the numeric approximation of weight
  function gradient is calculated. If \code{TRUE} it is
  assumed that the R function for weight function gradient
  has the name of the weight function appended with
  \code{.gradient}. This function must return the matrix
  with dimensions \eqn{d_k \times q}, where \eqn{d_k} and
  \eqn{q} are the numbers of coefficients in unrestricted
  and restricted regressions correspondingly.}

  \item{...}{additional arguments supplied to optimisation
  function}
}
\value{
a \code{midas_r} object which is the list with the
following elements:

\item{coefficients}{the estimates of parameters of
restrictions} \item{midas.coefficientas}{the estimates of
restricted coefficients of MIDAS regression}
\item{model}{model data} \item{weights}{the restriction
function(s) used in estimation.}
\item{unrestricted}{unrestricted regression estimated using
\code{\link{midas_u}}} \item{param.map}{parameter map for
optimisation function} \item{fn0}{optimisation function for
non-linear least squares problem solved in restricted MIDAS
regression} \item{rhs}{the function which evaluates the
right-hand side of the MIDAS regression} \item{allcoef}{the
function which evaluates the restricted coefficients of
MIDAS regression} \item{opt}{the output of optimisation
procedure} \item{argmap.opt}{the list containing the name
of optimisation function together with arguments for
optimisation function} \item{start.opt}{the starting values
used in optimisation}
}
\description{
Estimate restricted MIDAS regression using non-linear least
squares, when the regressor is I(1)
}
\details{
Given MIDAS regression:

\deqn{y_t=\sum_{j=0}^k\sum_{i=0}^{m-1}\theta_{jm+i}
x_{(t-j)m-i}+\mathbf{z_t}\beta+u_t}

estimate the parameters of the restriction

\deqn{\theta_h=g(h,\lambda),} where \eqn{h=0,...,(k+1)m},
together with coefficients \eqn{\beta} corresponding to
additional low frequency regressors.

It is assumed that \eqn{x} is a I(1) process, hence the
special transformation is made. After the transformation
\link{midas_r} is used for estimation.

MIDAS regression involves times series with different
frequencies.

The restriction function must return the restricted
coefficients of the MIDAS regression.
}
\examples{
theta.h0 <- function(p, dk) {
  i <- (1:dk-1)/100
  pol <- p[3]*i + p[4]*i^2
 (p[1] + p[2]*i)*exp(pol)
}

theta0 <- theta.h0(c(-0.1,10,-10,-10),4*12)

xx <- simplearma.sim(list(ar=1),1500*12,1,12)
y <- midas.sim(500,theta0,xx,1)
x <- window(xx,start=start(y))

imr <- imidas_r(y~fmls(x,4*12-1,12,theta.h0)-1,start=list(x=c(-0.1,10,-10,-10)))
}
\author{
Virmantas Kvedaras, Vaidotas Zemlys
}
\seealso{
midas_r.midas_r
}

