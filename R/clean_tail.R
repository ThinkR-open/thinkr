#' clean_tail
#'
#'
#' vire les tail pleine de NA
#' @param dataset un data.frame
#' @encoding UTF-8
#' @return un data.frame
#' @export
#'
clean_tail <- function(dataset){
  dataset[apply(dataset,MARGIN=1,FUN=function(.){sum(is.na(.),na.rm=TRUE)!=ncol(dataset)}),]
 }
