d_end = read.table(url('https://raw.githubusercontent.com/EmBro/MasterThesis/master/Data/Bilka_Temperature/End_Displays_130-161.csv'),
                  sep = ',', dec = '.', header = T)

m135 = mean(d_end$X135)
m155 = mean(d_end$X155)

par(mfrow = c(2,2))

hist(d_end$X135,
     breaks = 100,
     freq = T,
     main = 'Histogram of LT gondola X135',
     xlab = 'Temperature')
abline(v = m135, col = 'green')
abline(v = -18, col = 'red')

plot(d_end$X135, type = 'l',
     main = 'Lineplot of LT gondola X135',
     ylab = 'Temperature')
abline(h = m135, col = 'green')
abline(h = -18, col = 'red')


hist(d_end$X155,
     breaks = 100,
     freq = T,
     main = 'Histogram of MT gondola X155',
     xlab = 'Temperature')
abline(v = m155, col = 'green')
abline(v = 5, col = 'red')

plot(d_end$X155, type = 'l',
     main = 'Lineplot of MT gondola X155',
     ylab = 'Temperature')
abline(h = m155, col = 'green')
abline(h = 5, col = 'red')

stargazer(d_end)

