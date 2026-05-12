# Install the 'R Extension for Visual Studio Code' in order to run the rest of this script.

# Set the working directory. The VSC package is in the candi-examples folder, 
# therefore you need to set the R working directory to "R".
setwd("R_Depths")


# Load packages
# source("InstallPackages.R") # Install plotting and data management packages if you don't have them installed.
source("LoadPackages.R") # Load plotting and data management packages that you have installed.

# Load an image to display in the plotting grid
the.figure<-load.image("../Readmeimages/job1job2-01.png")

zones<-1; z=1
# Load other plot settings
source("ColourSettings.R")
widthy = 170; 
heighty = 75; 
axis.label.size=0.7
axis.tick.size=0.5
margin.list=c(2,4,5,2) # 1 bottom; 2 left; 3 top; 4 right

Depvar<-c("Layer_size_cm" )
# for(z in 1:length(zones)){
  
source("LoadDepthData.R")  
  folder<-paste0("../results/candi_aed/")

png(filename=paste0(folder,"../../",Depvar[1],"_.png")
    ,width=widthy,height=heighty  ,res=reso,units="mm"  )

the.layout<-layout(mat=matrix(nrow=1,ncol=2
                              ,byrow=TRUE
                              ,c(1,2
                              ))
                   ,widths = c(1,1)              )
layout.show(the.layout)
par(mar=margin.list)# 1 bottom; 2 left; 3 top; 4 right
source("Depths_x-y_plot.R")#1
par(mar=c(0,0,0,0))# 1 bottom; 2 left; 3 top; 4 right
plot(the.figure,axes=F)#2

# }#End zones
dev.off() # Close the png file
dev.off() # Close the png file
dev.off() # Close the png file
dev.off() # Close the png file
dev.off() # Close the png file



