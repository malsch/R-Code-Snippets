#########
# k-Next Neighbors
#########
library(FNN)
results <- (0:9)[knn(train, test, labels, k = 10, algorithm="cover_tree")] # from kaggle for number classification
# only for small dimensions