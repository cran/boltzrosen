\name{pcboltzrosen}
\alias{pcboltzrosen}
\title{
Boltzmann-Rosenbrock Copula Distribution Function
}
\description{
Computes the cumulative distribution function of the copula associated with the Boltzmann-Rosenbrock distribution. The copula is obtained via Sklar's theorem as \eqn{C(u,v) = F(x,y)}, where \eqn{u = F_X(x)} and \eqn{v = F_Y(y)}.
}
\usage{
pcboltzrosen(u, beta = 1, a = 1, b = 100)
}
\arguments{
\item{u}{
A numeric matrix with exactly two columns representing the probabilities \eqn{u} and \eqn{v} in the unit interval \eqn{[0,1]}. Each row corresponds to one observation, with the first column representing \eqn{u = F_X(x)} and the second column representing \eqn{v = F_Y(y)}. A numeric vector of length 2 or a data frame with two columns is also accepted and will be coerced into a matrix.
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
The copula associated with the Boltzmann-Rosenbrock distribution is defined by

\deqn{C(u,v) = F(x,y),}

where \eqn{u = F_X(x)} and \eqn{v = F_Y(y)}. The function first transforms the probabilities \eqn{u} and \eqn{v} into the corresponding quantiles \eqn{x} and \eqn{y} using \code{qxboltzrosen()} and \code{qyboltzrosen()}, respectively. Then it evaluates the joint cumulative distribution function \eqn{F(x,y)} using \code{pboltzrosen()}.

The parameters \code{beta}, \code{a}, and \code{b} are passed to all internal functions.

The input probabilities must lie in the interval \eqn{[0,1]}. If any value is outside this range, the function stops with an error. The returned values are forced to lie in \eqn{[0,1]} using \code{pmin()} and \code{pmax()} to correct any numerical rounding errors.

The parameter \code{beta} is defined as \eqn{\beta = kT/2}, where \eqn{k} is the Boltzmann constant and \eqn{T} is the absolute temperature.
}
\value{
A numeric vector containing the copula distribution values for each row of the input matrix. The length of the returned vector is equal to the number of rows in \code{u}.
}
\references{
Nelsen, R.B. (2006). An Introduction to Copulas. Springer. \doi{10.1007/0-387-28678-0}
}
\author{
Rogelio Salinas Gutiérrez, Jhon Daniel Aguilar Payares, Alejandro Fausto Cortés Salinas, Sofía Isabel Soledad Limón, Rogelio Emiliano Salinas Gutiérrez, Juan Pablo Salinas Muñoz, Pedro Abraham Montoya Calzada.
}
\note{
This function depends on \code{qxboltzrosen}, \code{qyboltzrosen}, and \code{pboltzrosen}. The parameters \code{beta} and \code{b} must be positive. The input probabilities must be in \eqn{[0,1]}; otherwise, an error is raised.
}
\examples{

# Define a matrix of probabilities
probs <- matrix(c(
  0.1, 0.2,
  0.5, 0.5,
  0.9, 0.8
), ncol = 2, byrow = TRUE)

# Evaluate the copula CDF
pcboltzrosen(probs)

# Evaluate with different parameters
pcboltzrosen(probs, beta = 2, a = 1, b = 100)

# A single observation can be given as a vector
pcboltzrosen(c(0.5, 0.5))
}
\keyword{distribution}
