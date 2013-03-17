## machine learning - data preparation
# sampling large data sets
index <- sample(1:nrow(iris), 10, replace=T)
iris[ind,]
# Indexvektor erzeugen, der Datensatz in k gleich große Teile unterteilt
n <- length(RatingS)
k <- 3 # k=3 empfiehlt sich bei großen Datensätzen: erster Teil um Modelle zu bauen, zweiter Teil zum Modell Ensambling, dritter Teil für Güteberechnung
T.index <- split(sample(1:n), rep(1:k, length = n))  # ausgewählte Werte in den jeweiligen Folds
L.index <- lapply(T.index, function(i) setdiff(1:n, i)) # übrige Werte in den jeweiligen Folds

# normalize data
# x-mean(x)/standard deviation
scaleiris <- scale(iris[, 1:4])

# zusätzliche Variablen erzeugen, variable transformation
library("plyr")
mutate(airquality, Temp = (Temp - 32) / 1.8, OzT = Ozone / Temp)


# Discretize numeric value into categories, binarize numerical values -> see http://horicky.blogspot.com.au/2012/05/predictive-analytics-data-preparation.html
# aggregieren, data frames mergen
aggregate
merge


# Box-Cox-Transformation for stability of variance, additivity of effects and symmetry of the density
plot(density(Prestige$income))
qqnorm(Prestige$income)
qqline(Prestige$income)
summary(box.cox.powers(cbind(Prestige$income)))
## bcPower Transformation to Normality 
## 
## Est.Power Std.Err. Wald Lower Bound Wald Upper Bound
## Y1    0.1793   0.1108          -0.0379           0.3965
## 
## Likelihood ratio tests about transformation parameters
## LRT df         pval
## LR test, lambda = (0)  2.710304  1 9.970200e-02
## LR test, lambda = (1) 47.261001  1 6.213585e-12
transformdata <- box.cox(Prestige$income, 0.18)
plot(density(transformdata))
qqnorm(transformdata)
qqline(transformdata)
