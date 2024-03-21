# Set the working directory to the location on your computer
# setwd("V:/danp/2024/candi-examples/1/R")
setwd("C:/Users/00074264/AED Dropbox/AED_Aquaculture_db/3_data/candi-examples/R")

# Plotting loop settings
zones<-c(1)
z=1
files<-c( 
  "oxy"
  ,"nit"
  ,"no2"
  ,"frp"
  ,"h2s"
  ,"n2o"
  ,"poml"
  ,"pomr"
  ,"pomspecial"
  ,"so4"
  ,"no2"
  ,"ch4"
  ,"feii"
  ,"feoh3a"
  ,"feoh3b"
  ,"fes2"
  ,"n2"
  ,"salinity"
  ,"fes"
)
i=1
num<-c("A","B","C","D","E","F","G")
n=1

# Load other scripts
source("Packages.R") # Load plotting and data management packages.
source("ColourSettings.R")
source("MultiplotSettings.R")

### For looping while running a sim, use the x feature
  # x=0
  # repeat{
  #   x <- x+1
  #   print(x)

for(z in 1){
  # for(i in 1:length(files)){
  for(i in 1:4){
folder<-paste0("../results/candi_aed/")
print(files[i])
  png(filename=paste0(folder,"../../6P_",files[i],"_.png")
      ,width=widthy,height=heighty  ,res=reso,units="mm"  )
  the.layout<-layout(mat=matrix(nrow=3,ncol=2
                      ,byrow=TRUE
                      ,c(1,2
                         ,3,4
                         ,5,6
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
  
source("LoadSedData.R")#0 Load the flux and concentration data
  # Six plots through the 2 by 3 grid
source("SixPlots-tF_y.R")#1
source("SixPlots-tF_pomspecial.R")#2
source("SixPlots-tdC.R")#3
source("C_at_t_av.R")#4
source("SixPlots-tbot2.R")#5
source("SixPlots-MassLeftAxis.R")#5
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

