dcboltzrosen <- function(u, beta=1, a=1, b=100) {
  # Función de densidad de la cópula: c(u,v) = f(x,y) / (f_X(x) f_Y(y))

  if (is.data.frame(u)) {
    u <- as.matrix(u)
  } else if (is.null(dim(u))) {
    u <- matrix(u, ncol=2)
  }

  # Prevenir que funciones subyacentes tiren warnings
  if (any(u < 0 | u > 1, na.rm = TRUE)) {
    stop("Las probabilidades 'u' y 'v' deben estar en el intervalo [0, 1]")
  }

  n <- nrow(u)
  res <- numeric(n)

  x_val <- qxboltzrosen(u[,1], beta=beta, a=a, b=b)
  y_val <- qyboltzrosen(u[,2], beta=beta, a=a, b=b)

  # Separar casos de borde (Infinitos generados por u,v muy cercanos a 0 o 1)
  # paquete `copula`, devolvemos 0 en fronteras asintóticas.
  es_borde <- !is.finite(x_val) | !is.finite(y_val)

  if (any(!es_borde)) {
    x_validos <- x_val[!es_borde]
    y_validos <- y_val[!es_borde]

    matriz_entrada <- cbind(x_validos, y_validos)

    f_xy <- dboltzrosen(matriz_entrada, beta=beta, a=a, b=b)
    f_x <- dxboltzrosen(x_validos, beta=beta, a=a, b=b)
    f_y <- dyboltzrosen(y_validos, beta=beta, a=a, b=b)

    denominador <- f_x * f_y

    res_validos <- ifelse(denominador <= 1e-300, 0, f_xy / denominador)
    res[!es_borde] <- res_validos
  }

  # res ya es 0 por defecto (res <- numeric(n)), lo cual maneja los bordes (es_borde == TRUE).
  # Si en el futuro se quiere retornar NaN para bordes exactos, se puede agregar aquí.

  return(res)
}
