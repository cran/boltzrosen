dxboltzrosen <- function(x, beta=1, a=1, b=100) {
  return(dnorm(x, mean=a, sd=sqrt(beta)))
}
