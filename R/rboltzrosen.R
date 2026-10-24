# Simulation of Boltzmann-Rosenbrock density function, both marginal and
# conditional i.e. f(x) and f(y|x) ^^


rboltzrosen <- function(n, beta=1, a=1, b=100){
  #Marginal:
  x <- rnorm(n=n, mean=a, sd=sqrt(beta))

  #Conditional:
  y <- rnorm(n=n, mean=x^2, sd=sqrt(beta/b))

  return(cbind(x,y) )
}
