library(shiny)
library(ggplot2)
library(shinythemes)

# runApp("./Materiały/gr1/shiny-intro/", display.mode = "showcase")

ui <- fluidPage(theme = shinytheme("superhero"),
  sidebarLayout(sidebarPanel = sidebarPanel(
    textInput("plot_title", "Specify plot title"),
    sliderInput("axis_x_range", "Specify range", 
                min = 0, max = 10, value = c(0, 10)),
    numericInput("number_points", "How many points?", 
                 min = 5, max = 20, value = 10),
    includeMarkdown("readme.md")
  ),
  mainPanel = mainPanel(
    tabsetPanel(
      tabPanel("Plot", plotOutput("point_plot", click = "plot_click"),
               verbatimTextOutput("clicked_points_rv"),
               tableOutput("point_table")),
      tabPanel("Click info", verbatimTextOutput("plot_click_value")))
    )
  )
)

server <- function(input, output, session) {
  
  selected_points <- reactiveValues(
    selected = c()
  )
  
  observeEvent(input[["plot_click"]], {
    clicked_points <- nearPoints(df = point_df(), coordinfo = input[["plot_click"]], 
                                 allRows = TRUE, maxpoints = 1)
    
    # if(!is.null(input[["plot_click"]]))
    #   browser()
    if(length(clicked_points[clicked_points[["selected_"]], "x"]) > 0) {
      if(clicked_points[clicked_points[["selected_"]], "x"] %in% selected_points[["selected"]]) {
        selected_points[["selected"]] <- setdiff(selected_points[["selected"]],
                                                 clicked_points[clicked_points[["selected_"]], "x"])
      } else {
        selected_points[["selected"]] <- c(selected_points[["selected"]],
                                           clicked_points[clicked_points[["selected_"]], "x"])
      }
    }
    
    
  })
  
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
    cbind(point_df(), 
          selected_point = point_df()[["x"]] %in% selected_points[["selected"]])
  })
  
  output[["point_table"]] <- renderTable({
    point_df_clicked() 
  })
  
  output[["clicked_points_rv"]] <- renderPrint({
    selected_points[["selected"]]
  })
  
  output[["point_plot"]] <- renderPlot({
    ggplot(data = point_df_clicked(),
           aes(x = x, y = y, size = selected_point, color = selected_point)) +
      geom_point() +
      coord_cartesian(xlim = input[["axis_x_range"]]) +
      ggtitle(input[["plot_title"]])
  }) 
  
  output[["plot_click_value"]] <- renderPrint({
    input[["plot_click"]]
  })
  
}

shinyApp(ui = ui, server = server)
