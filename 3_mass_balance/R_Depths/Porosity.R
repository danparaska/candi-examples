# Install the 'R Extension for Visual Studio Code' in order to run the rest of this script.

# Set the working directory. The VSC package is in the candi-examples folder, 
# therefore you need to set the R working directory to "R".
 setwd("../R_Depths")

# Load packages
# source("InstallPackages.R") # Install plotting and data management packages if you don't have them installed.
source("LoadPackages.R") # Load plotting and data management packages that you have installed.

# Load an image to display in the plotting grid
#the.figure<-load.image("../Readmeimages/Bioturb-02.png")

zones<-1; z=1
# Load other plot settings
source("ColourSettings.R")
widthy = 80; 
heighty = 75; 
axis.label.size=0.7
axis.tick.size=0.5
margin.list=c(2,4,5,2) # 1 bottom; 2 left; 3 top; 4 right

Depvar<-c("Porosity" )
# for(z in 1:length(zones)){
  
source("LoadDepthData.R")  
  folder<-paste0("../results/candi_aed/")

png(filename=paste0(folder,"../../",Depvar[1],"_.png")
    ,width=widthy,height=heighty  ,res=reso,units="mm"  )

par(mar=margin.list)# 1 bottom; 2 left; 3 top; 4 right
source("Depths_x-y_plot.R")#1

dev.off() # Close the png file
dev.off() # Close the png file
dev.off() # Close the png file
dev.off() # Close the png file
dev.off() # Close the png file