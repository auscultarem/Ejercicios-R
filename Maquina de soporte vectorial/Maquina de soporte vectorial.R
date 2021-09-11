install.packages("e1071")
library(caret)
library(e1071)

banknote <- read.csv("Documentacion de R/r-course-master/data/tema3/banknote-authentication.csv")
banknote$class = factor(banknote$class)


set.seed(2018)
t.ids <- createDataPartition(banknote$class, p= 0.7, list = FALSE)
mod <- svm(class ~. , data = banknote [t.ids, ])

table(banknote[t.ids,"class"], fitted(mod), dnn = c("Actual", "Predicho"))

#vamos  a validar el modelo.
pred <- predict(mod, banknote[-t.ids,])
table(banknote[-t.ids, "class"], pred, dnn = c("Actual", "Predicho"))

plot(mod, data = banknote[t.ids,], skew ~ variance)
plot(mod, data = banknote[-t.ids,], skew ~variance)

tuned <- tune.svm(class ~ ., data = banknote[t.ids,], 
                  gamma = 10^(-6:-1), cost = 10^(1:2))

summary(tuned)
