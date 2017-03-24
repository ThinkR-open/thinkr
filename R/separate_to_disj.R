#' transform a variable to disjonctif table
#'
#' @param dataset the data.frame
#' @param col the colonne to transform
#' @param sep the separator to split col
#' @param keepNA keep NA instead of FALSE
#'
#' @return a data.frame
#' @export
#' @encoding UTF-8
#' @examples
#' exemple <- data.frame(X=6:10,A=c("a, c, b",'c,b',NA,'a','b'),B=1:5)
#' separate_to_disj(exemple,A,sep=",")
#' separate_to_disj_(exemple,"A",sep=",")
#'
#'
separate_to_disj <- function(dataset,col,sep=",",keepNA=FALSE){
  col <- col_name(substitute(col))
  separate_to_disj_(dataset=dataset,col=col,sep=sep,keepNA=keepNA)
}

#' transform a variable to disjonctif table
#'
#' @param dataset the data.frame
#' @param col the colonne to transform
#' @param sep the separator to split col
#' @param keepNA keep NA instead of FALSE
#'
#' @return a data.frame
#' @export
#' @importFrom magrittr %>%
#' @importFrom tidyr separate_
#' @examples
separate_to_disj_ <- function(dataset,col,sep=",",keepNA=FALSE){
  # on compte toutes les combi possible
  # dataset[[col]] %>% as.character() %>% str_split(",")
  les_modalites <- dataset[[col]] %>%   find_all_modality()
  message(paste(les_modalites,"/ "))
  # chaque ligne va etre une successiond e oui/non en fonction
  dataset[[col]] <- dataset[[col]] %>%
    as.character() %>%
    str_split(",") %>% sapply(str_trim)%>%
    sapply(FUN = answer_to_truefalse,les_modalites=les_modalites,sep=sep,keepNA=keepNA)

  # answer_to_truefalse("a",les_modalites=les_modalites,sep=sep,keepNA = TRUE)
  # answer_to_truefalse(NA,les_modalites=les_modalites,sep=sep,keepNA = TRUE)
  #
  # answer_to_truefalse("a",les_modalites=les_modalites,sep=sep,keepNA = FALSE)
  # answer_to_truefalse(NA,les_modalites=les_modalites,sep=sep,keepNA = FALSE)
  new_col <- paste(col,les_modalites,sep="_") %>% clean_vec()

  dataset %>%
    separate_(col = col,into=new_col,sep=sep) %>%
    mutate_each_(funs(as.factor),new_col)
}

#' retourne un vecteur de caractere sous forme de TRUE/FALSE/FALSE en fonction de la présen de modalite dnas la reposne. en respectant l'ordre des modalité
#'
#' @param vec a vector
#' @param les_modalites the modality to find
#' @param sep the searator to use
#'
#' @return a vector
#' @export
#' @importFrom magrittr %>%
#' @examples
#' exemple <- data.frame(X=6:10,A=c("a,c,b",'c,b',NA,'a','b'),B=1:5)
#' answer_to_truefalse(c("a","c"),find_all_modality(exemple$A))
#'
#'
answer_to_truefalse <-
  function(vec,
           les_modalites,
           sep = ",",
           keepNA = FALSE) {
    if (keepNA & any(is.na(vec))) {
      # out <- rep(NA, length(les_modalites)) %>% paste(collapse = sep)
      out <- NA
    } else{
      out <- (les_modalites %in% vec) %>% paste(collapse = sep)
    }

    out


  }



#' renvoie les modalites de réponses possibles d'un QCM contenu dans une seule case
#'
#' @param vec a factor or character vector
#'
#' @export
#' @importFrom magrittr %>%
#' @importFrom stats na.omit
#' @importFrom stringr str_split str_trim
#' @examples
#'
#' exemple <- data.frame(X=6:10,A=c("a,c,b",'c,b',NA,'a','b'),B=1:5)
#' find_all_modality(exemple$A)
#'
#'
find_all_modality <- function(vec,sep=","){

  if (is.factor(vec)){vec <- vec %>%  levels()}

  vec%>%
    str_split(sep) %>%
    unlist() %>%
    na.omit() %>% str_trim() %>%
    unique()
    # %>%
    #   sort() # a voir pour virer le sort
}
