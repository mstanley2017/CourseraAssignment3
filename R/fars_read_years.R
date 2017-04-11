library("dplyr")
#' The function fars_read_years is used to take the year as an input and create a filename
#' using make_filename function. The file is then read using the fars_read function. If the year is invalid
#' it returns an error message
#'
#' @param years takes a year as input,creates a filename, reads the information, adds a column for year then
#'    subsets the information, validates if there is an error and appropriately displays a warning
#'    message if an error occurs else returns "NULL"
#'
#'
#' @return If an error is generated a warning message "invalid year: " with
#'    the invalid year information is displayed. If no error is generated it displays "NULL"
#'
#' @examples
#' fars_read_years(2013)
#' fars_read_years(2014)
#'
#'
#' @export
fars_read_years <- function(years) {
  lapply(years, function(year) {
    file <- make_filename(year)
    tryCatch({
      dat <- fars_read(file)
      dplyr::mutate(dat, year = year) %>%
        dplyr::select(MONTH, year)
    }, error = function(e) {
      warning("invalid year: ", year)
      return(NULL)
    })
  })
}
