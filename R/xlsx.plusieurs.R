#' exporter plusieur data.frame en xlsx
#'
#' @param file chemin du fichier a creer
#' @param ... les differents data.frame a sauvegarder
#' 
#' @return NULL
#' @export
#'
#' @importFrom  XLConnect writeWorksheetToFile
#' @import assertthat
#' @examples
#' data(iris)
#' iris2 <- iris3 <- iris
#' export_as_xlsx(file="out.xlsx",iris,iris2,iris3)


export_as_xlsx <- function(file,...){
  
  
    assert_that(is.character(file))
    assert_that(has_extension(file,"xlsx"))

    objects <- list(...)
    fargs <- as.list(match.call(expand.dots = TRUE))
    objnames <- as.character(fargs)[-c(1, 2)]
    # nobjects <- length(objects)
    # TODO VERIFIER QUE LES OBJETS EXISTENT

    for (i in seq_along(objects)) {
      writeWorksheetToFile(file = file,data=objects[[i]],sheet = objnames[i])
    
    }
    invisible(normalizePath(file))
  }
  
  
