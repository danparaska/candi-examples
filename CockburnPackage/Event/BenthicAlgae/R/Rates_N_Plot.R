
ltysequence<-c(5,5,5
              ,1,1,1
              ,1,3
)
lwdsequence<-c(1,1,1
              ,1,1,1
              ,1,1
)
rates.colours<-c(
                "darkorange4"# ROMN2O
                ,"darkorange3"# ROMNO3
                ,"goldenrod"# ROMNO2
                ,"red4"       # rnitrousation
                ,"red2"       # rnitritation
                ,"deeppink"       # rno2o2
                ,"deepskyblue4"# rnh4no2
                ,"grey50"     # sum
)
depth.tricks<-c(20,-1,0.5)
axis.label.size=0.49
tick.master.x=5
#x.axis.sequence = round_any(seq(min(linematrix.4),max(linematrix.4),length.out=tick.master.x)
x.axis.sequence = round_any(seq(min(linematrix.4),360,length.out=tick.master.x)
                            ,roundx.CD,f=floor);x.axis.sequence
y.axis.sequence      = round_any(seq(from=depth.tricks[1],to=0
                                     ,length.out=5),depth.tricks[3],f=floor);y.axis.sequence

png(filename=paste0(folder,"../../rates_N.png")
      ,width=widthy,height=heighty  ,res=reso,units="mm"  )

dim(linematrix.4)
par(mar=margin.list)
plot(linematrix.4[, dim(linematrix.4)[2] ], rownames(linematrix.4)
     ,axes=F
     ,ylab="",xlab=""
     ,col = "white"
       # ,xaxs="i" 
     ,ylim=c(depth.tricks[1],depth.tricks[2])
     # ,ylim=c(max(the.depths),min(the.depths))
     ,xlim=c(0,max(max(linematrix.4),max(x.axis.sequence)))
     ,xpd=F
)
box(bty="o")
for(i in 1:(dim(linematrix.4)[2])){
 lines(linematrix.4[,i], rownames(linematrix.4)
       ,col=rates.colours[i]
       ,lwd=lwdsequence[i],lty=ltysequence[i]
       ) 
}
lines(x=c(min(x.axis.sequence),max(x.axis.sequence)),y=c(0,0) ,lty=1,lwd=0.5)
legend("topright",inset=0.02 ,legend="SWI",cex=axis.label.size,col="black",bty="n")
axis(2,cex.axis=0.7,cex.lab=axis.label.size,tck=T,tcl=tick.tcl,line=tick.line,tck=T,tcl=-0.3,col.axis="white",at=y.axis.sequence)# Ticks
axis(2,cex.axis=axis.label.size,tck=F,tcl=-0.2,line=label.line,lwd=0,at=y.axis.sequence,las=1)# Labels
axis(3     ,tck=T     ,tcl=tick.tcl     ,line = tick.line, at=x.axis.sequence
     ,col.axis="white"     ,cex.axis=axis.label.size     ,cex=0.1     ) # The ticks
axis(3,cex.axis=axis.label.size, line = label.line, lwd= 0, tck=F,at=x.axis.sequence) # The labels
threetext<-expression("Nitrogen redox reaction rates (mmol L "^-1*" y "^-1*")")
mtext(3,text=threetext,cex=axis.label.size,line=2,col="black")
par(xpd=F)

left.axis.text<-expression("Depth (cm)")
mtext(2,text=left.axis.text,cex=axis.label.size,line=1.25) # 1=bottom, 2=left, 3=top, 4=right
par(xpd=T)

legendmatrix.2<-c(legendmatrix,"Sum of all N rates")

legend(
  # inset = legend.inset
       # x = max(linematrix[,1])*0.75, y = min(the.depths)*1.25
       #x = max(linematrix.4[,1])*0.75, y = max(the.depths)*0.5
       "bottomright", inset=0.05
       ,bty = "o",bg = "white"
       ,legend = legendmatrix.2
       ,col = rates.colours
       ,lwd = lwdsequence
       ,lty = ltysequence
       ,cex = axis.label.size
       )


dev.off()

 
 

dev.off()




