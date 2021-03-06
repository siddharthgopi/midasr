\name{prepmidas_r}
\alias{prepmidas_r}
\title{Prepare necessary objects for fitting of the MIDAS regression}
\usage{
prepmidas_r(y, X, mt, Zenv, cl, args, start, Ofunction, user.gradient,
  lagsTable, unrestricted = NULL, guess_start = TRUE)
}
\arguments{
  \item{y}{the response}

  \item{X}{the model matrix}

  \item{mt}{the terms of the formula}

  \item{Zenv}{the environment to evaluate the formula}

  \item{cl}{call of the function}

  \item{args}{additional argument}

  \item{start}{starting values}

  \item{Ofunction}{the optimisation function}

  \item{user.gradient}{see \link{midas_r} documentation}

  \item{lagsTable}{the lagstable from \link{checkARstar}}

  \item{unrestricted}{the unrestricted model}

  \item{guess_start}{if TRUE, get the initial values for
  non-MIDAS terms via OLS, if FALSE, initialize them with
  zero.}
}
\description{
Prepare necessary objects for fitting of the MIDAS
regression
}
\author{
Vaidotas Zemlys
}

