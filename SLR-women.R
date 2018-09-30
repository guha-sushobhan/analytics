fit=lm(weight~height, data=women)
summary(fit)
range(women)
(ndata=data.frame(height=c(58.5,163)))
(p=predict(fit, newdata = ndata))
cbind(ndata, p)
plot(fit)

sum(fitted())