#' all_ggplot_to_pptx
#'
#' @param out nom du fichier pptx de sortie
#' @param open booleen doit on ouvrir le ficher en fin de procédure
#' @param png doit on enregistrer des png
#' @param dossier chemin du dossier de creation
#' @import ReporteRs
#' @import ggplot2
#' @return NULL
#' @export
#'
#' @examples
#' \dontrun{
#' all_ggplot_to_pptx()}
all_ggplot_to_pptx <- function(out="tous_les_graphs.pptx",open=TRUE,png=TRUE,dossier="dessin"){
  require(ReporteRs)
  try(dir.create("dessin",recursive = TRUE),silent=TRUE)
  doc <- pptx( title = "title" )
  dim(doc)
  laliste<-ls(envir=.GlobalEnv)
  for ( k in laliste){
    if(is.ggplot(eval(parse(text=k)))){
      doc <- addSlide( doc, slide.layout = "Title and Content" )
      doc <- addPlot( doc, function( ) print( eval(parse(text=k)) ),
                      offx =0    ,offy=0,
                      height = dim(doc)$slide.dim[["height"]],width = dim(doc)$slide.dim[["width"]],
                      vector.graphic = TRUE, editable = TRUE )
      if(png){
        ggsave(eval(parse(text=k)),filename = paste0(dossier,"/",k,".png"),height=15,width=23)

      }
    }
  }

  ReporteRs::writeDoc(doc,file=out)
  if (open){browseURL(out)}
  invisible()
}
