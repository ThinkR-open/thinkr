test_that("Output is a vector", {
  expect_true(is.numeric(as_mon_numeric(c(FALSE,0,"0"))))
})

test_that("Output and input has same length", {
  expect_equal(length(c(FALSE,0,"0")), length((as_mon_numeric(c(FALSE,0,"0")))))
})
