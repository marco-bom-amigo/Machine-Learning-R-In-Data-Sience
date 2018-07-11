# Simple Linear Regression

# Importing the libraries
library(caTools)
library(ggplot2)

# Importing the dataset
setwd("2 - Regression/1 - Simple Linear Regression")
dataset <- read.csv("data/Salary_Data.csv")

# Splitting the dataset into the Training set and the Test set
set.seed(123)
split <- sample.split(Y = dataset$Salary, SplitRatio = 2/3)
training_set <- subset(dataset, split == T)
test_set     <- subset(dataset, split == F)

# Fitting Simple Linear Regression to the training data
regressor <- lm(formula = Salary ~ YearsExperience, data = training_set)
summary(regressor)
Y_pred <- predict(regressor, newdata = test_set)

# Visualising the Training set results
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary)
            ,colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set))
           ,colour = 'blue') +
  ggtitle("Salary vs Experience (Training set)") +
  xlab("Year of experience") +
  ylab("Salary")

# Visualising the Test set results
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary)
             ,colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set))
            ,colour = 'blue') +
  ggtitle("Salary vs Experience (Test set)") +
  xlab("Year of experience") +
  ylab("Salary")

