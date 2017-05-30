d_Cool_Wall = read.table(url('https://raw.githubusercontent.com/EmBro/MasterThesis/master/Data/Bilka_Temperature/Cool_Walls_70-80.csv'),
                   sep = ',', dec = '.', header = T)
d_Cool_Wall = d_Cool_Wall[,-9:-12]

m72 = mean(d_Cool_Wall$X072)
m76 = mean(d_Cool_Wall$X076, na.rm = T)

par(mfrow = c(2,2))

hist(d_Cool_Wall$X072,
     breaks = 100,
     freq = T,
     main = 'Histogram of MT display X72',
     xlab = 'Temperature')
abline(v = m72, col = 'green')
abline(v = 5, col = 'red')

plot(d_Cool_Wall$X072, type = 'l',
     main = 'Lineplot of MT display X72',
     ylab = 'Temperature')
abline(h = m72, col = 'green')
abline(h = 5, col = 'red')


hist(d_Cool_Wall$X076,
     breaks = 100,
     freq = T,
     main = 'Histogram of MT display X76',
     xlab = 'Temperature')
abline(v = m76, col = 'green')
abline(v = 5, col = 'red')


plot(d_Cool_Wall$X076, type = 'l',
     main = 'Lineplot of MT display X76',
     ylab = 'Temperature')
abline(h = m76, col = 'green')
abline(h = 5, col = 'red')

x = d_Cool_Wall$X076
x = na.rm(x)
x = d_Cool_Wall$X076[d_Cool_Wall$X076 <= 5]

x = na.omit(x)

par(mfrow = c(1,1))
qqnorm(x)
qqline(x)
qqplot(d_Cool_Wall$X070)

m = mean(x)
std = sd(x)

hist(x, prob = T)
curve(dnorm(x, mean=m, sd=std),
      col="darkblue", lwd=2, add=TRUE, yaxt="n")
abline(v = m)
abline(v = median(x))

s = as.data.frame(summary(d_Cool_Wall))
s

stargazer(d_Cool_Wall)
