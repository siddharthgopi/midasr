\name{midas_r.midas_r}
\alias{midas_r.midas_r}
\title{Restricted MIDAS regression}
\usage{
\method{midas_r}{midas_r}(x, start = coef(x),
  Ofunction = x$argmap.opt$Ofunction, ...)
}
\arguments{
  \item{x}{\code{midas_r} object}

  \item{start}{the starting values}

  \item{Ofunction}{a character string of the optimisation
  function to use. The default value is to use the function
  of previous optimisation.}

  \item{...}{further arguments to optimisation function. If
  none are supplied, the arguments of previous optimisation
  are used.}
}
\value{
\code{midas_r} object
}
\description{
Reestimate the MIDAS regression with different starting
values
}
\author{
Vaidotas Zemlys
}
\seealso{
midas_r
}

