d = read.table(url('https://raw.githubusercontent.com/EmBro/MasterThesis/master/Data/Bilka_kWh/Raw_Data_Jan1-Dec31_2016.csv'),
                 sep = ';', dec = ',', header = T)

means = aggregate(kWh ~ Hour, d, mean)

library(ggplot2)
library(Rmisc)

tgc = summarySE(d, measurevar = 'kWh', groupvars = 'Hour', conf.interval = 0.95)

p1 = ggplot(tgc, aes(x = Hour, y = kWh, colour = kWh)) + 
  geom_errorbar(aes(ymin = kWh - ci, ymax = kWh + ci), width=.1) +
  geom_point() +
  geom_smooth(method = 'lm') +
  labs(x = 'Time of day',
       y = 'kWh') +
  ylim(200, 500) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

show(p1)

p2 = hist(d$kWh, freq = T, breaks = 30,
     main = 'Histogram of kWh
     consumed in Bilka in 2016',
     xlab = 'kWh')

plot(p2)