ozone.data <- read.csv("Documentacion de R/r-course-master/data/tema1/ozone.csv",
                       stringsAsFactors = FALSE)

#realizamos un boxplot para visulizar la infromacion.
outliers_values <- boxplot(ozone.data$pressure_height,
                           main = "Preasure Height",
                           boxwex = 0.5)

summary(ozone.data$pressure_height)

boxplot(pressure_height ~ Month,
        data = ozone.data,
        main = "Presure height per Month")

boxplot(ozone_reading ~ Month,
       data = ozone.data,
       main = "Ozone Reading per Month")$out

mtext("hola")

impute_ouliers <- function(x, removeNA = TRUE){
  quantiles <- quantile(x, c(0.05, 0.95), na.rm = removeNA)
  x[x<quantiles[1]] <- mean(x, na.rm = removeNA)
  x[x>quantiles[2]] <- median(x, na.rm = removeNA) 
  x
}

impute_data <- impute_ouliers(ozone.data$pressure_height)

par(mfrow = c(1,2))

boxplot(ozone.data$pressure_height, main = "Presion con outliers")
boxplot(impute_data, main = "Presion sin outliers")

replace_outliers <-function(x, removeNA = TRUE){
  qrts <- quantile(x, probs = c(0.25, 0.75), na.rm = removeNA)
  caps <- quantile(x, probs= c(.05, .95), na.rm = removeNA)
  iqr <- qrts[2]- qrts[1]
  h <- 1.5 * iqr
  x[x<qrts[1]-h] <- caps[1]
  x[x>qrts[2]+h] <- caps[2]
  x
}

capped_preasure_height <- replace_outliers(ozone.data$pressure_height)

par(mfrow = c(1,2))

boxplot(ozone.data$pressure_height, main = "Presion con outliers")
boxplot(capped_preasure_height, main = "Presion sin ouliers")
