library(sf)
library(ggplot2)

hefei <- read.table("./data/assigment_geo/hefei.txt", header = TRUE, sep = "\t")

hefei_sf <- st_as_sf(hefei, coords = c("lng", "lat"), crs = 4326)

development_area <- st_read("development_area.shp")

companies_in_development_area <- st_intersection(hefei_sf, development_area)
number_of_companies_in_development_area <- nrow(companies_in_development_area)

for (distance in c(1, 3, 5)) {
  buffer <- st_buffer(development_area, dist = distance * 1000) 
  companies_in_buffer <- st_intersection(hefei_sf, buffer)
  number_of_companies_in_buffer <- nrow(companies_in_buffer)
  cat("Number of companies within", distance, "km from development area:", number_of_companies_in_buffer, "\n")
}