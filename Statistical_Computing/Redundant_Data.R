# --------------------------------------------------------

setwd("G:\\Path\\Somewhere")

mydata <- read.csv("Cosmetics.csv", header = T, colClasses = "factor") 
View(mydata)

install.packages("arules")
library(arules)

# --------------------------------------------------------

rules <- apriori(mydata)
rules

# 68880 rules were generated. It has used the default values of 
# confidence, support, minimum length, maximum length.

summary(rules)

# You will notice that there were 3 rules with just 1 item, 85 rules with 
# 2 items and so on it also gives you the summary of the quality measures.
# 
# e.g., the minimum support used was 0.1 and it went upto 0.958  

# Reduce to a smaller number of rules.
rules <- apriori(mydata, parameter = list(minlen=2, maxlen=3, supp=.7))
inspect(rules)

# Rules here are not important because the LHS has "No". We want "Yes" to appear.
#  We are more interested in what customers are purchasing.
#
# Finding interesting rules:

rules <- apriori(mydata, parameter = list(minlen=2, maxlen=3, conf=.7),
                 appearance = list(rhs=c("Foundation=Yes"),default="lhs"))

inspect(rules)

# --------------------------------------------------------

# We are using Foundation as the item here as Foundation is the most frequently bought item.
summary(mydata)

# Visualization of rules
install.packages("arulesViz")
library(arulesViz)

plot(rules)
plot(rules,method = "grouped")
plot(rules,method = "graph", control = list(type = "items"))

# We will notice that in certain rules we have "No" for items in LHS.
# NOTE: these rules do not add any value.
#
# Finding interesting rules(2):

rules <- apriori(mydata, parameter = list(minlen = 2, maxlen = 5, conf = .5),
                 appearance = list(rhs = c("Foundation=Yes"), lhs = c("Bag=Yes","Blush=Yes",
                 "Nail.Polish=Yes", "Brushes=Yes", "Concealer=Yes", "Eyebrow.Pencils=Yes",
                 "Bronzer=Yes", "Lip.liner=Yes", "Mascara=Yes", "Eye.shadow=Yes", "Lip.Gloss=Yes",
                 "Lipstick=Yes", "Eyeliner=Yes"), default = "none"))

quality(rules)<- round(quality(rules), digits = 3)

inspect(rules)

# --------------------------------------------------------

# Notice that rule number 6,7 gives us the same info as rule number 19. 

# Finding redundant rules:
subset.matrix <- is.subset(rules,rules)
subset.matrix
subset.matrix[lower.tri(subset.matrix,diag = T)] <- NA
redundant <- colSums(subset.matrix,na.rm = T) >=1
which(redundant)

# Removing redundant rules:
rules.pruned<- rules[!redundant]
rules.pruned <- sort(rules.pruned,by = "lift")
inspect(rules.pruned)

# --------------------------------------------------------
