#' Historical Population Data for Urban Europe
#'
#' All cities that had a population of at least 10,000 at some point between
#' 1500-1800 are included.
#'
#' @format A data frame with 2653 rows and 4 columns:
#' \describe{
#'  \item{\code{city}}{Character. City name (in native language.)}
#'  \item{\code{region}}{Character. Region that city belongs to. One of the
#'  following: \itemize{
#'  \item Scandinavia
#'  \item England and Wales
#'  \item Scotland
#'  \item Ireland
#'  \item The Netherlands
#'  \item Belgium
#'  \item Germany
#'  \item France
#'  \item Switzerland
#'  \item Northern Italy
#'  \item Central Italy
#'  \item Southern Italy
#'  \item Spain
#'  \item Portugal
#'  \item Austria and Czechoslovakia
#'  \item Poland}}
#'  \item{\code{year}}{Integer.}
#'  \item{\code{population}}{Integer. Population in the thousands. 0 represents
#'  a population under 1,000 (such cities are presented, in De Vries' words,
#'  "for information only").  \code{NA} is used when the population value is
#'  unknown.}
#' }
#'
#' @note This table can be joined to the \link{city_coords} table by the
#'   \code{city} column.
#'
#' @source Jan De Vries, \emph{European Urbanization, 1500-1800} (Cambridge:
#'   Harvard University Press, 1984), Appendix 2. (De Vries' sources for these
#'   numbers are cataloged in Appendix 2.)
"europop"

#' Coodinates of European Cities
#'
#' @format A data frame with 379 rows and 3 columns
#' \describe{
#'  \item{\code{lat}}{Double. Latitude.}
#'  \item{\code{lon}}{Double. Longitude.}
#'  \item{\code{city}}{Character. City name.}
#' }
#' @note This table can be joined to the \link{europop} table by the \code{city}
#'   column.
"city_coords"
