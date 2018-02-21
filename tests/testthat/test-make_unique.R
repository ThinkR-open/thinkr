context("make_unique")

## TODO: Rename context
## TODO: Add more tests

test_that("conformtite", {
  expect_is(make_unique(letters), "character")
  vec <- c("a","b","a","c","b","b")
  expect_equal(length(make_unique(vec)), length(vec))
  expect_equal_to_reference(make_unique(vec), "make_unique_vec.test")
})
