manual.legend.text<-c("Nothing"
                      );manual.legend.text
times_d<-times_y*365.25
depfile.1<-as.matrix(read.table(file=depfi, header=FALSE, skip=0))
rownames(depfile.1)<-gsub("&","",depfile.1[,1])
depfile.2<-data.frame(t(depfile.1[,2:dim(depfile.1)[2]]))

nnrows=length(file)-3# Load sed data 
ifelse( max(uno) < start.time ,time.start.index<-which.max(uno) ,time.start.index<-which.min(abs(uno - start.time)))
ifelse( max(uno) < stop.time  ,time.stop.index <-which.max(uno)-1, time.stop.index <-which.min(abs(uno - stop.time )))
time  <-as.matrix(uno[time.start.index:time.stop.index])/1#365.25 # Adjust this to change time unit
time.y<-as.matrix(uno[time.start.index:time.stop.index])/365.25 # Adjust this to change time unit

ifelse( max(eins) < desired.depth ,depthindex<-length(eins)-1,depthindex<-which.min(abs(eins - desired.depth)))
ifelse( max(eins) < desired.depths[1] ,depthindex.1<-length(eins),depthindex.1<-which.min(abs(eins - desired.depths[1])))
ifelse( max(eins) < desired.depths[2] ,depthindex.2<-length(eins),depthindex.2<-which.min(abs(eins - desired.depths[2])))
depthindex.3<-length(eins)

row1<-as.matrix(     file[1,1:depthindex  ]    )            #layernum]) # Top row
class(row1)<-"numeric"
the.depths<-row1[2:length(row1)]
depthindices=NULL
   depthindex<-which.min(abs(the.depths - avdep) )
timeindices=NULL
for(t in 1:length(times_d)){
   timeindices[t]<-which.min(abs(time-times_d[t]))
  }
thecol=as.numeric(depthindex);thecol
C_at_t<-as.matrix(file[time.start.index:time.stop.index
             ,3:thecol  ])

somedepths<-row1[1:depthindex]

weighteddepths=NULL
somedepths[0]<-0
weighteddepths[1]<-0
for (d in 2:depthindex) {
  weighteddepths[d]<-(somedepths[d]-somedepths[d-1])/(somedepths[depthindex])#-somedepths[maxd-1])
}
weighted.C<-C_at_t*weighteddepths[3:depthindex]
average.C<-rowSums(weighted.C)

ifelse( abs(max(average.C,na.rm=T))>0
        ,roundy   <- 10^floor(log10(abs(max(average.C,na.rm=T))) )/10
        ,roundy   <- 10^floor(log10(abs(min(average.C,na.rm=T))) )/10
);roundy
y.axis.sequence = round_any(seq(from=0,to=max(average.C,na.rm = T)
                                ,length.out=tick.master.y),roundy,f=floor);y.axis.sequence
spinupindex    <- which.min(abs(time.y - (spinuplength-1)));spinupindex # 10


# thresh.y<-c(threshold,threshold)

colseq=(matrix(ncol=3
              ,nrow=length(timeindices)
              ,collist[ 1:length(times_d) ]
              ));colseq
par(xpd=F)

plot(time.y,average.C
     ,axes=F
     ,ylab="",xlab=""
     ,col = "white"
     ,xaxs="i"
     # ,ylim=c(min(C_at_t),max(C_at_t))
     ,ylim=c(0,max(average.C, na.rm = T))
     ,xlim=c(min(axis.sequence),max(axis.sequence))
     ,pch=16
)
box(bty="o")
# lines(time.y.1,C_at_t.1
#       ,col=newglencolours[3]
#       )
lines(time.y,average.C
      ,col=newglencolours[3]
      )

zocex=0.7
axis(2,cex.axis=0.7,cex.lab=1.0,tck=T,tcl=-0.2,line=0,tck=T,tcl=-0.3,col.axis="white",at=y.axis.sequence)# Ticks
axis(2,cex.axis=axis.tick.size,cex.lab=1.0,tck=F,tcl=-0.2,line=0.5,lwd=0,at=y.axis.sequence,las=1)# Labels

axis(3,tck=T,tcl=-0.3,xaxs="i",yaxs="i",line=0,col.axis="white"
       ,at=axis.sequence
) # The ticks
axis(3,cex.axis=axis.tick.size,xaxs="i",yaxs="i",line=0.4,lwd = 0
     ,at=axis.sequence
) # The labels
axis(1,tck=T,tcl=-0.3,xaxs="i",yaxs="i",line=0,col.axis="white"
     ,at=axis.sequence
) # The ticks
axis(1,cex.axis=axis.tick.size,xaxs="i",yaxs="i",line=+0.50,lwd = 0
     ,at=axis.sequence
     ,labels=date.axis.sequence.2
) # The labels
threetext<-expression("Concentration at final time (mmol L "^-1*")")
mtext(3,text="Time (number of years)",cex=axis.label.size,line=1.5, adj=0.55)
# mtext(3,text=threetext,cex=axis.label.size,line=2,col="navy")
mtext(1,text="Time (date)",cex=axis.label.size,line=1.5, adj=0.55)
par(xpd=F)
depth.text<-as.character(avdep)
left.axis.text<-expression("Average concentration (mmol L" ^-1*")"  ) ;left.axis.text
mtext(2,text=left.axis.text,cex=axis.label.size,line=4 ) # 1=bottom, 2=left, 3=top, 4=right
mtext(2,text=paste0(" over ",depth.text, " cm"),cex=axis.label.size,line=3) # 1=bottom, 2=left, 3=top, 4=right
par(xpd=T)

