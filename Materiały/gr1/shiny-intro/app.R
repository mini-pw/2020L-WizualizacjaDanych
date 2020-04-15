library(shiny)
library(ggplot2)

ui <- fluidPage(
  sidebarLayout(sidebarPanel = sidebarPanel(
    textInput("plot_title", "Specify plot title"),
    sliderInput("axis_x_range", "Specify range", 
                min = 0, max = 10, value = c(0, 10))
  ),
  mainPanel = mainPanel(
    plotOutput("point_plot"),
    tableOutput("point_table"))
  )
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
      geom_point() +
      coord_cartesian(xlim = input[["axis_x_range"]]) +
      ggtitle(input[["plot_title"]])
  }) 
  
}

shinyApp(ui = ui, server = server)
