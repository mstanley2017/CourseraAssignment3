library("readr")
library("dplyr")

#' Checking the existance of a file
#'
#' @param filename takes the file name as an input and checks if it exists
#'
#' @return This function either returns a message the filename does not exist if the file name
#'
#'
#'  @examples
#'  fars_read("accident_2013.csv.bz2")
#'  fars_read("accident_2017.csv.bz2")
#'
#'  @importFrom readr read_csv
#'
#' @export
fars_read <- function(filename) {
  if(!file.exists(filename))
    stop("file '", filename, "' does not exist")
  data <- suppressMessages({
    readr::read_csv(filename, progress = FALSE)
  })
  dplyr::tbl_df(data)
}
