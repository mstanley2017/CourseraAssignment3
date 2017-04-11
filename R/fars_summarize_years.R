library("dplyr")
library("tidyr")
#' The fars_summarize_years function takes a year as an input and summarizes the number of
#' accidents by month within the input year specified
#'
#' @param years takes the years as input and displays a monthwise summary of the number of fatal injuries
#'
#' @return A table displaying a month number and the consolidated number of fatal injuries for
#' each month of the specified year
#'
#' @examples
#' fars_summarize_years(2013)
#' fars_summarize_years(2014)
#'
#'
#' @export
fars_summarize_years <- function(years) {
dat_list <- fars_read_years(years)
dplyr::bind_rows(dat_list) %>%
  dplyr::group_by(year, MONTH) %>%
  dplyr::summarize(n = n()) %>%
  tidyr::spread(year, n)
}
