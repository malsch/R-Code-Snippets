########
## Ridge und Lasso Regression
########

# regularized regression against overfitting, helpful for high collinearity, also good for variable selection
library(glmnet)
# Gewichtung von Ridge- und Lasso-Penalisierung: Modell: Cost == Non-regularization-cost + λ (α.Σ ||Ɵi|| + (1- α).Σ square(Ɵi))
# Wahl der Penalisierung anhand von Kreuzvalidierung
cv.fit <- cv.glmnet(as.matrix(prestige_train[,c(-4, -6)]), 
                    as.vector(prestige_train[,4]), 
                    nlambda=100, alpha=0.7, # alpha = 0.7 Mischung von Lasso und Ridge
                    family="gaussian")
plot(cv.fit)
coef(cv.fit)
## 5 x 1 sparse Matrix of class "dgCMatrix"
## 1
## (Intercept) 6.3876684930151
## education   3.2111461944976
## income      0.0009473793366
## women       0.0000000000000
## census      0.0000000000000
prediction <- predict(cv.fit, 
                      newx=as.matrix(prestige_test[,c(-4, -6)]))
# 
# try alpha = 0, Ridge regression
fit <- glmnet(as.matrix(iristrain[,-5]), 
              iristrain[,5], alpha=0, # alpha = 0 ist Ridge, alpha = 1 wäre lasso
              family="multinomial")
plot(fit) # xvar="lambda", Zeichnet Koeffizienten in Abhängigkeit von log lambda oder L1-Norm der Koeffizienten. Nützlich, wenn Anzahl der gewünschten Variablen bekannt ist.
