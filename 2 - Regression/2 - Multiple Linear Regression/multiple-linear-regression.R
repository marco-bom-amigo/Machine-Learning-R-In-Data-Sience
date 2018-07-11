# Multiple Linear Regression

# Importing the libraries
library(caTools)

# Importing the dataset
setwd("../2 - Multiple Linear Regression")
dataset <- read.csv("data/50_Startups.csv")

# Encoding categorical data
dataset$State <- factor(x=dataset$State, levels=c("New York", "California", "Florida"), labels=c(1, 2, 3))

# Splitting the dataset into the Training set and the Test set
set.seed(123)
split <- sample.split(Y = dataset$Profit, SplitRatio = .8)
training_set <- subset(dataset, split == T)
test_set     <- subset(dataset, split == F)

# Fitting Simple Linear Regression to the training data
regressor <- lm(formula=Profit ~ ., data=training_set)

# Predicting the Test set resulsts
Y_pred <- predict(regressor, newdata=test_set)

# Building the optimal model using Backward Elimination
regressor <- lm(formula=Profit ~ R.D.Spend + Administration + Marketing.Spend + State, data=training_set)
summary(regressor)

regressor <- lm(formula=Profit ~ R.D.Spend + Administration + Marketing.Spend, data=training_set)
summary(regressor)

regressor <- lm(formula=Profit ~ R.D.Spend + Marketing.Spend, data=training_set)
summary(regressor)

regressor <- lm(formula=Profit ~ R.D.Spend, data=training_set)
summary(regressor)