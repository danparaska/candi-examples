# Install the 'R Extension for Visual Studio Code' in order to run the rest of this script.

# Set the working directory. The VSC package is in the candi-examples folder, 
# therefore you need to set the R working directory to "R".
getwd()
#setwd("0_software_setup/R")
#setwd("R")

# Load packages
#source("InstallPackages.R") # Install plotting and data management packages if you don't have them installed.
source("LoadPackages.R") # Load plotting and data management packages that you have installed.

# Load an image to display in the plotting grid
# the.figure<-load.image("V:/danp/Cockburn/PeishengLoop/3_2022_OMMod2_x5/NModels-37.png")

# Plotting loop settings
zones<-c(1)
z=1
files<-c( 
  "amm"
  ,"dic"
  ,"docl"
  ,"docr"
  ,"donl"
  ,"donr"
  ,"n2"
  ,"nit"
  ,"no2"
  ,"oxy"
  ,"pocl"
  ,"pocr"
  ,"ponl"
  ,"ponr"
# )
);source("ColourSettings.R");source("MultiplotSettings.R");source("LoadInputs.R")


files<-c( 
  "amm"
  ,"dic"
  ,"n2"
  ,"nit"
  ,"no2"
  ,"oxy"
  ,"poml"
  ,"pomr"
# )
);source("ColourSettings.R");source("MultiplotSettings.R");source("LoadInputs.R")


i=1

# Load other plot settings
source("ColourSettings.R")
source("MultiplotSettings.R")
source("LoadInputs.R")


# for(z in 1){
  for(i in 1:length(files)){
  # for(i in 1){
#folder<-paste0("../results/candi_aed/")
# folder<-paste0("V:/danp/Cockburn/PeishengLoop/2_2022_MoreOM_OMMod1/results/candi_aed/")
folder<-paste0("V:/danp/Cockburn/PeishengLoop/4_2022_OMMod2_x1/results/candi_aed/")
print(folder);print(sdgfolder)

print(files[i])
  png(filename=paste0(folder,"../../6P_",files[i],"_.png"),width=widthy,height=heighty  ,res=reso,units="mm"  )
  the.layout<-layout(mat=matrix(nrow=3,ncol=2
                      ,byrow=TRUE
                      ,c(1,2
                         ,3,4
                         ,5,6
                          ))      ,widths = c(1,1)              )
  layout.show(the.layout)
  par(mar=margin.list)# 1 bottom; 2 left; 3 top; 4 right
source("LoadSedData.R")#0 Load the flux and concentration data

      ###
  flux.av.files
       source("DailyFluxLabels.R") # Flux label with units per day
       source("DailyFluxLabelsBold.R") # Flux label in bold font with units per day
       source("LabelsBoldNoUnit.R") # Variable label in bold font without unit, for headings
       source("ConcLabels.R") # Labels with concentration and unit, plus solid/solute and molecular mass
      ###
  # Six plots through the 2 by 3 grid
source("SixPlots-tF_y.R")#1
  #plot(the.figure,axes=F)#2
source("SixPlots-tdC.R")#3
par(mar=margin.list)# 1 bottom; 2 left; 3 top; 4 right
source("C_at_t_av.R");simulation.table#4
source("SixPlots-MassLeftAxis.R");simulation.table#5
source("C_at_d.R");simulation.table#6
dev.off() # Close the png file

};source("DrawSimTable.R")  ;processmaps()     # end i loop
# } # end z loop
      
    # if(x >= 10){
    #   break
   # x=0   }

dev.off();dev.off();dev.off()
dev.off();dev.off();dev.off()
dev.off();dev.off();dev.off()



