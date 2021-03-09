library(dplyr)
library(tidyr)


test_that("replace_pattern works", {


  dataset <- data.frame(a=as.factor(letters)[1:7],b=letters[1:7],c=1:7,stringsAsFactors = FALSE) %>%
    unite("fus",a,b,remove=FALSE,sep="")

  DF1 <- dataset %>% replace_pattern("a",'"XXX')
  # Chaque a doit etre un "XXX
  expect_equal(DF1[1,'fus'], '"XXX"XXX')

  # Checking if the 1st element of a is still a factor AND "XXX
  expect_equal(as.character(DF1[1,'a']), '"XXX')
  expect_true(is.factor(DF1[1,'a']), label = 'Format is not respected - factor')

  # Checking if the 1st element of b is still a character AND "XXX
  expect_equal(DF1[1,'b'], '"XXX')
  expect_true(is.character(DF1[1,'b']), label = 'Format is not respected - character')

  # Checking that exact matching works
  DF2 <- dataset %>% replace_pattern("a",'"XXX', exact = TRUE)
  expect_equal(DF2[1,'fus'], 'aa', label = 'Exact matching error')

})
