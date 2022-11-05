library(shiny)
library(r2d3)

monsters_caught <- readr::read_csv("data/monsters_caught.csv")


ui <- fluidPage(
  d3Output("d3")
)

server <- function(input, output) {
  output$d3 <- renderD3({
    r2d3(data = monsters_caught,
         script = "www/scoob.js",
         d3_version = "5")
  })
}

shinyApp(ui = ui, server = server)