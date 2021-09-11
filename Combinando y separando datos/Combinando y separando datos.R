install.packages("tidyr")
library(tidyr)

crime.data <- read.csv("Documentacion de R/r-course-master/data/tema1/USArrests.csv",
                       stringsAsFactors = FALSE)

#añade una columna con los nombres de cada fila al data frame que ya se tiene
crime.data <- cbind(state = rownames(crime.data), crime.data)

#la funcion gather hace un array asociativo de las variables.una combinacion de
#las variables
crime.data.1 <- gather(crime.data,
                       key = "crime_type", value = "arrest_estimate",
                       Murder: UrbanPop)

#Combinara o asociara todas la variables menos state.
crime.data.2 <-gather(crime.data,
                      key = "crime_type",
                      value = "arrest_estimate",
                      -state)

crime.data.3 <- gather(crime.data,
                       key = "crime_type",
                       value = "arrest_estimate",
                       Murder, Assault)

#Caso de uso de la funcion spread para separar informacion.
crime.data.4 <- spread(crime.data.2,
                        key = "crime_type",
                        value = "arrest_estimate")

#Para combinar dos colunas tambie se puede usar unite
crime.data.5 <- unite(crime.data, col = "Murder_Assault",
                      Murder, Assault,
                      sep = "_")

#Para separar una columna que se habia unido se usa separate
crime.data.6 <- separate(crime.data.5,
                         col = "Murder_Assault",
                         into = c("Murder","Assault"),
                         sep = "_")
