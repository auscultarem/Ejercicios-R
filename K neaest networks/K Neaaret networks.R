install.packages(c("caret","Class"))
library(caret)
library(class)

vac <- read.csv("Documentacion de R/r-course-master/data/tema3/vacation-trip-classification.csv")
vac$Income.z <- scale(vac$Income) # esta funcio normaliza la columna Z, resta la media y divide entre la desviacion tipica.
vac$Family_size.z <- scale(vac$Family_size) # Columna normalizada

set.seed(2018)

#se ocupa realizar tres particiones. Este grupo es de emtrenamiento
t.ids <- createDataPartition(vac$Result, p= 0.5, list= FALSE)
train <- vac[t.ids, ]
temp <- vac[-t.ids, ]

#Conjunto de validacion
v.ids <- createDataPartition(temp$Result, p= 0.5, list = FALSE)
val <- temp[v.ids, ]
test <- temp[v.ids, ]


#prediccion numeor 1
#Se toman los conjuntos normalizados columna 4 y 5 y se predice con respecto
#a la tercer columna que es Resultado.
pred1 <- knn(train[ ,4:5], val[,4:5], train[,3], k = 1)

# Se genera una matrix de cinfucion para observar el resultado.
errmat1 <- table(val$Result, pred1, dnn = c("Actual","Predicho"))
errmat1

#con K=2
pred2 <- knn(train[ ,4:5], val[,4:5], train[,3], k = 2)

# Se genera una matrix de cinfucion para observar el resultado.
errmat1 <- table(val$Result, pred2, dnn = c("Actual","Predicho"))
errmat1

knn.automate <- function(tr_predictors, val_predictors,tr_target,
                         val_target, start_k, end_k){
  for (k in start_k:end_k) {
    pred <- knn(tr_predictors, val_predictors, tr_target, k)
    tab <- table(val_target, pred, dnn = c("Actual", "Predichos"))
    cat(paste("Matriz de confucion para k = ",k,"\n"))
    cat("=============================\n")
    print(tab)
    cat("-----------------------------")
  }
  
}


knn.automate(train[,4:5], val[,4:5], train[,3], val[,3], 1, 8)

#se puede calcular el k nearest con una funcion dentro de caret.
trcntrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
caret_knn_fit <- train(Result ~ Family_size + Income, data = train,
                       method = "knn", trControl = trcntrl,
                       preProcess= c("center","scale"), 
                       tuneLength = 10)
caret_knn_fit

pred5 <- knn(train[,4:5], val[,4:5], train[,3], k=5, prob = TRUE)
pred5
