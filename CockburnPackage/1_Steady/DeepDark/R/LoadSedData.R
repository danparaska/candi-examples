# Load flux file
if(nchar(zones[z])==1){fluxsed<-(paste0(folder,"0000",zones[z],"/swi_fluxes.sed"))} # Load sed data}
if(nchar(zones[z])==2){fluxsed<-(paste0(folder,"000" ,zones[z],"/swi_fluxes.sed"))} # Load sed data}
if(nchar(zones[z])==3){fluxsed<-(paste0(folder,"00"  ,zones[z],"/swi_fluxes.sed"))}# Load sed data}
fluxdata<-fread(file=fluxsed, header=FALSE, skip=2)
uno <-as.numeric(as.matrix(fluxdata[3:dim(fluxdata)[1],1]))
ifelse( max(uno,na.rm=T) < start.time ,time.start.index<-which.max(uno), time.start.index<-which.min(abs(uno - start.time)))
ifelse( max(uno,na.rm=T) < stop.time  ,time.stop.index <-which.max(uno)-1, time.stop.index <-which.min(abs(uno - stop.time )))
times<- uno[time.start.index:time.stop.index]
timey<- times/365.25
headings <- as.matrix(fluxdata[1,])
times_y=NULL
for(ty in 1:length(percentwaythrough)) {
  times_y[ty]=max(timey)*percentwaythrough[ty]/100
};  times_y

fluxdata.2<-fluxdata[-1:-2,]
flux.names<-as.character(fluxdata[1,]); flux.names
colnames(fluxdata.2)<-flux.names ; head(fluxdata.2)
class(fluxdata.2)
fluxdata.3<-as.matrix(fluxdata.2)
class(fluxdata.3)<-"numeric"; head(fluxdata.3)
flux.av<-colMeans(fluxdata.3); flux.av
flux.av<-   signif(flux.av,3); flux.av

for(ff in 1:  ncol(simulation.table) ){
  flux.av.col  <- as.numeric(which(colnames(simulation.table)[ff]==names(flux.av)  ) )
  simulation.table[2,ff] <- flux.av[flux.av.col]
  };simulation.table

ifelse( abs(max(timey,na.rm=T))>1
          ,roundx   <- 10^floor(log10(abs(max(timey,na.rm=T))) )/10
          ,roundx   <- 10^floor(log10(abs(min(timey,na.rm=T))) )/10
  );roundx
roundx=0.1  

# Time axes
axis.sequence = round_any(seq(min(timey),max(timey),length.out=tick.master.x),roundx,f=floor);axis.sequence
axis.sequence = round_any(seq(min(timey),max(timey),length.out=tick.master.x)-axis.sequence[1],roundx,f=floor);axis.sequence
axis.sequence[1]
# date.axis.sequence.1 = as.Date(axis.sequence,origin = startdate);date.axis.sequence.1#daily
date.axis.sequence.1 = as.Date(axis.sequence*365,origin = startdate);date.axis.sequence.1#daily
date.axis.sequence.2 = format(date.axis.sequence.1, sep="/", format = "%b-%Y");date.axis.sequence.2
date.axis.sequence.2.y = format(date.axis.sequence.1, sep="/", format = "%Y");date.axis.sequence.2


if(nchar(zones[z])==1){sed<-(paste0(folder,"0000",zones[z],"/",files[i],".sed"));depfi<-(paste0(folder,"0000",zones[z],"/Depths.sed"))} # Load sed data}
if(nchar(zones[z])==2){sed<-(paste0(folder,"000" ,zones[z],"/",files[i],".sed"));depfi<-(paste0(folder,"000" ,zones[z],"/Depths.sed"))} # Load sed data}
if(nchar(zones[z])==3){sed<-(paste0(folder,"00"  ,zones[z],"/",files[i],".sed"));depfi<-(paste0(folder,"00"  ,zones[z],"/Depths.sed"))} # Load sed data}
file    <-fread(file=sed, header=FALSE, skip=3)# Load sed data

eins<-as.matrix(file[1,]) # First column

for(ff in 1:  ncol(simulation.table) ){
  if(length(grep( colnames(simulation.table)[ff] , names(swibc.av)))>0){
    swibc.av.col  <- as.numeric(which(colnames(simulation.table)[ff]==names(swibc.av)  ) )
    simulation.table[1,ff] <- swibc.av[swibc.av.col]
  }   # If in swibc 
} ; simulation.table # For ff  
    
