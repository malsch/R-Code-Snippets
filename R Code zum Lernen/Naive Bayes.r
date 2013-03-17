#########
## Naive Bayes, see explanation at http://horicky.blogspot.com.au/2012/06/predictive-analytics-neuralnet-bayesian.html
#########
#highly scalable

library(e1071)
# Can handle both categorical and numeric input, 
# but output must be categorical
model <- naiveBayes(Species~., data=iristrain)
prediction <- predict(model, iristest[,-5])
table(prediction, iristest[,5])

## prediction   setosa versicolor virginica
## setosa         10          0         0
## versicolor      0         10         2
## virginica       0          0         8
