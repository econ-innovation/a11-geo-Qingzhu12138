library(sf)
library(ggplot2)

development_areas <- st_read("development_areas.shp")

enterprises <- read.table("./data/assigment_geo/hefei.txt", header = TRUE, sep = "\t")

enterprises_sf <- st_as_sf(enterprises, coords = c("lng", "lat"), crs = 4326)

enterprises_in_development_areas <- st_intersection(enterprises_sf, development_areas)

ggplot() +
  geom_sf(data = development_areas, fill = "lightblue") +
  geom_sf(data = enterprises_in_development_areas, color = "red", size = 2) +
  labs(title = "Enterprises in development areas of Baoding") +
  theme_minimal()