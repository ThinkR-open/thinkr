
#' clean_names
#'
#' @param dataset a dataframe
#' @param verbose boolean
#'
#' @return a dataframe
#' @encoding UTF-8
#' @export
#'
#' @examples
#' data(iris)
#' clean_names(iris)
#'
clean_names<-function(dataset,verbose=TRUE,translit=TRUE){
  old <- names(dataset)
  names(dataset)<-clean_vec(names(dataset),verbose=FALSE,translit=translit)
   if (verbose)   message(data.frame(old=old,new=names(dataset)))
  invisible(dataset)

}

#' Clean character vector
#'
#' @param vec character vector to clean
#'
#' @param verbose booleen is the function verbose
#' @param unique booleen do we have to apply make_unique
#' @param keep_number booleen keep number at begining
#' @param translit booleen remove non ascii character
#'
#' @import magrittr
#'
#' @encoding UTF-8
#' @export
clean_vec<-function(vec,verbose=TRUE,
                    unique=TRUE,keep_number=FALSE,
                    translit=TRUE
                    ){

  old <- vec
  vec<-tolower(vec)
  if(unique){  vec<-make_unique(vec) }
  if (!keep_number){  vec<-make.names(vec) }

if ( translit){ vec <- iconv(to="ASCII//TRANSLIT",vec)}

  vec <- vec %>%
  gsub(perl = TRUE,"[[:punct:]]+", "_",.) %>% # la ponctuation
    gsub(perl = TRUE,"[[:space:]]+", "_",.) %>% # les espaces
    gsub(perl = TRUE,"^_+","",.) %>% # les _ au debut
    gsub(perl = TRUE,"_+$","",.) %>% # les _ à la fin
    gsub(perl = TRUE,"_+","_",.)%>% # les successions de _
    tolower

  if (!keep_number){  vec<-make.names(vec) }
  if(unique){  vec<-make_unique(vec) }

  if (verbose){  message(data.frame(old=old,new=vec))}
  invisible(vec)

}

#' Clean levels label
#'
#' @param vec a factor
#'
#' @param verbose
#'
#' @encoding UTF-8
#' @export
#' @import assertthat

clean_levels<-function(vec,verbose=TRUE){
  assert_that(is.factor(vec))
  var <- vec
  old <- levels(vec)
  vec <- levels(vec)
  vec<-clean_vec(vec,unique = FALSE,keep_number = TRUE)
  vec <- gsub("_+"," ",vec)
  vec <- gsub("\\s+$","",vec)
  vec <- gsub("\\s$","",vec)
  if (verbose)   message(data.frame(old=old,new=vec))
  levels(var) <- vec
  invisible(var)
}



