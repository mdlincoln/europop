library(readr)

city_coords <- read_csv("data-raw/city_coords.csv")

devtools::use_data(city_coords, overwrite = TRUE)
