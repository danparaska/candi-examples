
times_y_round <- round(times_y,digits=1);times_y_round

manual.legend.text<-c(paste0(times_y_round, " years")
                      );manual.legend.text

times_d<-times_y*365.25
# desired.depths = c(1,2,3)
rownames(depfile.1)<-gsub("&","",depfile.1[,1])
depfile.2<-data.frame(t(depfile.1[,2:dim(depfile.1)[2]]))

ifelse( max(uno,na.rm = T) < start.time ,time.start.index<-which.max(uno) ,time.start.index<-which.min(abs(uno - start.time)))
time<-as.matrix(uno[time.start.index:time.stop.index])/1#365.25 # Adjust this to change time unit

ifelse( max(eins) < desired.depth ,depthindex<-length(eins)-1,depthindex<-which.min(abs(eins - desired.depth)))
ifelse( max(eins) < desired.depths[1] ,depthindex.1<-length(eins),depthindex.1<-which.min(abs(eins - desired.depths[1])))
ifelse( max(eins) < desired.depths[2] ,depthindex.2<-length(eins),depthindex.2<-which.min(abs(eins - desired.depths[2])))
depthindex.3<-length(eins)

row1<-as.matrix(     file[1,1:depthindex  ]    )            #layernum]) # Top row
class(row1)<-"numeric"
the.depths<-row1[2:length(row1)]
roundy=5
y.axis.sequence      = round_any(seq(from=max(bw.sed.depths),to=min(bw.sed.depths)
                                     ,length.out=6),5,f=floor);y.axis.sequence
depthindices=NULL
for(d in 1:length(desired.depths)){
   depthindices[d]<-which.min(abs(the.depths - desired.depths[d]) )
  }
timeindices=NULL
for(t in 1:length(times_d)){
   timeindices[t]<-which.min(abs(time-times_d[t]))#-3
  };timeindices
DTmatrix<-matrix(nrow = length(desired.depths)
                     ,ncol = length(times_d)
                     ,0
                     ,dimnames=list(the.depths[depthindices]
                                    ,time[timeindices])
                     );DTmatrix
linematrix<-matrix(   nrow=length(the.depths)
                     ,ncol=length(times_d)
                     ,0
                     ,dimnames=list(the.depths
                                    ,time[timeindices])
                     )
dim(linematrix)
for(lm1 in 1:length(times_d)){
    linematrix[ ,lm1] <- t(as.matrix(file[as.numeric(timeindices[lm1])
                                ,2:(dim(file)[2]-1) ]  ))
}
bottomwater.matrix<-matrix(nrow=1,ncol=length(times_d)
                           ,linematrix[1,]
                           ,dimnames = list(-5))

linematrix.2<-rbind(bottomwater.matrix,linematrix)

for(m1 in 1:length(depthindices)){
  for(m2 in 1:length(timeindices)){
    DTmatrix[m1,m2]<-linematrix[depthindices[m1],m2]
  }
}
# collist<-c("blue","brown4","orange","lightsalmon2")
colseq=(matrix(ncol=length(depthindices)
              ,nrow=length(timeindices)
              # ,collist[ 1:length(times_d) ]
              ,newglencolours[ 1:length(times_d) ]
              ));colseq
colseq[4]="grey85"
class(linematrix)<-"numeric"
ifelse( abs(max(times,na.rm=T))>1
        ,roundx.CD   <- 10^floor(log10(abs(max(linematrix,na.rm=T))) )/10
        ,roundx.CD   <- 10^floor(log10(abs(min(linematrix,na.rm=T))) )/10
);roundx.CD
x.axis.sequence = round_any(seq(min(linematrix),max(linematrix),length.out=tick.master.x)
                            ,roundx.CD,f=floor);x.axis.sequence

plot(linematrix.2[,1], rownames(linematrix.2)
     ,axes=F
     ,ylab="",xlab=""
     ,col = "white"
       # ,xaxs="i" 
     ,ylim=c(max(the.depths),-5)
     # ,ylim=c(max(the.depths),min(the.depths))
     ,xlim=c(0,max(linematrix))
     ,xpd=F
)
box(bty="o")
for(m4 in 1:dim(DTmatrix)[2]){
 lines(linematrix.2[,m4], rownames(linematrix.2)
       # ,col=collist[m4]
       ,col=colseq[m4]
       ) 
}
for(m3 in 1:dim(DTmatrix)[1]){
  for(m4 in 1:dim(DTmatrix)[2]){
    points(DTmatrix[m3,m4]
       ,as.numeric(rownames(DTmatrix))[m3]
       # ,col=collist[m4]
       # ,col=colseq[m3,m4]
       ,col=colseq[m4]
       ,pch=c(16,15)
    )
  }
}


    # text(x=max(linematrix)/2,y=0.5*max(the.depths)
    #      ,labels=paste0(threshvalue
    #                     ,"% of concentration at "
    #                     ,desired.depths[1]," cm")
    #      )

axis(2,cex.axis=0.7,cex.lab=1.0,tck=T,tcl=-0.2,line=0,tck=T,tcl=-0.3,col.axis="white",at=y.axis.sequence)# Ticks
axis(2,cex.axis=axis.tick.size,cex.lab=1.0,tck=F,tcl=-0.2,line=0.5,lwd=0,at=y.axis.sequence,las=1)# Labels
axis(3     ,tck=T     ,tcl=-0.5     ,line = 0, at=x.axis.sequence
     ,col.axis="white"     ,cex.axis=1     ,cex=0.1     ) # The ticks
axis(3,cex=axis.label.size, line = 0.4, lwd= 0, tck=F,at=x.axis.sequence) # The labels
threetext<-expression("Concentration (mmol L "^-1*")")
mtext(3,text=threetext,cex=axis.label.size,line=2,col="black")
par(xpd=F)

left.axis.text<-expression("Depth (cm)")
mtext(2,text=left.axis.text,cex=axis.label.size,line=3.5) # 1=bottom, 2=left, 3=top, 4=right
par(xpd=T)
legend(
  # inset = legend.inset
       # x = max(linematrix[,1])*0.75, y = min(the.depths)*1.25
       x = max(linematrix[,1])*0.75, y = max(the.depths)*0.5
       # ,"bottomright"
       ,bty = "o",bg = "white"
       ,legend = manual.legend.text
       ,col = colseq
       ,lwd = c(1,1,1,1)
       ,lty = c(1,1,1,2)
       ,cex = axis.label.size
       )

