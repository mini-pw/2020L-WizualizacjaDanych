library(shiny)
library(ggplot2)

# runApp("./Materiały/gr1/shiny-intro/", display.mode = "showcase")

ui <- fluidPage(
  sidebarLayout(sidebarPanel = sidebarPanel(
    textInput("plot_title", "Specify plot title"),
    sliderInput("axis_x_range", "Specify range", 
                min = 0, max = 10, value = c(0, 10)),
    numericInput("number_points", "How many points?", 
                 min = 5, max = 20, value = 10)
  ),
  mainPanel = mainPanel(
    plotOutput("point_plot", click = "plot_click"),
    verbatimTextOutput("plot_click_value"), 
    tableOutput("point_table"))
  )
)

server <- function(input, output, session) {
  
  
  observeEvent(input[["number_points"]], {
    updateSliderInput(session, "axis_x_range", "Specify range", 
                      min = 0, max = input[["number_points"]], 
                      value = c(0, input[["number_points"]]))
  })
  
  point_df <- reactive({
    data.frame(x = 1L:input[["number_points"]], 
               y = rnorm(input[["number_points"]]))
  })
  
  point_df_clicked <- reactive({
    nearPoints(df = point_df(), coordinfo = input[["plot_click"]], 
               allRows = TRUE)
  })
  
  output[["point_table"]] <- renderTable({
    point_df_clicked()
  })
  
  output[["point_plot"]] <- renderPlot({
    ggplot(data = point_df(),
           aes(x = x, y = y)) +
      geom_point() +
      coord_cartesian(xlim = input[["axis_x_range"]]) +
      ggtitle(input[["plot_title"]])
  }) 
  
  output[["plot_click_value"]] <- renderPrint({
    input[["plot_click"]]
  })
  
}

shinyApp(ui = ui, server = server)
