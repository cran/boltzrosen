\name{qxboltzrosen}
\alias{qxboltzrosen}
\title{
Boltzmann-Rosenbrock Marginal Quantile Function of X
}
\description{
Computes the quantile function (inverse cumulative distribution function) of the X component of the Boltzmann-Rosenbrock distribution.
}
\usage{
qxboltzrosen(p, beta = 1, a = 1, b = 100)
}
\arguments{
\item{p}{
A numeric vector of probabilities in the interval \eqn{[0,1]}.
}

\item{beta}{
A positive numeric value controlling the variance of the marginal distribution of X. The variance of X is \code{beta}. The default value is \code{1}.
}

\item{a}{
A numeric value representing the mean of the marginal distribution of X. The default value is \code{1}.
}

\item{b}{
A positive numeric value included for consistency with other functions of the Boltzmann-Rosenbrock distribution. It is not used in this function. The default value is \code{100}.
}
}
\details{
The marginal distribution of X in the Boltzmann-Rosenbrock distribution is normal with mean \eqn{a} and variance \eqn{\beta}:

\deqn{X \sim N(a, \beta).}

The quantile function is evaluated using \code{qnorm(p, mean = a, sd = sqrt(beta))}, which returns the value \eqn{x} such that \eqn{P[X \le x] = p}.

The parameter \code{beta} is defined as \eqn{\beta = kT/2}, where \eqn{k} is the Boltzmann constant and \eqn{T} is the absolute temperature. This parameter is introduced to simplify the notation of the Boltzmann-Rosenbrock distribution.

Although the argument \code{b} appears in the function signature, it does not affect the marginal distribution of X and is ignored.
}
\value{
A numeric vector of quantiles corresponding to \code{p}. The length of the returned vector is equal to the length of \code{p}.
}
\references{
Gentle, J.E. (2009). Computational Statistics. Springer. \doi{10.1007/978-0-387-98144-4}
}
\author{
Rogelio Salinas Gutiérrez, Jhon Daniel Aguilar Payares, Alejandro Fausto Cortés Salinas, Sofía Isabel Soledad Limón, Rogelio Emiliano Salinas Gutiérrez, Juan Pablo Salinas Muñoz, Pedro Abraham Montoya Calzada.
}
\note{
The parameter \code{beta} must be positive to ensure a valid standard deviation for the normal distribution. The argument \code{b} is not used by this function but is kept for compatibility with \code{\link{dboltzrosen}} and other functions in the package.

This function is the inverse of \code{\link{pxboltzrosen}}.
}
\examples{
# Evaluate the marginal quantile function at a single probability
qxboltzrosen(0.5)

# Evaluate at several probabilities
qxboltzrosen(c(0.025, 0.5, 0.975), beta = 2, a = 1)

# The argument b is ignored
qxboltzrosen(0.5, b = 50)

# Check that qxboltzrosen is the inverse of pxboltzrosen
p <- 0.75
x <- qxboltzrosen(p)
pxboltzrosen(x)  # Should be approximately p
}
\keyword{distribution}
