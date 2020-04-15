library(shiny)
library(ggplot2)

ui <- fluidPage(title = "My first Shiny app",
                selectInput("point_color", label = "Select color", 
                            choices = c("black", "red", "#eeeeee",
                                        "#F5F5DC", "#C2B280")),
                sliderInput("number_of_points", "How many points?", 
                            min = 5, max = 50, value = 10),
                plotOutput("point_plot")
)


server <- function(input, output) {
  
  point_df <- reactive({
    data.frame(x = 1L:input[["number_of_points"]], 
               y = rpois(input[["number_of_points"]], 1.5))
  })
  
  
  output[["point_plot"]] <- renderPlot({
    ggplot(data = point_df(),
           aes(x = x, y = y)) +
      geom_point(color = input[["point_color"]])
  }) 
  
}

shinyApp(ui = ui, server = server)
