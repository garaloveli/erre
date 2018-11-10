setwd("~/Projects/erre/")

#install.packages("readxl")
#ipc_pdj<-read.xlsx("IPC-PDJ.xlsx", sheetIndex = 1)

#install.packages("gdata")

require(gdata)

ipc_pdj <- read.xls("IPC-PDJ.xlsx", sheet = 1, header = TRUE)

plot(ipc_pdj$PDJ,ipc_pdj$IPC)

ipc_pdj.lm <- lm(PDJ~.,data=ipc_pdj)

summary(ipc_pdj.lm)


library(car)

plot(ipc_pdj.lm$model$IPC,ipc_pdj.lm$residuals)
abline(0,0)

#Test de homocedasticidad
ncvTest (ipc_pdj.lm)

#Test por la normalidad de los residuos

#grafico entre cuartil teorico y estimado
qqnorm(ipc_pdj.lm$residuals)
qqline(ipc_pdj.lm$residuals)

#test de Shapiro-Wilk 
shapiro.test(ipc_pdj.lm$residuals)

#test de Durbin-Watson
durbinWatsonTest(ipc_pdj.lm$residuals)
