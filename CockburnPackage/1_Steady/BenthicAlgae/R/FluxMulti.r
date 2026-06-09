setwd("R")
folder<-paste0("../results/candi_aed/")
source("LoadPackages.R")
zones<-c(1); z=1
source("ColourSettings.R"); source("MultiplotSettings.R"); #source("LoadInputs.R")


# Bigs _______________________________________________________________________________________
files<-c( 
  "amm"
  ,"dic"
  ,"no2"
  ,"oxy"
  ,"poml"
  ,"pomr"
  )
multiflux.colours.bigs<-c("navy"
                ,"grey20" # dic
                ,"lightblue3" # no2
                ,"red3" # oxy
                ,"tan3" # poml
                ,"tan4" # pomr
 )
multiflux.lty<-c(1,1,1,1,1,1)
multiflux.colours<-multiflux.colours.bigs
linematrix<-matrix(   nrow=(length(timey))
                     ,ncol=length(files)
                     ,0
                     ,dimnames=list(timey
                                   ,files)
                     )
legend.names<-matrix(   nrow=1
                     ,ncol=length(files)
                     ,0
                     )
for(i in 1:length(files)){
    print(files[i])
    source("FluxLoadMulti.R")
} # End i loop

png(filename=paste0(folder,"../../Multiflux_bigs.png"),width=widthy,height=heighty*0.67  ,res=reso,units="mm"  )
    par(mar= c(1       # Bottom
            ,5          # Left
            ,4          # Top
            ,9)   )     # Right
  source("FluxMulti-tF_y.R")
dev.off()



# Littles _______________________________________________________________________________________
files<-c( 
  "n2"
  ,"n2o"
  ,"nit"
  ,"no2"
  )
multiflux.colours.littles<-c("lightsteelblue3" # n2
                ,"lightblue1" # n2o
                ,"lightblue2" # nit
                ,"lightblue3" # no2
)
multiflux.lty<-c(1,1,1343,3)
multiflux.colours<-multiflux.colours.littles
linematrix<-matrix(   nrow=(length(timey))
                     ,ncol=length(files)
                     ,0
                     ,dimnames=list(timey
                                   ,files)
                     )
legend.names<-matrix(   nrow=1
                     ,ncol=length(files)
                     ,0
                     )
for(i in 1:length(files)){
    print(files[i])
    source("FluxLoadMulti.R")
}# End i loop
png(filename=paste0(folder,"../../Multiflux_littles.png"),width=widthy,height=heighty*.67  ,res=reso,units="mm"  )
    par(mar= c(1       # Bottom
            ,5          # Left
            ,4          # Top
            ,9)   )     # Right
  source("FluxMulti-tF_y.R")
dev.off()
