#' Replace pattern everywhere in a data.frame
#'
#' @param dataset a data.frame
#' @param pattern Pattern to look for.
#' @param replacement A character of replacements.
#' @param exact a boolean if TRUE the whole value need ton match
#' @encoding UTF-8
#' @return a data.frame
#' @export
#'
#' @examples
#' dataset <- data.frame(
#'   col_a = as.factor(letters)[1:7],
#'   col_b = letters[1:7],
#'   col_c = 1:7,
#'   col_d = paste0(letters[1:7], letters[1:7]),
#'   stringsAsFactors = FALSE
#' )
#'
#' # replace pattern
#' replace_pattern(dataset, "a", "XXX-")
#'
#' # With exact matching
#' replace_pattern(dataset, "a", "XXX-", exact = TRUE)
replace_pattern <- function(dataset, pattern, replacement, exact = FALSE) {
  avant <- sapply(dataset, class)
  if (!exact) {
    # anywhere
    out <- data.frame(lapply(dataset, FUN = gsub2, pattern = pattern, replacement = replacement), stringsAsFactors = FALSE)
  } else {
    # correspondance exact avec une case

    # # on passe les facteur en character et on les remet apres
    # avant <- sapply(dataset,class)
    # dataset <- dataset %>% mutate_if(is.factor,as.character)
    # dataset[which(dataset==pattern,arr.ind = TRUE)] <- replacement
    # # on remet les niveau d'avant

    out <- data.frame(lapply(dataset, FUN = gsub2,
                             pattern = paste0("^", pattern, "$"),
                             replacement = replacement), stringsAsFactors = FALSE)
    # out <- out %>% set_col_type(col_type = avant)
  }
  out <- out %>% set_col_type(col_type = avant)
  out
}


#' from tidyr
#' @noRd
col_name <- function(x, default = stop("Please supply column name", call. = FALSE)) {
  if (is.character(x)) {
    return(x)
  }
  if (identical(x, quote(expr = ))) {
    return(default)
  }
  if (is.name(x)) {
    return(as.character(x))
  }
  if (is.null(x)) {
    return(x)
  }
  stop("Invalid column specification", call. = FALSE)
}


#' set a given coltype to each column in a data.frame
#'
#' @param col_type a character vector containing the class to apply
#' @param dataset a data.frame
#' @encoding UTF-8
#' @return a data.frame
#' @export
#' @importFrom dplyr mutate_at
set_col_type <- function(dataset, col_type) {

  # Pour l'instant on ne fait que les facteurs
  to_factor <- names(which(col_type == "factor"))

  if (length(to_factor) > 0) {
    # dataset <- dataset %>% mutate_each_(funs(as.factor),to_factor)
    dataset <- dataset %>% mutate_at(to_factor, .funs = as.factor)
  }
  dataset
}
#' like gsub but keep a factor as factor
#'
#' @param x a vector
#' @param ... les parametres de la fonction gsub
#' @importFrom assertthat is.date
#' @importFrom lubridate is.POSIXt
#' @return a vector
#' @encoding UTF-8
#' @export
#'
gsub2 <- function(x, ...) {
  if (is.numeric(x) | is.date(x) | is.integer(x) | is.POSIXt(x)) {
    return(x)
  }
  if (is.factor(x)) {
    levels(x) <- gsub(x = levels(x), ...)
    return(x)
  }
  gsub(x = x, ...)
}
