#getwd()
setwd("R")
folder<-paste0("../results/candi_aed/")
source("LoadPackages.R")
zones=1;z=1;i=1
extrafiles<-c("TerminalOxidationPerTEA")
rates.plot.time=365*5 # Choose the time (days) for plotting the rates
source("RatesMultiplotSettings.R")
source("LoadExtraSedData.R")#0 Load the flux and concentration data

source("Rates_Load.R")
source("Rates_Plot.R")
source("Rates_Plot_Stacked.R")

source("Rates_F_Load.R")
source("Rates_F_Plot.R")

source("Rates_N_Load.R")
source("Rates_N_Plot.R")

source("Rates_C_Load.R")
source("Rates_C_Plot.R")

source("Rates_O_Load.R")
source("Rates_O_Plot.R")
