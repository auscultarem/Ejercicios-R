#Distribution plots
library(ggplot2)

geiser <- read.csv("Documentacion de R/r-course-master/data/tema7/geiser.csv")
head(geiser)

plot <- ggplot(geiser, aes(x= waiting))
plot + geom_histogram()
plot + geom_histogram(binwidth = 5,
                      fill = "white", colour = "black")
#se va graficar las frecuencias relativas
ggplot(geiser, aes(x= waiting, y = ..density..))+
  geom_histogram(fill = "cornsilk",color = "grey60", size = 0.2)+
  geom_density() + xlim(35, 105)


#Graficando la otra variable
ggplot(geiser, aes(x= eruptions, y = ..density..))+
  geom_histogram(fill = "cornsilk",color = "grey60", size = 0.2)+
  geom_density() + xlim(0,7)