# Natural Language Processing
library(magrittr)
library(tm)
library(SnowballC)
library(caTools)
library(randomForest)

# Importing the dataset
dataset_original <- read.delim('data/Restaurant_Reviews.tsv', quote = '', stringsAsFactors = FALSE)

# Cleaning the texts
VCorpus(VectorSource(dataset_original$Review)) %>% 
tm_map(content_transformer(tolower)) %>% 
tm_map(removeNumbers) %>% 
tm_map(removePunctuation) %>% 
tm_map(removeWords, stopwords()) %>% 
tm_map(stemDocument) %>% 
tm_map(stripWhitespace) -> corpus

# Creating the Bag of Words model
dtm = DocumentTermMatrix(corpus)
dtm = removeSparseTerms(dtm, 0.999)
dataset = as.data.frame(as.matrix(dtm))
dataset$Liked = dataset_original$Liked

# Importing the dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

# Encoding the target feature as factor
dataset$Liked = factor(dataset$Liked, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
set.seed(123)
split = sample.split(dataset$Liked, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting Random Forest Classification to the Training set
# install.packages('randomForest')
classifier = randomForest(x = training_set[-692],
                          y = training_set$Liked,
                          ntree = 10)

# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-692])

# Making the Confusion Matrix
cm = table(test_set[, 692], y_pred)