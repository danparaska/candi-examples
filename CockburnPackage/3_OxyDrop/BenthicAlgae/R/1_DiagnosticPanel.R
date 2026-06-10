# Install the 'R Extension for Visual Studio Code' in order to run the rest of this script.

# Set the working directory. Set the R working directory to "R".
getwd()
setwd("R")
folder<-paste0("../results/candi_aed/")

# Load packages
#source("InstallPackages.R") # Install plotting and data management packages if you don't have them installed.
source("LoadPackages.R") # Load plotting and data management packages that you have installed.

zones<-c(1) # If there are multiple zones, list them here c(1, 2, 3 ...)
z=1 # Zone index, if necessary
i=1 # Variables (files) index
files<-c( 
   "amm"
  ,"ch4"
  ,"dic"
  ##,"feii"
  ##,"feoh3a"
  ##,"feco3"
  ##,"h2s"
  ##,"MPB"
  ##,"n2"
  ##,"n2o"
  ##,"nit"
  ##,"no2"
  ##,"oxy"
  ,"poml"
  ,"pomr"
  ##,"fes"
  ##,"so4"
);source("ColourSettings.R");source("MultiplotSettings.R");source("LoadInputs.R"); source("LoadAEDParameters.R")

# Load other plot settings
start.year = 10 # Start at this year to avoid spinup time
stop.year  = 11
start.time = start.year*365
stop.time  = stop.year *365

# Plotting loop for variables
for(i in 1:length(files)){
folder<-paste0("../results/candi_aed/")
print(files[i])
  png(filename=paste0(folder,"../../results/Panel_",files[i],"_",start.year,"_",stop.year,".png"),width=widthy,height=heighty  ,res=reso,units="mm"  )
  the.layout<-layout(mat=matrix(nrow=3,ncol=2
                      ,byrow=TRUE
                      ,c(1,2
                         ,3,4
                         ,5,6
                          ))      ,widths = c(1,1)              )
  layout.show(the.layout)
  par(mar=margin.list)# 1 bottom; 2 left; 3 top; 4 right
source("LoadSedData.R")# Load the flux and concentration data
  # Load labels for concentrations and fluxes
  source("DailyFluxLabels.R") # Flux label with units per day
  source("DailyFluxLabelsBold.R") # Flux label in bold font with units per day
  source("LabelsBoldNoUnit.R") # Variable label in bold font without unit, for headings
  source("ConcLabels.R") # Labels with concentration and unit, plus solid/solute and molecular mass
# Plots in the panel
source("Panel-tF.R")    #1
source("Panel-tdC.R")   #2
# The image.plot function in tdC changes the margins so we reset it here:
par(mar=margin.list)# 1 bottom; 2 left; 3 top; 4 right
source("Panel-Ct_av.R") #3
source("Panel-Mass.R")  #4
source("Panel-Cd.R")    #5
simulation.table
dev.off() # Close the png file
}; source("DrawSimTable.R"); processmaps() # end i loop; Write the summary table;
dev.off()
