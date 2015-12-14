#' Historical Population Data for Urban Europe
#'
#' All cities that had a population of at least 10,000 at some point between 1500-1800 are included.
#'
#' @format A data frame with 2653 rows and 4 columns:
#' \describe{
#'  \item{\code{city}}{City name (in native language)}
#'  \item{\code{region}}{Region that city belongs to. One of the following: Sacndinavia, England and Wales, Scotland, Ireland, The Netherlands, Belgium, Germany, France, Switzerland, Northern Italy, Central Italy, Southern Italy, Spain, Portugal, Austria and Czechoslovakia, Poland}
#'  \item{\code{year}}{}
#'  \item{\code{population}}{Population in the thousands. 0 represents a population under 1,000, while NA is used when the value is unknown.}
#' }
#' @note This table can be joined to the \link{city_coords} table by the \code{city} column.
#' @source Jan De Vries, \emph{European Urbanization, 1500-1800} (Cambridge: Harvard University Press, 1984), Appendix I.
"europop"

#' Coodinates of European Cities
#'
#' @format A data frame with 379 rows and 3 colums
#' \describe{
#'  \item{\code{lat}}{}
#'  \item{\code{lon}}{}
#'  \item{\code{city}}{City name}
#' }
#' @note This table can be joined to the \link{europop} table by the \code{city} column.
"city_coords"