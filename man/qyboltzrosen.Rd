\name{qyboltzrosen}
\alias{qyboltzrosen}
\title{
Boltzmann-Rosenbrock Marginal Quantile Function of Y
}
\description{
Computes the quantile function (inverse cumulative distribution function) of the Y component of the Boltzmann-Rosenbrock distribution.
}
\usage{
qyboltzrosen(p, beta = 1, a = 1, b = 100)
}
\arguments{
\item{p}{
A numeric vector of probabilities in the interval \eqn{[0,1]}.
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
The marginal distribution of Y in the Boltzmann-Rosenbrock distribution does not have a closed form. Its cumulative distribution function is given by

\deqn{F_Y(y) = F(\infty, y) = \int_{-\infty}^{\infty} f_X(s) \Phi_{Y|X}(y|s) \, ds,}

where \eqn{f_X} is the marginal density of X, normal with mean \eqn{a} and variance \eqn{\beta}, and \eqn{\Phi_{Y|X}} is the conditional CDF of Y given X = s, normal with mean \eqn{s^2} and variance \eqn{\beta/b}.

Because \eqn{F_Y} has no closed form, the quantile function \eqn{F_Y^{-1}(p)} is obtained numerically. For each probability \eqn{p}, the returned value is the number \eqn{y} satisfying \eqn{F_Y(y) = p}. If a probability lies outside the range of attainable values of \eqn{F_Y}, the function returns \eqn{-\infty} or \eqn{\infty} accordingly.

The parameter \code{beta} is defined as \eqn{\beta = kT/2}, where \eqn{k} is the Boltzmann constant and \eqn{T} is the absolute temperature. This parameter is introduced to simplify the notation of the Boltzmann-Rosenbrock distribution.
}
\value{
A numeric vector of quantiles corresponding to \code{p}. The length of the returned vector is equal to the length of \code{p}. The value \code{NA} is returned for any \code{NA} probability in \code{p}.
}
\references{
Gentle, J.E. (2009). Computational Statistics. Springer. \doi{10.1007/978-0-387-98144-4}
}
\author{
Rogelio Salinas Gutiérrez, Jhon Daniel Aguilar Payares, Alejandro Fausto Cortés Salinas, Sofía Isabel Soledad Limón, Rogelio Emiliano Salinas Gutiérrez, Juan Pablo Salinas Muñoz, Pedro Abraham Montoya Calzada.
}
\note{
The parameters \code{beta} and \code{b} must be positive. Because the marginal distribution of Y has no closed form, the quantile function is obtained numerically, and therefore the computation may be slow when \code{p} is a long vector.
}
\examples{
# Evaluate the marginal quantile function of Y at a single probability
qyboltzrosen(0.5)

# Evaluate at several probabilities
qyboltzrosen(c(0.025, 0.5, 0.975), beta = 2, a = 1, b = 100)

# Check that qyboltzrosen is approximately the inverse of pyboltzrosen
p <- 0.75
y <- qyboltzrosen(p)
pyboltzrosen(y)  # Should be approximately p

# NA probabilities propagate to NA outputs
qyboltzrosen(c(0.5, NA, 0.9))
}
\keyword{distribution}
