students <- read.csv("Documentacion de R/r-course-master/data/tema1/data-conversion.csv")

#Se definen unos break point para definir coo se va a categorizar las variables
bp <- c(-Inf, 10000, 31000, Inf)
# defnicon d elos nombres de las columnas
names <- c("Low", "Average","High")

# la funcion cut me ayuda a categorizar las lovalores numericos deacuerdo a las 
#variables dadas
students$Income.cat <- cut(students$Income, breaks = bp, labels = names)

#Aqui se muestra como R define el nombre d elos intervalos que le di en el break
#point.
students$Income.cat2 <- cut(students$Income, breaks = bp)

#Si deseo que R realice la categorizacion de los valores numericos hago lo
#siguiente
students$Income.cat3 <- cut(students$Income, breaks = 4,
                            labels = c("Level 1", "Level 2",
                                       "Level 3", "Level 4"))

#Dummy variables -> variables ficticias
students <- read.csv("Documentacion de R/r-course-master/data/tema1/data-conversion.csv")
install.packages("dummies")
library(dummies)

# cracion de un dataframe dummy.
students.dummy <- dummy.data.frame(students, sep = ".")


dummy.data.frame(students,names = c("State", "Gender"), sep = ".")