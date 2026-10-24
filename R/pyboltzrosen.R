pyboltzrosen <- function(y, beta=1, a=1, b=100) {
  matriz_entrada <- cbind(Inf, y)
  return(pboltzrosen(matriz_entrada, beta=beta, a=a, b=b))
}
