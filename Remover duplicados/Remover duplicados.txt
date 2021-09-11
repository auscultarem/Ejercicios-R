family.salary <- c(4000, 6000, 5000, 8000, 6000, 7000, 6000)
family.size <- c(4, 3, 2, 2, 3, 4, 3)
family.car <- c("Lujo","Compacto","Utilitario","Lujo",
              "Compacto","Compacto","Compacto")
family <- data.frame(family.salary,family.size,family.car)
family.unique <- unique(family)

duplicated(family)

#devuelve que filas con duplicadas de una fila ya existente.
family[duplicated(family), ]