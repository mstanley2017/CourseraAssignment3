% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fars_read_years.R
\name{fars_read_years}
\alias{fars_read_years}
\title{The function fars_read_years is used to take the year as an input and create a filename
using make_filename function. The file is then read using the fars_read function. If the year is invalid
it returns an error message}
\usage{
fars_read_years(years)
}
\arguments{
\item{years}{takes a year as input,creates a filename, reads the information, adds a column for year then
subsets the information, validates if there is an error and appropriately displays a warning
message if an error occurs else returns "NULL"}
}
\value{
If an error is generated a warning message "invalid year: " with
   the invalid year information is displayed. If no error is generated it displays "NULL"
}
\description{
The function fars_read_years is used to take the year as an input and create a filename
using make_filename function. The file is then read using the fars_read function. If the year is invalid
it returns an error message
}
\examples{
fars_read_years(2013)
fars_read_years(2014)


}
