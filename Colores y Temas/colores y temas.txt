#labels an legends
#ggtitle(titulo)
#xlab(eje x)
#Ylab(eje y)
#labs(....)

library(ggplot2)
tooth <- read.csv("Documentacion de R/r-course-master/data/tema7/ToothGrowth.csv")
head(tooth)

#box plot
ggplot(tooth, aes(x = dose, y = len, fill = as.factor(dose)))+
  geom_boxplot()+
  ggtitle("Crecimiento dental en funcion de una dosis (mg/dia) de vitamina C")+
  xlab("Dosis de vitamina C (mg/dia)")+
  ylab("Crecimiento dental (en mm)") +
  labs(fill = "Dosis en mg/dia") +
  theme(legend.position = "top")
  guides(fill=FALSE)
  
ggplot(tooth, aes(x=dose, y= len))+
  geom_boxplot()+
  theme_bw()+
  theme_dark()
  theme_classic()+
  theme_grey()+
  #theme(plot.background = element_rect(fill= "darkblue"))
  theme(axis.text.x = element_text(face = "bold",
                                   family = "Times",
                                   size = 14,
                                   angle = 45,
                                   color= "#0000FF",
                                   axis.text.y = element_text(face ="italic",
                                                              family = "Courier",
                                                              size = 14,
                                                              angle = 45,
                                                              color= "#0000FF")
                                   ))+
   theme(panel.border = element_blank())+
    theme(panel.grid.mayor = element_blank(),
          panel.grid.minor = element_blank())
  