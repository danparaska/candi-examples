depfile.1<-as.matrix(read.table(file=depfi, header=FALSE, skip=0))
rownames(depfile.1)<-gsub("&","",depfile.1[,1])
depfile.2<-data.frame(t(depfile.1[,2:dim(depfile.1)[2]]))

nnrows=length(file)-3# Load sed data 
# eins<-as.matrix(file[1,]) # First column
# uno <-as.matrix(file[,1])

# Keep this.
ifelse( max(uno) < start.time ,time.start.index<-which.max(uno) ,time.start.index<-which.min(abs(uno - start.time)))
# Comment this out to keep the `time.stop.index` the same as in the tF script #
# ifelse( max(uno) < stop.time  ,time.stop.index <-which.max(uno)  ,time.stop.index <-which.min(abs(uno - stop.time )))
# Comment this out to keep the `time.stop.index` the same as in the tF script #

# time<-as.matrix(file[1:which.max(file[,1]),1])/1#365.25 # Adjust this to change time unit
time<-as.matrix(uno[time.start.index:time.stop.index])/1#365.25 # Adjust this to change time unit

ifelse( max(eins) < desired.depth ,depthindex<-length(eins)-1,depthindex<-which.min(abs(eins - desired.depth)))
ifelse( max(eins) < desired.depths[1] ,depthindex.1<-length(eins),depthindex.1<-which.min(abs(eins - desired.depths[1])))
ifelse( max(eins) < desired.depths[2] ,depthindex.2<-length(eins),depthindex.2<-which.min(abs(eins - desired.depths[2])))
                                       depthindex.3<-length(eins)

row1<-as.matrix(     file[1,1:depthindex  ]    )            #layernum]) # Top row
con <-as.matrix( file [1+time.start.index :time.stop.index  ,  2:depthindex  ] ) # Concentration matrix
dim(con)
cc<-ncol(con);cc
rr<-nrow(con);rr
if(neg==TRUE){
    for(c in 1:cc){
        for(r in 1:rr){
          con[r,c]<-as.matrix(as.numeric(con[r,c])*-1)
        }
    }
};con[1:5,1:5]
con<-matrix(as.numeric(con),ncol=cc,nrow=rr);con[1:5] # mmol /L /y

# mol<-con*as.numeric((depfile.2$Porewater_m3_per_m2[2:depthindex]))*1000 # mmol/L × m3 × 1000 matrix 
# mol<-con*as.numeric(as.matrix(depfile.2$Porewater_m3_per_m2[2:depthindex]))*1000 # mmol/L × m3 × 1000 matrix 
# porewatervolume=(as.matrix(as.numeric(depfile.2$Porewater_m3_per_m2[2:depthindex])))
porewatervolume=as.numeric(depfile.2$Porewater_m3_per_m2[2:depthindex])
solidsvolume   =as.numeric(depfile.2$Solids_m3_per_m2[2:depthindex])
thickness      =as.numeric(depfile.2$Thick_cm[2:depthindex])
thedepths      =as.numeric(depfile.2$Depths[2:depthindex])
      
# mol<-con*as.numeric((depfile.2$Porewater_m3_per_m2[2:depthindex]))*1000 # mmol/L × m3 × 1000 matrix 
raw<-NULL
if(issolid==F){
   print("Solute")
   raw<-sweep(x=con, MARGIN = 2, STATS = porewatervolume, FUN="*") # mmol [ ] / L × m3 water / m2 space / y
} # mmol / m2 / y

if(issolid==T){
   print("Solid")
   raw<-sweep(x=con, MARGIN = 2, STATS = solidsvolume,    FUN="*") # mmol [ ] / L × m3 solids / m2 space / y
} # mmol / m2 / y

mas <- raw * 1000 # L / m3
# mmol / m2 / y
mas.top<-as.matrix( mas [,  2  ] )*0.5 # Concentration matrix
# matt.top = as.matrix( mas [,  2:3  ] )*0.5*(as.numeric(depfile.2$Depths[3])-as.numeric(depfile.2$Depths[2] ))
mas.1  <-as.matrix( mas [,  1:depthindex.1  ] ) # Concentration matrix
mas.2  <-as.matrix( mas [,  (depthindex.1 + 1):depthindex.2 ] ) # Concentration matrix
mas.3  <-as.matrix( mas [,  (depthindex.2 + 1):dim(mas)[2]  ] ) # Concentration matrix

timey<-as.vector(t(time))/365.25 #  Transpose time #
time.s<-timey[seq(from=1,to=length(timey),by=subsample)]
datey<-as.Date(time.s,origin = startdate)

mas.1.sum<-rowSums(x=mas.1,na.rm = T)
mas.2.sum<-rowSums(x=mas.2,na.rm = T)
mas.3.sum<-rowSums(x=mas.3,na.rm = T)
mas.sum  <-rowSums(x=mas  ,na.rm = T)

ifelse( abs(max(mas.1.sum,na.rm=T))>0
        ,roundy   <- 10^floor(log10(abs(max(mas.1.sum,na.rm=T))) )/10
        ,roundy   <- 10^floor(log10(abs(min(mas.1.sum,na.rm=T))) )/10
);roundy
# y.axis.sequence      = round_any(seq(from=0,to=max(mas.sum),length.out=tick.master.y),roundy,f=floor);y.axis.sequence
y.axis.sequence      = round_any(seq(from=0,to=max(mas.sum, na.rm = T),length.out=tick.master.y),roundy,f=floor);y.axis.sequence
y.axis.sequence.sig  = signif(y.axis.sequence,digits = 2);y.axis.sequence.sig


plot(timey, mas.1.sum
# plot(timey, (matt.top.1.sum+
#                mas.1.sum+
#                mas.2.sum+
#                mas.3.sum)
     ,axes=F
     ,ylab="",xlab=""
     ,col = "white"
     # ,type = "h"
     # ,ylim=c(0,max(mas.1.sum))
     ,ylim=c(0,max(mas.sum))
     ,xaxs="i" 
     # ,yaxs="i"
     ,xlim=c(min(axis.sequence),max(axis.sequence))
     ,xpd=F
     )
mass.colours  <-c("antiquewhite","wheat","burlywood4","grey40")
legend.text <-c(
                paste0("SWI to ",desired.depths[1]," cm")
                ,paste0(desired.depths[1]," cm to ",desired.depths[2]," cm")
                ,paste0(desired.depths[2]," cm to bottom")
                )
par(xpd=F)
 points(timey, mas.sum                     ,type="h",col=mass.colours[1]
         ,lwd=10,lend="butt"
 )

 points(timey,(mas.1.sum+mas.2.sum+mas.3.sum),type="h",xaxs="i",col=mass.colours[2]
         ,lwd=2,lend="butt"
 )
          # points(timey,(mas.1.sum),type="h",xaxs="i"
          #        ,col=mass.colours[2]
          #         ,lwd=2,lend="butt"
          # )
 points(timey,(mas.2.sum+mas.3.sum)          ,type="h",col=mass.colours[3]
       # points(timey,(mas.2.sum)          ,type="h",col=mass.colours[3]
         ,lwd=10,lend="butt"
 )
 points(timey, mas.3.sum                     ,type="h",col=mass.colours[4]
         ,lwd=10,lend="butt"
 )
box(bty="o")
left.axis.text<-expression("Integrated value m "^-2)
mtext(2,text=left.axis.text,cex=axis.label.size,line=5) # 1=bottom, 2=left, 3=top, 4=right
mtext(1,text="Time (date)",cex=axis.label.size,line=1.5, adj=0.55)
axis(2,cex.axis=axis.tick.size,cex.lab=1.0,tck=T,tcl=-0.2,line=0,tck=T,tcl=-0.3,col.axis="white"
       ,at=y.axis.sequence.sig)# Ticks
axis(2,cex.axis=axis.label.size,cex.lab=1.0,tck=F,tcl=-0.2,line=0.0,lwd=0
     ,at=y.axis.sequence.sig,las=1)# Labels

axis(3,tck=T,tcl=-0.3,xaxs="i",yaxs="i",line=0,col.axis="white"
     ,at=axis.sequence
) # The ticks
axis(3,cex.axis=axis.label.size,xaxs="i",yaxs="i",line=-0.5,lwd = 0 
     ,at=axis.sequence
) # The labels

axis(1,tck=T,tcl=-0.3,xaxs="i",yaxs="i",line=0,col.axis="white"
     ,at=axis.sequence
) # The ticks
axis(1,cex.axis=axis.label.size,xaxs="i",yaxs="i",line=-0.50,lwd = 0
     ,at=axis.sequence
     ,labels=date.axis.sequence.2
) # The labels

      # # mtext(4,text="Cumulative flux",cex=axis.label.size,line=4.0) # 1=bottom, 2=left, 3=top, 4=right
      mtext(3,text="Time (number of years)",cex=axis.label.size,line=1.5, adj=0.55)
      # mtext(1,text="Time (date)",cex=axis.label.size,line=1.5, adj=0.55)
# Cumulative plot. Turn it on or off ^^^
# # # # # # # # # # # # # # # # # # # # # # # # # # 
par(xpd=T)
legend( x=max(timey)*0.70 , y=max(mas.sum)*0.5
  # "bottomright"        , inset= legend.inset-0.1
        # , fill = c(mass.colours[2])
        , fill = c(mass.colours[2:4])
        # , legend = legend.text[1]
        , legend = legend.text
        # , pch = 15
        , bty = "o"
        , cex = axis.label.size
        , title = expression("Sum over all depths per 1 m"^2)
        # , title = "Mass in sediment (left axis)"
)
# legend( "right"
#         , inset  = 0.05
#         # , fill   = cumul.colours
#         , col   = cumul.colours
#         , legend = cumul.leg.text
#         # , pch    = 20
#         , bty    = "o"
#         , cex    = axis.label.size*1.0
#         , lty    = 1
#         , title = "Cumulative mass (right axis)" 
# )
# 
final.mass<-mas.1.sum[length(mas.1.sum)];final.mass
final.mass<-signif(final.mass,2)
#final.mass.index<-which(files[i]==colnames(simulation.table))
#simulation.table[4,final.mass.index]<-final.mass; simulation.table
