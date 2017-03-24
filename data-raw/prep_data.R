# BSD_2_clause

library(geojsonio)

setwd("./data-raw")
zips <- list.files(".", pattern = ".zip", full.names = TRUE)
unzip2 <- function(z) {
  dir <- gsub(z, pattern = ".zip", replacement = "")
  unzip(zipfile = z, exdir = dir)
}
unzipped <- sapply(zips, unzip2)

shps <- list.files(".", recursive = TRUE, pattern = ".shp$", full.names = TRUE)
shps

read_shps <- function(f) {
  name <- gsub(basename(f), pattern = ".shp", replacement = "")
  cur <- rgdal::readOGR(f)
  assign(name, cur, envir = .GlobalEnv)
  return(name)
}
shppd <- sapply(shps[c(1,2,18,39)], read_shps)

leaflet(get(shppd[1])) %>%
  addProviderTiles("Stamen.Toner") %>%
  addPolygons(color = "#000", weight = 1, fillColor = "red") %>%
  addPolygons(data = get(shppd[2]), color="#000", weight = 1, fillColor = "blue") %>%
  addPolygons(data = get(shppd[3]), color="#000", weight = 1, fillColor = "green") %>%
  addPolygons(data = get(shppd[4]), color="#000", weight = 1, fillColor = "black")


