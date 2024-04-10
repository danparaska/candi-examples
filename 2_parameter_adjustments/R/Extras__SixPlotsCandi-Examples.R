# Install the 'R Extension for Visual Studio Code' in order to run the rest of this script.

# Set the working directory. The VSC package is in the candi-examples folder, 
# therefore you need to set the R working directory to "R".
#setwd("R")

# Load packages
# source("InstallPackages.R") # Install plotting and data management packages if you don't have them installed.
source("LoadPackages.R") # Load plotting and data management packages that you have installed.

# Load an image to display in the plotting grid
the.figure<-load.image("../Readmeimages/FTEAFIn-02.png")

# Plotting loop settings
zones<-c(1)
z=1
extrafiles<-c( 
  "RO2"
  ,"bioturb"
  ,"cirrig"
  # ,"FSal"
  # ,"FSul"
)
i=1

# Load other plot settings
source("ColourSettings.R")
source("MultiplotSettings.R")

### For looping while running a sim, use the x feature
  # x=0
  # repeat{
  #   x <- x+1
  #   print(x)

for(z in 1){
  for(i in 1:length(extrafiles)){
  # for(i in 1:4){
folder<-paste0("../results/candi_aed/")
print(extrafiles[i])
  png(filename=paste0(folder,"../../6P_",extrafiles[i],"_.png")
      ,width=widthy,height=heighty  ,res=reso,units="mm"  )
  the.layout<-layout(mat=matrix(nrow=2,ncol=2
                      ,byrow=TRUE
                      ,c(1,2
                         ,3,4
                          ))
                    ,widths = c(1,1)              )
  layout.show(the.layout)
  par(mar=margin.list)# 1 bottom; 2 left; 3 top; 4 right
      ###
       source("DailyFluxLabels.R") # Flux label with units per day
       source("DailyFluxLabelsBold.R") # Flux label in bold font with units per day
       source("LabelsBoldNoUnit.R") # Variable label in bold font without unit, for headings
       source("ConcLabels.R") # Labels with concentration and unit, plus solid/solute and molecular mass
      ###
  
source("LoadExtraSedData.R")#0 Load the flux and concentration data
  # Six plots through the 2 by 3 grid
# source("SixPlots-tF_pomspecial.R")#2
  plot(the.figure,axes=F)#2
source("SixPlots-tdCExtras.R")#3
source("C_at_t_av.R")#4
source("C_at_d.R")#6
  dev.off() # Close the png file
} # end i loop
} # end z loop
      
    # if(x >= 10){
    #   break
   # x=0   }
      
dev.off();dev.off();dev.off()
dev.off();dev.off();dev.off()
dev.off();dev.off();dev.off()

