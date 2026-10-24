\name{dboltzrosen}
\alias{dboltzrosen}
\title{
Boltzmann-Rosenbrock Density Function
}
\description{
Computes the joint probability density function of the Boltzmann-Rosenbrock distribution for a set of two-dimensional observations. The joint density is calculated as the product of the marginal density of X and the conditional density of Y given X.
}
\usage{
dboltzrosen(x, beta=1, a=1, b=100)
}
\arguments{
\item{x}{
A numeric matrix with exactly two columns representing the observations of the random variables X and Y. Each row corresponds to one observation, with the first column representing X and the second column representing Y.
}

\item{beta}{
A positive numeric value controlling the variance of the marginal and conditional distributions. The variance of X is \code{beta}, while the conditional variance of Y given X is \code{beta/b}. The default value is \code{1}.
}

\item{a}{
A numeric value representing the mean of the marginal distribution of X. The default value is \code{1}.
}

\item{b}{
A positive numeric value controlling the conditional variance of Y given X. The conditional distribution has mean \code{x[,1]^2} and variance \code{beta/b}. The default value is \code{100}.
}
}
\details{
The Boltzmann-Rosenbrock distribution is constructed from the Rosenbrock function, which is commonly used as a benchmark in optimization problems. The joint density function can be expressed as

\deqn{f(x,y)=f_X(x)f_{Y|X}(y|x),}

where the marginal distribution of X is normal with mean a and variance beta,

\deqn{X \sim N(a,\beta),}

and the conditional distribution of Y given X=x is normal with mean x^2 and variance beta/b,

\deqn{Y|X=x \sim N(x^2,\beta/b).}

The function evaluates the marginal density using \code{dnorm()} with mean \code{a} and standard deviation \code{sqrt(beta)}. The conditional density is evaluated using \code{dnorm()} with mean \code{x[i,1]^2} and standard deviation \code{sqrt(beta/b)}. The product of these two densities gives the joint density for each observation.

The parameter \code{beta} is defined as \eqn{\beta = kT/2}, where \eqn{k} is the Boltzmann constant and \eqn{T} is the absolute temperature. This parameter is introduced to simplify the notation of the Boltzmann-Rosenbrock distribution. Consequently, the marginal variance of X is \eqn{\beta}, and the conditional variance of Y given X is \eqn{\beta/b}.

}
\value{
A numeric vector containing the joint density values for each row of the input matrix. The length of the returned vector is equal to the number of rows in \code{x}.
}
\references{
Pagani, F., Wiegand, M., & Nadarajah, S. (2021). An n-dimensional Rosenbrock distribution for Markov chain Monte Carlo testing. \emph{Scandinavian Journal of Statistics}, 49(2), 657-680. \doi{10.1111/sjos.12532}

Segovia-Domínguez, I., Valdez, S.I. and Hernández-Aguirre, A. (2014). A Boltzmann Multivariate Estimation of Distribution Algorithm for Continuous Optimization. In \emph{Proceedings of the International Conference on Evolutionary Computation Theory and Applications (IJCCI 2014) - ECTA}, (pp. 251-258). SciTePress. \doi{10.5220/0005079902510258}
}
\author{
Rogelio Salinas Gutiérrez, Jhon Daniel Aguilar Payares, Alejandro Fausto Cortés Salinas, Sofía Isabel Soledad Limón, Rogelio Emiliano Salinas Gutiérrez, Juan Pablo Salinas Muñoz, Pedro Abraham Montoya Calzada.
}
\note{
The input must be a matrix with two columns. The parameters \code{beta} and \code{b} must be positive to ensure valid standard deviations for the normal distributions.
}
\examples{

# Define a matrix of observations

points <- matrix(c(
0, 0,
1, 1,
2, 4
), ncol = 2, byrow = TRUE)

# Evaluate the joint density

dboltzrosen(points)

# Evaluate the density with different parameters

dboltzrosen(points, beta = 2, a = 1, b = 100)
}
\keyword{distribution}
\keyword{dplot}
