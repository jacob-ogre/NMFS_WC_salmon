# BSD_2_clause

sidebar_content <- {
  dashboardSidebar(
    collapsed = FALSE,
    sidebarMenu(
      id = "sb1",
      h4("Range Maps"),
      menuItem(
        "Chinook Salmon",
        checkboxGroupInput(
          "chinook",
          label = NULL,
          choices = c(
            "CA Coastal" = "CKCAC.shp",
            "CV Fall and Late Fall-run" = "CKCVF.shp",
            "CV Spring-run" = "CKCVS.shp",
            "Deschutes R. summer/fall-run" = "CKDRF.shp",
            "Lower Columbia R." = "CKLCR.shp",
            "Middle Columbia R. spring-run" = "CKMCS.shp",
            "OR Coast" = "CKORC.shp",
            "Puget Sound" = "CKPUG.shp",
            "Sacramento R. Winter-run" = "CKSAC.shp",
            "Snake R. Fall-run" = "CKSRF.shp",
            "Snake R. Spring/Summer-run" = "CKSRS",
            # "Southern OR and Northern CA Coast" = 13,
            "Upper Columbia R. Spring-run" = "CKUCS.shp",
            "Upper Columbia R. summer/fall-run" = "CKUCF.shp",
            "Upper Klamath-Trinity R.s" = "CKUKT.shp",
            "Upper Willamette R." = "CKUWR.shp",
            "Washington Coast" = "CKWAC.shp"
          )
        )
      ),

      menuItem(
        "Chum Salmon",
        checkboxGroupInput(
          "chum",
          label = NULL,
          choices = c(
            "Columbia River" = "CMCOL.shp",
            "Hood Canal Summer-run" = "CMHCS.shp",
            "Pacific Coast" = "CMPAC.shp",
            "Puget Sound/Strait of Georgia" = "CMPUG.shp"
          )
        )
      ),

      menuItem(
        "Coho Salmon",
        checkboxGroupInput(
          "coho",
          label = NULL,
          choices = c(
            "Central CA Coast" = "COCCA.shp",
            "Lower Columbia R." = "COLCR.shp",
            "Olympic Peninsula" = "COOLY.shp",
            "Oregon Coast" = "COORC.shp",
            "Puget Sound/Strait of Georgia" = "COPUG.shp",
            "Southern OR/Northern CA" = "COSNC.shp",
            "Southwest WA" = "COSWW.shp"
          )
        )
      ),

      menuItem(
        "Pink Salmon",
        checkboxGroupInput(
          "pink",
          label = NULL,
          choices = c(
            "Even-year" = "PIEVN.shp",
            "Odd-year" = "PIODD.shp"
          )
        )
      ),

      menuItem(
        "Sockeye Salmon",
        checkboxGroupInput(
          "sockeye",
          label = NULL,
          choices = c(
            "Baker River" = "SOBKR.shp",
            "Lake Pleasant" = "SOLPT.shp",
            "Lake Wenatchee" = "SOLWN.shp",
            "Okanogan River" = "SOOKR.shp",
            "Ozette Lake" = "SOOZT.shp",
            "Quinault Lake" = "SOQTL.shp",
            "Snake River" = "SOSNR.shp"
          )
        )
      ),

      menuItem(
        "Steelhead Salmon",
        checkboxGroupInput(
          "steelhead",
          label = NULL,
          choices = c(
            "CA Central Valley" = "STCCV.shp",
            "Central CA Coast" = "STCCC.shp",
            "Klamath Mts. Province" = "STKMP.shp",
            "Lower Columbia R." = "STLCR.shp",
            "Middle Columbia R." = "STMCR.shp",
            "Olympic Peninsula" = "STOLY.shp",
            "OR Coast" = "STORC.shp",
            "Puget Sound" = "STPUG.shp",
            "Snake R. Basin" = "STSNR.shp",
            "South Central CA Coast" = "STSCC.shp",
            "Southern CA" = "STSCA.shp",
            "Southwest WA" = "STSWW.shp",
            "Upper Columbia R." = "STUCR.shp",
            "Upper Willamette R." = "STUWR.shp"
          )
        )
      ),

      hr(),
      menuItem(
        "Basemap",
        radioButtons(
          inputId = "map_tile",
          label = NULL,
          choices = c(
            "Stamen toner light" = "Stamen.TonerLite",
            "Stamen toner dark" = "Stamen.Toner",
            "Stamen terrain" = "Stamen.Terrain",
            "Stamen watercolor" = "Stamen.Watercolor",
            "OpenStreetMap Mapnik" = "OpenStreetMap.Mapnik",
            "CartoDB Positron" = "CartoDB.Positron",
            "OpenMapSurfer" = "OpenMapSurfer.Roads"),
          width = "95%"
        )
      )
    )
  )
}
