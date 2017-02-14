# thinkR

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
devtools::install_github("ThinkRstat/ThinkR")
```
