# Boltzmann-Rosenbrock density function ^^

dboltzrosen <- function(x, beta=1, a=1, b=100){

  d <- dim(x) # regresa un vector con 2 valores
  if(is.null(d)) {
    #Marginal:
    mar <- dnorm(x[1], mean=a, sd=sqrt(beta))
    #Conditional:
    con <- dnorm(x[2], mean=x[1]^2, sd=sqrt(beta/b))
  } else {
    n <- d[1]
    mar <- numeric(n)
    con <- numeric(n)
    for(i in 1:n){
      #Marginal:
      mar[i] <- dnorm(x[i, 1], mean=a, sd=sqrt(beta))
      #Conditional:
      con[i] <- dnorm(x[i, 2], mean=x[i,1]^2, sd=sqrt(beta/b))
    }
  }
  z <- (mar*con)
  return(z)
}
