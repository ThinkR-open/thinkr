# thinkR

the ublo function allow you to "have a look" inside a dplyr workflow 

```R
library(dplyr)
data(iris)
iris %>% ublo(head,summary) %>% plot
iris %>% ublo_("head","summary") %>% plot
iris %>% ublo2(funs(head(.,n=2),summary(.,maxsum=2))) %>% plot
iris %>% ublo2(funs(summary(.,maxsum=2))) %>% plot
```
## Installation



```R
# install.packages("devtools")
devtools::install_github("ThinkRstat/ThinkR")
```
