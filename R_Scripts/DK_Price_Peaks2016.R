d = read.table(url('https://raw.githubusercontent.com/EmBro/MasterThesis/master/Data/Denmark/Cons_and_Price2016.csv'),
               sep = ';', dec = ',', header = T)

d = na.omit(d)
means = aggregate(SYS_price.mWh ~ Hours, d, mean)
means1 = means$SYS_price.mWh/1000

library(RCurl)
library(ggplot2)
library('Rmisc', lib.loc='/Library/Frameworks/R.framework/Versions/3.3/Resources/library')

tgc = summarySE(d, measurevar = 'SYS_price.mWh', groupvars = 'Hours', conf.interval = 0.95)

p1 = ggplot(tgc, aes(x = Hours, y = SYS_price.mWh, colour = SYS_price.mWh)) + 
  geom_errorbar(aes(ymin = SYS_price.mWh - ci, ymax = SYS_price.mWh + ci), width=.1) +
  geom_point() +
  geom_smooth(method = 'lm') +
  labs(x = 'Time of day',
       y = 'Kr/mWh') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

show(p1)

m = mean(means1)

plot(means1, type = 'b', col = 'blue',
     ylab = 'kr/MWh')
abline(h = m)
abline(h = l)

l = (means1 - m)/m
plot(l, yaxt = 'n', type = 'b', xaxt = 'n',
     main = 'Percentage price fluctuations above average price during 2016',
     xlab = 'Time',
     ylab = 'Percentage')
axis(2, at=pretty(l), lab=paste0(pretty(l) * 100, " %"), ' %', las=TRUE)
axis(1, at = seq(0, 24, by = 1))
abline(h = 0, col = 'blue')

l = t(l)
l = as.numeric(l)

install.packages('formattable')
library(formattable)



l = scales::percent(l)
install.packages("stargazer")
library(stargazer)

stargazer(l)

plot(l, type = 'b')
abline(h = 0)


plot(means)
plot(means, type = 'l')
m = means$DK1.1
mm = mean(m)

plot.new()
plot(m, type = 'l', col = 'blue', xlim = c(0,25),
     ylab = 'Price/mWh',
     xlab = 'Time')
abline(v = c(0,5,10,15,20,25), col = 'lightgrey')
abline(h = c(160,180,200,220), col = 'lightgrey')
abline(h = mm, col = 'red')

help("plot")



hist(d$DK1.1, breaks = 50, freq = F)

help("grid")

meanscons = aggregate(DK_cons_tot ~ Hours, d, mean)

tgccons = summarySE(d, measurevar = 'DK_cons_tot', groupvars = 'Hours', conf.interval = 0.95)

p2 = ggplot(tgccons, aes(x = Hours, y = DK_cons_tot, colour = DK_cons_tot)) + 
  geom_errorbar(aes(ymin = DK_cons_tot - ci, ymax = DK_cons_tot + ci), width=.1) +
  geom_point() +
  geom_smooth(method = 'lm') +
  labs(x = 'Time of day',
       y = 'Average mWh consumption in DK 2016') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

show(p2)

plot(meanscons)
