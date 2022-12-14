setwd("G:\\Path\\Somewhere")
restaurant<-read.csv("Restaurant.csv")
View(restaurant)

st_restaurant <- stack(restaurant)
View(st_restaurant)

head(st_restaurant)

names(st_restaurant) <- c("sales", "Menu")
st_restaurant

# --------------------------------------------------------

# ANOVA
# Here, we are comparing three menu items (item1, item2, item3).
# avg for itme 1=mu1,
# avg for itme 1=mu2,
# avg for itme 1=mu3.
#
# Ho: mu1 = mu2 = mu3.
# Ha: at least one is diffrent.

# We calcuted the f value and p value.
avl<- aov(sales ~ Menu,data = st_restaurant)
summary(avl)

# --------------------------------------------------------

# Consider the data set 'mtcars' available in the R environment. 
# It gives a comparison between different car models in terms of mileage per gallon (mpg), 
# cylinder displacement("disp"), horse power("hp"), weight of the car("wt") and other parameters.
#
# The goal of the model is to establish the relationship between "mpg" as a response
# variable (depended variable) with "disp","hp" and "wt" as predictor variables. 
#
# We create a subset of these variables from the mtcars data set for this purpose.

head(mtcars)
input <- mtcars[,c("mpg","disp","hp","wt")]
head(input)

# Create Relationship Models & Get the Coefficients.
model <- lm(mpg ~ disp+hp+wt, data = input)
model

summary(model)

# Create Equation for Regression Model.
#
# Y = a + disp.x1 + hp.x2 + wt.x3
# or
# y=b0+b1x1+b2x2+b3x3 (x1 = disp, x2 = hp, x3 = wt)

# Apply Equation for predicting New Values.
#
# We can use the regression equation created above to predict the mileage 
# when a new set of values for displacement, horse power and weight is provided.

# For a car with disp = 221, hp = 102 and wt = 2.91, the predicted mileage is (_)?

Y = 37.10+(-0.000937)*221+(-0.0311)*102+(-3.8008)*2.91

Y = 37.10+(-0.000937)*160+(-0.0311)*110+(-3.8008)*2.620
Y

# --------------------------------------------------------

# Case Study 2 - we will use a built-in data set.

head(state.x77)

# Lets look at the class:
# Clearly it is not a dataframe, 
# so we need to convert it into one:
class(state.x77) 

st = as.data.frame(state.x77)
class(st)

colnames(st)[4] = "Life.Exp"  # no spaces in variable names
colnames(st)[6] = "HS.Grad" 

model <- lm(formula = Life.Exp ~ ., data = st)

model1 <- lm(formula = Life.Exp ~ Murder + HS.Grad, data = st)

summary(model)

# --------------------------------------------------------

# Creating Dummy Variables

setwd("G:\\Path\\Somewhere")
install.packages("dummies")
library(dummies)

policy <- read.csv("Policy_Number.csv")
names(policy)
policy.new <- dummy.data.frame(policy)
policy.new
head(policy.new)

# --------------------------------------------------------

## Interaction Regression Model

# The presence of a significant interaction indicates that the effect of one predictor variable
# on the response variable is different at different values of the other predictor variable. 
# 
# It is tested by adding a term to the model in which the two predictor variables are multiplied.

setwd("G:\\Path\\Somewhere")
datavar <- read.csv("dataset_iceCreamConsumption.csv")
head(datavar)

# Predict ice cream consumption by its per pint price, weekly family income, mean
# temperature, and the interaction between per pint price and weekly family income.

# Create the interaction variable:
PRICEINCi <- datavar$PRICE * datavar$INC
interactionModel <- lm(CONSUME ~ INC + TEMP + PRICEINCi, datavar)
summary(interactionModel)

# --------------------------------------------------------

# Decision Trees

library(rpart)
library(rpart.plot)
library(RColorBrewer)

installed.packages()

# Data used is fetal cardiotocograms. 

# LB - FHR baseline (beats per minute),
# AC - # of accelerations per second, 
# FM - # of fetal movements per second, 
# NSP - fetal state class code (N = normal; S = suspect; P = pathologic).

setwd("G:\\Path\\Somewhere")

data <-read.csv("CTG.csv")
str(data)

data$NSPF <- factor(data$NSP)
str(data)

dim(data)

# Partition of data into training and validation datasets.
set.seed(1234)
?sample
pd <- sample(2, nrow(data), replace = TRUE , prob = c(0.8,0.2))
pd
train <- data[pd==1,]
validate <- data[pd==2,]

# Decision Tree with party package.
library(party)
tree <- ctree(NSPF~LB+AC+FM, data = train)
?ctree
tree
plot(tree)

# Pruning the tree to make it simple by controlling parameters.
tree <- ctree(NSPF~LB+AC+FM, data = train, controls = ctree_control(mincriterion = 0.90, minsplit = 100))
tree
plot(tree)

# Predict.
predict(tree, validate, type = "prob")

# Decision Tree using rpart.
library(rpart)

tree1 <- rpart(NSPF~LB+AC+FM, data = train)

library(rpart.plot)
rpart.plot(tree1, extra = 3)

# Misclassification of error for validate data.

testPred <- predict(tree, newdata = validate)
tab <- table(testPred, validate$NSPF)
tab
1-sum(diag(tab))/sum(tab)### 20% accurate(its a very poor model)## We need to improve our data

# --------------------------------------------------------
