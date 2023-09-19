# A data structure is a specialized format for organizing and storing data.
# We have differnt types of Data Structures in R.

# --------------------------------------------------------

#1) Vector-These are one-dimensional arrays.
a <-c(1, 2, 5, 3, 6, -2, 4)
b <-c("one", "two", "three")
c <-c(TRUE, TRUE, TRUE, FALSE, TRUE, FALSE)
class(a) # "numeric"
class(b) # "character"
class(c) # "logical"

# Accessing Vector Elements.
a[3]            # 5 
b[1:3]          # "one" "two" "three"
c[c(1,3)]       # TRUE TRUE

# Remove vector.
rm(a)

a # Error: object 'a' not found

# --------------------------------------------------------

# 2) Scalars-These are one-element vectors used to hold constants.
f <- 3
g <- "US"
h <- TRUE
class(f) # "numeric"

# --------------------------------------------------------

# 3) Matrices-These are two-dimensional data structures.
# Elements in a matrix must be of the same type, whether a number, character, or Boolean.
vector <- c(1,2,3,4)
foo <- matrix(vector, nrow = 2, ncol = 2)
foo #    [,1] [,2]
#[1,]      1    3
#[2,]      2    4
foo <- matrix(vector, nrow = 2, ncol = 2, byrow = TRUE)

# Accessing Vector Elements.
foo[2,2]    # Second row, second col
class(foo)  # "matrix"

# Remove.
rm(foo)
foo

# --------------------------------------------------------

# 4) Arrays – similar to matrices. 
# These can have more than two dimensions.
a <- matrix(c(1,1,1,1),2,2)
b <- matrix(c(2,2,2,2),2,2)
c <- matrix(c(3,3,3,3),2,2)
arr <- array(c(a,b,c),c(2,2,3))  # 2x2 matrix with count 2
arr

# Accessing Vector Elements.
arr[2,2,2]
arr[1,,3]
arr[1,2,]

# Class.
class(arr) #"array"

# Remove.
rm(arr)

arr # Error: object 'arr' not found

# --------------------------------------------------------

#5) Data Frame.
# Similar to a matrix, but its columns can take different types of data – numeric, character or logical.
name <- c("sds","fwef","wfw")
id <- c(1,2,3)
sex <- c("m","f","m")
datafrm<-data.frame(id,name,sex)
name1 <- c("joe","jhon","Nancy")
sex <- c("m","f","m")
age1 <- c(27,26,26)
foo <- data.frame(name1,sex1,age1)

# Elements of Data Frames
datafrm$name
datafrm$sex
datafrm$id[2]

datafrm[1,2]
datafrm[,-c(2,3)]

# --------------------------------------------------------

# 6) Lists:These are the most complex data structures.
# A list may contain a combination of vectors, matrices, data frames, and even other lists.
vec <- c(1,2,3,4)
mat <- matrix(vec,2,2)
foo <- list(vec, mat)

# --------------------------------------------------------
