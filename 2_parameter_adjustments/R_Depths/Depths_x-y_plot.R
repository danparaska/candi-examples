
dd<-Depcols[[which(names(Depcols)==Depvar[ds])]]

plot(dd,Depth
     ,ylim=c(max(as.numeric(Depth)),min(as.numeric(Depth)))
     ,type="n"
     ,axes=F , xlab="", ylab=""
) 
lines(dd,Depcols$Depths,col="navy")
mtext(2,text=expression("Depth (cm)"),cex=axis.label.size,line=2)
mtext(3,text=Depvar[ds],cex=axis.label.size,line=3)

axis(2,cex.axis=axis.tick.size)
axis(3,cex.axis=axis.tick.size)
box(bty="o")
axis.tick.size=0.7
