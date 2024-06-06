source("LoadPackages.R") # Load plotting and data management packages that you have installed.
# Plotting loop settings
zones<-c(1)
z=1
files<-c( 
  "pomspecial"
  ,"n2"
)
i=1

# Load other plot settings
source("ColourSettings.R")
source("MultiplotSettings.R")
margin.list<-c(3.5, 5.5, 5.0, 1.0)

for(z in 1){
  for(i in 1:length(files)){
    # for(i in 1:4){
    folder<-paste0("../results/candi_aed/")
    print(files[i])
    png(filename=paste0(folder,"../../1P_Mass_",files[i],"_.png")
        ,width=widthy,height=heighty  ,res=reso,units="mm"  )
    par(mar=margin.list)# 1 bottom; 2 left; 3 top; 4 right
    source("LoadSedData.R")#0 Load the flux and concentration data
    ###
    source("DailyFluxLabels.R") # Flux label with units per day
    source("DailyFluxLabelsBold.R") # Flux label in bold font with units per day
    source("LabelsBoldNoUnit.R") # Variable label in bold font without unit, for headings
    source("ConcLabels.R") # Labels with concentration and unit, plus solid/solute and molecular mass
    ###
    source("SixPlots-tF_y.R")#1
    print(max(flux.cumul))
    
    print(max(flux.cumul))
    source("OnePlot-Mass-plotter.R")#5
    print(max(flux.cumul))
    dev.off() # Close the png file
  } # end i loop
} # end z loop

# if(x >= 10){
#   break
# x=0   }

dev.off();dev.off();dev.off()
dev.off();dev.off();dev.off()
dev.off();dev.off();dev.off()

