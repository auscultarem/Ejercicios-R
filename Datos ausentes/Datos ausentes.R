housing.data <- read.csv("Documentacion de R/r-course-master/data/tema1/housing-with-missing-value.csv",
                         header = TRUE, stringsAsFactors = FALSE)

summary(housing.data)


#Primer variante para remover todos los valores NA.
housing.data.1 <- na.omit(housing.data)
summary(housing.data.1)

#Eliminar las NA de ciertas columnas
drop_na <- c("rad")
housing.data.2 <- housing.data[
  complete.cases(housing.data[,!(names(housing.data))%in% drop_na]),]

summary(housing.data.2)

##Eliminar toda una columnas del dataframe.
housin.data.remove.rad <- housing.data
housin.data.remove.rad$rad <- NULL
summary(housin.data.remove.rad)

#Eliminar dos columnas que continen valores NA
drops <- c("rad", "ptratio")
housing.data.3 <- housing.data[,!(names(housing.data)%in% drops)]
summary(housing.data.3)

##Completar informacion faltante
install.packages("Hmisc")
library(Hmisc)

#Se realiza una copia del housing original
housing.data.copy1 <- housing.data

#con la funcion impute vamos  a ramplazar los valores Na con el promedio mean.
housing.data.copy1$ptratio <- impute(housing.data.copy1$ptratio, mean)
housing.data.copy1$rad <- impute(housing.data.copy1$rad, mean)
summary(housing.data.copy1)


#Segundo ejemplo remplazando los valores NA con la meadian median
housing.data.copy2 <- housing.data
#con la funcion impute vamos  a ramplazar los valores Na con la mediana.
housing.data.copy2$ptratio <- impute(housing.data.copy2$ptratio, median)
housing.data.copy2$rad <- impute(housing.data.copy2$rad, median)
summary(housing.data.copy2)

#Tercer ejemplo remplazando los valores NA con un valor especifico
housing.data.copy3 <- housing.data
#con la funcion impute vamos  a ramplazar los valores Na con la mediana.
housing.data.copy3$ptratio <- impute(housing.data.copy3$ptratio, 18)
housing.data.copy3$rad <- impute(housing.data.copy3$rad, 7)
summary(housing.data.copy3)


#con este paque observare el patron de la informacion que falta.
install.packages("mice")
library(mice)

#este comando me ayuda a visualizar donde tengo valores NA.
md.pattern(housing.data)

install.packages("VIM")
library(VIM)

aggr(housing.data,
     col = c("green", "red"),
     numbers = TRUE,
     sortvars = TRUE, 
     labels = names(housing.data),
     cex.axis = 1,
     gap = 5,
     ylab = c("Histogramas de NAs", "Patron")
     )
