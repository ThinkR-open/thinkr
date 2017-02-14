#' Predicate for full NA vector
#'
#' @description is_full_na test if the vector is full of NA's
#' @param . a vector
#'
#' @return a vector of boolean
#' @export
#'
#' @examples is_full_na(c(NA, NA, NA))

is_full_na <- function(.) {sum(is.na(.), na.rm = TRUE) == length(.)}
