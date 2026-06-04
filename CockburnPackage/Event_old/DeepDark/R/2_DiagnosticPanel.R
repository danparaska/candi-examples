# Install the 'R Extension for Visual Studio Code' in order to run the rest of this script.

# Set the working directory. Set the R working directory to "R".
getwd()
setwd("R")
folder<-paste0("../results/candi_aed/")

# Load packages
#source("InstallPackages.R") # Install plotting and data management packages if you don't have them installed.
source("LoadPackages.R") # Load plotting and data management packages that you have installed.

# Plotting loop settings
zones<-c(1)
z=1
i=1
files<-c( 
   "amm"
  ,"ch4"
  ,"dic"
  ,"feii"
  ,"feoh3a"
  ,"feco3"
  ,"h2s"
  ,"MPB"
  ,"n2"
  ,"n2o"
  ,"nit"
  ,"no2"
  ,"oxy"
  ,"poml"
  ,"pomr"
  ,"fes"
  ,"so4"
);source("ColourSettings.R");source("MultiplotSettings.R");source("LoadInputs.R")

# Load other plot settings
start.year = 0.1
stop.year  = 5.1
start.time = start.year*365
stop.time  = stop.year*365

for(i in 1:length(files)){
   #for(i in 4){
folder<-paste0("../results/candi_aed/")
print(files[i])
  png(filename=paste0(folder,"../../Panel_",files[i],"_",start.year,"_",stop.year,".png"),width=widthy,height=heighty  ,res=reso,units="mm"  )
  the.layout<-layout(mat=matrix(nrow=3,ncol=2
                      ,byrow=TRUE
                      ,c(1,2
                         ,3,4
                         ,5,6
                          ))      ,widths = c(1,1)              )
  layout.show(the.layout)
  par(mar=margin.list)# 1 bottom; 2 left; 3 top; 4 right
source("LoadSedData.R")#0 Load the flux and concentration data
  source("DailyFluxLabels.R") # Flux label with units per day
  source("DailyFluxLabelsBold.R") # Flux label in bold font with units per day
  source("LabelsBoldNoUnit.R") # Variable label in bold font without unit, for headings
  source("ConcLabels.R") # Labels with concentration and unit, plus solid/solute and molecular mass
source("SixPlots-tF_y.R")#1
source("SixPlots-tdC.R")#3
par(mar=margin.list)# 1 bottom; 2 left; 3 top; 4 right
source("C_at_t_av.R");simulation.table#4
source("SixPlots-MassLeftAxis.R");simulation.table#5
source("C_at_d.R");simulation.table#6
dev.off() # Close the png file
};source("DrawSimTable.R")  ;processmaps()     # end i loop

dev.off();dev.off();dev.off()