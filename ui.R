#To improve performance, the lists of items for UI controls is cached rather than reading
#the original dataset and using unique().
nativeCountry <- readRDS("nativeCountry.rds")
occupation <- readRDS("occupation.rds")
race <- readRDS("race.rds")
maritalStatus <- readRDS("maritalStatus.rds")

shinyUI(pageWithSidebar(
  headerPanel("USA Standard of Living Predictor"),
  sidebarPanel(
    selectInput("selectCountry", "Country of Origin", choices = nativeCountry ),
    selectInput("selectOcc", "Occupation", choices = occupation ),
    selectInput("selectRace", "Race", choices = race ),
    selectInput("selectMarital", "Marital Status", choices = maritalStatus),
    sliderInput("slideAge", "Age (years)", 18, 80, 30),
    sliderInput("slideSchooling", "Years of formal schooling", 0, 22, 12),
    radioButtons("radioSex", "Choose gender:", list(" Female", " Male")),
    sliderInput("slideHours", "Hours Per Week of Work", 0, 80, 40)
  ),
  mainPanel(
    tabsetPanel(
      tabPanel("Output",
        h2('Predicted standard of living'),
        textOutput('text1'),
        hr(),
        h5('Country of Origin'),
        textOutput('textCountry'),
        h5('Occupation'),
        textOutput('textOccupation'),
        h5('Race'),
        textOutput('textRace'),
        h5('Marital Status'),
        textOutput('textMarital'),
        h5('Age'),
        textOutput('textAge'),
        h5('Years of schooling'),
        textOutput('textSchooling'),
        h5('Sex'),
        textOutput('textSex'),
        h5('Hours per week'),
        textOutput('textHours')
      ),
      tabPanel("Instructions",
        helpText("Select the personal characteristics from the sidebar at left and see the predicted lifestyle change in real time"),
        helpText("The author trained the model from the listed dataset with the personal characteristics and income level"),
        helpText("Data: UCI Census Income"),
        helpText("http://archive.ics.uci.edu/ml/datasets/Adult")
      )
    )
  )
) )