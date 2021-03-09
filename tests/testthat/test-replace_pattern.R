# Test dataset
dataset <- data.frame(
  col_a = as.factor(letters)[1:7],
  col_b = letters[1:7],
  col_c = 1:7,
  col_d = paste0(letters[1:7], letters[1:7]),
  stringsAsFactors = FALSE
)

test_that("replace_pattern works", {
  DF1 <- replace_pattern(dataset, "a", '"XXX')
  # Chaque a doit etre un "XXX
  expect_equal(DF1[1, "col_d"], '"XXX"XXX')

  # Checking if the 1st element of a is still a factor AND "XXX
  expect_equal(as.character(DF1[1, "col_a"]), '"XXX')
  expect_true(is.factor(DF1[1, "col_a"]), label = "Format is not respected - factor")

  # Checking if the 1st element of b is still a character AND "XXX
  expect_equal(DF1[1, "col_b"], '"XXX')
  expect_true(is.character(DF1[1, "col_b"]), label = "Format is not respected - character")

  # Checking that exact matching works
  DF2 <- replace_pattern(dataset, "a", '"XXX', exact = TRUE)
  expect_equal(DF2[1, "col_d"], "aa", label = "Exact matching error")
})
