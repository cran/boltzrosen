\name{pxboltzrosen}
\alias{pxboltzrosen}
\title{
Boltzmann-Rosenbrock Marginal Distribution Function of X
}
\description{
Computes the marginal cumulative distribution function of the X component of the Boltzmann-Rosenbrock distribution.
}
\usage{
pxboltzrosen(x, beta = 1, a = 1, b = 100)
}
\arguments{
\item{x}{
A numeric vector of quantiles.
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

The cumulative distribution is evaluated using \code{pnorm(x, mean = a, sd = sqrt(beta))}.

The parameter \code{beta} is defined as \eqn{\beta = kT/2}, where \eqn{k} is the Boltzmann constant and \eqn{T} is the absolute temperature. This parameter is introduced to simplify the notation of the Boltzmann-Rosenbrock distribution.

Although the argument \code{b} appears in the function signature, it does not affect the marginal distribution of X and is ignored.
}
\value{
A numeric vector of probabilities corresponding to \code{x}. The length of the returned vector is equal to the length of \code{x}.
}
\references{
Chan, S. (2026). Introduction to Probability for Data Science. Michigan Publishing. \url{https://probability4datascience.com}
}
\author{
Rogelio Salinas Gutiérrez, Jhon Daniel Aguilar Payares, Alejandro Fausto Cortés Salinas, Sofía Isabel Soledad Limón, Rogelio Emiliano Salinas Gutiérrez, Juan Pablo Salinas Muñoz, Pedro Abraham Montoya Calzada.
}
\note{
The parameter \code{beta} must be positive to ensure a valid standard deviation for the normal distribution. The argument \code{b} is not used by this function but is kept for compatibility with \code{\link{dboltzrosen}} and other functions in the package.
}
\examples{
# Evaluate the marginal CDF at a single point
pxboltzrosen(0)

# Evaluate at several points
pxboltzrosen(c(0, 1, 2), beta = 2, a = 1)

# The argument b is ignored
pxboltzrosen(0, b = 50)
}
\keyword{distribution}
