library(shiny)
library(ggplot2)

ui <- fluidPage(title = "My first Shiny app",
                selectInput("point_color", label = "Select color", 
                            choices = c("black", "red", "#eeeeee",
                                        "#F5F5DC", "#C2B280")),
                sliderInput("number_of_points", "How many points?", 
                            min = 5, max = 50, value = 10),
                plotOutput("point_plot", click = "point_click"),
                tableOutput("point_click_table"), 
                verbatimTextOutput("point_click_value")
)


server <- function(input, output) {
  
  clicked_points <- reactiveValues(
    selected = c()
  )
  
  observeEvent(input[["point_click"]], {
    np_df <- nearPoints(point_df(), input[["point_click"]], 
               maxpoints = 1, allRows = TRUE)
    
    clicked_points[["selected"]] <- c(clicked_points[["selected"]],
                                      np_df[np_df[, "selected_"], "x"])
  })
  
  point_df <- reactive({
    data.frame(x = 1L:input[["number_of_points"]], 
               y = rpois(input[["number_of_points"]], 1.5))
  })
  
  
  output[["point_plot"]] <- renderPlot({
    ggplot(data = point_df(),
           aes(x = x, y = y)) +
      geom_point(color = input[["point_color"]]) +
      geom_path(data = point_df()[clicked_points[["selected"]], ])
  }) 
  
  output[["point_click_table"]] <- renderTable({
    point_df()[clicked_points[["selected"]], ]
  })
  
  output[["point_click_value"]] <- renderPrint({
    clicked_points[["selected"]]
  })
  
}

shinyApp(ui = ui, server = server)
