d_LT_gon = read.table(url('https://raw.githubusercontent.com/EmBro/MasterThesis/master/Data/Bilka_Temperature/Freez_Displays_100-115.csv'),
                   sep = ',', dec = '.', header = T)

d_LT_gon = na.omit(d_LT_gon)

m105 = mean(d_LT_gon$X105)
m115 = mean(d_LT_gon$X115)

par(mfrow = c(2,2))

hist(d_LT_gon$X105,
     breaks = 100,
     freq = T,
     main = 'Histogram of LT gondola X105',
     xlab = 'Temperature')
abline(v = m105, col = 'green')
abline(v = -18, col = 'red')


plot(d_LT_gon$X105, type = 'l',
     main = 'Lineplot of MT X105',
     ylab = 'Temperature')
abline(h = m105, col = 'green')
abline(h = -18, col = 'red')


hist(d_LT_gon$X115,
     breaks = 100,
     freq = T,
     main = 'Histogram of LT gondola X115',
     xlab = 'Temperature')
abline(v = m115, col = 'green')
abline(v = -18, col = 'red')


plot(d_LT_gon$X115, type = 'l',
     main = 'Lineplot of LT X115',
     ylab = 'Temperature')
abline(h = m115, col = 'green')
abline(h = -18, col = 'red')

library(stargazer)

stargazer(d_LT_gon)
