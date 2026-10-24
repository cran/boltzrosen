\name{rboltzrosen}
\alias{rboltzrosen}
\title{
Simulation from the Boltzmann-Rosenbrock Distribution
}
\description{
Generates random samples from the Boltzmann-Rosenbrock distribution using its conditional structure.
}
\usage{
rboltzrosen(n, beta = 1, a = 1, b = 100)
}
\arguments{
\item{n}{
A positive integer giving the number of samples to generate.
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
The Boltzmann-Rosenbrock distribution admits a conditional representation in which the marginal distribution of X is normal with mean \eqn{a} and variance \eqn{\beta},

\deqn{X \sim N(a, \beta),}

and the conditional distribution of Y given X = x is normal with mean \eqn{x^2} and variance \eqn{\beta/b},

\deqn{Y|X=x \sim N(x^2, \beta/b).}

This function exploits that representation by first sampling the X component from its marginal distribution and then sampling the Y component from the corresponding conditional distribution. The resulting pairs \eqn{(x, y)} are independent and identically distributed draws from the joint Boltzmann-Rosenbrock distribution.

The parameter \code{beta} is defined as \eqn{\beta = kT/2}, where \eqn{k} is the Boltzmann constant and \eqn{T} is the absolute temperature. This parameter is introduced to simplify the notation of the Boltzmann-Rosenbrock distribution.
}
\value{
A numeric matrix with \code{n} rows and two columns. The first column contains the sampled values of X and the second column contains the sampled values of Y.
}
\references{
Gentle, J.E. (2009). Computational Statistics. Springer. \doi{10.1007/978-0-387-98144-4}
}
\author{
Rogelio Salinas Gutiérrez, Jhon Daniel Aguilar Payares, Alejandro Fausto Cortés Salinas, Sofía Isabel Soledad Limón, Rogelio Emiliano Salinas Gutiérrez, Juan Pablo Salinas Muñoz, Pedro Abraham Montoya Calzada.
}
\note{
The parameters \code{beta} and \code{b} must be positive. The argument \code{n} should be a positive integer.

Because the conditional representation is used, no rejection or iterative procedure is required, and the samples are exact draws from the target distribution.
}
\examples{
# Generate a sample of size 1000 with default parameters
set.seed(123)
sample1 <- rboltzrosen(1000)

# Inspect the first rows
head(sample1)

# Generate a sample with different parameters
sample2 <- rboltzrosen(1000, beta = 2, a = 1, b = 100)

# The marginal distribution of X is normal
hist(sample1[, 1], prob = TRUE, main = "Marginal of X")

# The conditional distribution of Y given X can be explored by subsets
x_close_to_one <- abs(sample1[, 1] - 1) < 0.1
mean(sample1[x_close_to_one, 2])  # Approximately 1
}
\keyword{distribution}
\keyword{datagen}
