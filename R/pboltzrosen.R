pboltzrosen <- function(x, beta=1, a=1, b=100) {

  d <- dim(x)
  if(is.null(d)) {
    x <- matrix(x, ncol=2)
    d <- dim(x)
  }

  n <- d[1]
  z <- numeric(n)

  for(i in 1:n){

    val_x <- x[i, 1]
    val_y <- x[i, 2]

    integrand <- function(s) {
      mar <- dnorm(s, mean=a, sd=sqrt(beta))
      con <- pnorm(val_y, mean=s^2, sd=sqrt(beta/b))
      return(mar * con)
    }

    limite_inf <- a - 10 * sqrt(beta)

    if(val_x <= limite_inf) {
      z[i] <- 0
    } else {
      limite_sup <- min(val_x, a + 10 * sqrt(beta))
      int_res <- integrate(integrand, lower = limite_inf, upper = limite_sup)
      z[i] <- int_res$value
    }

  }

  return(z)
}
