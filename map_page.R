# BSD_2_clause

map_page <- {
  tabPanel(
    title="Map",
    tags$head(
      tags$link(
        href='https://fonts.googleapis.com/css?family=Open+Sans:300,400',
        rel='stylesheet',
        type='text/css'
      ),
      tags$link(
        href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css',
        rel='stylesheet'
      ),
      includeCSS("custom_styles.css") #,
      # includeScript("www/gomap.js"),
      # includeScript("www/leaflet.zoomhome.js")
    ),
    # tags$style(type="text/css", "body {padding-top: 80px;}"),
    div(class = "mapper",
      leafletOutput("map", height="1000px")
    )
  )

}
