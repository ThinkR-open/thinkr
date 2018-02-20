[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/thinkr)](https://cran.r-project.org/package=thinkr)
[![](http://cranlogs.r-pkg.org/badges/thinkr)](https://cran.r-project.org/package=thinkr)
[![Travis build status](https://travis-ci.org/ThinkR-open/thinkr.svg?branch=master)](https://travis-ci.org/ThinkR-open/thinkr)
 [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/ThinkR-open/thinkr?branch=master&svg=true)](https://ci.appveyor.com/project/ThinkR-open/thinkr)
 [![Coverage status](https://codecov.io/gh/ThinkR-open/thinkr/branch/master/graph/badge.svg)](https://codecov.io/github/ThinkR-open/thinkr?branch=master)

# thinkr

the peep function allow you to "have a look" inside a dplyr workflow 

```R
library(thinkr)
library(dplyr)
data(iris)
iris %>% peep(head,summary) %>% plot
iris %>% peep_("head","summary") %>% plot
iris %>% peep(funs(head(.,n=2),summary(.,maxsum=2))) %>% plot
iris %>% peep(funs(summary(.,maxsum=2))) %>% plot
```


clean_names allow to cean dirty names

```R
library(thinkr)
library(dplyr)
data(iris)

iris %>% head
iris %>% clean_names() %>% head
iris %>% clean_names() %>% head
```


## Installation



```R
# install.packages("devtools")
devtools::install_github("ThinkR-open/thinkr")
```
