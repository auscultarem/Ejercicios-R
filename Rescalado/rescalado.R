install.packages("scales")
library(scales)

students <- read.csv("Documentacion de R/r-course-master/data/tema1/data-conversion.csv")

students$Income.rescaled <- rescale(students$Income)

# rescalado de 0 a 1
(students$Income - min(students$Income))/ 
  (max(students$Income) - min(students$Income))

#rescalado a porcentaje.
rescale(students$Income, to = c(0,100))

rescale.many <- function(dataframe, cols){
  names <- names(dataframe)
  for(col in cols){
    name <- paste(names[col], "rescaled", sep = ".")
    dataframe[name] <- rescale(dataframe[,col]) 
  }
  cat(paste("Hemos reescalado ", length(cols), " variable(s)"))
  dataframe
}


students <- rescale.many(students, c(1,4))
