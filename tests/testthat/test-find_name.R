test_that("find_name works", {
  expect_equal(find_name(iris,"Sepal"), list(rang = 1:2, valeur = c("Sepal.Length", "Sepal.Width")))
})
