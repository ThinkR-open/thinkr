globalVariables(c(".", "Var2", "Var1"))

#' ThinkR welcome message
#'
#' @return a package startup message
#' @importFrom withr with_preserve_seed
#' @noRd
.onAttach <- function(...) {
    withr::with_preserve_seed({
        if (!interactive() | stats::runif(1) > 0.02) {
            return()
        }

        packageStartupMessage(startupmessage())
    })
}

#' ThinkR message
#'
#' @importFrom cli cat_line
#'
#' @return thinkr message
#' @noRd
startupmessage <- function() {
    cat_line(c(
        "  #################################################################  ",
        " #############################   ####################################  ",
        "####             #   ###   #######    ####   ##   ###    ##       ####",
        "#########   #####   ###   ##   ##     ###   ##   ##   ####   ##   ####",
        "########   #####         ##   ##   #   #   ##       #####       ######"
    ), col = "#f05622")
    cat_line(c(
        "#######   #####   ###   ##   ##   ###     ##   ##   ####   ##   ######",
        "######   #####   ###   ##   ##   ####    ##   ####   ##   ####   #####",
        " #################################################################### ",
        "  ##################################################################  "
    ), col = "#20b8d6")
}