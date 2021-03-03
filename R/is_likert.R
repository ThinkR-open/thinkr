#' is a factor a likert scale
#'
#' @param vec a factor
#' @param lev le scale
#'
#' @return boolean
#' @export
#'
#' @examples
#' is_likert(iris$Species,c("setosa","versicolor","virginica"))
#' is_likert(iris$Species,c("setosa","versicolor","virginica","banana"))
#' is_likert(iris$Species,c("setosa","versicolor"))
#'
is_likert <- function(vec,lev){
  assertthat::assert_that(is.factor(vec)|is.character(vec))
  assertthat::assert_that(all(is.character(lev)))

  if (!is.factor(vec)){return(FALSE)}
  # Send message if a level is unused in factors levels
  if (any(!lev %in% levels(vec))) {
    message(paste("At least one element of lev is not in levels of vec"))
  }
  !as.logical(sum(!levels(vec) %in% lev))
}
