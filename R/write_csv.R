#' export a data.frame to csv
#'
#' @param dataset a data.frame
#' @param filename the path
#' @param row.names booleen do we have to save the row names
#' @param ... other write.csv parameters
#'
#' @return file name as character
#' @export
#' @import assertthat
#' @encoding UTF-8
#' @examples
#'
#' \dontrun{
#' iris %>% save_as_csv("output.csv") %>% browseURL()
#'
#'
#' }
#'
save_as_csv <- function(dataset, filename, row.names = FALSE, ...) {
  assert_that(has_extension(filename,"csv"))
  assert_that(is.dir(dirname(filename)))
  assert_that(is.writeable(dirname(filename)))
  assert_that(not_empty(dataset))
  assert_that(is.data.frame(dataset))

  write.csv2(x = dataset, file = filename, row.names = row.names, ...)
  invisible(normalizePath(filename))
}

