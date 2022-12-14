# Import required libraries.
library(ISLR)
library(tree)
attach(Carseats)

# Classification.
names(Carseats)
head(Carseats)

# --------------------------------------------------------

# We need to convert sales to category data because we 
# cannot use continuous data for our CART Algorithm.
range(Sales)
high <- ifelse(Sales > 8,"Yes","No")
high
length(high)
dim(Carseats)
Carseats1 <- Carseats[,-1]
names(Carseats1)
Carseats1 <- data.frame(Carseats1,high)
names(Carseats1)

# --------------------------------------------------------

# Training and Testing Data.
set.seed(1)
train <- sample(1:nrow(Carseats1),nrow(Carseats1)/2)
train
test <- -train
test
training_data <- Carseats1[train,]
str(training_data)
head(training_data)
testing_data <- Carseats1[test,]
str(testing_data)
testing_data
testing_high <- high[test]
testing_high

# --------------------------------------------------------

# Creating a Tree Model
tree_model <- tree(high~.,training_data)
    plot(tree_model)                                       
    text(tree_model,pretty = 0)
    
  tree_pred <- predict(tree_model, testing_data , type = "class")
  mean(tree_pred != testing_high)
    
  # Prune.
  set.seed(3)
  cv_tree <- cv.tree(tree_model, FUN = prune.misclass)
    names(cv_tree)
    cv_tree$size
    cv_tree$dev
    plot(cv_tree$size,cv_tree$dev,type = "b")
    pruned_model <- prune.misclass(tree_model,best = 7)
   
    tree_pred <- predict(pruned_model, testing_data , type = "class")
    mean(tree_pred != testing_high)
    
# --------------------------------------------------------
