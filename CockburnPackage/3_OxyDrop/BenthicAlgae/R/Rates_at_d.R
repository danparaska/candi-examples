extrafiles<-c( 
   "TerminalOxidationPerTEA"
  ,"ROMO2"
  ,"ROMN2O"
  ,"ROMNO3"
  ,"ROMNO2"
  ,"ROMMnO2"
  ,"ROMFeOH"
  ,"ROMSO4"
  ,"ROMMet"
  ,"RDIC"
)
files=NULL
i=1
source("LoadExtraSedData.R")#0 Load the flux and concentration data


rates.colours<-c("grey20"
                ,"red3" # oxy
                ,"lightblue1" # n2o
                ,"lightblue2" # nit
                ,"lightblue3" # no2
                ,"green4" # mno2
                ,"deepskyblue4" # feoh
                ,"goldenrod2" # so4
                ,"grey60" # met
                ,"thistle1" # sum
                ,"grey90" # sum
)

ltysequence<-c(2
              ,1,1,1,1,1,1,1,1
              ,2
              ,2
)
lwdsequence<-c(1
              ,2,2,2,2,2,2,2,2
              ,2
              ,2
)

depth.tricks<-c(30,-2,5)
desired.depth<-depth.tricks[1]
ifelse( max(eins) < desired.depth ,depthindex<-length(eins)-1,depthindex<-which.min(abs(eins - desired.depth)))
the.depths<-eins[2:depthindex];the.depths

linematrix<-NULL

linematrix<-matrix(   nrow=(length(the.depths))
                     ,ncol=length(extrafiles)
                     ,0
                     ,dimnames=list(the.depths[1:length(the.depths)-0]
                                    ,extrafiles)
                     )
dim(linematrix)
legendmatrix<-matrix(   nrow=(length(extrafiles))
                     ,ncol=1
                     ,0
                     )
dim(legendmatrix)

 for (i in 1:length(extrafiles)){
 #for (i in 1:8){
#for (i in 1){

source("LoadExtraSedData.R")#0 Load the flux and concentration data
files[i]=extrafiles[i]
source("ExtrasConcLabels.R")
extrafiles[i]
file

times_y_round <- round(times_y,digits=1);times_y_round

manual.legend.text<-c(paste0(times_y_round, " years")
                      );manual.legend.text

times_d<-times_y*365.25
# desired.depths = c(1,2,3)
depfile.1<-as.matrix(read.table(file=depfi, header=FALSE, skip=0))
rownames(depfile.1)<-gsub("&","",depfile.1[,1])
depfile.2<-data.frame(t(depfile.1[,2:dim(depfile.1)[2]]))

ifelse( max(uno,na.rm = T) < start.time ,time.start.index<-which.max(uno) ,time.start.index<-which.min(abs(uno - start.time)))
time<-as.matrix(uno[time.start.index:time.stop.index])/1#365.25 # Adjust this to change time unit

ifelse( max(eins) < desired.depth ,depthindex<-length(eins)-1,depthindex<-which.min(abs(eins - desired.depth)))
ifelse( max(eins) < desired.depths[1] ,depthindex.1<-length(eins),depthindex.1<-which.min(abs(eins - desired.depths[1])))
ifelse( max(eins) < desired.depths[2] ,depthindex.2<-length(eins),depthindex.2<-which.min(abs(eins - desired.depths[2])))
depthindex.3<-length(eins)

row1<-as.matrix(     file[1,1:depthindex  ]    )            #layernum]) # Top row
the.depths<-row1[2:length(row1)]
roundy=5
y.axis.sequence      = round_any(seq(from=max(the.depths),to=min(the.depths)
                                     ,length.out=6),depth.tricks[3],f=floor);y.axis.sequence
depthindices=NULL
for(d in 1:length(desired.depths)){
   depthindices[d]<-which.min(abs(the.depths - desired.depths[d]) )
  }
timeindices=NULL
for(t in 1:length(times_d)){
   timeindices[t]<-which.min(abs(time-times_d[t]))#-3
  };timeindices

dim(linematrix)

    linematrix[ ,i] <- t(as.matrix(file[as.numeric(timeindices[3])
                                ,2:(depthindex) ]  ))

legendmatrix[i]<-the.label

linematrix.3 <- matrix(   nrow=length(the.depths)
                     ,ncol=1
                     ,0
                     #,dimnames=list( ,"sum" )
                     )
linematrix.3 <- as.matrix(rowSums(linematrix[,2:9]))
colnames(linematrix.3)  <- "sum"
linematrix.4 <- cbind(linematrix,linematrix.3)
linematrix.4<- linematrix.4[-1,]


ifelse( abs(max(times,na.rm=T))>1
        ,roundx.CD   <- 10^floor(log10(abs(max(linematrix,na.rm=T))) )/10
        ,roundx.CD   <- 10^floor(log10(abs(min(linematrix,na.rm=T))) )/10
);roundx.CD
x.axis.sequence = round_any(seq(min(linematrix.4),max(linematrix.4),length.out=tick.master.x)
                            ,roundx.CD,f=floor);x.axis.sequence


#bottomwater.matrix<-matrix(nrow=1,ncol=length(extrafiles)
#                           ,linematrix[1,]
#                           ,dimnames = list(-5))
#
#linematrix.2<-rbind(bottomwater.matrix,linematrix)



 }
















png(filename=paste0(folder,"../../rates.png")
      ,width=widthy,height=heighty  ,res=reso,units="mm"  )

par(mar=margin.list)

plot(linematrix.4[,1], rownames(linematrix.4)
     ,axes=F
     ,ylab="",xlab=""
     ,col = "white"
       # ,xaxs="i" 
     ,ylim=c(max(the.depths),depth.tricks[2])
     # ,ylim=c(max(the.depths),min(the.depths))
     ,xlim=c(0,max(linematrix.4))
     ,xpd=F
)
box(bty="o")
for(i in 1:(length(extrafiles)+1)){
 lines(linematrix.4[,i], rownames(linematrix.4)
       ,col=rates.colours[i]
       ,lwd=lwdsequence[i],lty=ltysequence[i]
       ) 
}
axis(2,cex.axis=0.7,cex.lab=1.0,tck=T,tcl=-0.2,line=0,tck=T,tcl=-0.3,col.axis="white",at=y.axis.sequence)# Ticks
axis(2,cex.axis=axis.label.size,tck=F,tcl=-0.2,line=label.line,lwd=0,at=y.axis.sequence,las=1)# Labels
axis(3     ,tck=T     ,tcl=-0.5     ,line = 0, at=x.axis.sequence
     ,col.axis="white"     ,cex.axis=1     ,cex=0.1     ) # The ticks
axis(3,cex.axis=axis.label.size, line =label.line, lwd= 0, tck=F,at=x.axis.sequence) # The labels
threetext<-expression("Organic matter reaction rate (mmol L "^-1*" y "^-1*")")
mtext(3,text=threetext,cex=axis.label.size,line=2,col="black")
par(xpd=F)

colnames(linematrix)

left.axis.text<-expression("Depth (cm)")
mtext(2,text=left.axis.text,cex=axis.label.size,line=2) # 1=bottom, 2=left, 3=top, 4=right
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

dev.off()