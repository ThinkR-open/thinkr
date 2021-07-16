#' Transform a vector into numeric if meaningful, even with bad decimal, space or \%
#'
#' @param vec a vector
#'
#' @return a numeric vector
#' @details Note that text and factors are not transformed as numeric (except FALSE, TRUE, F, T),
#' contrary to R default behavior with `as.numeric(factor())`
#' @importFrom methods is
#' @export
#' @examples
#' as_mon_numeric(c("1", "0", "1"))
#' as_mon_numeric(c("1.3", "1,5", "1;6", "16%", "17 87 "))
#' as_mon_numeric(c(TRUE, "A", "F"))
#' as_mon_numeric(c(TRUE, TRUE, FALSE))
#' as_mon_numeric(factor(c("toto", "tata", "toto")))
as_mon_numeric <- function(vec) {
  assertthat::assert_that(not_empty(vec))
  assertthat::assert_that("vector" %in% is(vec))

  if (is.character(vec)) {
    vec <- as.factor(vec)
  }

  if (is.factor(vec)) {
    levels(vec) <- gsub("^FALSE$", 0, levels(vec))
    levels(vec) <- gsub("^TRUE$", 1, levels(vec))
    levels(vec) <- gsub("^F$", 0, levels(vec))
    levels(vec) <- gsub("^T$", 1, levels(vec))
  }

  if (is.logical(vec)) {
    return(as.numeric(vec))
  }

  out <- gsub("%", "", vec)
  out <- gsub(" ", "", out)
  out <- gsub(",", ".", out)
  out <- gsub(";", ".", out)
  out <- as.numeric(as.character(out))

  return(out)
}
