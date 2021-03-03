test_that("test is likert", {
  expect_equal(is_likert(iris$Species,c("setosa","versicolor","virginica")), TRUE)
  expect_equal(is_likert(iris$Species,c("setosa","versicolor","virginica", "banana")), TRUE)
  expect_equal(is_likert(iris$Species,c("setosa","versicolor")), FALSE)
  expect_equal(is_likert(iris$Species,c("setosa",1)), FALSE)
  expect_error(is_likert(iris$Sepal.Length,c("setosa","versicolor")))
  expect_error(is_likert(iris$Species,c(1,2)))
  expect_message(is_likert(iris$Species,c("setosa","versicolor","virginica", "banana")), "At least one element of lev is not in levels of vec")
})
