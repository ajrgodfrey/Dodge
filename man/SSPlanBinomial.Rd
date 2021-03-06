% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Single.R
\name{SSPlanBinomial}
\alias{SSPlanBinomial}
\alias{SingleSamplingPlans}
\alias{SSPlanHyper}
\alias{SSPlanPoisson}
\title{Single Sampling Plans}
\usage{
SSPlanBinomial(N, n, Ac, p = seq(0, 0.3, 0.001), Plots = TRUE)
}
\arguments{
\item{N}{the lot size}

\item{n}{the sample size}

\item{Ac}{the acceptance number, being the maximum allowable number of
non-conforming units or non-conformities}

\item{p}{a vector of values for the possible fraction of product that is
non-conforming}

\item{Plots}{logical to request generation of the four plots}
}
\description{
Single sampling plans for the binomial, hypergeometric and Poisson
distributions.
}
\examples{

SSPlanBinomial(1000, 20,1)
SSPlanHyper(5000, 200,3)
SSPlanPoisson(1000, 20,1)

}
\references{
Dodge, H.F. and Romig, H.G. (1959) \dQuote{Sampling Inspection
Tables, Single and Double Sampling}, Second edition, John Wiley and Sons, New
York.
}
\author{
Raj Govindaraju with minor editing by Jonathan Godfrey
}
