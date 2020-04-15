library(shiny)
library(ggplot2)

ui <- fluidPage(title = "My first Shiny app",
  plotOutput("point_plot")
)

server <- function(input, output) {
  
  output[["point_plot"]] <- renderPlot({
    ggplot(data = data.frame(x = 1L:10, y = rpois(10, 1.5)),
           aes(x = x, y = y)) +
      geom_point()
  }) 
  
}

shinyApp(ui = ui, server = server)
