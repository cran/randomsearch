## ----setup, include = FALSE, cache = FALSE-------------------------------
library(randomsearch)
set.seed(123)
knitr::opts_chunk$set(cache = TRUE, collapse = FALSE)

## ----simple usage--------------------------------------------------------
fun = function(x) x[1]^2 + sin(x[2])
res = randomsearch(fun, lower = c(-1, -1), upper = c(2,2), minimize = TRUE, max.evals = 30)
rs = summary(res)
rs$best.x
rs$best.y

tail(as.data.frame(res))

## ----usage---------------------------------------------------------------
fun = function(x) {
  if (x$a == "a1") {
    x$x^2
  } else if (x$a == "a2") {
    sin(x$x * x$z) + 1
  }
}
obj.fun = makeSingleObjectiveFunction(
  fn = fun,
  par.set = makeParamSet(
    makeDiscreteParam("a", values = c("a1", "a2")),
    makeNumericParam("x", lower = -3, upper = 3),
    makeNumericParam("z", lower = 0, upper = 2, requires = quote(a == "a2"))
  ),
  minimize = TRUE,
  has.simple.signature = FALSE
)
res = randomsearch(obj.fun, max.evals = 30)
rs = summary(res)
rs$best.x
rs$best.y

tail(as.data.frame(res))

## ----parallel_usage, eval = FALSE----------------------------------------
#  fun = function(x) {
#    Sys.sleep(runif(1))
#    x[1]^2 + sin(x[2])
#  }
#  
#  parallelMap::parallelStartMulticore(cpus = 2, level = "randomsearch.feval")
#  res = randomsearch(fun, lower = c(-1, -1), upper = c(2,2), minimize = TRUE, max.execbudget = 2, max.evals = 1000)
#  parallelMap::parallelStop()
#  summary(res)

## ----multi_objective, eval = TRUE----------------------------------------
obj.fun = function(x) c(x[1]^2 + sin(x[2]), cos(x[1]))
res = randomsearch(obj.fun, lower = c(-1, -1), upper = c(2,2), minimize = c(TRUE, TRUE), max.evals = 30)
summary(res)

## ----multi_objective_smoof-----------------------------------------------
obj.fun = makeMultiObjectiveFunction(
  fn = function(x) c(x[1]^2 + sin(x[2]), cos(x[1])),
  par.set = makeNumericParamSet(len = 2, lower = -1, upper = 2),
  minimize = c(TRUE, TRUE)
)
res = randomsearch(obj.fun, max.evals = 10)

## ----augment-------------------------------------------------------------
fun = function(x) x[1]^2 + sin(x[2])
res = randomsearch(fun, lower = c(-1, -1), upper = c(2,2), minimize = TRUE, max.evals = 10)
summary(res)
des = as.data.frame(res)
res = randomsearch(fun, lower = c(-1, -1), upper = c(2,2), minimize = TRUE, max.evals = 1000, target.fun.value = -0.4)
summary(res)

