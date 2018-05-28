#' print methods for thee Dodge package
#' 
#' Adds to the base functionality for the print() command. The accompanying
#' \code{plot} methods are more sophisticated.
#' 
#' These methods print the most necessary elements of the corresponding
#' objects.
#' 
#' @aliases print.AccSampPlan print.CurtSampPlan print.SeqSampPlan
#' @param x an object of class AccSampPlan, CurtSampPlan, or SeqSampPlan
#' @param ... further arguments passed to or from other methods.
#' @author Jonathan Godfrey
#' @seealso The corresponding plot method is far more interesting. See
#' \code{\link{plot.AccSampPlan}} for example.
print.AccSampPlan = function(x,...){
print.default(x,...)
}





#' plot methods for the Dodge package
#' 
#' Creates plots for analysing the design of an acceptance sampling procedure.
#' 
#' At this stage the \code{plot.AccSampPlan} method only plots the Operating
#' Characteristic (OC) curve, the Average (AOQ) and (ATI) against the
#' proportion (p) of product that is nonconforming. It also plots the curtailed
#' sample size or the average sample number (ASN) against p. Further
#' development is still required.
#' 
#' @aliases plot.AccSampPlan plot.CurtSampPlan plot.SeqSampPlan
#' @param x an object of class AccSampPlan, CurtSampPlan, or SeqSampPlan
#' @param y ignored
#' @param ... further arguments passed to or from other methods.
#' @author Jonathan Godfrey with some assistance from Raj Govindaraju
#' @keywords ~kwd1 ~kwd2
#' @examples
#' 
#' Plan1 = SSPlanBinomial(1000, 20,1, Plots=FALSE)
#' plot(Plan1)
#' 
plot.AccSampPlan = function(x, y=NULL, ...){
    one.fig <- prod(par("mfcol")) == 1
plot(x$p, x$OC, type="l", 
ylab="Probability of Acceptance", 
xlab="Fraction Nonconforming p")

if(!is.null(x$ASN)){
if(one.fig){dev.new()}
plot(x$p, x$ASN, type="l", 
ylab="Uncurtailed average sample size", 
xlab="Fraction Nonconforming p")
}
if(!is.null(x$n)){
if(one.fig){dev.new()}
plot(x$p, x$n, type="l", 
ylab="Uncurtailed sample size", 
xlab="Fraction Nonconforming p")
}

if(one.fig){dev.new()}
plot(x$p, x$AOQ, type="l", 
ylab="AOQ", 
xlab="Fraction Nonconforming p")
title(paste("AOQL = ", formatC(max(x$AOQ))))

if(one.fig){dev.new()}
plot(x$p, x$ATI, type="l", 
ylab="ATI", 
xlab="Fraction Nonconforming p")
}
