#i=5
#print(extrafiles[i])
if(nchar(zones[z])==1){sed<-(paste0(folder,"0000",zones[z],"/Extras/",extrafiles[i],".sed"));depfi<-(paste0(folder,"0000",zones[z],"/Depths.sed"))} # Load sed data}
if(nchar(zones[z])==2){sed<-(paste0(folder,"000" ,zones[z],"/Extras/",extrafiles[i],".sed"));depfi<-(paste0(folder,"000" ,zones[z],"/Depths.sed"))} # Load sed data}
if(nchar(zones[z])==3){sed<-(paste0(folder,"00"  ,zones[z],"/Extras/",extrafiles[i],".sed"));depfi<-(paste0(folder,"00"  ,zones[z],"/Depths.sed"))} # Load sed data}
file    <-fread(file=sed, header=FALSE, skip=3)# Load sed data (slow step)
eins<-as.matrix(file[1,]) # First column
class(eins)<-"numeric"
# uno <-as.numeric(as.matrix(fluxdata[3:dim(fluxdata)[1],1]))
uno <-as.numeric(as.matrix(file[1:dim(file)[1],1]))
ifelse( max(uno,na.rm=T) < start.time ,time.start.index<-which.max(uno), time.start.index<-which.min(abs(uno - start.time)))
ifelse( max(uno,na.rm=T) < stop.time  ,time.stop.index <-which.max(uno)-1, time.stop.index <-which.min(abs(uno - stop.time )))
times<- uno[time.start.index:time.stop.index]
timey<- times/365.25
# headings <- as.matrix(fluxdata[1,])
times_y=NULL
for(ty in 1:length(percentwaythrough)) {
  times_y[ty]=max(timey)*percentwaythrough[ty]/100
};  times_y

# Time axes
axis.sequence = round_any(seq(min(timey),max(timey),length.out=tick.master.x),roundx,f=floor);axis.sequence
# date.axis.sequence.1 = as.Date(axis.sequence,origin = startdate);date.axis.sequence.1#daily
date.axis.sequence.1 = as.Date(axis.sequence*365,origin = startdate);date.axis.sequence.1#daily
date.axis.sequence.2 = format(date.axis.sequence.1, sep="/", format = "%b-%Y");date.axis.sequence.2
date.axis.sequence.2.y = format(date.axis.sequence.1, sep="/", format = "%Y");date.axis.sequence.2

Npath.time
dim(file)[2]
Npath.index    <-which.min(abs(uno - Npath.time));Npath.index
Npath.at.time  <-file[Npath.index,2:dim(file)[2]];Npath.at.time
Npath.at.time.t<-t(Npath.at.time);Npath.at.time.t
to.5.cm        <-Npath.at.time.t[1:which.min(abs(eins - 5.0))];to.5.cm
index.5.cm     <-which.max(to.5.cm); index.5.cm


depfile.1<-as.matrix(read.table(file=depfi, header=FALSE, skip=0))
rownames(depfile.1)<-gsub("&","",depfile.1[,1])
depfile.2<-data.frame(t(depfile.1[,2:dim(depfile.1)[2]]))
ifelse( max(eins) < desired.depth ,depthindex<-length(eins)-1,depthindex<-which.min(abs(eins - desired.depth)))
porewatervolume=as.numeric(depfile.2$Porewater_m3_per_m2[2:depthindex])
raw<-sweep(x=Npath.at.time, MARGIN = 2, STATS = porewatervolume, FUN="*") # mmol [ ] / L × m3 water / m2 space / y
mas <- raw * 1000 # L / m3
mas.sum  <-rowSums(x=mas  ,na.rm = T); mas.sum
mas.mean <-mean(as.numeric(mas[1:index.5.cm])); mas.mean



Npath.max     <-max(Npath.at.time);      Npath.max
ifelse(Npath.max<0.01,round.N<-0.001,ifelse(Npath.max<0.1, round.N<-0.01,ifelse(Npath.max<1,round.N<-0.1,ifelse(Npath.max<10,round.N<-1,round.N<-2))));round.N
Npath.max     <-round_any(Npath.max,round.N,f=floor);Npath.max
if(Npath.max<0.001){Npath.max<-formatC(max(Npath.at.time), format = "e", digits = 2)};Npath.max


Npath.sum     <-mas.sum;      Npath.sum
ifelse(Npath.sum<0.01,round.N<-0.001,ifelse(Npath.sum<0.1, round.N<-0.01,ifelse(Npath.sum<1,round.N<-0.1,ifelse(Npath.sum<10,round.N<-1,round.N<-2))));round.N
Npath.sum     <-round_any(Npath.sum,round.N,f=floor);Npath.sum
if(Npath.sum<0.001){Npath.sum<-formatC(mas.sum, format = "e", digits = 2)};Npath.sum

Npath.5cm     <-mas.mean;           Npath.5cm
ifelse(Npath.5cm<0.01,round.N<-0.001,ifelse(Npath.5cm<0.1, round.N<-0.01,ifelse(Npath.5cm<1,round.N<-0.1,ifelse(Npath.5cm<10,round.N<-1,round.N<-2))));round.N
Npath.5cm     <-round_any(Npath.5cm,round.N,f=floor);Npath.5cm
if(Npath.5cm<0.001){Npath.5cm<-formatC(mas.mean, format = "e", digits = 2)};Npath.5cm

npath.index   <-which(extrafiles[i]==colnames(npath.table));npath.index
 
  npath.table[1,npath.index] <- Npath.max       # "Maximum rate"
  npath.table[2,npath.index] <- Npath.sum       # "Total rate"
  npath.table[3,npath.index] <- Npath.5cm       # "Average rate 2 cm"
 
npath.table

extrafiles[i]

