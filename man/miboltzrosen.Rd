\name{miboltzrosen}
\alias{miboltzrosen}
\title{
Mutual Information for the Boltzmann-Rosenbrock Distribution
}
\description{
Computes the mutual information between the random variables X and Y of the Boltzmann-Rosenbrock distribution. The mutual information is obtained as the difference between the marginal entropy of Y and the conditional entropy of Y given X.
}
\usage{
miboltzrosen(beta = 1, a = 1, b = 100)
}
\arguments{

\item{beta}{
A positive numeric value controlling the variance of the marginal distribution of X. The variance of X is \code{beta}. The default value is \code{1}.
}

\item{a}{
A numeric value representing the mean of the marginal distribution of X. The default value is \code{1}.
}

\item{b}{
A positive numeric value controlling the conditional variance of Y given X. The conditional distribution has mean \code{x^2} and variance \code{beta/b}. The default value is \code{100}.
}
}
\details{
The mutual information between X and Y is defined as

\deqn{I(X,Y) = H(Y) - H(Y|X),}

where \eqn{H(Y)} is the marginal entropy of Y and \eqn{H(Y|X)} is the conditional entropy of Y given X.

For the Boltzmann-Rosenbrock distribution, the conditional distribution of Y given X = x is normal with mean \eqn{x^2} and variance \eqn{\beta/b}. Therefore, the conditional entropy has a closed form:

\deqn{H(Y|X) = \frac{1}{2} \log(2\pi e \beta / b).}

The marginal entropy of Y is given by

\deqn{H(Y) = -\int_{-\infty}^{\infty} f_Y(y) \log f_Y(y) \, dy,}

which has no closed form. The function evaluates this integral numerically using \code{integrate()}.

The parameter \code{beta} is defined as \eqn{\beta = kT/2}, where \eqn{k} is the Boltzmann constant and \eqn{T} is the absolute temperature.
}
\value{
A numeric scalar with the estimated mutual information \eqn{I(X,Y)}.
}
\references{
Bishop, C.M. (2006). Pattern Recognition and Machine Learning. Springer. \url{https://link.springer.com/book/9780387310732}
}
\author{
Rogelio Salinas Gutiérrez, Jhon Daniel Aguilar Payares, Alejandro Fausto Cortés Salinas, Sofía Isabel Soledad Limón, Rogelio Emiliano Salinas Gutiérrez, Juan Pablo Salinas Muñoz, Pedro Abraham Montoya Calzada.
}
\note{
This function depends on \code{dyboltzrosen}. The integration is performed with \code{integrate()}, and a warning is issued if the integration routine does not return a successful message. The parameters \code{beta} and \code{b} must be positive.
}
\examples{

# Compute mutual information with default parameters
miboltzrosen()

# Compute with different parameters
miboltzrosen(beta = 2, a = 1, b = 100)

}
\keyword{distribution}
