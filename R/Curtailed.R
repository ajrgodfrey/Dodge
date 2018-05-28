
#' Curtailed Average Sample Number
#' 
#' Computes the average sample number for a curtailed inspection plan for
#' single sampling plans. Functionality is currrently available for only the
#' binomial distribution.
#' 
#' 
#' @aliases CurtASN CurtBinomial
#' @param n the sample size (potential)
#' @param Ac the acceptance number
#' @param p a vector of values for the possible fraction of product that is
#' nonconforming
#' @param Plots logical to request generation of the four plots
#' @author Raj Govindaraju with minor editing by Jonathan Godfrey
#' @examples
#' 
#' CurtBinomial(20,1)
#' 

CurtBinomial= function(n, Ac, p=seq(0, 0.5, .01), Plots=TRUE)
{
# The ASN Function for Curtailed Single
# Sampling by Attributes
# Anders Hald and Uffe Msller
# Technometrics, Vol. 18, No. 3(Aug., 1976), pp. 307-312

q=1-p
ASN.full = pbinom(Ac, n+1, p)*((n-Ac)/(n*q)) +(1-pbinom(Ac+1, n+1, p))*((Ac+1)/(n*p))
ASN.full=n*ASN.full

ASN.semi = pbinom(Ac, n, p) +(1-pbinom(Ac+1, n+1, p))*((Ac+1)/(n*p))
ASN.semi=n*ASN.semi
if(any(p==0)){
ASN.semi[p==0] = n
ASN.full[p==0] = n-Ac
}
results=list(p=p, ASN.semi=ASN.semi, ASN.full=ASN.full, n=n)
class(results)="CurtSampPlan"
if(Plots){
plot(results)
}
return(results)
}


print.CurtSampPlan = function(x,...){
print.default(x,...)
}

plot.CurtSampPlan=function(x,y=NULL,...){
plot(x$p, x$ASN.full, type="l", ylim=c(1, x$n), ylab="ASN", col="red", lty=2)
par(new=TRUE)
plot(x$p, x$ASN.semi, type="l", ylim=c(1, x$n), ylab="", col="blue", lty=1)
legend("topright", legend =c("Fully Curtailed ASN","Semi-curtailed ASN"), lty=2:1, col = c("red", "blue"))
}
