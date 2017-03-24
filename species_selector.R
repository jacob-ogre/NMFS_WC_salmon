# BSD_2_clause

species_selector <- function(input, output, session) {
 renderTree({
    list("Chinook Salmon" = structure(
      list(
        "California Coastal" = 3,
        "Central Valley Fall and Late Fall-run" = 4,
        "Central Valley Spring-run" = 5,
        "Deschutes River summer/fall-run" = 6,
        "Lower Columbia River" = 7,
        "Middle Columbia River spring-run" = 7,
        "Oregon Coast" = 8,
        "Puget Sound" = 9,
        "Sacramento River Winter-run" = 10,
        "Snake River Fall-run" = 11,
        "Snake River Spring/Summer-run" = 12,
        "Southern Oregon and Northern California Coast" = 13,
        "Upper Columbia River Spring-run" = 14,
        "Upper Columbia River summer/fall-run" = 15,
        "Upper Klamath-Trinity Rivers" = 16,
        "Upper Willamette River" = 17,
        "Washington Coast" = 18
      ),
      stselected = FALSE
    ),
    "Coho Salmon" = structure(
      list(
        "Coho, Central California Coast" = 19,
        "Coho, Lower Columbia River" = 20,
        "Coho, Olympic Peninsula" = 21,
        "Coho, Oregon Coast" = 22,
        "Coho, Puget Sound/Strait of Georgia" = 23,
        "Coho, Southern Oregon/Northern California" = 24,
        "Coho, Southwest Washington" = 25
      ),
      stselected = FALSE
    ))
  })
}
