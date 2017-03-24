#' Predicate for charater vector full of figures
#'
#' @description detects if a character vector is only made with figures. Useful when you
#' @param . a vector of character (and eventually NA's)
#'
#' @return a boolean
#' @export
#' @encoding UTF-8
#' @importFrom stringr str_detect
#' @examples
#' is_full_figures(c(NA,"0","25.3"))
#' is_full_figures((c(NA,"0","25_3")))
is_full_figures <- function(.){
  !(sum(str_detect(.,"[[:alpha:]] | ."), na.rm = TRUE) > 1)
}


