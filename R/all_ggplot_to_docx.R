#' Save all ggplot in a pptx
#'
#' @param out output file name
#' @param open booleen open file after creation
#' @param png booleen also save as png
#' @param global booleen use .GlobalEnv
#' @param folder png's folder
#'
#' @importFrom  officer read_pptx ph_with_gg add_slide
#' @import ggplot2
#' @import assertthat
#' @return NULL
#' @encoding UTF-8
#' @export
#' @importFrom utils browseURL
#'
#' @examples
#' \dontrun{
#' all_ggplot_to_pptx()}
all_ggplot_to_pptx <- function(out="tous_les_graphs.pptx",open=TRUE,png=TRUE,folder="dessin",global=TRUE){
  assertthat::assert_that(has_extension(out,"pptx"))
  try(dir.create(folder,recursive = TRUE),silent=TRUE)
  # doc <- pptx( title = "title" )
  doc <- read_pptx()
  if (global){
    lenv<- .GlobalEnv}else{
      lenv<- parent.frame()

    }
  laliste<-ls(envir=lenv)

  for ( k in laliste){





    if (is.ggplot(eval(envir = lenv,parse(text=k)))){
      # doc <- addSlide( doc, slide.layout = "Title and Content" )
      doc <- doc %>%
        add_slide(layout = "Title and Content", master = "Office Theme")
      doc <- ph_with_gg(doc, value = eval(envir = lenv,parse(text=k)) )
      # doc <-  ph_with_vg(doc, value = print(eval(envir = lenv,parse(text=k))),type = "body" )
      # doc <-  ph_with_vg(doc, value = eval(envir = lenv,parse(text=k)),type = "body" )
      # doc <- addPlot( doc, function( ) print( eval(envir = lenv,parse(text=k)) ),
      #                 offx =0    ,offy=0,
      #                 height = dim(doc)$slide.dim[["height"]],width = dim(doc)$slide.dim[["width"]],
      #                 vector.graphic = TRUE, editable = TRUE )
      if(png){
        ggsave(eval(envir = lenv,parse(text=k)),filename = paste0(folder,"/",k,".png"),height=15,width=23)

      }
    }


    # on gere les ggsurvfit

    if(class(eval(envir = lenv,parse(text=k)))[1]=="ggsurvplot"){
      doc <- doc %>%
        add_slide(layout = "Title and Content", master = "Office Theme")
      doc <- ph_with_gg(doc, value = eval(envir = lenv,parse(text=k))$plot )



      if(png){
        ggsave(eval(envir = lenv,parse(text=k))$plot,filename = paste0(folder,"/",k,".png"),height=15,width=23)

      }
    }






  }
  print(doc, target = out )
  if (open){browseURL(out)}
  invisible()
}
