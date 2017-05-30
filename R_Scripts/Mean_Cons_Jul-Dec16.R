d = read.table('https://raw.githubusercontent.com/EmBro/MasterThesis/master/Data/Home/Data_Home_Jul16-Feb17.csv',
               dec = ',', sep = ';', header = T)

means = aggregate(kWh ~ Hour, d, mean)

meanmean = mean(means$kWh)

plot(means$kWh, type = 'l', col = 'blue', xlab = 'Hours', ylab = 'kWh')
abline(h = meanmean, col = 'red')

library('ggplot2')
library("Rmisc", lib.loc="/Library/Frameworks/R.framework/Versions/3.3/Resources/library")

p = ggplot(d = d, aes(x = Hour, y = kWh, colour = kWh)) + 
  geom_point() + 
  geom_line() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

plot(p)


tgc <- summarySE(d, measurevar = "kWh", groupvars = 'Hour')

ggplot(tgc, aes(x = Hour, y = kWh, colour=kWh)) + 
  geom_errorbar(aes(ymin = kWh - ci, ymax = kWh + ci), width = .1) +
  geom_line() +
  geom_point() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

