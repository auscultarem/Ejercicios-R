housing <- read.csv("Documentacion de R/r-course-master/data/tema1/BostonHousing.csv")

housing.z <- scale(housing)

scale.many = function(dataframe, cols){
  names <- names(dataframe)
  for(col in cols){
    name <- paste(names[col], "z", sep = ".")
    dataframe[name] <-scale(dataframe[, col])
  }
  cat(paste("Hemos normalizado", length(cols), " variables(s)"))
  dataframe
}

hounsing <- scale.many(housing, c(1,3, 5:8)) 
