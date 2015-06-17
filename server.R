library(shiny)
library(ggplot2)
data(ToothGrowth)

shinyServer(function(input, output) {
  output$boxpPlot <- renderPlot({
    df <- ToothGrowth
    if(input$supplement != "Compare") {
      df <- ToothGrowth[ToothGrowth$supp == input$supplement, ]
    }
      
    eda <- ggplot(df, aes(x = supp, y = len)) + 
      geom_boxplot(aes(fill = supp)) + 
      geom_jitter() +
      ggtitle("Boxplot of Supplement and Dosage vs. Tooth Length") +
      xlab("Supplement") + ylab("Tooth Length")
      
    if(input$dosage == "Compare") {
      eda <- eda + facet_grid(~dose)
    }
      
    print(eda)
  })
})
