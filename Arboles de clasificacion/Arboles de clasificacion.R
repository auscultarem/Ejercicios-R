install.packages(c("rpart", "rpart.plot", "caret"))
library(caret)
library(rpart)
library(rpart.plot)

banknote <- read.csv("Documentacion de R/r-course-master/data/tema3/banknote-authentication.csv")

set.seed(2018)
training.ids <- createDataPartition(banknote$class, p= 0.7, list = FALSE)#crea una particion del 705 de mis datos,list = false para devolverlo en fomato array


#class ~. <-> class ~ variance +skew + cutosis + entropy
mod <- rpart(class ~ . ,
             data = banknote[training.ids,], 
             method = "class",
             control = rpart.control(minsplit = 20, cp = 0.01)) #el aro solo considerara nodos con al  menos 20 casos en su en
#su interior y in deice de complejidad de 0.01

mod

#la mejor maner ade ver esta informacion es grafiarlo
prp(mod, type = 2, extra = 104, nn= TRUE, fallen.leaves = TRUE,
    faclen = 4, varlen = 8, shadow.col = "gray") # se puede apreciar qeu crea un modelo para poer clasificar un objeto.

#Aqui se mostrara como se poda un arbol.
mod$cptable

mod.pruned <- prune(mod, mod$cptable[5, "CP"]) # me quedo con la octava componene principal.

prp(mod.pruned, type = 2, extra = 104, nn = TRUE,
    fallen.leaves = TRUE, faclen = 4, varlen = 8,
    shadow.col = "gray")

pred.pruned <- predict(mod, banknote[-training.ids,], type = "class") #modelo original

table(banknote[-training.ids,]$class, pred.pruned, dnn =  c("Actual", "Predicho"))

pred.pruned2 <- predict(mod.pruned, banknote[-training.ids,], type = "class") #modelo podado

table(banknote[-training.ids,]$class, pred.pruned, dnn =  c("Actual", "Predicho"))

pred.pruned3 <- predict(mod.pruned, banknote[-training.ids,], type = "prob") #modelo de probabilidad.

head(pred.pruned3)

install.packages("ROCR")
library(ROCR)


pred <- prediction(pred.pruned3[,2], banknote[-training.ids, "class"])
perf <- performance(pred, "tpr", "fpr")
plot(perf)
