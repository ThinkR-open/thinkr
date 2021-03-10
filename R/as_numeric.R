
#' transform a vector into numeric
#'
#' @param vec a vector
#'
#' @return a numeric vector
#' @export
#'@examples
#'as_mon_numeric(c("1","0","1"))

as_mon_numeric<-function(vec){
  assertthat::assert_that(not_empty(vec))
  assertthat::assert_that(is.vector(vec))

  if (is.character(vec)){
    vec<-as.factor(vec)
  }

  if (is.factor(vec)){
    levels(vec)<-gsub("^FALSE$",0,levels(vec))
    levels(vec)<-gsub("^TRUE$",1,levels(vec))
    levels(vec)<-gsub("^F$",0,levels(vec))
    levels(vec)<-gsub("^T$",1,levels(vec))
  }

  if (is.logical(vec)){
    return(as.numeric(vec))
  }

  out<-gsub("%","",vec)
  out<-gsub(" ","",out)
  out <-gsub(",",".",out)
  out <-gsub(";",".",out)
  out<-as.numeric(as.character(out))

  return(out)
}


