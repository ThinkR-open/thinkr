#' return R instruction to create levels
#'
#' @param vec a factor or character vector
#'
#' @return a R instruction
#' @export
#'
#' @examples
#' dput_levels(iris$Species)
#'
dput_levels <- function(vec){
  if (is.factor(vec))  return(dput(levels(vec)))
  if (!is.factor(vec))  return(dput(unique(vec)))
  }
