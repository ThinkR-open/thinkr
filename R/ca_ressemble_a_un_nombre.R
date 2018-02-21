#' return TRUE if this look like a number
#'
#' @param vec a vector
#'
#' @return un booleen
#' @export
#'
look_like_a_number <- function( vec){
  if ( assertthat::is.date(vec)){return(FALSE)}
  sum(is.na(vec)) == sum(is.na(
    suppressWarnings(
      as_mon_numeric(vec)
    )
  ))
}
