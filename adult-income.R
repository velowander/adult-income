#This is a random scratch pad of code to build and evaluate the model.
#The shiny app doesn't need or reference this at all.

#http://archive.ics.uci.edu/ml/datasets/Adult

require(caret)
set.seed(300)
adult <- read.csv("adult.data", header=FALSE)
#adult.test <- read.csv("~/R/ddp/adult.test", header=FALSE)
adult.names <- c("age", "workclass", "fnlwgt", "education", "education-num", "maritalStatus", "occupation", "relationship",
                 "race", "sex", "capitalGain", "capitalLoss", "hoursPerWeek", "countryOrigin", "income")
names(adult) <- adult.names
adult$education <- NULL
#adult$maritalStatus <- NULL
adult$fnlwgt <- NULL
adult$capitalGain <- NULL
adult$capitalLoss <- NULL
adult$relationship <- NULL
adult$workclass <- NULL
adult.sample <- adult[sample(nrow(adult), 10000), ]
inTrain = createDataPartition(adult.sample$income, p = 0.7, list = FALSE)
training = adult.sample[ inTrain, ]
validation = adult.sample [ -inTrain, ]
modFit <- train(income ~ ., data = adult.sample, method = "rf", trControl = trainControl(method='cv'))
predict1 <- predict(modFit, validation)
confusionMatrix(predict1, validation$income)