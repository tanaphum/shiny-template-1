#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(markdown)

# Define UI for application that draws a histogram
    ui <- fluidPage(
    
    includeCSS("./www/css/style.css"),

    # Application title
    tags$div(class="header bg-primary",
             tags$h1(class="text-center","Application title")
    ),
    navbarPage("Logo",
               #can use source for a long code for easy maintenance
               tabPanel("Plot",
                        source("./www/plot.R", local = TRUE)$value
               ),
               tabPanel("Summary",
                        verbatimTextOutput("summary")
               ),
               #Dropdowns
               navbarMenu("More",
                          tabPanel("Table",
                                   DT::dataTableOutput("table")
                                   ),
                          tabPanel("About",
                                   tags$h1("Lorem Ipsum"),
                                   tags$p("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce consequat bibendum sapien maximus tempor. Vestibulum rutrum ligula eget quam venenatis tincidunt. Proin at dictum nisl. Proin sodales felis enim, at egestas sem luctus sed. Morbi quis lacinia odio, ac dignissim ante. Cras eget felis faucibus, dictum purus quis, pellentesque urna. Maecenas tristique, lacus eu bibendum sollicitudin, orci ante dapibus urna, a venenatis elit lorem a mauris. Pellentesque non ornare eros. Pellentesque efficitur, velit semper consectetur ornare, enim tellus scelerisque lorem, in pharetra nunc augue non risus. Maecenas sed accumsan eros. Aliquam pharetra ac risus ac condimentum. Phasellus nec eleifend nulla. Praesent auctor ligula eget pellentesque vulputate. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae")
                                   )
                          )
               ),
    tags$div(class="footer",
             tags$h1(class="center","Footer"),
    )

    )

    
    
    



server <- function(input, output) {
    output$plot <- renderPlot({
        plot(cars, type=input$plotType)
    })
    
    output$summary <- renderPrint({
        summary(cars)
    })
    
    output$table <- DT::renderDataTable({
        DT::datatable(cars)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
