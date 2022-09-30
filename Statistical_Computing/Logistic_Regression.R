# --------------------------------------------------------

# Logistic Regression
data("mtcars")
head(mtcars)

# --------------------------------------------------------

# We do regression on vs, wt and disp. 
# VS (dependent variable) is categorical in nature (has binary outcome).

model <- glm(formula = vs~wt+disp,data=mtcars,family = "binomial")
?glm
summary(model)

# --------------------------------------------------------
