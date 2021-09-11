library(mice)

housing.data <-read.csv("Documentacion de R/r-course-master/data/tema1/housing-with-missing-value.csv",
                      header = TRUE,
                      stringsAsFactors = FALSE)

columns <- c("ptratio", "rad")

#se contruye un modelo para rempalzar los valores NA con la funcion mice.
imputed_data <- mice(housing.data[ ,names(housing.data) %in% columns],
                     m = 5,
                     maxit = 50,
                     method = "pmm",#Predictive mean machine.
                     seed = 2018
                     )
##pmm - comaracion predictiva de medias
##Logreg - regresion logistica
##polyreg - regresion logistica politomica
## plor- modelo de probabilidades proporcionales.

summary(imputed_data)


complete.data <- mice::complete(imputed_data)

#remplazo los valores ontenidos en imputed data en el datafrare original.
housing.data$ptratio <- complete.data$ptratio
housing.data$rad <- complete.data$rad

#Validamos que ya no hay valores Na en nuestro data frame con la funcion anyNA
anyNA(housing.data)


#Para usar aregImpute es necesaria la liberia Hmisc
#library(Hmisc)

housing.data.1 <-read.csv("Documentacion de R/r-course-master/data/tema1/housing-with-missing-value.csv",
                        header = TRUE,
                       stringsAsFactors = FALSE)

impute_arg <- aregImpute(~ptratio + rad, data = housing.data.1, n.impute = 5)

#Al obervar este valor debemos de tener un valor cercano a 1
impute_arg

#podemos ver los 40 valores obtenidos calculaods en este modelo.
impute_arg$imputed$rad