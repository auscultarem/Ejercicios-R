#graficos en 3D
install.packages("plot3D")
library(plot3D)

mtcars <- read.csv("Documentacion de R/r-course-master/data/tema7/mtcars.csv")
head(mtcars)


rownames(mtcars) = mtcars$X # Cambio el nombre de los renglones por el nombre 
#la columna X
mtcars$X = NULL #Elimino la columna X poruqe ya no es necesaria.
head(mtcars)

scatter3D(x= mtcars$disp,
          y= mtcars$wt,
          z= mtcars$mpg,
          clab =  c("Millas/Galeon"),
          pch=18,
          cex=0.5,
          theta = 18,
          phi = 20,
          main = "Coches de los 70",
          xlab = "Dezplazamiento (cu.in)",
          ylab = "Peso (x1000lb)",
          zlab = "Millas por galeon",
          bty = "g")

text3D( x=mtcars$disp,
        y=mtcars$wt,
        z=mtcars$mpg,
        labels = rownames(mtcars),
        add = TRUE,
        colkey = FALSE,
        cex =0.5)

data(VADeaths)
head(VADeaths)
hist3D(z = VADeaths,
       scale = FALSE,
       expand = 0.01,
       bty ="g", phi = 35,
       col = "#1188CC", border = "black",
       shade =  0.2, space = 0.3, ticktype = "detailed")

scatter3D( x = mtcars$disp,
           y = mtcars$wt,
           z = mtcars$mpg,
           type = "h")

