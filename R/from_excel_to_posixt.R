#' transform the excel numeric date format into POSIXct
#'
#' @param vec a vector
#'
#' @export
#'
from_excel_to_posixt <- function(vec){


  as.POSIXct(as_mon_numeric(vec)* (60*60*24)
                  , origin="1899-12-30"
                  , tz="GMT")

}
