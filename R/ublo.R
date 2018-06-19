
# borrowed from e.g. dplyr
dots <- function (...){
    eval(substitute(alist(...)))
}

#' peep the pipeline
#'
#' peep some data at one step of a pipeline.
#'
#' @param data some data
#' @param \dots function names or expressions that use \code{.} as a
#'        placeholder for the data
#' @param printer which function use to print
#' @param verbose TRUE to include what is printed
#'
#' @examples
#' if( require(magrittr) ){
#'   # just symbols
#'   iris %>% peep(head,tail) %>% summary
#'   # expressions with .
#'   iris %>% peep(head(., n=2),tail(., n=3) ) %>% summary
#'   # or both
#'   iris %>% peep(head,tail(., n=3) ) %>% summary
#'   # use verbose to see what happens
#'   iris %>% peep(head,tail(., n=3), verbose = TRUE) %>% summary
#' }
#' @return the input data
#' @importFrom lazyeval interp
#' @export
peep <- function(data, ... , printer = print, verbose = FALSE){
  dots <- dots(...)
  for( expr in dots){
    # first deal with symbols, e.g. peep(head,tail) --> peep( head(.), tail(.) )
    if( typeof(expr) == "symbol"){
      expr <- interp( quote(fun(.)) , fun = expr)
    }

    # print what we are peeping
    if( verbose ){
      message(deparse(substitute(expr)))
    }

    # replace . with the data
    expr <- interp(expr, .values = list( . = data) )

    # add the print call
    expr <- interp( quote(printer(expr)), .values = list(expr = expr) )

    # eval
    eval(expr)
  }
  data
}
