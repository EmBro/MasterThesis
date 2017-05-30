d = read.table(url('https://raw.githubusercontent.com/EmBro/MasterThesis/master/Data/Consumption/Total_Trade_NPS2016.csv'),
                 sep = ';', dec = ',', header = T)

d = na.omit(d)

means = aggregate(mWh ~ Hours, d, mean)
library(Rmisc)
library(ggplot2)

tgc = summarySE(d, measurevar = 'mWh', groupvars = 'Hours', conf.interval = 0.95)

plot(means$mWh, type = 'b')

p1 = ggplot(tgc, aes(x = Hours, y = mWh, colour = mWh)) + 
  geom_errorbar(aes(ymin = mWh - ci, ymax = mWh + ci), width=.1) +
  geom_point() +
  geom_smooth(method = 'lm') +
  labs(x = 'Hours',
       y = 'MWh') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

show(p1)

p2 = hist(d$mWh, freq = T, breaks = 30,
     main = 'Histogram of kWh
     consumed in Bilka in 2016',
     xlab = 'kWh')

plot(p2)

help("summarySE")

qqnorm(d$mWh)
qqline(d$mWh)
