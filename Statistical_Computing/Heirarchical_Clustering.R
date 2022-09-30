# For heirarchical clustering, we are going to use the 'mtcars' dataset.
# ----------------------------------------------------------------------

# Look at the column names.
names(mtcars)
dim(mtcars)
View(mtcars)

# Find distances.
cars.dist <- dist(mtcars, )
cars.dist

# Create distance matrix.
as.matrix(cars.dist)
head(as.matrix(cars.dist))

# Use hclust() function.
clusters <- hclust(cars.dist)
summary(clusters)

# Create dendogram.
plot(clusters)

# Apply rectangles at specified height.
rect.hclust(clusters, h = 300)

# Install "cluster" package to use agnes function.
install.packages("cluster")
library(cluster)

cluster.agnes <- agnes(mtcars)
plot(cluster.agnes)

# NOTE: for divisive heirarchical clustering, we can use functions 
# "diana" or "mona" which are available in library -cluster.

# --------------------------------------------------------

# DBSCAN Clustering Method.
install.packages("cluster")
library(cluster)
data("ruspini")
View(ruspini)
ruspini_scaled <- scale(ruspini)
plot(ruspini_scaled)

library(dbscan)

kNNdistplot(ruspini_scaled, k = 5)
abline(h = .25, col = "red")

db <- dbscan(ruspini_scaled, eps = .25, minPts = 10)
db

# NOTE: 0 is not a color, so we add 1 to cluster :: 0 is black now.
plot(ruspini_scaled, col=db$cluster+1L)

# Alternative visualization from package dbscan:
hullplot(ruspini_scaled, db)

# --------------------------------------------------------
