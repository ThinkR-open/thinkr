#' Get position or excel name of column
#'
#' \code{ncol_to_excel} returns excel column name from a position number. \code{excel_to_ncol} returns excel column position number from a column name. \code{excel_col} returns all excel column name.
#'
#' @param n the column position
#' @param col_name the culumn name
#' 
#' @importFrom assertthat assert_that
#' @importFrom tidyr unite
#'
#' @name excel_names
NULL


#' return excel column name from a position number
#'
#' @rdname excel_names
#'
#' @export
#' @examples
#' ncol_to_excel(35)
#' excel_to_ncol("BF")
#' excel_col()
#' ncol_to_excel(1:6)
#' excel_to_ncol(c('AF', 'AG', 'AH'))
ncol_to_excel<-function(n){
  assert_that(all(is.numeric(n)))
  assert_that(all(round(n) == n))
  excel_col()[n]
}



#' @rdname excel_names
#' @export
excel_to_ncol<-function(col_name){
  assert_that(all(is.character(col_name)))
  assert_that(all(nchar(col_name) > 1 & nchar(col_name) <= 2))
  assert_that(all(unlist(strsplit(col_name, split = "")) %in% LETTERS))
  which(excel_col() %in% col_name)
}


#' @rdname excel_names
#' @export
excel_col <- function(){
  # require(dplyr)
  c(LETTERS,
    expand.grid(LETTERS,LETTERS)[2:1]  %>% tidyr::unite(Var2,Var1,col="col",sep = "") %>% unlist() %>% unname())
}



