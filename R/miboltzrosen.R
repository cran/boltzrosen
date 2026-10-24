miboltzrosen <- function(beta=1, a=1, b=100) {
  H_Y_given_X <- 0.5 * log(2 * pi * exp(1) * beta / b)

  integrand_H_Y <- function(y_vec) {
    fy <- dyboltzrosen(y_vec, beta=beta, a=a, b=b)
    res <- ifelse(fy > 1e-300, -fy * log(fy), 0)
    return(res)
  }

  sd_x <- sqrt(beta)
  sd_y <- sqrt(beta/b)
  lim_inf_x <- a - 10 * sd_x
  lim_sup_x <- a + 10 * sd_x
  min_x2 <- ifelse(lim_inf_x <= 0 & lim_sup_x >= 0, 0, min(lim_inf_x^2, lim_sup_x^2))
  max_x2 <- max(lim_inf_x^2, lim_sup_x^2)
  lim_inf_y <- min_x2 - 10 * sd_y
  lim_sup_y <- max_x2 + 10 * sd_y

  res_integrate <- integrate(integrand_H_Y, lower = lim_inf_y, upper = lim_sup_y, rel.tol = 1e-5, stop.on.error = FALSE)

  if(res_integrate$message != "OK") {
    warning("Aviso en la integracion de miboltzrosen_new: ", res_integrate$message)
  }

  int_res <- res_integrate$value

  return(int_res - H_Y_given_X)
}
