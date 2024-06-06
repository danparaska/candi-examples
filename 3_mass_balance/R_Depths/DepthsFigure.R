# Install the 'R Extension for Visual Studio Code' in order to run the rest of this script.

# Set the working directory. The VSC package is in the candi-examples folder, 
# therefore you need to set the R working directory to "R".
setwd("R_Depths")

# Load an image to display in the plotting grid
the.figure<-load.image("Overview2.png")

# Load packages
source("InstallPackages.R") # Install plotting and data management packages if you don't have them installed.
source("LoadPackages.R") # Load plotting and data management packages that you have installed.

# Load other plot settings
source("ColourSettings.R")
source("MultiplotSettings.R")

zones<-1


for(z in 1:length(zones)){
  
  for(zz in 1:length(zones)){
    if(nchar(zones)==1){longzones<-paste0("0000",zones)} # Load sed data}
    if(nchar(zones)==2){longzones<-paste0("000" ,zones)} # Load sed data}
    if(nchar(zones)==3){longzones<-paste0("00"  ,zones)} # Load sed data}
  }
  
  
  depfi<-(paste0(folder,longzones,"/","Depths.sed"))
  depfile.1<-as.matrix(read.table(file=depfi, header=FALSE, skip=0))
  rownames(depfile.1)<-gsub("&","",depfile.1[,1])
  depfile.2<-data.frame(t(depfile.1[,2:dim(depfile.1)[2]]))
  Depcols<-list(
     depfile.2$Depths
    ,depfile.2$Porosity
    ,depfile.2$Irrigation
    ,depfile.2$Bioturbation
    ,depfile.2$Layer_size_cm
    ,depfile.2$Thick_cm
    ,depfile.2$Porewater_m3_per_m2
    ,depfile.2$Solids_m3_per_m2
  )
  
  
folder<-paste0("../results/candi_aed/")
png(filename=paste0(folder,"../../Depths_",files[i],"_.png")
    ,width=widthy,height=heighty  ,res=reso,units="mm"  )
the.layout<-layout(mat=matrix(nrow=2,ncol=2
                              ,byrow=TRUE
                              ,c(1,2
                                 ,3,4
                              ))
                   ,widths = c(1,1)              )
layout.show(the.layout)
par(mar=margin.list)# 1 bottom; 2 left; 3 top; 4 right

}#End zones

plot(the.figure,axes=F)#2

dev.off() # Close the png file
