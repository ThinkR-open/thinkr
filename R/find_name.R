#' find pattern in name's dataset
#'
#' @param dataset a data.frame (or list or anything with names parameter)
#' @param pattern pattern we are looking for
#'
#' @return a list with position and value
#' @export
#'
#' @examples
#'
#' find_name(iris,"Sepal")
find_name <- function(dataset,pattern){
  vec<-grep(pattern,names(dataset))
  list(rang=vec,valeur=names(dataset)[vec])
}
