# reduce high dimensionality
# eg. pca recommended from http://horicky.blogspot.com.au/2012/05/predictive-analytics-data-preparation.html
pca <- prcomp(iris[,-5], scale=T)
summary(pca)
plot(pca)
pca$rotation
# Project first 2 records in PCA direction
predict(pca)[1:2,]
# plot all points in top 2 PCA direction
biplot(pca)