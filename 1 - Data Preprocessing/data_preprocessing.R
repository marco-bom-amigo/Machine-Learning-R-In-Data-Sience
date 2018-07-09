# Data Preprocessing

# Importig the dataset
setwd("1 - Data Preprocessing")
dataset <- read.csv("data/Data.csv")

# Taking care of missing data
dataset$Age    <- ifelse(is.na(dataset$Age)   , ave(dataset$Age   , FUN = function(x) mean(x, na.rm = T)), dataset$Age)
dataset$Salary <- ifelse(is.na(dataset$Salary), ave(dataset$Salary, FUN = function(x) mean(x, na.rm = T)), dataset$Salary)

# Encoding categorical data
dataset$Country   <- factor(x = dataset$Country,levels = c("France", "Spain", "Germany"),labels = c(1,2,3))
dataset$Purchased <- factor(x = dataset$Purchased,levels = c("No", "Yes"),labels = c(0,1))