#' delete .test file in testthat folder
#'
#' Only usefull during package developpement using testthat package
#' @export
#' @importFrom devtools package_file
#'
.efface_test <-function(){
  liste_a_effacer <-   normalizePath(list.files(path=file.path(devtools::package_file(),"tests","testthat"),pattern = "*.test$",full.names = TRUE))
  lapply(liste_a_effacer,message)
  file.remove(liste_a_effacer)

}
