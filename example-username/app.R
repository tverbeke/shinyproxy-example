library(shiny)
library(shinyjs)

ui <- fluidPage(
  titlePanel("Hello Shiny!"),
  sidebarLayout(
    sidebarPanel(
      uiOutput("userAuth"),
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    mainPanel(
      plotOutput(outputId = "distPlot")
    )
  )
)

server <- function(input, output) {

  output$userAuth <- renderUI({
    userName <- Sys.getenv("SHINYPROXY_USERNAME")
    alert(paste0("User name:", userName))
    if (userName != "") {
      sidebarUserPanel(
        span("Logged in as ", userName),
        subtitle = a(icon("sign-out"), "Logout", href="/logout"))
    }
  })

  output$distPlot <- renderPlot({
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
    })
}

shinyApp(ui = ui, server = server)
