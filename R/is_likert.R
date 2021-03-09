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
  if (!is.factor(vec)){return(FALSE)}
  !as.logical(sum(!levels(vec) %in% lev))
}
