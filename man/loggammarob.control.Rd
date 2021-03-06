\name{loggammarob.control}
\alias{loggammarob.control}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Tuning parameters for loggammarob
}
\description{
  Tuning parameters for 'loggammarob' for all four methods implemented. 
}
\usage{
loggammarob.control(method="oneWL", tuning.rho=1.547647,
  tuning.psi=6.08, lower=-7, upper=7, n=201, max.it=750,
  refine.tol=1e-6, solve.tol=1e-7, nResample=100, bw=0.3,
  smooth=NULL, raf=c("NED","GKL","PWD","HD","SCHI2"),
  tau=1, subdivisions=1000, lambda.step=TRUE, sigma.step=TRUE,
  step=1, minw=0.04, nexp=1000, reparam=NULL, bootstrap=FALSE,
  bootstrap.lambda=NULL, qthreshold=0.9, nTML=2000, xmax=1e100,
  iter=1, pcut=0.997, compute.rd=FALSE,
  eps.outlier= function(nobs) 0.1 / nobs)
}

%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{method}{character. The method to be used. See Details below.}
  \item{tuning.rho}{numeric. Tuning constant c1 for the Tau-estimator.}
  \item{tuning.psi}{numeric. Tuning constant c2 for the Tau-estimator.}
  \item{lower}{numeric. The lower limit for the search grid of the shape
  parameter.}
  \item{upper}{numeric. The upper limit for the search grid of the shape
  parameter.}
  \item{n}{numeric. The number of subdivisions for the search grid of
    the shape parameter.}
  \item{max.it}{numeric. Maximum number of iterations.}
  \item{refine.tol}{numeric. Relative convergence tolerance
    for the fully iterated best candidates.}
  \item{solve.tol}{numeric. Relative tolerance for inversion.
    Hence, this corresponds to \code{solve.default()}'s \code{tol}.}
  \item{nResample}{integer. Number of re-sampling candidates to be used
    to find the initial estimator. Currently defaults to 100 which works
    well in most situations.}
  \item{bw}{numeric. Bandwidth used in the Weighted Likelihood steps.}
  \item{smooth}{\code{NULL} or numeric. When not \code{NULL} the
    parameter \code{bw} is set to \code{smooth} times the square root of
    the starting value of the scale parameter.} 
  \item{raf}{character. Residual adjustment function used in the Weighted
    Likelihood steps
    
    \code{raf="NED"}: Negative Exponential Disparity RAF,
    
    \code{raf="GKL"}: Generalized Kullback-Leibler Divergence Family
    with parameter \code{tau} (see below) RAF.

    \code{raf="PWD"}: Power Divergence Family with parameter \code{tau}
    (see below) RAF.

    \code{raf="HD"}: Hellinger Distance RAF,

    \code{raf="SCHI2"}: Symmetric Chi-Squared Disparity RAF.

    Default value is "NED".
  }
  \item{tau}{parameter used when \code{raf} is equal to "PWD" or "GKL".}
  \item{subdivisions}{numeric. Number of subdivisions used in the approximation
     of the smoothed model density in the Weighted Likelihood steps.}
  \item{lambda.step}{logical.}
  \item{sigma.step}{logical.}
  \item{step}{integer. Number of steps to be performed when
    \code{method} is "oneWL" (only implemented for the functions for non
  censored data).}
  \item{minw}{numeric. A scalar in the interval [0,1]. When
  \code{method} is "oneWL" the weights smaller than
  \code{minw} are set to zero.}
  \item{nexp}{integer. When \code{method} is "oneWL" number of quantile
  points used in the approximation of the Expected Jacobian matrix.}
  \item{reparam}{list. When \code{method} is "oneWL" a reparametrization
  is possible for the "sigma" parameter. See function
  \code{\link{sqrtloggamma}} for an example.}
  \item{bootstrap}{logical. To use \code{\link{loggammarob}} in
    \code{\link{boot}}}
  \item{bootstrap.lambda}{numeric. An initial estimates for the shape
    parameter. To use \code{\link{loggammarob}} in \code{\link{boot}}}
  \item{qthreshold}{numeric. A value in (0.5, 1] used for TQtau e TWQtau
  procedure. It is the quantile order to truncated the data on the
  right.}
\item{nTML}{numeric. Number of elements to be considered in the grid
  for finding the cut points of the TML.}
\item{xmax}{numeric. A threshold value for the log likelihood. Used for ML.}
\item{iter}{numeric. Number of iterations to be performed. Only working
  for TML.}
\item{pcut}{numeric. Fraction to determined the cut points of the TML.}
\item{compute.rd}{logical. Indicating if robust distances (based on the
  MCD robust covariance estimator \code{covMcd}) are to be computed
  for the robust diagnostic plots.  This may take some time to
  finish, particularly for large data sets, and can lead to
  singularity problems when there are \code{factor} explanatory
  variables (with many levels, or levels with "few"
  observations).  Hence, is \code{FALSE} by default.}
\item{eps.outlier}{limit on the robustness weight below which an
  observation is considered to be an outlier.  Either a
  \code{numeric(1)} or a function that takes the number of
  observations as an argument.
  Used in \code{summary.loggammacenslmrob}.}
}

\references{
  C. Agostinelli, A. Marazzi and V.J. Yohai (2015) Robust estimates of
  the generalized loggamma distribution, Technometrics, Volume 56, Issue
  1, 2014. DOI: 10.1080/00401706.2013.818578

  C. Agostinelli, A. Marazzi, V.J. Yohai and A. Randriamiharisoa (2016)
  
  Robust Estimation of the Generalized Loggamma Model. The R
  Package robustloggamma. Journal of Statistical Software. Accepted.

  C. Agostinelli, I. Locatelli, A. Marazzi and V.J. Yohai (2015)
  Robust estimators of accelerated failure time
  regression with generalized log-gamma errors. Submitted.
}

\author{
  C. Agostinelli, A. Marazzi, V.J. Yohai and A. Randriamiharisoa 
}

\seealso{
  \code{\link{loggammarob}}
}

\examples{
## Show the default settings:
  str(loggammarob.control())
}

\keyword{robust}
\keyword{models}
