s <- seq(.01, 0.99, 0.01)
s
qn <- qnorm(s)
qn

df <- data.frame(p = s, q = qn)

sample <- rnorm(200)
quantile (sample, probs =  s)

#qqnorm
trees
par(mfrow = c(1,1))
qqnorm(trees$Height)
qqnorm(randu$x)

#qqplot
randu
n <- length(randu$x)
n
y <- qunif(ppoints(400))
y
qqplot(y, randu$x)
