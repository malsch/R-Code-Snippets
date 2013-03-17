# impute missing values
library(e1071) # recommended from http://horicky.blogspot.com.au/2012/05/predictive-analytics-data-preparation.html
fixIris1 <- impute(irissample[,1:4], what='mean')
# alternative in discussion: Amelia