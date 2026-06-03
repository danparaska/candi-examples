setwd("R")
# source("InstallPackages.R") # Install plotting and data management packages if you don't have them installed.
source("LoadPackages.R") # Load plotting and data management packages that you have installed.
# Plotting loop settings
zones<-c(1); z=1; i=1
extrafiles<-c( 
  "TerminalOxidationPerTEA"
  ,"TerminalOxidationPerPOC"
  ,"reac_O2"
  ,"reac_POML"
  ,"RTDIC"
  ,"Rgpp"
  ,"Rrsp"
  ,"RRootsO2"
  ,"ROMO2"
  ,"ROMFeOH"
  ,"ROMSO4"
  ,"FO2"
  ,"NH4release"
)
files<-extrafiles
# Load other plot settings
source("ColourSettings.R")
source("MultiplotSettings.R")
start.time = 10*365
stop.time  = 12*365
margin.list<-c(2.5,6.5,6.5,5.0)# 1 bottom; 2 left; 3 top; 4 right
  for(i in 1:length(extrafiles)){
  #for(i in 6){
folder<-paste0("../results/candi_aed/")
print(extrafiles[i])
files<-extrafiles
  png(filename=paste0(folder,"../../Extras_",extrafiles[i],"_.png")
      ,width=widthy,height=heighty  ,res=reso,units="mm"  )
  the.layout<-layout(mat=matrix(nrow=2,ncol=2
                      ,byrow=TRUE
                      ,c(1,2
                         ,3,4
                          ))
                    ,widths = c(1,1)              )
  layout.show(the.layout)
  par(mar=margin.list)# 1 bottom; 2 left; 3 top; 4 right
       source("DailyFluxLabels.R") # Flux label with units per day
       source("DailyFluxLabelsBold.R") # Flux label in bold font with units per day
       source("LabelsBoldNoUnit.R") # Variable label in bold font without unit, for headings
       source("ExtrasConcLabels.R") # Labels with concentration and unit, plus solid/solute and molecular mass
  source("LoadExtraSedData.R")#0 Load the flux and concentration data
  source("C_at_t_av_Extras.R")#1
  source("C_at_d_Extras.R")#2
  source("Extras_Mass.R")#3
  source("SixPlots-tdCExtras.R")#4
  dev.off() # Close the png file
} # end i loop
dev.off();dev.off();dev.off()