# BSD_2_clause

source("map_page.R")
source("sidebar_content.R")

header <- dashboardHeader(
  title = "West Coast Salmonids"
)

sidebar <- sidebar_content

#############################################################################
# Define the page(s) with dashboardBody
body <- dashboardBody(
  map_page
)

dashboardPage(header, sidebar, body, skin = "blue")


