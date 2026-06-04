#extrafiles<-c( 
#   "FO2"
#  ,"FN2O"
#  ,"FNO3"
#  ,"FNO2"
#  ,"FMnO2"
#  ,"FFeOH"
#  ,"FSO4"
#  ,"FMet"
#)
files<-NULL
#rates.colours<-c("red3" # oxy
#                ,"cyan2" # n2o
#                ,"lightblue2" # nit
#                ,"lightblue3" # no2
#                ,"green4" # mno2
#                ,"deepskyblue4" # feoh
#                ,"goldenrod2" # so4
#                ,"grey60" # met
#                ,"thistle1" # met
#)
depth.tricks<-c(20,-2,5)
desired.depth<-depth.tricks[1]
ifelse( max(eins) < desired.depth ,depthindex<-length(eins)-1,depthindex<-which.min(abs(eins - desired.depth)))
the.depths<-eins[2:depthindex];the.depths
y.axis.sequence      = round_any(seq(from=depth.tricks[2],to=depth.tricks[1]
                                     ,length.out=6),depth.tricks[3],f=floor);y.axis.sequence
png(filename=paste0(folder,"../../results/rates(factors).png")
      ,width=widthy,height=heighty  ,res=reso,units="mm"  )

par(mar=margin.list)

head(linematrix.4)

plot(linematrix.4[,1], rownames(linematrix.4)
     ,axes=F
     ,ylab="",xlab=""
     ,col = "white"
       # ,xaxs="i" 
     ,ylim=c(depth.tricks[1],depth.tricks[2])
     ,xlim=c(0,max(x.axis.sequence))
     ,xpd=F
)
box(bty="o")
for(i in 1:(length(extrafiles)+0)){
 lines(linematrix.4[,i], rownames(linematrix.4)
       ,col=rates.colours[i]
       ,lwd=1
       ) 
}
axis(2,cex.axis=axis.label.size,cex.lab=1.0,tck=T,tcl=-0.2,line=0,tck=T,tcl=-0.3,col.axis="white",at=y.axis.sequence)# Ticks
axis(2,cex.axis=axis.label.size,cex.lab=axis.label.size,tck=F,tcl=-0.2,line=label.line,lwd=0,at=y.axis.sequence,las=1)# Labels
axis(3     ,tck=T     ,tcl=-0.5     ,line = 0, at=x.axis.sequence
     ,col.axis="white"     ,cex.axis=axis.label.size     ,cex=0.1     ) # The ticks
axis(3,cex.axis=axis.label.size, line = label.line, lwd= 0, tck=F,at=x.axis.sequence) # The labels
threetext<-expression("Redox pathway favourability factor (0 to 1)")
mtext(3,text=threetext,cex=axis.label.size,line=1.5,col="black")
par(xpd=F)

left.axis.text<-expression("Depth (cm)")
mtext(2,text=left.axis.text,cex=axis.label.size,line=1.25) # 1=bottom, 2=left, 3=top, 4=right
par(xpd=T)
legend(
       "bottomright", inset=0.05
       ,bty = "o",bg = "white"
       ,legend = legendmatrix
       ,col = rates.colours
       ,lwd = 1
       ,lty = c(1,1,1,1)
       ,cex = axis.label.size
       )


dev.off()



dev.off()

