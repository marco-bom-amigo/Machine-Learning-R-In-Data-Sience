# Data Preprocessing

# Importig the dataset
setwd("1 - Data Preprocessing")
dataset <- read.csv("data/Data.csv")

# Taking care of missing data
dataset$Age    <- ifelse(is.na(dataset$Age)   , ave(dataset$Age   , FUN = function(x) mean(x, na.rm = T)), dataset$Age)
dataset$Salary <- ifelse(is.na(dataset$Salary), ave(dataset$Salary, FUN = function(x) mean(x, na.rm = T)), dataset$Salary)