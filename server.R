# BSD_2_clause

source("server_map_page.R")
# source("species_selector.R")

shinyServer(function(input, output, session) {

  showModal(modalDialog(
    tags$h4("Early draft"),
    tags$p("This is an early draft of an app to access West Coast salmonid data.
           At the moment the tool simply turns on the range maps for different
           species and different runs...they don't turn off yet. The data are
           from the",
      tags$a(href = "http://www.westcoast.fisheries.noaa.gov/maps_data/Species_Maps_Data.html",
             "National Marine Fisheries Service."),
      "We may update the app as needs arise and as time allows."),
    title = "DRAFT",
    size = "s",
    easyClose = TRUE
  ))

  server_map_page(input, output, selected, session)

})
