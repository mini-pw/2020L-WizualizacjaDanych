library(shiny)
library(ggplot2)

ui <- fluidPage(
  plotOutput("point_plot"),
  tableOutput("point_table")
)

server <- function(input, output) {
  
  point_df <- reactive({
    data.frame(x = 1L:10, y = rnorm(10))
  })
  
  output[["point_table"]] <- renderTable({
    point_df()
  })
  
  output[["point_plot"]] <- renderPlot({
    ggplot(data = point_df(),
           aes(x = x, y = y)) +
      geom_point()
  }) 
  
}

shinyApp(ui = ui, server = server)
