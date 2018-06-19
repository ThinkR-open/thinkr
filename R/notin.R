#' not in
#'
#' @param x vector or NULL: the values to be matched
#' @param table the values to be matched against
#' @export
#'
#' @examples
#' "a" %ni% letters
#' "coucou" %ni% letters
#'
`%ni%` <- function (x, table) {
  !(match(x, table, nomatch = 0L) > 0L)}


