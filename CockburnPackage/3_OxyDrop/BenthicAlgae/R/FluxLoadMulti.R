if(nchar(zones[z])==1){fluxsed<-(paste0(folder,"0000",zones[z],"/swi_fluxes.sed"))} # Load sed data}
if(nchar(zones[z])==2){fluxsed<-(paste0(folder,"000" ,zones[z],"/swi_fluxes.sed"))} # Load sed data}
if(nchar(zones[z])==3){fluxsed<-(paste0(folder,"00"  ,zones[z],"/swi_fluxes.sed"))}# Load sed data}
fluxdata<-fread(file=fluxsed, header=FALSE, skip=2)
uno <-as.numeric(as.matrix(fluxdata[3:dim(fluxdata)[1],1]))
ifelse( max(uno,na.rm=T) < start.time ,time.start.index<-which.max(uno), time.start.index<-which.min(abs(uno - start.time)))
ifelse( max(uno,na.rm=T) < stop.time  ,time.stop.index <-which.max(uno)-1, time.stop.index <-which.min(abs(uno - stop.time )))
times<- uno[time.start.index:time.stop.index]
timey<- times/365.25
axis.sequence = round_any(seq(min(timey),max(timey),length.out=tick.master.x),roundx,f=floor);axis.sequence
date.axis.sequence.1 = as.Date(axis.sequence*365,origin = startdate);date.axis.sequence.1#daily
date.axis.sequence.2 = format(date.axis.sequence.1, sep="/", format = "%b-%Y");date.axis.sequence.2
date.axis.sequence.2.y = format(date.axis.sequence.1, sep="/", format = "%Y");date.axis.sequence.2
  headings <- as.matrix(fluxdata[1,])
  fluxcol  <- as.numeric(which(headings==files[i]))
  issolid  <- as.matrix(fluxdata[2, ..fluxcol])
  chemcol  <- as.matrix(fluxdata[ 3:length(as.matrix(fluxdata[,1])) , ..fluxcol ])
  chem     <- as.matrix(chemcol[ time.start.index:time.stop.index ])
  chem     <- as.numeric(chem)/1 # /365 to convert from yearly to daily
  for(cc in 1:length(chem)){
    if(is.na(chem[cc])){chem[cc]=0}
  }
linematrix[ ,i] <- t(as.matrix(chem))
source("LabelsNoUnit.R");label
legend.names[i]<-label