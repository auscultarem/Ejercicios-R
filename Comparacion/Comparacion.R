data <- read.csv("Documentacion de R/r-course-master/data/tema2/daily-bike-rentals.csv")

str(data)

#Cambiamos a factor la columa de season
data$season <- factor(data$season, levels = c(1,2,3,4),
                      labels = c("Invierno", "Primavera", "Verano","Otoño"))

#Cambiamos a faactor el dia que se trabaja.
data$workingday <- factor(data$workingday, levels = c(0,1),
                          labels = c("Festivo","De trabajo"))

#Cambiamos a factor el timepo
data$weathersit <- factor(data$weathersit, levels = c(1,2,3),
                          labels = c("Despejado", "Nublado","Lluvia\Nieve ligera"))

data$dteday <- as.Date(data$dteday, format = "
                       %Y-%m-%d")

#sirve para evitar estar escribiendo data$
attach(data)

par(mfrow = c(2,2))
winter <- subset(data, season == "Invierno")$cnt #para obtener solo el conteo.
spring <- subset(data, season == "Primavera")$cnt
summer <- subset(data, season == "Verano")$cnt
fall <- subset(data,season == "Otoño")$cnt

#Se usa prob poque es un histograma de frecuencias relaativas
hist(winter, prob = TRUE, xlab = "Alquiler diario en Invierno", main = "")
lines(density(winter))
abline(v = mean(winter), col = "red")
abline(v = median(winter), col= "blue")


hist(spring, prob = TRUE, xlab = "Alquiler diario en primavera", main = "")
lines(density(spring))
abline(v = mean(spring), col = "red")
abline(v = median(spring), col = "blue")


hist(summer, prob = TRUE, xlab = "Alquiler diario en Verano", main = "")
lines(density(summer))
abline(v = mean(summer), col = "red")
abline(v = median(summer), col = "blue")

hist(fall, prob = TRUE, xlab = "Alquiler diario en Otoño", main = "")
lines(density(fall))
abline(v = mean(fall), col = "red")
abline(v = median(fall), col = "blue")

install.packages("beanplot")
library(beanplot)

par(mfgrow = c(1,1))
beanplot(data$cnt ~ data$season, col = c("red", "blue", "yellow"))


#analisis de Causalidad
install.packages("lattice")
library(lattice)
bwplot(cnt ~ weathersit, data = data,
       layout = c(1,1), xlab = "Pronostico del tiempo",
       ylab = "Frecuencias",
       par.settings = list(box.rectangle = list(fill = c("red", "yellow", "green")))
)


