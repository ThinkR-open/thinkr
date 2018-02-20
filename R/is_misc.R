#' does this vector only contains 0 and 1
#'
#' @param x a vector
#' @encoding UTF-8
#' @return a boolean
#' @export
#'
#' @examples
#'
#' is.01(c(0,1,0,0,1))
#' is.01(c(0,1,0,0,5))
#'
is.01<-function(x){setequal(sort(unique(as.character(x))),c("0","1"))}

#' does this vector only contains 1 and 2
#'
#' @param x a vector
#'
#' @return a boolean
#' @export
#' @encoding UTF-8
#' @examples
#'
#' is.12(c(1,1,2,1,2))
#' is.12(c(1,1,2,1,5))
#'
is.12<-function(x){setequal(sort(unique(as.character(x))),c("1","2"))}



