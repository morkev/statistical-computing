# APPLY Family of Functions
#
# Apply can be used to apply a function to a matrix. It is used to
# perform a specific change to each column or row of R objects. 

# --------------------------------------------------------

# For example, let's create a sample dataset:
data <- matrix(c(1:10, 21:30), nrow = 5, ncol = 4)
data

# Now we can use the apply function to find the mean of each row as follows:
apply(data, 1, mean)
# The second parameter is the dimension. 1 signifies rows and 2 signifies columns. 
apply(data, 2, mean)
# The family of apply has following functions:

# apply
# lapply
# sapply
# tapply
# mapply

# --------------------------------------------------------

# Function: apply()
# Helps to apply a function to a matrix row or a column and returns a vector, array or list.
# Syntax: apply(x, margin, function), where margin indicates whether the function is to be applied to a row or a column.
#
# margin = 1 indicates that the function needs to be applied to a row.
# margin = 2  indicates that the function needs to be applied to a column.
#
# Function can be any function such as mean, average, sum...

m <- matrix(c(1,2,3,4),2,2)
m
apply(m, 1, sum)
apply(m, 2,sum)

# --------------------------------------------------------

# Function: lapply()
# Similar to apply, but it takes a list as an input, and returns a list as the output.
# Syntax: lapply(list, function).

# Example 1 (create a list):
data <- list(x = 1:5, y = 6:10, z = 11:15)
data
# Now, we can use lapply to apply a function to each element in the list.
lapply(data, FUN = median)

# Example 2:
data2 <- list(a=c(1,1), b=c(2,2), c=c(3,3))
data2
lapply(data2, sum)
lapply(data2, mean)

# --------------------------------------------------------

# Function: sapply()
# sapply() is the same as lapply(), but returns a vector instead of a list.
# Syntax: sapply(list, function).

# Example 1 : 
data <- list(x = 1:5, y = 6:10, z = 11:15)
data
lapply(data, FUN = median)
sapply(data, FUN = median)
# NOTE: if the result are all scalars, then a vector is returned.

data3 <- list(a=c(1,1), b=c(2,2), c=c(3,3))
data3
sapply(data3, FUN = sum)

# However, if the result are of same size (>1) then a matrix is returned else.
data4 <- list(a=c(1,2), b=c(1,2,3), c=c(1,2,3,4))
data4
sapply(data4, FUN = range)

# --------------------------------------------------------

# Function: tapply() 
# tapply() splits the array based on specified data, usually
# factor levels and then applies the function to it.
# Syntax: tapply(x, factor, function).

# Example 1: 
age <- c(23,33,28,21,20,19,34)
gender <- c("m" , "m", "m" , "f", "f", "f" , "m")
tapply(age, gender, mean)
tapply(gender, age, mean)

# Example 2:
# Load the datasets.
library(datasets)

# View all the datasets.
data()
View(mtcars)
class(mtcars)
summary(mtcars)
str(mtcars)
mtcars$wt
mtcars$cyl
tapply(mtcars$wt, mtcars$cyl, mean)

# --------------------------------------------------------

# Function: mapply() 
# mapply() is a multivariate version of sapply(). It will apply the specified function 
# to the first element of each argument first, followed by the second element, and so on.
# Syntax: mapply(function...)

# Example 1:
# Create a 4 x 4 matrix using rep function repeatedly, four times.
rep(1,4)
Q = matrix(c(rep(1, 4), rep(2, 4), rep(3, 4), rep(4, 4)),4,4)
Q

# Where we bind the results of the rep function with c, and ask for a 4 x 4 matrix.
# Alternatively we can use the mapply() function. 
Q = mapply(rep,1:4,4)
Q

# Example 2
# Create a list.
a <- list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))
a
b <- mapply(rep, 1:4, c(4,3,3,2))    
b

# --------------------------------------------------------

# Package: dplyr
# Transforms and summarizes tabular data with rows and columns.

# Install 'dplyr' package:
install.packages("dplyr")

# Load the package:
library(dplyr)

# Functions of dplyr package:
# select()
# filter()
# arrange()
# mutate()
# summarize()

# To understand each of these functions , lets consider the the dataset 'mtcars'.
View(mtcars)

# Select function allows us to select specific columns from large data sets.
#
# Select columns by names:
select(mtcars, mpg, disp)

# Select a range of columns by names:
select(mtcars, mpg:hp)
select(mtcars,vs:disp)

# Select columns with string match
# for this, load another data called Iris.
View(iris)
iris <- data.frame(iris) # creates a dataframe table
iris
select(iris, starts_with("Petal"))
select(iris, ends_with("Width"))
select(iris, contains("etal"))
select(iris, matches(".t."))
select(iris, Petal.Length, Petal.Width)

# filter() enables easy filtering, zoom in, and zoom out of relevant data. 
# There are two types of filters:

# Simple Filter.
filter(mtcars, cyl == 8)
filter(mtcars, cyl < 6)

# Multiple Criteria Filter.
filter(mtcars, cyl <6 & vs == 1)
filter(mtcars, cyl <6 | vs == 1)

# --------------------------------------------------------

# Function: arrange() 
# Helps arrange the data in a specific order.
# Syntax: arrange(data, ordering column).
arrange(mtcars, desc(disp))
func <- arrange(mtcars, cyl, disp)
View(func)
write.csv(func, "abc.csv")

#--------------------------------------------------

# Function: mutate() 
# Helps add new variables to an existing data set. 
# Syntax: mutate(data, new_column)

new_mtcars <- mutate(mtcars, my_custom_disp = disp/2)
View(new_mtcars)

# Inserting a new column in a dataframe
oldframe <- data.frame(matrix(0:14,ncol=3)) # create a dataframe
oldframe 
newcol <- data.frame(20:24)
newcol
names(newcol) <- "newcol" # name the new column
newcol
newframe  <- data.frame(c(oldframe[1],newcol, oldframe[2:3])) # inserting the new column after the 1st column
newframe

#----------------------------------------------------------------------------------------

# Function: summarize() 
# Summarizes multiple value into a single value in a dataset. 
summarise(mtcars,mean(disp))
summarise(group_by(mtcars, cyl), mean(disp))
summarise(group_by(mtcars, cyl), m = mean(disp), sd = sd(disp))

#----------------------------------------------------------------------------------------
