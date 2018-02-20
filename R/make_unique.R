#' make.unique improvement
#'
#' @param vec a vector
#' @param sep char  separator to use
#'
#' @return a vector
#' @export
#' @encoding UTF-8
#' @importFrom stats ave
#' @examples
#'
#' make_unique(c("a","a","a","b","a","b","c"))
#'
make_unique <- function(vec, sep = "_") {
  vec[is.na(vec)] <- "NA"
  cs <- ave(vec == vec, vec, FUN = cumsum)
  vec[cs > 1] <- paste(vec[cs > 1], cs[cs > 1], sep = sep)
  vec
}

