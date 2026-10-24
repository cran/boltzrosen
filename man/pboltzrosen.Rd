\name{pboltzrosen}
\alias{pboltzrosen}
\title{
Boltzmann-Rosenbrock Joint Distribution Function
}
\description{
Computes the joint cumulative distribution function of the Boltzmann-Rosenbrock distribution for a set of two-dimensional observations.
}
\usage{
pboltzrosen(x, beta = 1, a = 1, b = 100)
}
\arguments{
\item{x}{
A numeric matrix with exactly two columns representing the observations of the random variables X and Y. Each row corresponds to one observation, with the first column representing X and the second column representing Y. A numeric vector of length 2 is also accepted and will be coerced into a one-row matrix.
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
The joint cumulative distribution function is defined as

\deqn{F(x,y) = P[X \le x, Y \le y] = \int_{-\infty}^{x} f_X(s) \Phi_{Y|X}(y|s) \, ds,}

where \eqn{f_X} is the marginal density of X, which is normal with mean \eqn{a} and variance \eqn{\beta},

\deqn{X \sim N(a,\beta),}

and \eqn{\Phi_{Y|X}} is the conditional cumulative distribution function of Y given X = s, which is normal with mean \eqn{s^2} and variance \eqn{\beta/b},

\deqn{Y|X=s \sim N(s^2,\beta/b).}

The integral is evaluated numerically using \code{integrate()}. The lower limit of integration is set to \eqn{a - 10\sqrt{\beta}}, and the upper limit is \eqn{\min(x, a + 10\sqrt{\beta})}, effectively truncating the integration at ten standard deviations from the mean of X. If \eqn{x} is less than or equal to the lower limit, the function returns zero.

The parameter \code{beta} is defined as \eqn{\beta = kT/2}, where \eqn{k} is the Boltzmann constant and \eqn{T} is the absolute temperature.
}
\value{
A numeric vector containing the joint cumulative distribution values for each row of the input matrix. The length of the returned vector is equal to the number of rows in \code{x}.
}
\references{
Pagani, F., Wiegand, M., & Nadarajah, S. (2021). An n-dimensional Rosenbrock distribution for Markov chain Monte Carlo testing. \emph{Scandinavian Journal of Statistics}, 49(2), 657-680. \doi{10.1111/sjos.12532}

Segovia-Domínguez, I., Valdez, S.I. and Hernández-Aguirre, A. (2014). A Boltzmann Multivariate Estimation of Distribution Algorithm for Continuous Optimization. In \emph{Proceedings of the International Conference on Evolutionary Computation Theory and Applications (IJCCI 2014) - ECTA}, (pp. 251-258). SciTePress. \doi{10.5220/0005079902510258}
}
\author{
Rogelio Salinas Gutiérrez, Jhon Daniel Aguilar Payares, Alejandro Fausto Cortés Salinas, Sofía Isabel Soledad Limón, Rogelio Emiliano Salinas Gutiérrez, Juan Pablo Salinas Muñoz, Pedro Abraham Montoya Calzada.
}
\note{
The input must be a matrix with two columns or a numeric vector of length two. The parameters \code{beta} and \code{b} must be positive. The integration limits are truncated at ten standard deviations of the marginal distribution of X, which introduces a small approximation error in the tails.
}
\examples{

# Define a matrix of observations
points <- matrix(c(
  0, 0,
  1, 1,
  2, 4
), ncol = 2, byrow = TRUE)

# Evaluate the joint CDF
pboltzrosen(points)

# Evaluate with different parameters
pboltzrosen(points, beta = 2, a = 1, b = 100)

# A single observation can be given as a vector
pboltzrosen(c(1, 1))
}
\keyword{distribution}
