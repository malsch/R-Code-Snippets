
##################
## ein einzelner Baum
##################
library(rpart)
#Train the decision tree
treemodel <- rpart(Species~., data=iristrain)
plot(treemodel)
text(treemodel, use.n=T)
#Predict using the decision tree
prediction <- predict(treemodel, newdata=iristest, type='class')
#Use contingency table to see how accurate it is
table(prediction, iristest$Species)
## prediction   setosa versicolor virginica
## setosa         10          0         0
## versicolor      0         10         3
## virginica       0          0         7

#########
## randomForest
#########
library(randomForest)
rf <- randomForest(train, labels, xtest=test, ntree=1000) # from kaggle for number classification
predictions <- levels(labels)[rf$test$predicted]
## oder
#Train 100 trees, random selected attributes
model <- randomForest(Species~., data=iristrain, nTree=500)
#Predict using the forest
prediction <- predict(model, newdata=iristest, type='class')
table(prediction, iristest$Species)
importance(model)

#########
## Gradient boosted Trees
#########
library(gbm)
gbm(formula, data=iris2, 
    n.trees=1000, 
    interaction.depth=2,
    distribution="bernoulli")
