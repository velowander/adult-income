adult <- read.csv("adult.data", header=FALSE)
adult.names <- c("age", "workclass", "fnlwgt", "education", "education-num", "maritalStatus", "occupation", "relationship",
                 "race", "sex", "capitalGain", "capitalLoss", "hours per week", "nativeCountry", "income")
names(adult) <- adult.names
nativeCountry <- unique(adult$nativeCountry)
occupation <- unique(adult$occupation)
race <- unique(adult$race)
rm(adult, adult.names)

shinyUI(pageWithSidebar(
  headerPanel("USA Standard of Living Predictor"),
  sidebarPanel(
    helpText("See the predicted standard of living based on selected parameters"),
    selectInput("selectCountry", "Country of Origin", choices = nativeCountry ),
    selectInput("selectOcc", "Occupation", choices = occupation ),
    selectInput("selectRace", "Race", choices = race ),
    sliderInput("slideAge", "Age (years)", 18, 80, 30),
    sliderInput("slideSchooling", "Years of formal schooling", 0, 22, 12),
    radioButtons("radioSex", "Choose gender:", list(" Female", " Male")),
    sliderInput("slideHours", "Hours Per Week of Work", 0, 80, 40),
    helpText("UCI Census Income: http://archive.ics.uci.edu/ml/datasets/Adult")
  ),
  mainPanel(
    h2('Predicted standard of living'),
    textOutput('text1'),
    hr(),
    h5('Country of Origin'),
    textOutput('textCountry'),
    h5('Occupation'),
    textOutput('textOccupation'),
    h5('Race'),
    textOutput('textRace'),
    h5('Age'),
    textOutput('textAge'),
    h5('Years of schooling'),
    textOutput('textSchooling'),
    h5('Sex'),
    textOutput('textSex'),
    h5('Hours per week'),
    textOutput('textHours')
    )
) )