d = read.table(url('https://raw.githubusercontent.com/EmBro/MasterThesis/master/Data/Consumption/Cons_EU_2015.csv'),
               sep = ';', dec = ',', header = T, skipNul = T)

d = na.omit(d)
means = aggregate(DK ~ Hours, d, mean)

library('ggplot2')
library('Rmisc')
tgc = summarySE(d, measurevar = 'DK', groupvars = 'Hours', conf.interval = 0.9)

p1 = ggplot(tgc, aes(x = Hours, y = DK, colour = DK)) + 
  geom_errorbar(aes(ymin = DK - ci, ymax = DK + ci), width = .1) +
  geom_point() +
  geom_smooth(method = 'lm') +
  labs(x = 'Hours',
       y = 'kWh') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

plot(p1)

