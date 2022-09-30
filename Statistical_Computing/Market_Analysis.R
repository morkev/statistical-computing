# --------------------------------------------------------

# Load the libraries.
library(arules)
library(arulesViz)
library(datasets)

# Load the datasets.
data("Groceries")
head(Groceries)

View(Groceries)

# --------------------------------------------------------

# You will always have to pass the minimum required support and confidence:
# We set the minimum support to 0.001
# We set the minimum confidence of 0.8

# Get the rules.
rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8))

# Look at the summary of the rules.
summary(rules)

# Reduce number of rules.
rules <- apriori(Groceries, parameter = list(maxlen = 3 ,supp = 0.001, conf = 0.8))

?apriori

# --------------------------------------------------------

# See the rules.
inspect(rules)

# Check the summary of the data to check the most frequent item/items.
summary(Groceries)  # Whole milk is the most frequent item.

# Reduce to further smaller number of rules keeping whole milk in RHS:
rules <- apriori(Groceries, parameter = list(maxlen=3 ,supp = 0.001, conf = 0.8), 
                 appearance = list(rhs = "whole milk", default = "lhs"))

inspect(rules)

# --------------------------------------------------------

setwd("D:/Path/Somewhere")
mydata <- read.csv('Cosmetics.csv', header = T, colClasses = "factor")

View(mydata)

library(arules)
rules <- apriori(mydata)
summary(rules)

# Reduce to smaller number of rules.
rules <- apriori(mydata, parameter = list(minlen = 2, maxlen = 3, supp=.7))
inspect(rules)

# Finding interesting rules.
rules <- apriori(mydata,parameter = list(minlen = 2, maxlen=3, conf=.7), 
                appearance=list(rhs=c("Foundation=Yes"), default = "lhs"))

# We have chosen foundation in RHS as foundation is most sold object.
summary(mydata)

# Inspect the rules.
inspect(rules)

# Visualize the rules.
library(arulesViz)
plot(rules)

# --------------------------------------------------------
