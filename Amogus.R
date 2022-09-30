# AMOGUS is a very sussy place where all the simple 
# visualizations in R programming happen.
#
# @author: Kevin Mora
#
# 1) Bar Chart
# 2) Pie Chart 
# 3) Histogram 
# 4) Kernel desity Plot 
# 5) Line Charts
# 6) Box plot 
# 7) Heat Map 
# 8) Word Cloud
# --------------------------------------------------------

# Visualization 1
count <- table(mtcars$gear)
count
barplot(count,horiz = TRUE) # by default horiz = FALSE
barplot(count,main = "Simple Bar Chart",xlab = "Improvement", ylab = "Frequency",
        col = c("Yellow","red","green"),legend = rownames(count))

# --------------------------------------------------------

# Visualization 2
# Stacked Bar Chart (when there is a matrix)
count <- table(mtcars$vs,mtcars$gear)
count
barplot(count,main= "Simple Stacked Bar Chart",xlab="number of gear",
        col = c("Yellow","red","green"),legend = rownames(count))
barplot(count,main= "Simple Stacked Bar Chart",xlab = "number of gear",
        col = c("Yellow","red","green"),legend = rownames(count),beside = TRUE) 
        # Use Beside to have bar next to each other
   
# --------------------------------------------------------

# Visualization 3
# Pie Chart – install package 'plotrix'
library(plotrix)
slice <- c(10,24,29,47)
lbls <- c("US","IND","UK","PAK")
pie(slice,labels = lbls,main = "Pie chart",col = rainbow(4))

# Has percentage also
pct <- round(slice/sum(slice)*100)
pct
lbls1 <- paste(lbls," ",pct,"%",seq="")
lbls1
pie(slice,labels = lbls1,col=rainbow(4),main="Percentage pie chart")

# Pie :: 3D
pie3D(slice,labels = lbls1,col=rainbow(4),main="Percentage 3 D pie chart",explode = 0.0)

# --------------------------------------------------------
