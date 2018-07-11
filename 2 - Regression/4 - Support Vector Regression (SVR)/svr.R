# SVR

# Importing the libraries
library(e1071)
library(ggplot2)

# Importing the dataset
setwd("../2 - Regression/4 - Support Vector Regression (SVR)")
dataset = read.csv('data/Position_Salaries.csv')
dataset = dataset[2:3]

# Fitting SVR to the dataset
regressor = svm(formula=Salary ~ ., data=dataset, type='eps-regression', kernel='radial')

# Predicting a new result
y_pred = predict(regressor, data.frame(Level=6.5))

# Visualising the SVR results

ggplot() +
  geom_point(aes(x=dataset$Level, y=dataset$Salary), colour='red') +
  geom_line(aes(x=dataset$Level, y=predict(regressor, newdata=dataset)), colour='blue') +
  ggtitle('Truth or Bluff (SVR)') +
  xlab('Level') +
  ylab('Salary')

# Visualising the SVR results (for higher resolution and smoother curve)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
  geom_point(aes(x=dataset$Level, y=dataset$Salary), colour='red') +
  geom_line(aes(x=x_grid, y=predict(regressor, newdata=data.frame(Level=x_grid))), colour='blue') +
  ggtitle('Truth or Bluff (SVR)') +
  xlab('Level') +
  ylab('Salary')