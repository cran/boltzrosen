\name{pyboltzrosen}
\alias{pyboltzrosen}
\title{
Boltzmann-Rosenbrock Marginal Distribution Function of Y
}
\description{
Computes the marginal cumulative distribution function of the Y component of the Boltzmann-Rosenbrock distribution.
}
\usage{
pyboltzrosen(y, beta = 1, a = 1, b = 100)
}
\arguments{
\item{y}{
A numeric vector of quantiles.
}

\item{beta}{
A positive numeric value controlling the variance of the marginal and conditional distributions. The variance of X is \code{beta}, while the conditional variance of Y given X is \code{beta/b}. The default value is \code{1}.
}

\item{a}{
A numeric value representing the mean of the marginal distribution of X. The default value is \code{1}.
}

\item{b}{
A positive numeric value controlling the conditional variance of Y given X. The conditional distribution has mean \code{x^2} and variance \code{beta/b}. The default value is \code{100}.
}
}
\details{
The marginal cumulative distribution function of Y is defined as

\deqn{F_Y(y) = P[Y \le y] = \int_{-\infty}^{\infty} \int_{-\infty}^{y} f(x,t) \, dt \, dx.}

Using the joint cumulative distribution function \eqn{F(x,y)}, the marginal CDF of Y can be obtained by taking the limit as \eqn{x \to \infty}:

\deqn{F_Y(y) = F(\infty, y).}

This function exploits that identity by constructing a matrix with first column equal to \code{Inf} and second column equal to \code{y}, and then calling \code{pboltzrosen()}. The joint CDF is evaluated numerically by \code{pboltzrosen()}, which integrates the marginal density of X times the conditional CDF of Y given X.

The parameter \code{beta} is defined as \eqn{\beta = kT/2}, where \eqn{k} is the Boltzmann constant and \eqn{T} is the absolute temperature.
}
\value{
A numeric vector of probabilities corresponding to \code{y}. The length of the returned vector is equal to the length of \code{y}.
}
\references{
Chan, S. (2026). Introduction to Probability for Data Science. Michigan Publishing. \url{https://probability4datascience.com}
}
\author{
Rogelio Salinas Gutiérrez, Jhon Daniel Aguilar Payares, Alejandro Fausto Cortés Salinas, Sofía Isabel Soledad Limón, Rogelio Emiliano Salinas Gutiérrez, Juan Pablo Salinas Muñoz, Pedro Abraham Montoya Calzada.
}
\note{
This function depends on \code{pboltzrosen}. The parameters \code{beta} and \code{b} must be positive. Because the joint CDF is evaluated by numerical integration, this function may be slow for large vectors \code{y}.
}
\examples{
# Evaluate the marginal CDF of Y at a single point
pyboltzrosen(1)

# Evaluate at several points
pyboltzrosen(c(0, 1, 4), beta = 2, a = 1, b = 100)

# The result equals the joint CDF evaluated at x = Inf
pyboltzrosen(1) == pboltzrosen(cbind(Inf, 1))
}
\keyword{distribution}
