\name{split_data}
\alias{split_data}
\title{Split mixed frequency data into in-sample and out-of-sample}
\usage{
split_data(data, insample, outsample)
}
\arguments{
  \item{data}{a list containing mixed frequency data}

  \item{insample}{the low frequency indexes for in-sample
  data}

  \item{outsample}{the low frequency indexes for
  out-of-sample data}
}
\value{
a list with elements \code{indata} and \code{outdata}
containing respectively in-sample and out-of-sample data
sets
}
\description{
Splits mixed frequency data into in-sample and
out-of-sample datasets given the indexes of the low
frequency data
}
\details{
It is assumed that data is a list containing mixed
frequency data. Then given the indexes of the low frequency
data the function splits the data into two subsets.
}
\examples{
#Monthly data
x <- 1:24
#Quartely data
z <- 1:8
#Yearly data
y <- 1:2
split_data(list(y=y,x=x,z=z),insample=1,outsample=2)
}
\author{
Virmantas Kvedaras, Vaidotas Zemlys
}

