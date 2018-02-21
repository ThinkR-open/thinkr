#' export many data.frame into one xlsx
#'
#' @param path chemin du fichier a creer
#' @param ... les differents data.frame a sauvegarder
#'
#' @return NULL
#' @export
#'
#' @import  XLConnect
#' @import assertthat
#' @examples
#' data(iris)
#' iris2 <-  iris
#' export_xl(path=file.path(tempdir(),"out.xlsx"),iris,iris2)




export_xl <- function(path,...){

   # browser()
    assert_that(is.character(path))
    assert_that(has_extension(path,"xlsx"))

    objects <- list(...)
    fargs <- as.list(match.call(expand.dots = TRUE))
    objnames <- as.character(fargs)[-c(1, 2)]


    objnames <-     make.unique(substr(objnames,1,29),sep = "_")

    # nobjects <- length(objects)
    # TODO VERIFIER QUE LES OBJETS EXISTENT

    for (i in seq_along(objects)) {

      if (is.data.frame(objects[[i]])){
      writedfToFile(file = path,data=objects[[i]],sheet = make.names(objnames[i]))
      }

      if (is.table(objects[[i]])){
      writeTableToFile(file = path,data=objects[[i]],sheet = make.names(objnames[i]))
      }




      }
    invisible(normalizePath(path))
  }


#' @import XLConnect
writeTableToFile <- function(file,data,sheet){
  assertthat::assert_that(is.table(data))
  wb <- loadWorkbook(file, create = TRUE)

  createSheet(wb, name = sheet)

  writeWorksheet(wb,
                 paste(names(dimnames(data)),collapse = " x "),
                 sheet=sheet ,
                 startRow = 1, startCol = 1,header = TRUE)
  writeWorksheet(wb,
                 data %>% as.data.frame.matrix(),
                 sheet=sheet ,
                 startRow = 4,
                 startCol = 3,
                 header = TRUE,
                 rownames = "")

  saveWorkbook(wb)

}

writedfToFile <- function(file,data,sheet){
  assertthat::assert_that(is.data.frame(data))
  wb <- loadWorkbook(file, create = TRUE)

  createSheet(wb, name = sheet)

  if (!is.null(attr(data,"nom"))){
  writeWorksheet(wb,
                 attr(data,"nom"),
                 sheet=sheet ,
                 startRow = 1, startCol = 1)


    writeWorksheet(wb,
                   data,
                   sheet=sheet ,
                   startRow = 4,
                   startCol = 3,
                   header = TRUE,
                   rownames = "")

  }else{
    writeWorksheet(wb,
                   data =  data,
                   sheet=sheet ,
                   startRow = 1, startCol = 1,header = TRUE)

  }




  saveWorkbook(wb)

}
