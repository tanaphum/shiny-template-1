#don't forget to use tags$div to cover the code if it's a code for shiny/HTML
tags$div(
  
sidebarPanel(
  radioButtons("plotType", "Plot type",
               c("Scatter"="p", "Line"="l")
  )
),
mainPanel(
  plotOutput("plot")
)

)
