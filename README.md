---
output:
  md_document:
    variant: markdown_github
---
# randomsearch

[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/randomsearch)](https://cran.r-project.org/package=randomsearch)
[![Build Status](https://travis-ci.org/jakob-r/randomsearch.png?branch=master)](https://travis-ci.org/jakob-r/randomsearch)
[![Build status](https://ci.appveyor.com/api/projects/status/gvr607kqcl78qjq9/branch/master?svg=true)](https://ci.appveyor.com/project/jakob-r/randomsearch/branch/master)
[![Coverage Status](https://coveralls.io/repos/github/jakob-r/randomsearch/badge.svg?branch=master)](https://coveralls.io/github/jakob-r/randomsearch?branch=master)
[![Monthly RStudio CRAN Downloads](https://cranlogs.r-pkg.org/badges/randomsearch)](https://CRAN.R-project.org/package=randomsearch)

## Random Search for Expensive Functions

 Simple Random Search function for the [smoof](https://cran.r-project.org/package=smoof) and [ParamHelpers](https://cran.r-project.org/package=ParamHelpers) ecosystem with termination criteria and parallelization.

* [Documentation](https://jakob-r.github.io/randomsearch/)
* [Issues, Requests and Bug Tracker](https://github.com/jakob-r/randomsearch/issues)



# Installation

We recommend to install the official release version:


```r
install.packages("randomsearch")
```

For experimental use you can install the latest development version:


```r
devtools::install_github("jakob-r/randomsearch")
```

# Usage


```r
obj.fun = makeSingleObjectiveFunction(
  fn = function(x) x[1]^2 + sin(x[2]),
  par.set = makeNumericParamSet(len = 2, lower = -1, upper = 2),
  minimize = TRUE
)
res = randomsearch(obj.fun, max.evals = 10)
ind = getOptPathBestIndex(res)
getOptPathEl(res, ind)
```

```
## $x
## $x$x
## [1] -0.2617368 -0.8738214
## 
## 
## $y
##          y 
## -0.6982813 
## 
## $dob
## [1] 9
## 
## $eol
## [1] NA
## 
## $exec.time
## [1] 0
```

```r
as.data.frame(res)
```

```
##             x1         x2          y dob eol exec.time
## 1  -0.13726744  1.3649154  0.9977236   1  NA     0.001
## 2   0.22693077  1.6490522  1.0484371   2  NA     0.002
## 3   1.82140185 -0.8633305  2.5574934   3  NA     0.000
## 4   0.58431646  1.6772571  1.3357641   4  NA     0.000
## 5   0.65430504  0.3698442  0.7895853   5  NA     0.000
## 6   1.87050004  0.3600025  3.8510469   6  NA     0.000
## 7   1.03271191  0.7179002  1.7242985   7  NA     0.000
## 8  -0.69122595  1.6994749  1.4695256   8  NA     0.000
## 9  -0.26173680 -0.8738214 -0.6982813   9  NA     0.000
## 10 -0.01623784  1.8635109  0.9577278  10  NA     0.000
```
