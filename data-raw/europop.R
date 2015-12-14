library(plyr)
library(dplyr)
library(tidyr)
library(readr)

pop_files <- list.files("data-raw/extracted/", pattern = "*.csv", full.names = TRUE)

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

europop <- lapply(pop_files, function(x) read_csv(x, col_types = "cciiiiiii", na = "UNK")) %>%
  bind_rows() %>%
  gather(year, population, `1500`:`1800`) %>%
  arrange(year) %>%
  mutate(
    year = as.integer(as.character(year)),
    Code = revalue(Code, region_names),
    population = population) %>%
  select(city = City, region = Code, year, population)

write_csv(europop, path = "data-raw/europop.csv")
devtools::use_data(europop, overwrite = TRUE)
