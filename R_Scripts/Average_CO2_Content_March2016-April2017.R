d = read.table(url('https://raw.githubusercontent.com/EmBro/MasterThesis/master/Data/Denmark/CO2_means.csv'),
               sep = ',', dec = '.', header = T)

# By changing the name of the month in the code below, additional plots can be produced
plot(d$September, type = 'l')

means = rowMeans(d)


plot(means, type = 'l', xaxt = 'n',
     xlab = 'Time',
     ylab = 'Average CO2 content g/kWh',
     main = 'Data span from March 2016 to April 2017',
     cex.lab=1.5, cex.axis=1.5, cex.main=1.5, cex.sub=1.5)
axis(1, at = seq(1, length(means), by = 12), labels = 0:23)
grid(0, NULL, col = 'darkgrey')

means1 = as.data.frame(means)
my.time <- seq(from = as.POSIXct('2000-01-01 00:00:00'),
               to = as.POSIXct('2000-01-02 00:00:00'),
               by = '5 min')
time = as.data.frame(my.time)
time = time[-289,]

library('zoo')
library('xts')

my.data <- as.xts(means, order.by = time)

apply.hourly <- function(x, FUN,...) {
  ep <- endpoints(x, 'hours')
  period.apply(x, ep, FUN, ...)
}

mean_hr = (apply.hourly(my.data, mean))

op = par(cex = .94)
matplot(mean_hr, type = 'l', col = c('black'),
        xlab = 'Time of day',
        ylab = 'Average CO2 emissions/kWh',
        main = 'Average CO2 emissions 2016')
legend("topright", inset=.05, legend = "Average CO2 emissions",
       pch='--', col=c('black', 'blue','red'), horiz=F,
       par(ps = 3, cex = 1, legend = 1),
       pt.cex = 2,
       text.width = 4.5)
grid(0, NULL, col = 'darkgrey')

matplot(mean_hr, type = 'l')

mean_hr1 = as.data.frame(mean_hr)
mean_hr1 = mean_hr1$V1
mean_hr1 = as.data.frame(mean_hr1)

