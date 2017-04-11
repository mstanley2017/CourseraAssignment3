#'  The make_filename function is used to create a filename
#'
#'  @param year Takes the year as an input and creates a filename
#'
#'  @return This function returns a character vector containing the formatted combination of text
#'     and variable values
#'
#'  @examples
#'  make_filename(2013)
#'  make_filename(2014)
#'
#'  @export
    make_filename <- function(year) {
      year <- as.integer(year)
      sprintf("accident_%d.csv.bz2", year)
    }
