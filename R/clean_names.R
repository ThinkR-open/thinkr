
#' clean_names
#'
#' @param dataset a dataframe
#' @param verbose boolean
#'
#' @return a dataframe
#' @export
#'
#' @examples
#' data(iris)
#' clean_names(iris)
#'
clean_names<-function(dataset,verbose=TRUE){
  old <- names(dataset)
  names(dataset)<-clean_vec(names(dataset))
   if (verbose)   print(data.frame(old=old,new=names(dataset)))
  invisible(dataset)

}


#' @export
clean_vec<-function(vec,verbose=TRUE,unique=TRUE,keep_number=FALSE){
  old <- vec
  vec<-tolower(vec)
  if(unique){  vec<-make.unique(vec) }
  if (!keep_number){  vec<-make.names(vec) }
  vec<-gsub("\\.\\.",".",vec)
  vec<-gsub("\\.\\.",".",vec)
  vec<-gsub("^X.","",vec)
  vec<-gsub("\\.","_",vec)
  vec<-gsub("_+","_",vec)
  vec<-gsub("_$","",vec)
  vec <- gsub("\\s+"," ",vec)
  vec <- gsub("\\s+$","",vec)
  vec <- gsub("\\s$","",vec)
  vec<-tolower(vec)
  if (!keep_number){  vec<-make.names(vec) }
  vec<-tolower(vec)
  if(unique){  vec<-make.unique(vec) }

  if (verbose)   print(data.frame(old=old,new=vec))
  invisible(vec)

}

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
  if (verbose)   print(data.frame(old=old,new=vec))
  levels(var) <- vec
  invisible(var)
}

