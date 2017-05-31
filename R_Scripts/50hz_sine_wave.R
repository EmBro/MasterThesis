t=seq(0,10,0.1)

y=sin(t)

plot(t,y,type="l", xlab="Time", ylab="Sine wave", yaxt = 'n', xaxt = 'n',
     cex.lab=1.5, cex.axis=1.5, cex.main=1.5, cex.sub=1.5)
axis(2, at = c(-1,-0.5,0,0.5,1), labels = c(49.9, 49.95, 50, 50.05, 50.1),
     cex.axis = 1.5)
grid(0, NULL, col = 'black')

axis(1, at = c(0:9), labels = c(0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1))
