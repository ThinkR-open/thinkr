#' renvoie vrai si le vecteur ne contient que des 1 et des 0
#'
#' @param x un vecteur
#' @encoding UTF-8
#' @return
#' @export
#'
#' @examples
is.01<-function(x){setequal(sort(unique(as.character(x))),c("0","1"))}

#' renvoie vrai si le vecteur ne contient que des 1 et des 2
#'
#' @param x
#'
#' @return
#' @export
#' @encoding UTF-8
#' @examples
is.12<-function(x){setequal(sort(unique(as.character(x))),c("1","2"))}
#' indique si la class de l'objet est posixct
#'
#' @param x
#'
#' @return
#' @export
#' @encoding UTF-8
#' @examples
is.pos<-function(x){inherits(x,"POSIXct")}




#' gsub qui conserve le type factor si présent, et qui ne touche pas au numerique
#'
#' @param x un vecteur
#' @param ... les parametres de la fonction gsub
#' @importFrom assertthat is.date
#' @importFrom lubridate is.POSIXt
#' @return
#' @encoding UTF-8
#' @export
#'
gsub2 <- function(x,...){

  if ( is.numeric(x) | is.date(x) | is.integer(x) | is.POSIXt(x)){


    return(x)}
  out <- gsub(x=x,...)
  if (is.factor(x)){ out <- out %>% as.factor()}
  out
}



#' applique le type précisé a chaque colonne d 'un jeu de données
#'
#' @param col_type unv ecteur de chaine de caractere qui contient les différentes class
#' @param dataset
#' @encoding UTF-8
#' @return
#' @export
#' @importFrom dplyr mutate_each_ funs
#' @examples
set_col_type <- function(dataset,col_type){

  # Pour l'instant on ne fait que les facteurs
  to_factor <- names(which(col_type=="factor"))
  dataset %>% mutate_each_(funs(as.factor),to_factor)

}


#' Replace pattern everywhere in a data.frame
#'
#' @param dataset
#' @param pattern
#' @param replacement
#' @param exact
#' @encoding UTF-8
#' @return
#' @export
#'
#' @examples
#' library(dplyr)
#' library(tidyr)
#' dataset <-
#' data.frame(a=as.factor(letters)[1:7],b=letters[1:7],c=1:7,stringsAsFactors = FALSE) %>%
#' unite("fus",a,b,remove=FALSE,sep="")
#' dataset %>% replace_pattern("a",'"XXX') %>% summary()
#'
#'
#'
#'
replace_pattern <- function(dataset,pattern,replacement,exact=FALSE){

  if (!exact){
    # n'importe ou

    out <- data.frame(lapply(dataset,FUN=gsub2,pattern=pattern,replacement=replacement),stringsAsFactors = FALSE)
  } else{
    # correspondance exact avec une case

    # # on passe les facteur en character et on les remet apres
     avant <- sapply(dataset,class)
    # dataset <- dataset %>% mutate_if(is.factor,as.character)
    # dataset[which(dataset==pattern,arr.ind = TRUE)] <- replacement
    # # on remet les niveau d'avant

    out <- data.frame(lapply(dataset,FUN=gsub2,pattern=paste0("^",pattern,"$"),replacement=replacement),stringsAsFactors = FALSE)
    out <- out %>% set_col_type(col_type = avant)
  }
  out
}



#' affiche les info de chaque colonne l'une apres l'autre
#'
#' @param dataset
#'
#' @return
#' @export
#' @encoding UTF-8
#' @examples
summary_each <- function(dataset){
  if (!exists(".compteurdataset")){
    init_summary_each()
    i<-1
  }
  if (.compteurdataset > ncol(dataset)  ){.compteurdataset <<-1}
  i <- .compteurdataset
  message(i," ",class(dataset[,i])," ",names(dataset)[i])
  print(summary(dataset[,i]))

  .compteurdataset <<- i+1
}

#' met a 1 ou n le compteur de summary_each
#'
#' @return
#' @export
#' @encoding UTF-8
#' @examples
init_summary_each <- function(n=1){
  .compteurdataset <<-n
}


#' from tidyr
#'
#' @param x
#' @param default
#'
#' @return
#' @export
#' @encoding UTF-8
#' @examples
col_name <- function (x, default = stop("Please supply column name", call. = FALSE))
{
  if (is.character(x))
    return(x)
  if (identical(x, quote(expr = )))
    return(default)
  if (is.name(x))
    return(as.character(x))
  if (is.null(x))
    return(x)
  stop("Invalid column specification", call. = FALSE)
}
