\name{CSP1}
\alias{CSP1}
\title{Continuous Sampling Plan 1}
\usage{
CSP1(units, f, i)
}
\arguments{
\item{products}{a vector of 0 and 1 representing a continuous flow of units: 0 indicate a unit without defects and 1 a unit with defects.}
\item{f}{a fraction between 0 and 1, indicating the sampling fraction}
\item{i}{an integer, larger or equal to zero giving the clearance number}
}

\description{
This continuous sampling plan offer a method to control the quality of an uninterrupted sequence of items, given as an argument by the vector called products. The procedure is as follow:
(a) At the outset, inspect 100% of the units consecutively as produced and continue such inspection until i units in succession are found clear of defects.
(b) when i units in succession are found clear of defects, discontinue 100% inspection, and inspect only a fraction f of the units, selecting individual sample units one at a time from the flow of products, in such a manner as to assure an unbiased sample.
(c) If a sample unit is found defective, revert immidiately to a 100% inspection of succeeding units and continue until again i units in succession are found clear of defects, as in paragraph (a).
(d) Correct or replace with good units, all defective units found. [NOTE: THIS IS NOT IMPLEMENTED INTO THE PRESENT FUNCTION].

The result of such inspections is to remove some of the defective units.
}
\examples{

CSP1(products = c(rep(0,5), rep(1,5)), f = 0.75, i = 5)

}
\references{
H.F. Dodge "A Sampling Inspection Plan for Continuous Production." Annals of Mathematical Statistics, XIV, 3 Sept. 1943, pp. 264-279.
}
\author{
Marco.Kienzle@gmail.com
}
