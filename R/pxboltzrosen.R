pxboltzrosen <- function(x, beta=1, a=1, b=100) {
  return(pnorm(x, mean=a, sd=sqrt(beta)))
}

