rcboltzrosen <- function(n, beta=1, a=1, b=100) {
  # Generar números aleatorios de la cópula

  xy <- rboltzrosen(n=n, beta=beta, a=a, b=b)

  u_val <- pxboltzrosen(xy[,1], beta=beta, a=a, b=b)

  v_val <- pyboltzrosen(xy[,2], beta=beta, a=a, b=b)

  return(cbind(u_val, v_val))
}
