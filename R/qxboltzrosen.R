qxboltzrosen <- function(p, beta=1, a=1, b=100) {
  qnorm(p, mean = a, sd = sqrt(beta))
}
