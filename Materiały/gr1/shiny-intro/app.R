library(shiny)
library(ggplot2)

ui <- fluidPage(
  plotOutput("point_plot"),
  tableOutput("point_table")
)

server <- function(input, output) {
  
  output[["point_table"]] <- renderTable({
    data.frame(x = 1L:10, y = rnorm(10))
  })
  
  output[["point_plot"]] <- renderPlot({
    ggplot(data = data.frame(x = 1L:10, y = rnorm(10)),
           aes(x = x, y = y)) +
      geom_point()
  }) 
  
}

shinyApp(ui = ui, server = server)
