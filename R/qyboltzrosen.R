qyboltzrosen <- function(p, beta=1, a=1, b=100) {

  if (any(p < 0 | p > 1, na.rm = TRUE)) {
    stop("Las probabilidades p deben estar en el intervalo [0, 1]")
  }

  res <- numeric(length(p))

  max_p <- pyboltzrosen(Inf, beta=beta, a=a, b=b)
  min_p <- pyboltzrosen(-Inf, beta=beta, a=a, b=b)

  for (i in seq_along(p)) {
    prob <- p[i]

    if (is.na(prob)) {
      res[i] <- NA
    } else if (prob >= max_p) {
      res[i] <- Inf
    } else if (prob <= min_p) {
      res[i] <- -Inf
    } else {
      # Función objetivo: F_Y(y) - prob = 0
      obj_func <- function(y) {
        pyboltzrosen(y, beta = beta, a = a, b = b) - prob
      }

      # Buscador de raices
      raiz <- tryCatch({
        uniroot(obj_func, interval = c(-10, 10), extendInt = "yes", tol = 1e-6)
      }, error = function(e) {
        uniroot(obj_func, interval = c(-100, 100), extendInt = "yes", tol = 1e-6)
      })

      res[i] <- raiz$root
    }
  }

  return(res)
}
