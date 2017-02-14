#' clean_tail
#'
#'
#' vire les tail pleine de NA
#' @param dataset un data.frame
#'
#' @return un data.frame
#' @export
#'
clean_tail <- function(dataset){
  dataset[apply(eldata,MARGIN=1,FUN=function(.){sum(is.na(.),na.rm=TRUE)!=ncol(eldata)}),]
 }
