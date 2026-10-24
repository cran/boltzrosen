\name{dyboltzrosen}
\alias{dyboltzrosen}
\title{
Boltzmann-Rosenbrock Marginal Density Function of Y
}
\description{
Computes the marginal probability density function of the Y component of the Boltzmann-Rosenbrock distribution. Since the marginal density of Y has no closed form, it is evaluated by numerical integration of the joint density over X using Gauss-Legendre quadrature.
}
\usage{
dyboltzrosen(y, beta = 1, a = 1, b = 100, L = 120, npt = 120)
}
\arguments{
\item{y}{
A numeric vector of quantiles.
}

\item{beta}{
A positive numeric value controlling the variance of the marginal distribution of X. The variance of X is \code{beta}. The default value is \code{1}.
}

\item{a}{
A numeric value representing the mean of the marginal distribution of X. The default value is \code{1}.
}

\item{b}{
A positive numeric value controlling the conditional variance of Y given X. The conditional distribution has mean \code{x^2} and variance \code{beta/b}. The default value is \code{100}.
}

\item{L}{
A positive numeric value controlling the truncation level for the integration domain around each ridge of the integrand. The level set is defined by \eqn{h(x,y) = h(x_c,y) + 2\beta L}, where \eqn{h} is the Rosenbrock energy and \eqn{x_c} is a ridge location. The default value is \code{120}.
}

\item{npt}{
A positive integer giving the number of Gauss-Legendre quadrature nodes used in each integration subinterval. The default value is \code{120}.
}
}
\details{
The marginal density of Y is given by

\deqn{f_Y(y) = \int_{-\infty}^{\infty} f_X(x) f_{Y|X}(y|x) \, dx,}

where the marginal distribution of X is normal with mean \eqn{a} and variance \eqn{\beta},

\deqn{X \sim N(a,\beta),}

and the conditional distribution of Y given X = x is normal with mean \eqn{x^2} and variance \eqn{\beta/b},

\deqn{Y|X=x \sim N(x^2,\beta/b).}

Therefore,

\deqn{f_Y(y) = \int_{-\infty}^{\infty} \frac{1}{\sqrt{2\pi\beta}} e^{-\frac{(x-a)^2}{2\beta}} \frac{1}{\sqrt{2\pi\beta/b}} e^{-\frac{(y-x^2)^2}{2\beta/b}} \, dx.}

This integral does not have a closed form. The function finds the ridges (local maxima) of the integrand in the \eqn{x} direction for a given \eqn{y}, determines integration windows around each ridge using the level set \eqn{h(x,y) = h(x_c,y) + 2\beta L}, and then applies Gauss-Legendre quadrature with \code{npt} nodes to each window. The parameter \code{L} controls how far from the peak the integration is truncated; larger values increase accuracy at the cost of a wider integration domain. The parameter \code{npt} controls the number of quadrature nodes per window.

The parameter \code{beta} is defined as \eqn{\beta = kT/2}, where \eqn{k} is the Boltzmann constant and \eqn{T} is the absolute temperature. This parameter is introduced to simplify the notation of the Boltzmann-Rosenbrock distribution.
}
\value{
A numeric vector containing the marginal density values corresponding to \code{y}. The length of the returned vector is equal to the length of \code{y}.
}
\references{
Chan, S. (2026). Introduction to Probability for Data Science. Michigan Publishing. \url{https://probability4datascience.com}
}
\author{
Rogelio Salinas Gutiérrez, Jhon Daniel Aguilar Payares, Alejandro Fausto Cortés Salinas, Sofía Isabel Soledad Limón, Rogelio Emiliano Salinas Gutiérrez, Juan Pablo Salinas Muñoz, Pedro Abraham Montoya Calzada.
}
\note{
The parameters \code{beta} and \code{b} must be positive to ensure valid standard deviations for the normal distributions. The function may stop with an error if no ridges or integration boundaries are found for a given value of \code{y}; this typically indicates that the chosen \code{L} or \code{npt} is inadequate or that \code{y} is far in the tails.
}
\examples{

# Evaluate the marginal density of Y at a single point
dyboltzrosen(1)

# Evaluate at several points with different parameters
dyboltzrosen(c(0, 1, 4), beta = 2, a = 1, b = 100)

# Increase the truncation level for greater accuracy
dyboltzrosen(1, L = 150, npt = 200)
}
\keyword{distribution}
\keyword{dplot}
