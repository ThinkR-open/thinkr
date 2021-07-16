test_that("Output is a vector and numeric", {
  expect_true(is.vector(as_mon_numeric(c(FALSE, 0, "0"))))
  expect_true(is.numeric(as_mon_numeric(c(FALSE, 0, "0"))))
  expect_true(is.numeric(as_mon_numeric(c("1.3", "1,5", "1;6", "16%", "17 87 "))))
  expect_equal(as_mon_numeric(c("1.3", "1,5", "1;6", "16%", "17 87 ")),
               c(1.3, 1.5, 1.6, 16, 1787))
  expect_equal(as_mon_numeric(c(TRUE, "A", "F")), c(1, NA, 0))
  expect_equal(as_mon_numeric(c(TRUE, T, F)), c(1, 1, 0))
  expect_true(all(is.na(as_mon_numeric(factor(c("toto", "tata", "toto"))))))
})

test_that("Output and input has same length", {
  expect_equal(length(c(FALSE, 0, "0")), length((as_mon_numeric(c(FALSE, 0, "0")))))
})
