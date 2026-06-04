
aed.params.file.index<-which(aed.nml.file=="dbase");aed.params.file.index
aed.params.file.name<-paste0(folder,"../../",aed.nml.file[aed.params.file.index+2]);aed.params.file.name
# aed.params.file<-aed.nml.file[aed.params.file.index+2];aed.params.file.name
aed.params<-fread(aed.params.file.name)
OMModel<-as.numeric(aed.params[which(aed.params=="OMModel")][,2]);OMModel

if(OMModel==1){
  poml2dic<-as.numeric(aed.params[which(aed.params=="poml2dic")][,2]);poml2dic
  pomr2dic<-as.numeric(aed.params[which(aed.params=="pomr2dic")][,2]);pomr2dic
  pomspecial2dic<-as.numeric(aed.params[which(aed.params=="pomspecial2dic")][,2]);pomspecial2dic
}

if(OMModel==2){
  pocr2docr<-as.numeric(aed.params[which(aed.params=="pocr2docr")][,2]);pocr2docr
  pocl2docl<-as.numeric(aed.params[which(aed.params=="pocl2docl")][,2]);pocl2docl
  ponr2donr<-as.numeric(aed.params[which(aed.params=="ponr2donr")][,2]);ponr2donr
  ponl2donl<-as.numeric(aed.params[which(aed.params=="ponl2donl")][,2]);ponl2donl
  popr2dopr<-as.numeric(aed.params[which(aed.params=="popr2dopr")][,2]);popr2dopr
  popl2dopl<-as.numeric(aed.params[which(aed.params=="popl2dopl")][,2]);popl2dopl

  pomspecial2dic<-as.numeric(aed.params[which(aed.params=="pomspecial2dic")][,2]);pomspecial2dic

  docr2docl<-as.numeric(aed.params[which(aed.params=="docr2docl")][,2]);docr2docl
  docl2dic <-as.numeric(aed.params[which(aed.params=="docl2dic") ][,2]);docl2dic
  donr2donl<-as.numeric(aed.params[which(aed.params=="donr2donl")][,2]);donr2donl
  donl2din <-as.numeric(aed.params[which(aed.params=="donl2din") ][,2]);donl2din
  dopr2dopl<-as.numeric(aed.params[which(aed.params=="dopr2dopl")][,2]);dopr2dopl
  dopl2dip <-as.numeric(aed.params[which(aed.params=="dopl2dip") ][,2]);dopl2dip
}


kno2o2  <-as.numeric(aed.params[which(aed.params=="kno2o2") ][,2]);kno2o2
knh4no2 <-as.numeric(aed.params[which(aed.params=="knh4no2")][,2]);knh4no2
kNH4OX  <-as.numeric(aed.params[which(aed.params=="kNH4OX") ][,2]);kNH4OX

print(simulation.table)