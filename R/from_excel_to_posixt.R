#' transform the excel numeric date format into POSIXct
#'
#' @param vec a vector
#' @param origin a date-time object, or something which can be coerced by as.POSIXct(tz = "GMT") to such an object.
#'
#' @export
#'
from_excel_to_posixt <- function(vec,origin="1904-01-01"){


  as.POSIXct(as_mon_numeric(vec)* (60*60*24)
                  , origin=origin#"1899-12-30"
                  , tz="GMT")

}
