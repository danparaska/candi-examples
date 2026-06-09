#rates.colours<-c(
#     #"grey20"
#                "red3" # oxy
#                ,"lightblue1" # n2o
#                ,"lightblue2" # nit
#                ,"lightblue3" # no2
#                ,"green4" # mno2
#                ,"deepskyblue4" # feoh
#                ,"goldenrod2" # so4
#                ,"grey60" # met
#                ,"grey90" # sum
#                #,"thistle1" # sum
#)

ltysequence<-c(
     #2
              1,1,1,1,1,1,1,1
              ,2
              ,2
)
lwdsequence<-c(
     #1
              1,1,1,1,1,1,1,1
              ,1
              ,1
)
#x.axis.sequence = round_any(seq(0,max(linematrix.4[,1:(dim(linematrix)[2]-0)]),length.out=tick.master.x)
x.axis.sequence = round_any(seq(0, 500 ,length.out=tick.master.x)
                            ,roundx.CD,f=ceiling);x.axis.sequence
y.axis.sequence      = round_any(seq(from=max(the.depths),to=min(the.depths)
                            ,length.out=tick.master.y),depth.tricks[3],f=floor);y.axis.sequence
#depth.tricks<-c(30,-1,5)
desired.depth<-depth.tricks[1]
ifelse( max(eins) < desired.depth ,depthindex<-length(eins)-1,depthindex<-which.min(abs(eins - desired.depth)))
the.depths<-eins[2:depthindex];the.depths


png(filename=paste0(folder,"../../rates_lowx.png")
      ,width=widthy,height=heighty  ,res=reso,units="mm"  )

par(mar=margin.list)

plot(linematrix.4[,1], rownames(linematrix.4)
     ,axes=F
     ,ylab="",xlab=""
     ,col = "white"
       # ,xaxs="i" 
     ,ylim=c(max(the.depths),depth.tricks[2])
     # ,ylim=c(max(the.depths),min(the.depths))
     ,xlim=c(0,1.05*max(x.axis.sequence))
     ,xpd=F
)
box(bty="o")
for(i in 1:(length(extrafiles)+0)){
 lines(linematrix.4[,i], rownames(linematrix.4)
       ,col=rates.colours[i]
       ,lwd=lwdsequence[i],lty=ltysequence[i]
       ) 
}
axis(2,cex.axis=0.7,cex.lab=1.0,tck=T,tcl=tick.tcl,line=tick.line,tck=T,tcl=-0.3,col.axis="white",at=y.axis.sequence)# Ticks
axis(2,cex.axis=axis.label.size,tck=F,tcl=-0.2,line=label.line,lwd=0,at=y.axis.sequence,las=1)# Labels
axis(3     ,tck=T     ,tcl=tick.tcl     ,line = tick.line, at=x.axis.sequence
     ,col.axis="white"     ,cex.axis=1     ,cex=0.1     ) # The ticks
axis(3,cex.axis=axis.label.size*0.9, line =label.line, lwd= 0, tck=F,at=x.axis.sequence) # The labels
threetext<-expression("Organic matter reaction rate (mmol C L "^-1*" y "^-1*")")
mtext(3,text=threetext,cex=axis.label.size,line=1.5,col="black")
par(xpd=F)

colnames(linematrix)

left.axis.text<-expression("Depth (cm)")
mtext(2,text=left.axis.text,cex=axis.label.size,line=1.25) # 1=bottom, 2=left, 3=top, 4=right
par(xpd=T)
legend(
  # inset = legend.inset
       # x = max(linematrix[,1])*0.75, y = min(the.depths)*1.25
       "bottomright",inset=0.05
       #, y = max(the.depths)*0.5
       # ,"bottomright"
       ,bty = "o",bg = "white"
       ,legend = legendmatrix
       ,col = rates.colours
       ,lwd = lwdsequence
       ,lty = ltysequence
       ,cex = axis.label.size
       )
dev.off()


