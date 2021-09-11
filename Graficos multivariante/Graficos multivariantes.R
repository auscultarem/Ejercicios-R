#Plot multivariante

library(ggplot2)
install.packages("GGally")
library(GGally)

bike <- read.csv("Documentacion de R/r-course-master/data/tema7/daily-bike-rentals.csv")
head(bike)

bike$season <- factor(bike$season,
                      levels = c(1,2,3,4),
                      labels = c("Invierno","Primavera","Verano","Otoño"))

bike$weathersit <-factor(bike$weathersit,
                         levels = c(1,2,3),
                         labels = c("Despejado","Nublado","LLuvia"))

bike$weekday <- factor(bike$weekday,
                       levels =  0:6,
                       labels = c("D","L","M","X","J","V","S"))

hist(bike$windspeed)

bike$windspeed.fac <- cut(bike$windspeed, breaks = 3,
                          labels = c("Poco", "Medio", "Elevado"))

head(bike)

ggplot(bike, aes(x=temp, y=cnt))+
 geom_point(size= 3, aes(color= windspeed.fac))+
 theme(legend.position = "bottom")+
 geom_smooth(method = "lm", se= FALSE, col="red")+
 facet_grid(weekday ~ season) 
 
auto <- read.csv("Documentacion de R/r-course-master/data/tema7/auto-mpg.csv")
auto$cylinders <-factor(auto$cylinders,
                        levels = c(3,4,5,6,8),
                        labels = c("3C","4C","5C","6C","8C"))
ggpairs(auto[,2:5],
        aes(colour = cylinders, alpha = 0.4),
        title= "Analisis Multivariante de coches",
        upper = list(continuous = "density"),
        lower = list(combo = "denstrip"))+
  theme(plot.title = element_text(hjust = 0.5))
