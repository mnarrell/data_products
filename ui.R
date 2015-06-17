library(shiny)
library(markdown)

shinyUI(fluidPage(
  navbarPage("Vitamin C Impact on Tooth Growth",
             tabPanel("Application",
                      sidebarLayout(
                        sidebarPanel(
                          selectInput(inputId = "supplement", label = "Supplement", 
                                      choices = c("Orange Juice" = "OJ", "Ascorbic Acid" = "VC", "Compare")),
                          selectInput(inputId = "dosage", label = "Dosage", choices = c(0.5, 1.0, 2.0, "Compare"))
                          ),
                        mainPanel(
                          plotOutput("boxpPlot")
                          )
                        )
                      ),
             tabPanel("About", mainPanel(includeMarkdown("README.md")))
  )
))
