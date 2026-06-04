rates.colours<-c(
  #"grey20"
                "red4" # oxy
                #,"grey80" # oxy
                ,"dodgerblue4" # oxy
                ,"grey80" 
)

png(filename=paste0(folder,"../../rates_C.png")
      ,width=widthy,height=heighty  ,res=reso,units="mm"  )

par(mar=margin.list)
plot(linematrix.4[,1], rownames(linematrix.4[1:2])
     ,axes=F
     ,ylab="",xlab=""
     ,col = "white"
       # ,xaxs="i" 
     ,ylim=c(max(the.depths),-5)
     # ,ylim=c(max(the.depths),min(the.depths))
     ,xlim=c(0,max(linematrix.4))
     ,xpd=F
)
box(bty="o")
for(i in 1:(dim(linematrix.4)[2]-1)){
 lines(linematrix.4[,i], rownames(linematrix.4)
       ,col=rates.colours[i]
       ,lwd=lwdsequence[i],lty=ltysequence[i]
       ) 
}
axis(2,cex.axis=0.7,cex.lab=1.0,tck=T,tcl=tick.tcl,line=tick.line,tck=T,tcl=-0.3,col.axis="white",at=y.axis.sequence)# Ticks
axis(2,cex.axis=axis.label.size,tck=F,tcl=-0.2,line=label.line,lwd=0,at=y.axis.sequence,las=1)# Labels
axis(3     ,tck=T     ,tcl=tick.tcl     ,line = tick.line, at=x.axis.sequence
     ,col.axis="white"     ,cex.axis=1     ,cex=0.1     ) # The ticks
axis(3,cex.axis=axis.label.size, line = label.line, lwd= 0, tck=F,at=x.axis.sequence) # The labels
threetext<-expression("Organic matter reaction rate (mmol L "^-1*" y "^-1*")")
mtext(3,text=threetext,cex=axis.label.size,line=2,col="black")
par(xpd=F)

left.axis.text<-expression("Depth (cm)")
mtext(2,text=left.axis.text,cex=axis.label.size,line=2) # 1=bottom, 2=left, 3=top, 4=right
par(xpd=T)

legend(
  # inset = legend.inset
       # x = max(linematrix[,1])*0.75, y = min(the.depths)*1.25
       #x = max(linematrix.4[,1])*0.75, y = max(the.depths)*0.5
       "bottomright",inset=0.05
       ,bty = "o",bg = "white"
       ,legend = legendmatrix[1:2]
       ,col = rates.colours
       ,lwd = lwdsequence
       ,lty = ltysequence
       ,cex = axis.label.size
       )


dev.off()

 
 

dev.off()



