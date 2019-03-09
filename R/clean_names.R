#' clean_names
#'
#' @param dataset a dataframe
#' @param verbose logical
#' @param translit logical remove non ascii character
#'
#' @return a dataframe
#' @encoding UTF-8
#' @export
#'
#' @examples
#' data(iris)
#' clean_names(iris)
#'
clean_names <- function(dataset,
                        verbose = FALSE,
                        translit = TRUE) {
  old <- names(dataset)
  names(dataset) <-
    clean_vec(names(dataset), verbose = FALSE, translit = translit)
  if (verbose)
    print(data.frame(old = old, new = names(dataset)))
  invisible(dataset)
}

#' Clean character vector
#'
#' @param vec character vector to clean
#'
#' @param verbose logical is the function verbose
#' @param unique logical do we have to apply make_unique
#' @param keep_number logical keep number at begining
#' @param translit logical remove non ascii character
#' @param punct logical do you remove punctuation
#'
#' @importFrom magrittr '%>%'
#' @importFrom stringi stri_trans_general
#'
#' @encoding UTF-8
#' @export
clean_vec <- function(vec,
                      verbose = FALSE,
                      unique = TRUE,
                      keep_number = FALSE,
                      translit = TRUE,
                      punct = TRUE) {
  old <- vec
  vec <- tolower(vec)
  if (unique) {
    vec <- make_unique(vec)
  }
  if (translit) {
    vec <- stringi::stri_trans_general(vec, "latin-ascii")
  }
  if (!keep_number) {
    vec <- make.names(vec)
  }
  if (punct) {
    vec <- vec %>%
      gsub(perl = TRUE, "[[:punct:]]+", "_", .)
  }
  vec <- vec %>%
    # gsub(perl = TRUE,"[[:punct:]]+", "_",.) %>% # la ponctuation
    gsub(perl = TRUE, "[[:space:]]+", "_", .) %>% # les espaces
    gsub(perl = TRUE, "^_+", "", .) %>% # les _ au debut
    gsub(perl = TRUE, "_+$", "", .) %>% # les _ a la fin
    gsub(perl = TRUE, "_+", "_", .) %>% # les successions de _
    tolower

  if (!keep_number) {
    vec <- make.names(vec)
  }
  if (unique) {
    vec <- make_unique(vec)
  }

  if (verbose) {
    print(data.frame(old = old, new = vec))
  }
  invisible(vec)

}

#' Clean levels label
#'
#' @param vec a factor
#'
#' @param verbose booleen is the function verbose
#' @param translit booleen remove non ascii character
#' @param punct booleen do you remove punctuation
#'
#' @encoding UTF-8
#' @export
#' @import assertthat

clean_levels<-function(vec,verbose=FALSE,
                       translit=FALSE,
                       punct=FALSE){
  assert_that(is.factor(vec))
  var <- vec
  old <- levels(vec)
  vec <- levels(vec)
  vec<-clean_vec(vec,unique = FALSE,keep_number = TRUE,
                 translit=translit,punct=punct)
  vec <- gsub("_+"," ",vec)
  vec <- gsub("\\s+$","",vec)
  vec <- gsub("\\s$","",vec)
  if (verbose)   print(data.frame(old=old,new=vec))
  levels(var) <- vec
  invisible(var)
}



