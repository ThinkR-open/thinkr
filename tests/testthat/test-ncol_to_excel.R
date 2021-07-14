test_that("ncol_to_excel works properly", {
  expect_equal(ncol_to_excel(35), "AI")
  expect_equal(ncol_to_excel(1:3), LETTERS[1:3])
  expect_error(ncol_to_excel(5.2))
  expect_error(ncol_to_excel("not_a_number"))
  expect_error(ncol_to_excel(TRUE))
})

test_that("excel_to_ncol works properly", {
  expect_equal(excel_to_ncol("BF"), 58)
  expect_equal(excel_to_ncol(c("BF", "BG", "BH")), 58:60)
  expect_error(excel_to_ncol(5))
  expect_error(excel_to_ncol(c("a", "B", "C")))
  expect_error(excel_to_ncol(TRUE))
})
test_that("excel_col works properly", {
  expect_equal(excel_col()[1], "A")
})

