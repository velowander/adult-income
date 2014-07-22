library(shiny)
library(caret)
answer = c("Living modestly, under USD 50K/year", "Comfortable USA lifestyle, over USD 50K/year")
modFit <- readRDS("modFit.rds") #load the precomputed model from file

shinyServer(
  function(input, output) {
    output$textAge <- renderText(input$slideAge)
    output$textSchooling <- renderText(input$slideSchooling)
    output$textOccupation <- renderText(input$selectOcc)
    output$textRace <- renderText(input$selectRace)
    output$textSex <- renderText(input$radioSex)
    output$textHours <- renderText(input$slideHours)
    output$textCountry <- renderText(input$selectCountry)
    output$text1 <- renderText({
      userData <- data.frame(input$slideAge, input$slideSchooling, input$selectOcc,
                             input$selectRace, input$radioSex, input$slideHours, input$selectCountry)
      names(userData) <- c("age", "education-num", "occupation", "race", "sex", "hours per week", "nativeCountry")
      answerCode <- predict(modFit, userData)
      answer[answerCode]
    })
  }
)
