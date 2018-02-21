context("test generaux clean_names")

## TODO: Rename context
## TODO: Add more tests


test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})
test_that("test global iris", {
  expect_equal_to_reference(clean_names(iris,verbose = FALSE),"clean_iris.test")
})


test_that("conformite data.frame", {
  expect_equal(dim(iris), dim(clean_names(iris,verbose = FALSE)))
  iris_clean <- clean_names(iris,verbose = FALSE)
  names(iris)  <- names(iris_clean)<-NULL
  expect_equal(iris, iris_clean)
})
test_that("conformite data.frame", {
  expect_equal(names(clean_names(iris,verbose = FALSE))[3],"petal_length")
})


test_that("caracteres accentues", {
    expect_equal(names(thinkr::clean_names(data.frame( `eeeeeaaai` = 3),verbose = FALSE)),"eeeeeaaai")
    # expect_equal(names(thinkr::clean_names(data.frame( `éèëééäàãï` = 3),verbose = FALSE,translit = TRUE)),"eeeeeaaai")
})



