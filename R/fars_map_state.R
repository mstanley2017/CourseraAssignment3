library("maps")
library("graphics")
library("dplyr")
#'The fars_map_state function takes the state number and year as an input and displays a plot
#'of the state with the number of fatalaties mapped as dots at the appropriate location of the
#'incident. To be able to use this function ensure the maps package is installed
#'
#' @param state.num and years Take the statenum and year and displays a map plot of the state for the year specified with the dots for each fatal
#'    injury incident
#'
#' @importFrom graphics points
#'
#'
#' @return This function returns map plot of the state for the year specified with the dots for
#'    each fatal injury incident with the map at their corresponding latitude and longitude of
#'    occurence
#'
#'
#'  @importFrom maps map
#'
#' @examples
#' fars_map_state(1,2013)
#' fars_map_state(4,2013)
#'
#'
#'@export
  fars_map_state <- function(state.num, year) {
    filename <- make_filename(year)
    data <- fars_read(filename)
    state.num <- as.integer(state.num)

    if(!(state.num %in% unique(data$STATE)))
      stop("invalid STATE number: ", state.num)
    data.sub <- dplyr::filter(data, STATE == state.num)
    if(nrow(data.sub) == 0L) {
      message("no accidents to plot")
      return(invisible(NULL))
    }
    is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
    is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
    with(data.sub, {
      maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
                xlim = range(LONGITUD, na.rm = TRUE))
      graphics::points(LONGITUD, LATITUDE, pch = 46)
    })
  }
