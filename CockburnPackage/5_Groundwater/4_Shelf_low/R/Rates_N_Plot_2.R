
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
depth.tricks<-c(5,0,1)
axis.label.size=0.47
tick.master.x=5
linematrix.5<-linematrix.4[,1:(dim(linematrix.4)[2]-1)]
y.axis.sequence      = round_any(seq(from=depth.tricks[1],to=depth.tricks[2]
                                     ,length.out=6),depth.tricks[3],f=floor);y.axis.sequence
#x.axis.sequence = round_any(seq(min(linematrix.5),max(linematrix.5),length.out=tick.master.x)
x.axis.sequence = round_any(seq(min(linematrix.5),200,length.out=tick.master.x)
                            ,roundx.CD,f=floor);x.axis.sequence



png(filename=paste0(folder,"../../rates_N_2.png")
      ,width=widthy,height=heighty  ,res=reso,units="mm"  )
par(mar=margin.list)
plot(linematrix.5[, dim(linematrix.5)[2] ], rownames(linematrix.5)
     ,axes=F
     ,ylab="",xlab=""
     ,col = "white"
       # ,xaxs="i" 
     ,ylim=c(depth.tricks[1],depth.tricks[2])
     # ,ylim=c(max(the.depths),min(the.depths))
     ,xlim=c(0,max(max(linematrix.5),max(x.axis.sequence)))
     ,xpd=F
)
box(bty="o")
for(i in 1:(dim(linematrix.5)[2])){
 lines(linematrix.5[,i], rownames(linematrix.5)
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
#mtext(3,text=threetext,cex=axis.label.size,line=2,col="black")
par(xpd=F)

left.axis.text<-expression("Depth (cm)")
mtext(2,text=left.axis.text,cex=axis.label.size,line=1.25) # 1=bottom, 2=left, 3=top, 4=right
par(xpd=T)

legendmatrix.2<-c(legendmatrix,"Sum of all rates")

#legend(
#  # inset = legend.inset
#       # x = max(linematrix[,1])*0.75, y = min(the.depths)*1.25
#       #x = max(linematrix.4[,1])*0.75, y = max(the.depths)*0.5
#       "bottomright", inset=0.05
#       ,bty = "o",bg = "white"
#       ,legend = legendmatrix#.2
#       ,col = rates.colours
#       ,lwd = lwdsequence
#       ,lty = ltysequence
#       ,cex = axis.label.size
#       )


dev.off()

 
 

dev.off()




