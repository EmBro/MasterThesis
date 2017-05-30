d_MT_gon = read.table(url('https://raw.githubusercontent.com/EmBro/MasterThesis/master/Data/Bilka_Temperature/Cool_Displays_50-65.csv'),
               sep = ',', dec = '.', header = T)

m55 = mean(d_MT_gon$X055)
m58 = mean(d_MT_gon$X058)

par(mfrow = c(2,2))

hist(d_MT_gon$X055,
     breaks = 100,
     freq = T,
     main = 'Histogram of MT gondola X55',
     xlab = 'Temperature')
abline(v = m55, col = 'green')
abline(v = 5, col = 'red')

plot(d_MT_gon$X055, type = 'l',
     main = 'Lineplot of MT gondola X55',
     ylab = 'Temperature')
abline(h = m55, col = 'green')
abline(h = 5, col = 'red')


hist(d_MT_gon$X058,
     breaks = 100,
     freq = T,
     main = 'Histogram of MT gondola X58',
     xlab = 'Temperature')
abline(v = m58, col = 'green')
abline(v = 5, col = 'red')


plot(d_MT_gon$X058, type = 'l',
     main = 'Lineplot of MT gondola X58',
     ylab = 'Temperature')
abline(h = m58, col = 'green')
abline(h = 5, col = 'red')

stargazer(d_MT_gon)


