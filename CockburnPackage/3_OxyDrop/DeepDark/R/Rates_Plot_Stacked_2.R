#rates.colours<-c(
#     #"grey20"
#                "red2" # oxy
#                ,"lightblue1" # n2o
#                ,"lightblue2" # nit
#                ,"turquoise3" # no2
#                ,"green4" # mno2
#                ,"deepskyblue4" # feoh
#                ,"goldenrod2" # so4
#                ,"grey60" # met
#                ,"grey90" # sum
#                #,"thistle1" # sum
#)
#
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
depth.tricks<-c(15,-0.5,3)
tick.master.x.2=6
x.axis.sequence = round_any(seq(0, 500 ,length.out=tick.master.x.2)
                            ,roundx.CD,f=ceiling);x.axis.sequence
#y.axis.sequence      = round_any(seq(from=max(the.depths),to=min(the.depths)
#                            ,length.out=tick.master.y),depth.tricks[3],f=floor);y.axis.sequence
y.axis.sequence      = round_any(seq(from=depth.tricks[1],to=0
                            ,length.out=tick.master.y),depth.tricks[3],f=floor);y.axis.sequence
desired.depth<-depth.tricks[1]
ifelse( max(eins) < desired.depth ,depthindex<-length(eins)-1,depthindex<-which.min(abs(eins - desired.depth)))
the.depths<-eins[2:depthindex];the.depths

head(linematrix.4)

zeros<-seq(from=0, to= 0, length.out= dim(linematrix.4)[1]);zeros
#sum.1.2<-linematrix.4[,1]+linematrix.4[,2]
#sum.2.3<-sum.1.2+linematrix.4[,3]
#sum.3.4<-sum.2.3+linematrix.4[,4]
#sum.4.5<-sum.3.4+linematrix.4[,5]
#sum.5.6<-sum.4.5+linematrix.4[,6]
#sum.6.7<-sum.5.6+linematrix.4[,7]
#sum.7.8<-sum.6.7+linematrix.4[,8]

#polygon.oxy.xx <-c(zeros,rev(linematrix.4[,1]))
#polygon.n2o.xx <-c(sum.1.2,rev(linematrix.4[,1]))
#polygon.nit.xx <-c(sum.2.3,rev(sum.1.2))
#polygon.no2.xx <-c(sum.3.4,rev(sum.2.3))
#polygon.mno2.xx<-c(sum.4.5,rev(sum.3.4))
#polygon.feoh.xx<-c(sum.5.6,rev(sum.4.5))
#polygon.so4.xx <-c(sum.6.7,rev(sum.5.6))
#polygon.met.xx <-c(sum.7.8,rev(sum.6.7))

sum.1.2<-linematrix.4[,8]+linematrix.4[,7]
sum.2.3<-sum.1.2+linematrix.4[,6]
sum.3.4<-sum.2.3+linematrix.4[,5]
sum.4.5<-sum.3.4+linematrix.4[,4]
sum.5.6<-sum.4.5+linematrix.4[,3]
sum.6.7<-sum.5.6+linematrix.4[,2]
sum.7.8<-sum.6.7+linematrix.4[,1]

polygon.met.xx <-c(zeros,rev(linematrix.4[,8]))
polygon.so4.xx <-c(sum.1.2,rev(linematrix.4[,8]))
polygon.feoh.xx<-c(sum.2.3,rev(sum.1.2))
polygon.mno2.xx<-c(sum.3.4,rev(sum.2.3))
polygon.no2.xx <-c(sum.4.5,rev(sum.3.4))
polygon.nit.xx <-c(sum.5.6,rev(sum.4.5))
polygon.n2o.xx <-c(sum.6.7,rev(sum.5.6))
#####polygon.oxy.xx <-c(sum.7.8,rev(sum.6.7))

polygon.yy <-c(rownames(linematrix.4),rev(rownames(linematrix.4)))

png(filename=paste0(folder,"../../rates_stacked_2.png")
      ,width=widthy,height=heighty  ,res=reso,units="mm"  )

par(mar=margin.list)

plot(linematrix.4[,1], rownames(linematrix.4)
     ,axes=F
     ,ylab="",xlab=""
     ,col = "white"
       # ,xaxs="i" 
     ,ylim=c(depth.tricks[1],depth.tricks[2])
     # ,ylim=c(max(the.depths),min(the.depths))
     ,xlim=c(0,1.05*max(x.axis.sequence))
     ,xpd=F
)
box(bty="o")
lines(x=c(min(x.axis.sequence),max(x.axis.sequence)),y=c(0,0) ,lty=5,lwd=0.5)

#for(i in 1:(length(extrafiles)+0)){
# lines(linematrix.4[,i], rownames(linematrix.4)
#       ,col=rates.colours[i]
#       ,lwd=lwdsequence[i],lty=ltysequence[i]
#       ) 
#}

#polygon(polygon.oxy.xx, polygon.yy,col=rates.colours[1],border=NA)
polygon(polygon.met.xx, polygon.yy,col=rates.colours[8],border=NA)
polygon(polygon.so4.xx, polygon.yy,col=rates.colours[7],border=NA)
polygon(polygon.feoh.xx,polygon.yy,col=rates.colours[6],border=NA)
polygon(polygon.mno2.xx,polygon.yy,col=rates.colours[5],border=NA)
polygon(polygon.no2.xx, polygon.yy,col=rates.colours[4],border=NA)
polygon(polygon.nit.xx, polygon.yy,col=rates.colours[3],border=NA)
polygon(polygon.n2o.xx, polygon.yy,col=rates.colours[2],border=NA)
par(xpd=NA)

axis(2,cex.axis=0.7,cex.lab=1.0,tck=T,tcl=tick.tcl,line=tick.line,tck=T,tcl=-0.3,col.axis="white",at=y.axis.sequence)# Ticks
axis(2,cex.axis=axis.label.size,tck=F,tcl=-0.2,line=label.line,lwd=0,at=y.axis.sequence,las=1)# Labels
axis(3     ,tck=T     ,tcl=tick.tcl     ,line = tick.line, at=x.axis.sequence
     ,col.axis="white"     ,cex.axis=1     ,cex=0.1     ) # The ticks
axis(3,cex.axis=axis.label.size*1.0, line =label.line, lwd= 0, tck=F,at=x.axis.sequence) # The labels
threetext<-expression("Organic matter reaction rate (mmol C L "^-1*" y "^-1*")")
mtext(3,text=threetext,cex=axis.label.size,line=1.5,col="black")
#par(xpd=NA)

colnames(linematrix)

left.axis.text<-expression("Depth (cm)")
mtext(2,text=left.axis.text,cex=axis.label.size,line=1.5) # 1=bottom, 2=left, 3=top, 4=right
par(xpd=T)
#legend(
#  # inset = legend.inset
#       # x = max(linematrix[,1])*0.75, y = min(the.depths)*1.25
#       "bottomright",inset=0.05
#       #, y = max(the.depths)*0.5
#       # ,"bottomright"
#       ,bty = "o",bg = "white"
#       ,legend = legendmatrix
#       ,col = rates.colours
#       ,lwd = lwdsequence
#       ,lty = ltysequence
#       ,cex = axis.label.size
#       )
dev.off()


