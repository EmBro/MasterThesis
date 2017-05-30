d = read.table(url('https://raw.githubusercontent.com/EmBro/MasterThesis/master/Data/Denmark/Balance_Market_2016_DK1.csv'),
                    sep = ';', dec = ',', header = T)

d = na.omit(d)

means_up = aggregate(DK1_UP_P ~ Hour, d, mean)


plot(means_up$DK1_UP_P, type = 'l')
grid(0, NULL, col = 'darkgrey')


(sum(d$DK1_UP_P) * 0.075) + (sum(d$DK1_Down_P) * 0.075)
