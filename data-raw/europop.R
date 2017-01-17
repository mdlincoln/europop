library(dplyr)
library(tidyr)
library(readr)

# Get filenames of the original tables
pop_files <- list.files("data-raw/extracted/", pattern = "*.csv", full.names = TRUE)

# Map region codes to English names
region_names <- c(
  "1" = "Scandinavia",
  "2" = "England and Wales",
  "3" = "Scotland",
  "4" = "Ireland",
  "5" = "The Netherlands",
  "6" = "Belgium",
  "7" = "Germany",
  "8" = "France",
  "9" = "Switzerland",
  "10" = "Northern Italy",
  "11" = "Central Italy",
  "12" = "Southern Italy",
  "13" = "Spain",
  "14" = "Portugal",
  "15" = "Austria and Czechoslovakia",
  "16" = "Poland"
)

# Read each table and bind together
europop <- lapply(pop_files, function(x) read_csv(x, col_types = "cciiiiiii", na = "UNK")) %>%
  bind_rows() %>%
  # Reshape into long table
  gather(year, population, `1500`:`1800`) %>%
  arrange(year) %>%
  # Set the correct variable types
  mutate(
    year = as.integer(year),
    region = plyr::revalue(Code, region_names)) %>%
  # Set final variables
  select(city = City, region, year, population)

write_csv(europop, path = "data-raw/europop.csv")
devtools::use_data(europop, overwrite = TRUE)

# Read in coordinates file
city_coords <- read_csv("data-raw/city_coords.csv", col_types = "ddc")
devtools::use_data(city_coords, overwrite = TRUE)
