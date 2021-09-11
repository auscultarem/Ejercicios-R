#Redes
library(igraph)

#grafico dirigido
g.dir <- graph(edges =  c(1,2,2,3,2,4,1,4,5,5,3,6,5,6), n=6)

#grafico no dirigido
g.n_dir <- graph(edges =  c(1,2,2,3,2,4,1,4,5,5,3,6,5,6), n=6,
                 directed = FALSE)

par(mfgrow = c(1,2))
plot(g.dir)
plot(g.n_dir)

g_isolated <- graph(c("Juan", "Maria",
                      "Maria", "Ana",
                      "Ana", "Juan",
                      "Jose", "Maria",
                      "Pedro", "Jose",
                      "Joel","Pedro"),
                    isolates = c("Carmen",
                                 "Antonio",
                                 "Mario",
                                 "Vicente"))
par(mfgrow = c(1,1))
plot(g_isolated, edge.arrow.size = 1,
     vertex.color = "gold", vertex.size = 15,
     vertex.frame.color = "gray",
     vertex.label.color = "black",
     vertex.label.cex = 0.8,
     vertex.label.dsit = 2,
     edge.curve =0.2
     )

