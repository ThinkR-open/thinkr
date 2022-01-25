
test_that("find_names sur Iris", {
  expect_equal(find_name(iris, "Sepal"),
               list(rang = 1:2, valeur = c("Sepal.Length", "Sepal.Width")))

})






