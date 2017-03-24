# BSD_2_clause

server_map_page <- function(input, output, selected, session) {

  cols <- substr(viridis(10), 0, 7)

  cur_zoom <- reactive({
    ifelse(!is.null(input$map_zoom), input$map_zoom, 5)
  })

  output$map <- renderLeaflet({
    cur_map <- leaflet() %>%
      setView(lng=-120, lat=38, zoom = 5) %>%
      # addProviderTiles(input$map_tile) # %>%
      mapOptions(zoomToLimits = "never")
    return(cur_map)
  })

  # proxy to add/change the basemap
  observe({
    leafletProxy("map") %>%
      clearTiles() %>%
      addProviderTiles(input$map_tile)
  })

  load_shp <- function(f, obj) {
    cur_shp <- try(readOGR(f))
    if(class(cur_shp) != "try-error") {
      if("Class" %in% names(cur_shp@data)) {
        msg <- cur_shp@data$Class
      } else if("CLASS" %in% names(cur_shp@data)) {
        msg <- cur_shp@data$CLASS
      } else {
        msg <- NA
      }
    } else {
      print(cur_shp)
    }
    assign(obj, cur_shp, envir = .GlobalEnv)
    leafletProxy("map") %>%
      addPolygons(
        data = get(obj),
        color = "#fff",
        weight = 1,
        fillColor = sample(cols, 1),
        fillOpacity = 0.7,
        popup = ~msg
      )
  }

  chnks <- reactive({ input$chinook })
  chums <- reactive({ input$chum })
  cohos <- reactive({ input$coho })
  pinks <- reactive({ input$pink })
  socks <- reactive({ input$sockeye })
  steel <- reactive({ input$steelhead })

  # Add chinook layers
  observe({
    if(!is.null(chnks())) {
      CKs <- chnks()
      CKshp <- paste0("data/chinook_salmon/", CKs)
      objs <- gsub(CKs, pattern = ".shp", replacement = "")
      for(i in 1:length(objs)) {
        if(!exists(objs[i])) {
          load_shp(CKshp[i], objs[i])
        }
      }
    }
  })

  # Add Chums
  observe({
    if(!is.null(chums())) {
      CHs <- chums()
      CHshp <- paste0("data/chum_salmon/", CHs)
      objs <- gsub(CHs, pattern = ".shp", replacement = "")
      for(i in 1:length(objs)) {
        if(!exists(objs[i])) {
          load_shp(CHshp[i], objs[i])
        }
      }
    }
  })

  # Add Cohos
  observe({
    if(!is.null(cohos())) {
      COs <- cohos()
      COshp <- paste0("data/coho_salmon/", COs)
      objs <- gsub(COs, pattern = ".shp", replacement = "")
      for(i in 1:length(objs)) {
        if(!exists(objs[i])) {
          load_shp(COshp[i], objs[i])
        }
      }
    }
  })

  # Add Pinks
  observe({
    if(!is.null(pinks())) {
      PIs <- pinks()
      PIshp <- paste0("data/pink_salmon/", PIs)
      objs <- gsub(PIs, pattern = ".shp", replacement = "")
      for(i in 1:length(objs)) {
        if(!exists(objs[i])) {
          load_shp(PIshp[i], objs[i])
        }
      }
    }
  })

  # Add sockeye
  observe({
    if(!is.null(socks())) {
      SOs <- socks()
      SOshp <- paste0("data/sockeye_salmon/", SOs)
      objs <- gsub(SOs, pattern = ".shp", replacement = "")
      for(i in 1:length(objs)) {
        if(!exists(objs[i])) {
          load_shp(SOshp[i], objs[i])
        }
      }
    }
  })

  # Add steelhead
  observe({
    if(!is.null(steel())) {
      STs <- steel()
      STshp <- paste0("data/steelhead_salmon/", STs)
      objs <- gsub(STs, pattern = ".shp", replacement = "")
      for(i in 1:length(objs)) {
        if(!exists(objs[i])) {
          load_shp(STshp[i], objs[i])
        }
      }
    }
  })


#
  # # proxy to add/change topoJSON, with line color dependent on basemap
  # observe({
  #   cur_col <- ifelse(input$map_tile == "Stamen.TonerLite" |
  #             input$map_tile == "Stamen.Toner" |
  #             input$map_tile == "OpenStreetMap.Mapnik",
  #           "#ffcc00",
  #           "#000000")
  #   leafletProxy("map") %>%
  #   addTopoJSON(topoData,
  #         weight = 0.5,
  #         color = cur_col,
  #         fill = FALSE)
  # })

  # # proxy to add/change plotted circles, with size/fill dependent on selection
  # observe({
  #   if (input$circ_rep == "sep") {
  #   circle_size <- circ_1()$scaled_nspp
  #   circle_color <- circ_1()$tot_exp
  #   } else {
  #   circle_size <- log(scale(circ_1()$exp_per_sp, center=F)) * 100000 * 1/cur_zoom()
  #   circle_color <- circ_1()$exp_per_sp
  #   }
  #   # print(circle_size)
  #   # print(circle_color)
  #   ifelse(input$species == "All",
  #      leafletProxy("map", data=circ_1()) %>%
  #        clearShapes() %>%
  #        addCircles(lng = ~INTPTLON,
  #             lat = ~INTPTLAT,
  #             radius = ~circle_size,
  #             color = ~colorBin("RdYlBu",
  #                     range(circle_color),
  #                     bins=5)(circle_color),
  #             fillOpacity=0.85,
  #             stroke = FALSE,
  #             popup = ~paste0("<b>", NAME, " Co.</b><br>",
  #                     make_dollars(circ_1()$tot_exp),
  #                     "<br>", n_spp, " species<br>")
  #        ),
  #      leafletProxy("map", data=circ_1()) %>%
  #        clearShapes() %>%
  #        addCircles(lng = ~INTPTLON,
  #             lat = ~INTPTLAT,
  #             radius = ~circle_size,
  #             color = "#1a9641",
  #             fillOpacity=0.85,
  #             stroke = FALSE,
  #             popup = ~paste0("<b>", NAME, " Co.</b><br>",
  #                     make_dollars(circ_1()$tot_exp),
  #                     "<br>", n_spp, " species<br>")
  #        )
  #   )
  # })

  # # proxy to add/change the legend, conditioned on viz selection
  # observe({
  #   if (input$circ_rep == "sep") {
  #     circle_color <- circ_1()$tot_exp
  #     title <- "<p style='text-align:center;'>Est. expenditures<br>(&times; 1,000)</p>"
  #   } else {
  #     circle_color <- circ_1()$exp_per_sp
  #     title <- "<p style='text-align:center;'>Est. per-species expend.<br>(&times; 1,000)</p>"
  #   }
  #   leafletProxy("map", data=circ_1()) %>%
  #     clearControls() %>%
  #     addLegend("bottomleft",
  #           pal=colorBin("RdYlBu",
  #                range(circle_color),
  #                bins=5),
  #           values=circ_1()$tot_exp,
  #           title=title,
  #           labFormat=labelFormat(prefix="$",
  #             transform=function(x) {return(x / 1000) }),
  #           opacity=1)
  # })


  }

