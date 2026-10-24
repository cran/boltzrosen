\name{rcboltzrosen}
\alias{rcboltzrosen}
\title{
Simulation from the Boltzmann-Rosenbrock Copula
}
\description{
Generates random samples from the copula associated with the Boltzmann-Rosenbrock distribution.
}
\usage{
rcboltzrosen(n, beta = 1, a = 1, b = 100)
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
The copula associated with the Boltzmann-Rosenbrock distribution is obtained via Sklar's theorem from the joint distribution function \eqn{F(x,y)} and its marginal distribution functions \eqn{F_X} and \eqn{F_Y}. It is the function \eqn{C} satisfying

\deqn{F(x, y) = C(F_X(x), F_Y(y))}

for all \eqn{x, y} in \eqn{\mathbb{R}}.

This function generates samples from the copula by first drawing pairs \eqn{(x, y)} from the joint Boltzmann-Rosenbrock distribution and then applying the probability integral transform to each component, i.e., computing \eqn{u = F_X(x)} and \eqn{v = F_Y(y)}. The resulting pairs \eqn{(u, v)} are uniformly distributed on \eqn{[0,1]^2} and their joint distribution function is the copula \eqn{C}.

The parameter \code{beta} is defined as \eqn{\beta = kT/2}, where \eqn{k} is the Boltzmann constant and \eqn{T} is the absolute temperature. This parameter is introduced to simplify the notation of the Boltzmann-Rosenbrock distribution.
}
\value{
A numeric matrix with \code{n} rows and two columns. The first column contains the sampled values of \eqn{u = F_X(x)} and the second column contains the sampled values of \eqn{v = F_Y(y)}. Both columns lie in the interval \eqn{[0,1]}.
}
\references{
Gentle, J.E. (2009). Computational Statistics. Springer. \doi{10.1007/978-0-387-98144-4}

Nelsen, R.B. (2006). An Introduction to Copulas. Springer. \doi{10.1007/0-387-28678-0}
}
\author{
Rogelio Salinas Gutiérrez, Jhon Daniel Aguilar Payares, Alejandro Fausto Cortés Salinas, Sofía Isabel Soledad Limón, Rogelio Emiliano Salinas Gutiérrez, Juan Pablo Salinas Muñoz, Pedro Abraham Montoya Calzada.
}
\note{
The parameters \code{beta} and \code{b} must be positive. The argument \code{n} should be a positive integer.

Because the marginal distribution function of Y has no closed form, obtaining each sample of \eqn{v} requires numerical evaluation of \eqn{F_Y}, and therefore this function may be slow when \code{n} is large.
}
\examples{
# Generate a sample of size 1000 from the copula
set.seed(123)
copula_sample <- rcboltzrosen(1000)

# Inspect the first rows
head(copula_sample)

# The margins are uniform on (0,1)
hist(copula_sample[, 1], main = "Marginal of u")
hist(copula_sample[, 2], main = "Marginal of v")

# Generate with different parameters
copula_sample2 <- rcboltzrosen(1000, beta = 2, a = 1, b = 100)
}
\seealso{
\code{\link{rboltzrosen}}, \code{\link{pcboltzrosen}}
}
\keyword{distribution}
\keyword{datagen}
