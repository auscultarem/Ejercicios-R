data <- read.csv("Documentacion de R/r-course-master/data/tema1/missing-data.csv", na.strings = "")

data.cleaned <- na.omit(data)

is.na(data[4,2])
is.na(data[4,1])
is.na(data$Income) #para averiguar si exitsen valores NA en una columna de mi data frame.


#Limiar NA de solamente la variable Income
data.income.cleaned <- data[!is.na(data$Income), ] #limpia la columna de income de valores NA.

#Nos muestra si las filas estan completas.
complete.cases(data)

# En esta segunda opcion se realiza lipieza usando complete.cases
#Filtro todas las filas completas y me qudo con todas las columnas.
data.cleaned.2 <- data[complete.cases(data),]

#convertir los ceros de ingresos en NA.
data$Income[data$Income == 0] <- NA

#Medidas de centralizacion y dispercion.
mean(data$Income)
mean(data$Income, na.rm = TRUE)

sd(data$Income)
sd(data$Income, na.rm = TRUE)

#Remplaza los valores NA con la media en la columna de income.
data$Income.mean <- ifelse(is.na(data$Income), 
                           mean(data$Income, na.rm = TRUE),
                           data$Income)
#x es un vector de datos que puede contener NA
rand.impute <- function(x) {
  #Missing contiene un vector de valores T/F dependieno del NA de x
  missing <- is.na(x)
  #n.missin contiene cuantos valores son NA dentro de X
  n.missing <- sum(missing)
  #x.obs son los valores conocidos que tienen dato diferente de NA en X
  x.obs <- x[!missing]
  #por defecto, devolvere lo mismo que habia entrado por parametro.
  imputed <- x
  #En los valores que faltaban, los remplazamos por un muestra de los que si conocemos.
  #Tecnica estadistica (MAS= muestra Aleatoria simple)
  imputed[missing] <- sample(x.obs, n.missing, replace = TRUE)
  return(imputed)
}

#imputar valores aleatorios
random.impute.data.frame <- function(dataframe, cols){
  names <- names(dataframe)
  for(col in cols){
    name <- paste(names[col], "imputed", sep = ".")
    dataframe[name] = rand.impute(dataframe[,col])
  }
  dataframe
}


data <- read.csv("Documentacion de R/r-course-master/data/tema1/missing-data.csv", na.strings = "")
data$Income[data$Income == 0] <- NA
data <- random.impute.data.frame(data, c(1,2))
