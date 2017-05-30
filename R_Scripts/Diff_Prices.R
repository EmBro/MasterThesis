## Loading in data

d_cons = read.table(url('https://raw.githubusercontent.com/EmBro/MasterThesis/master/Data/Bilka_kWh/Raw_Data_Jan1-Dec31_2016.csv'),
               sep = ';', dec = ',', header = T)

mean_cons = aggregate(kWh ~ Hour, d_cons, mean)

d_price = read.table(url('https://raw.githubusercontent.com/EmBro/MasterThesis/master/Data/Denmark/Cons_and_Price2016.csv'),
               sep = ';', dec = ',', header = T)

c_proc = mean_cons$kWh / 100 * 67
c_other = mean_cons$kWh / 100 * 33

library(reshape2)
c_tot = data.frame(c_proc, c_other)
P = 0.7
p_set = 0.271
t_non =  P - p_set
t_ref = 0.885

mean_price = aggregate(SYS_price.mWh ~ Hours, d_price, mean)
m_price = mean_price$SYS_price.mWh / 1000
m_market = mean(m_price)
delta_p = as.data.frame((m_price - m_market) / m_market)
delta_p_PDP = as.data.frame((m_price - m_market) / m_market)
delta_p_PDP[delta_p_PDP < 0] <- 0

TC_REG = as.data.frame(c_proc * (p_set + t_non) + c_other * (p_set + t_non + t_ref))
colnames(TC_REG) = 'TC_REG'

TC_TDP = c_proc * (p_set * (1 + delta_p) + t_non) + c_other * (p_set * (1 + delta_p) + t_non + t_ref)
colnames(TC_TDP) = 'TC_TDP'

TC_PDP = c_proc * (p_set * (1 + delta_p_PDP) + t_non) + c_other * 
  (p_set * (1 + delta_p_PDP) + t_non + t_ref)
colnames(TC_PDP) = 'TC_PDP'

sum(TC_TDP * 365) - sum(TC_REG * 365)

df = as.data.frame(cbind(TC_REG, TC_TDP, TC_PDP))



matplot(df, type = 'l', col = c('black', 'blue', 'red'),
        xlab = 'Time of day',
        ylab = 'Total Electricity Cost DKr/hr',
        main = 'Price Curves for the proposed price models')
legend("topleft", inset=.01, legend=c("TC - Regular", "TC - Total Dynamic Pricing",
                                      'TC - Peak Dynamic Pricing'),
       pch='--', col=c('black', 'blue','red'), horiz = F,
       par(ps = 3, cex = 1, legend = 1),
       pt.cex = 2,
       text.width = 4.5)


res = as.data.frame(colSums(df * 365))
colnames(res) = 'Sum'

res1 = res[1,] - res[1,]
res2 = res[2,] - res[1,]
res3 = res[3,] - res[1,]

dTC = as.data.frame(cbind(res1, res2, res3))
colnames(dTC) = c('TC_REG - TC_REG', 'TC_TDP - TC_REG', 'TC_PDP - TC_REG')
rownames(dTC) = 'Additional Cost'

library('stargazer')

stargazer(dTC, summary = F)

