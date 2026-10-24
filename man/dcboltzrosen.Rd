\name{dcboltzrosen}
\alias{dcboltzrosen}
\title{
Boltzmann-Rosenbrock Copula Density Function
}
\description{
Computes the probability density function of the copula associated with the Boltzmann-Rosenbrock distribution. The copula density is obtained by dividing the joint density by the product of the marginal densities, evaluated at the corresponding quantiles.
}
\usage{
dcboltzrosen(u, beta=1, a=1, b=100)
}
\arguments{
\item{u}{
A numeric matrix or data frame with two columns containing probability values in the interval [0,1]. The first column represents the probability associated with the marginal distribution of X, and the second column represents the probability associated with the marginal distribution of Y. A numeric vector can also be supplied and is converted into a two-column matrix.
}

\item{beta}{
A positive numeric value defined as \eqn{\beta=kT/2}, where \eqn{k} is the Boltzmann constant and \eqn{T} is the absolute temperature. It controls the variance of the marginal distribution of X and the conditional distribution of Y given X. The default value is \code{1}.
}

\item{a}{
A numeric value representing the mean of the marginal distribution of X. The default value is \code{1}.
}

\item{b}{
A positive numeric value controlling the conditional variance of Y given X. The conditional variance is \eqn{\beta/b}. The default value is \code{100}.
}
}
\details{
The Boltzmann-Rosenbrock copula is derived from the joint distribution of the random variables X and Y. According to Sklar's theorem, the copula density can be expressed as

\deqn{c(u,v)=\frac{f(x,y)}{f_X(x)f_Y(y)},}

where \eqn{u=F_X(x)} and \eqn{v=F_Y(y)}. Here, \eqn{f(x,y)} is the joint density of the Boltzmann-Rosenbrock distribution, while \eqn{f_X(x)} and \eqn{f_Y(y)} are the marginal densities of X and Y, respectively.

The function first converts a data frame into a matrix or a numeric vector into a two-column matrix, when necessary. It then calculates the corresponding quantiles using \code{qxboltzrosen()} and \code{qyboltzrosen()} to obtain the values of X and Y.

For observations with finite quantiles, the function evaluates the joint density using \code{dboltzrosen()}, the marginal density of X using \code{dxboltzrosen()}, and the marginal density of Y using \code{dyboltzrosen_crestas()}. The copula density is calculated as the ratio of the joint density to the product of the marginal densities.

If either quantile is non-finite, the function returns zero for that observation. It also returns zero when the product of the marginal densities is less than or equal to \eqn{10^{-300}}, avoiding division by a numerically negligible denominator.

The function stops with an error if any non-missing probability value lies outside the interval [0,1].
}
\value{
A numeric vector containing the copula density values corresponding to the rows of the input matrix. The length of the returned vector is equal to the number of rows in the processed input matrix.
}
\references{
Nelsen, R.B. (2006). An Introduction to Copulas. Springer. \doi{10.1007/0-387-28678-0}
}

\author{
Rogelio Salinas Gutiérrez, Jhon Daniel Aguilar Payares, Alejandro Fausto Cortés Salinas, Sofía Isabel Soledad Limón, Rogelio Emiliano Salinas Gutiérrez, Juan Pablo Salinas Muñoz, Pedro Abraham Montoya Calzada.
}
\note{
The parameters \code{beta} and \code{b} must be positive to ensure valid standard deviations in the underlying normal distributions.

The implementation assigns zero to observations for which either quantile is non-finite, as well as to observations whose product of marginal densities is less than or equal to \eqn{10^{-300}}. These are numerical handling rules implemented by the function and do not, by themselves, establish that the mathematical copula density is zero at the corresponding points.
}
\examples{

#Define probability pairs

u <- matrix(c(
0.25, 0.30,
0.50, 0.50,
0.75, 0.80
), ncol = 2, byrow = TRUE)

# Evaluate the copula density

dcboltzrosen(u)

# Evaluate with different parameters

dcboltzrosen(u, beta = 2, a = 1, b = 100)
}
\keyword{distribution}
\keyword{copula}
