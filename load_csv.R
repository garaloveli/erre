#library(leaps)
#library(faraway)
#library(MASS)

setwd("~/Projects/erre/")

base<-read.csv(file="salario - gasto vivienda.csv",head= TRUE,sep=";")

plot(base$Gasto,base$Salario)

base.lm <- lm(Gasto~.,data=base)

summary(base.lm)

#install.packages("car")
library(car)

#gr?fico de residuos
plot(base.lm$model$Salario,base.lm$residuals)
abline(0,0)

#Test de homocedasticidad
ncvTest (base.lm)

#Test por la normalidad de los residuos

#grafico entre cuartil teorico y estimado
qqnorm(base.lm$residuals)
qqline(base.lm$residuals)

#test de Shapiro-Wilk 
shapiro.test(base.lm$residuals)

#test de Durbin-Watson
durbinWatsonTest(base.lm$residuals)