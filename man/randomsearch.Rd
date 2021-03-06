% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/randomsearch.R
\name{randomsearch}
\alias{randomsearch}
\alias{randomsearch.smoof_function}
\alias{randomsearch.function}
\title{Optimizes a function with random search.}
\usage{
randomsearch(fun, ...)

\method{randomsearch}{smoof_function}(fun, design = NULL,
  max.evals = 20, max.execbudget = NULL, target.fun.value = NULL,
  design.y.cols = NULL, par.dir = NULL, par.jobs = NULL, ...)

\method{randomsearch}{function}(fun, minimize = TRUE, lower, upper,
  design = NULL, max.evals = 20, max.execbudget = NULL,
  target.fun.value = NULL, design.y.cols = NULL, par.dir = NULL,
  par.jobs = NULL, ...)
}
\arguments{
\item{fun}{[\code{smoof_function}|\code{function}]\cr
Fitness function to optimize.
Can be either a \code{smoof_function} or a normal function that takes the numeric vector over that should be optimized as the first argument.
For one dimensional target functions you can obtain a \code{smoof_function} by using \code{\link[smoof]{makeSingleObjectiveFunction}}.
For multi dimensional functions use \code{\link[smoof]{makeMultiObjectiveFunction}}.
It is possible to return even more information which will be stored in the optimization path. 
To achieve this, simply append the attribute \dQuote{extras} to the return value of the target function. 
This has to be a named list of scalar values.
Each of these values will be stored additionally in the optimization path.}

\item{...}{[any] \cr
Additional arguments that will be passed to each call of \code{fun}.}

\item{design}{[\code{data.frame}]\cr
Initial design as data frame.
If the y-values are not already present in design, randomsearch will evaluate the points.
If the parameters have corresponding trafo functions, the design must not be transformed before it is passed!
Functions to generate designs are available in \code{ParamHelpers}: \code{\link[ParamHelpers]{generateDesign}}, \code{\link[ParamHelpers]{generateGridDesign}}, \code{\link[ParamHelpers]{generateRandomDesign}}.
Default is \code{NULL}, which means no initial design.}

\item{max.evals}{[\code{integer(1)}]\cr
Maximum number of evaulations of the objective functions.
Includes the initial design.}

\item{max.execbudget}{[\code{integer(1)}]\cr
Exceution time budget in seconds.}

\item{target.fun.value}{[\code{numeric(1)}]\cr
Traget function value.}

\item{design.y.cols}{[\code{characer()}]\cr
The name of the column containing the function outcomes.
One for single-crit optimization.
Multiple for multi-crit optimization.}

\item{par.dir}{[\code{character(1)}]\cr
Location to store parallel communication files.
Defaults to \code{tmpfile()} which might not be suitable for parallelization methods that work on multiple machines. 
Those need a shared directory.}

\item{par.jobs}{[\code{integer(1)}]\cr
How many parallel jobs do you want to run to evaluate the random search?
Default is \code{NULL} which means 1 if no \code{parallelStart*} function is called.
Otherwise it will detect the number through \code{\link[parallelMap]{parallelGetOptions}}.}

\item{minimize}{[\code{logical()}]\cr
Wheter the function should be minimized or maximized.
If this is a vector we will assume it is a multi-objective optimization.
Has to have the same length as the output of the objective function \code{fun}.}

\item{lower}{[\code{numeric()}] \cr
Lower bounds on the variables.}

\item{upper}{[\code{numeric()}] \cr
Upper bounds on the variables.}
}
\value{
[\code{\link[ParamHelpers]{OptPath}}]
}
\description{
This function conducts a random search on the given function with the support of parallelization and multiple termination criteria.
}
\section{Methods (by class)}{
\itemize{
\item \code{smoof_function}: optimize smoof function

\item \code{function}: optimize generic function
}}

\examples{
obj.fun = makeSingleObjectiveFunction(
 fn = function(x) x[1]^2 + sin(x[2]),
 par.set = makeNumericParamSet(id = "x", lower = -1, upper = 1, len = 2)
)
res = randomsearch(obj.fun, max.evals = 10)
summary(res)
}
