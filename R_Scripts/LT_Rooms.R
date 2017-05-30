d_LT_Rooms = read.table(url('https://raw.githubusercontent.com/EmBro/MasterThesis/master/Data/Bilka_Temperature/Freez_Rooms.csv'),
                   sep = ',', dec = '.', header = T)

d_LT_Rooms = na.omit(d_LT_Rooms)

median(d_LT_Rooms$X036) - mean(d_LT_Rooms$X036)

par(mfrow = c(2,2))
hist(d_LT_Rooms$X042, type = 'l', breaks = 50, freq = F,
     main = 'Histogram of LT X042 ')

m44 = mean(d_LT_Rooms$X044)
m37 = mean(d_LT_Rooms$X037)

hist(d_LT_Rooms$X044,
     breaks = 100,
     freq = T,
     main = 'Histogram of LT X044',
     xlab = 'Temperature')
abline(v = m44, col = 'green')
abline(v = -18, col = 'red')

plot(d_LT_Rooms$X044,type = 'l',
     main = 'Lineplot of LT X044',
     ylab = 'Temperature')
abline(h = m44, col = 'green')
abline(h = -18, col = 'red')

hist(d_LT_Rooms$X037,
     breaks = 100,
     freq = T,
     main = 'Histogram of LT X037',
     xlab = 'Temperature')
abline(v = m37, col = 'green')
abline(v = -18, col = 'red')

plot(d_LT_Rooms$X037,type = 'l',
     main = 'Lineplot of LT X037',
     ylab = 'Temperature')
abline(h = m37, col = 'green')
abline(h = -18, col = 'red')

stargazer(d_LT_Rooms)
warnings()


?abline
