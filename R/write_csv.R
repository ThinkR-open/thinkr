#' export a data.frame to csv
#'
#' @param dataset a data.frame
#' @param path the path
#' @param row.names booleen do we have to save the row names
#' @param ... other write.csv parameters
#'
#' @importFrom assertthat assert_that has_extension is.dir is.writeable not_empty
#' @importFrom utils write.csv2
#'
#' @return file name as character
#' @export
#' @encoding UTF-8
#' @examples
#'
#' \dontrun{
#' iris %>% save_as_csv(file.path(tempdir(),'coucou.csv')) %>% browseURL()
#'
#'
#' }
#'
save_as_csv <- function(dataset, path, row.names = FALSE, ...) {

  assert_that(has_extension(path,"csv"))
  assert_that(is.dir(dirname(path)))
  assert_that(is.writeable(dirname(path)))
  assert_that(not_empty(dataset))
  assert_that(is.data.frame(dataset))

  write.csv2(x = dataset, file = path, row.names = row.names, ...)
  invisible(path)
}

