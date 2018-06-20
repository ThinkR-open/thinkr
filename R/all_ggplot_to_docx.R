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
#' @importFrom rvg ph_with_vg
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





    if (is.ggplot(
      # eval(envir = lenv,parse(text=k))
      get(k,envir = lenv)
      )){
      # doc <- addSlide( doc, slide.layout = "Title and Content" )
      doc <- doc %>%
        add_slide(layout = "Title and Content", master = "Office Theme") %>%
        ph_with_vg(ggobj = get(k,envir = lenv),type = "body" )

      if(png){
        ggsave(
          # eval(envir = lenv,parse(text=k))
          get(k,envir = lenv)
          ,filename = paste0(folder,"/",k,".png"),height=15,width=23)

      }
    }


    # on gere les ggsurvfit

    if(class(get(k,envir = lenv))[1]=="ggsurvplot"){
      doc <- doc %>%
        add_slide(layout = "Title and Content", master = "Office Theme") %>%
        ph_with_vg( ggobj = get(k,envir = lenv)$plot )



      if(png){
        ggsave(eval(envir = lenv,parse(text=k))$plot,filename = paste0(folder,"/",k,".png"),height=15,width=23)

      }
    }






  }
  print(doc, target = out )
  if (open){browseURL(out)}
  invisible()
}
