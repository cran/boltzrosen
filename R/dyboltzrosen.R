gauss_legendre <- function(npt){
  x <- numeric(npt)
  w <- numeric(npt)
  mm <- (npt + 1) %/% 2
  for(i in 1:mm){
    z <- cos(pi * (i - 0.25) / (npt + 0.5))
    repeat{
      p1 <- 1
      p2 <- 0
      for(j in 1:npt){
        p3 <- p2
        p2 <- p1
        p1 <- ((2*j - 1) * z * p2 - (j - 1) * p3) / j
      }
      pp <- npt * (z * p1 - p2) / (z^2 - 1)
      z_ant <- z
      z <- z_ant - p1 / pp
      if(abs(z - z_ant) < 1e-14) break
    }
    x[i] <- -z
    x[npt + 1 - i] <- z
    w[i] <- 2 / ((1 - z^2) * pp^2)
    w[npt + 1 - i] <- w[i]
  }
  return(list(nodos = x, pesos = w))
}

dyboltzrosen <- function(y, beta=1, a=1, b=100, L=120, npt=120){

  if(beta<=0) stop("beta debe ser mayor a 0")
  if(b<=0) stop("b debe ser mayor a 0")

  gl <- gauss_legendre(npt)
  nodos <- gl$nodos
  pesos <- gl$pesos

  n <- length(y)
  z <- numeric(n)

  for(i in 1:n){

    val_y <- y[i]

    coefs_cubica <- c(-a, 1 - 2*b*val_y, 0, 2*b)
    raices_cubica <- polyroot(coefs_cubica)
    es_real_cubica <- abs(Im(raices_cubica)) < 1e-8 * (1 + abs(Re(raices_cubica)))
    raices_reales <- sort(Re(raices_cubica[es_real_cubica]))

    curvatura_raices <- 12*b*raices_reales^2 - 4*b*val_y + 2
    crestas <- raices_reales[curvatura_raices > 0]
    maximos_interiores <- raices_reales[curvatura_raices < 0]

    if(length(crestas) == 0) stop(paste("no hay crestas para y =", val_y))

    h <- function(x) (a - x)^2 + b*(val_y - x^2)^2

    ventana_inf <- numeric(length(crestas))
    ventana_sup <- numeric(length(crestas))

    for(p in seq_along(crestas)){

      xc <- crestas[p]
      objetivo <- h(xc) + 2*beta*L

      coefs_cuartica <- c(a^2 + b*val_y^2 - objetivo, -2*a, 1 - 2*b*val_y, 0, b)
      raices_cuartica <- polyroot(coefs_cuartica)
      es_real_cuartica <- abs(Im(raices_cuartica)) < 1e-8 * (1 + abs(Re(raices_cuartica)))
      raices_nivel <- Re(raices_cuartica[es_real_cuartica])

      candidatos_izq <- raices_nivel[raices_nivel < xc]
      candidatos_der <- raices_nivel[raices_nivel > xc]

      if(length(candidatos_izq) == 0) stop(paste("no se encontro borde izquierdo del nivel para y =", val_y))
      if(length(candidatos_der) == 0) stop(paste("no se encontro borde derecho del nivel para y =", val_y))

      nivel_izq <- max(candidatos_izq)
      nivel_der <- min(candidatos_der)

      vecinos_izq <- maximos_interiores[maximos_interiores < xc]
      vecinos_der <- maximos_interiores[maximos_interiores > xc]

      ventana_inf[p] <- if(length(vecinos_izq) > 0) max(nivel_izq, max(vecinos_izq)) else nivel_izq
      ventana_sup[p] <- if(length(vecinos_der) > 0) min(nivel_der, min(vecinos_der)) else nivel_der

    }

    log_terminos <- numeric(0)

    for(p in seq_along(crestas)){
      centro <- (ventana_sup[p] + ventana_inf[p]) / 2
      radio <- (ventana_sup[p] - ventana_inf[p]) / 2
      x_nodos <- centro + radio * nodos
      log_dens_x <- dnorm(x_nodos, mean=a, sd=sqrt(beta), log=TRUE)
      log_dens_y <- dnorm(val_y, mean=x_nodos^2, sd=sqrt(beta/b), log=TRUE)
      log_pesos <- log(pesos * radio)
      log_terminos <- c(log_terminos, log_dens_x + log_dens_y + log_pesos)
    }

    maximo <- max(log_terminos)
    z[i] <- exp(maximo) * sum(exp(log_terminos - maximo))

  }

  return(z)

}
