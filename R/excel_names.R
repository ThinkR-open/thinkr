#' return excel column name from a position number
#'
#' @param n the colum position
#'
#' @export
#'
#' @examples
#' ncol_to_excel(35)
ncol_to_excel<-function(n){
  excel_col()[n]
}


#' return excel column position number from a column name
#'
#' @param col_name the culum name
#'
#' @export
#'
#' @examples
#' excel_to_ncol("BF")
excel_to_ncol<-function(col_name){
  which(excel_col() %in% col_name)
}




#' return all excel column name
#'
#' @export
#' @importFrom tidyr unite
#' @importFrom magrittr %>%
#' @examples
#' excel_col()
#' ncol_to_excel(6)
#' excel_to_ncol('AF')
excel_col <- function(){
  # require(dplyr)
  c(LETTERS,
    expand.grid(LETTERS,LETTERS)[2:1]  %>% tidyr::unite(Var2,Var1,col="col",sep = "") %>% unlist() %>% unname())
}


