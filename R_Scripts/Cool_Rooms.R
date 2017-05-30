d_MT_Rooms = read.table(url('https://raw.githubusercontent.com/EmBro/MasterThesis/master/Data/Bilka_Temperature/Cool_Rooms.csv'),
               sep = ',', dec = '.', header = T)


stargazer(d_MT_room)

m25 = mean(d_MT_Rooms$X025, na.rm = T)
m15 = mean(d_MT_Rooms$X015)


par(mfrow = c(2,2))

hist(d_MT_Rooms$X025,
     breaks = 100,
     freq = T,
     main = 'Histogram of MT X025',
     xlab = 'Temperature')
abline(v = m25, col = 'green')
abline(v = 5, col = 'red')


plot(d_MT_Rooms$X025, type = 'l',
     main = 'Lineplot of MT X025',
     ylab = 'Temperature')
abline(h = m25, col = 'green')
abline(h = 5, col = 'red')

hist(d_MT_Rooms$X015,
     breaks = 100,
     freq = T,
     main = 'Histogram of MT X015',
     xlab = 'Temperature')
abline(v = m15, col = 'green')
abline(v = 5, col = 'red')


plot(d_MT_Rooms$X015, type = 'l',
     main = 'Lineplot of MT X015',
     ylab = 'Temperature')
abline(h = m15, col = 'green')
abline(h = 5, col = 'red')


library(stargazer)

stargazer(d_MT_Rooms)

