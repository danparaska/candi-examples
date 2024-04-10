# # Load flux file
# if(nchar(zones[z])==1){fluxsed<-(paste0(folder,"0000",zones[z],"/swi_fluxes.sed"))} # Load sed data}
# if(nchar(zones[z])==2){fluxsed<-(paste0(folder,"000" ,zones[z],"/swi_fluxes.sed"))} # Load sed data}
# if(nchar(zones[z])==3){fluxsed<-(paste0(folder,"00"  ,zones[z],"/swi_fluxes.sed"))}# Load sed data}
# fluxdata<-fread(file=fluxsed, header=FALSE, skip=2)
# ifelse( max(uno,na.rm=T) < start.time ,time.start.index<-which.max(uno), time.start.index<-which.min(abs(uno - start.time)))


if(nchar(zones[z])==1){sed<-(paste0(folder,"0000",zones[z],"/Extras/",extrafiles[i],".sed"));depfi<-(paste0(folder,"0000",zones[z],"/Depths.sed"))} # Load sed data}
if(nchar(zones[z])==2){sed<-(paste0(folder,"000" ,zones[z],"/Extras/",extrafiles[i],".sed"));depfi<-(paste0(folder,"000" ,zones[z],"/Depths.sed"))} # Load sed data}
if(nchar(zones[z])==3){sed<-(paste0(folder,"00"  ,zones[z],"/Extras/",extrafiles[i],".sed"));depfi<-(paste0(folder,"00"  ,zones[z],"/Depths.sed"))} # Load sed data}
file    <-fread(file=sed, header=FALSE, skip=3)# Load sed data

eins<-as.matrix(file[1,]) # First column
class(eins)<-"numeric"
# uno <-as.numeric(as.matrix(fluxdata[3:dim(fluxdata)[1],1]))
uno <-as.numeric(as.matrix(file[1:dim(file)[1],1]))
ifelse( max(uno,na.rm=T) < stop.time  ,time.stop.index <-which.max(uno)-1, time.stop.index <-which.min(abs(uno - stop.time )))
times<- uno[time.start.index:time.stop.index]
timey<- times/365.25
# headings <- as.matrix(fluxdata[1,])
times_y=NULL
for(ty in 1:length(percentwaythrough)) {
  times_y[ty]=max(timey)*percentwaythrough[ty]/100
};  times_y

# folder<-paste0("V:/danp/UAE/5/1yf/","D","/results/candi_aed/")
# Time axes
axis.sequence = round_any(seq(min(timey),max(timey),length.out=tick.master.x),roundx,f=floor);axis.sequence
# date.axis.sequence.1 = as.Date(axis.sequence,origin = startdate);date.axis.sequence.1#daily
date.axis.sequence.1 = as.Date(axis.sequence*365,origin = startdate);date.axis.sequence.1#daily
date.axis.sequence.2 = format(date.axis.sequence.1, sep="/", format = "%b-%Y");date.axis.sequence.2
date.axis.sequence.2.y = format(date.axis.sequence.1, sep="/", format = "%Y");date.axis.sequence.2

