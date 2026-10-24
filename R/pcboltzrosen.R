pcboltzrosen <- function(u, beta=1, a=1, b=100) {
  # Función de distribución de la cópula: C(u,v) = F(x,y)

  if (is.data.frame(u)) {
    u <- as.matrix(u)
  } else if (is.null(dim(u))) {
    u <- matrix(u, ncol=2)
  }

  # Prevenir advertencias de qnorm y evaluaciones fuera del dominio.
  if (any(u < 0 | u > 1, na.rm = TRUE)) {
    stop("Las probabilidades 'u' y 'v' deben estar en el intervalo [0, 1]")
  }

  x_val <- qxboltzrosen(u[,1], beta=beta, a=a, b=b)
  y_val <- qyboltzrosen(u[,2], beta=beta, a=a, b=b)

  matriz_entrada <- cbind(x_val, y_val)
  res <- pboltzrosen(matriz_entrada, beta=beta, a=a, b=b)

  # Forzar el límite probabilístico
  res <- pmin(pmax(res, 0), 1)

  return(res)
}
