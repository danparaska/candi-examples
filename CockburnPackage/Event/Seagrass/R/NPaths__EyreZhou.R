# Install the 'R Extension for Visual Studio Code' in order to run the rest of this script.

# Set the working directory. The VSC package is in the candi-examples folder, 
# therefore you need to set the R working directory to "R".
setwd("R")

# Load packages
# source("InstallPackages.R") # Install plotting and data management packages if you don't have them installed.
source("LoadPackages.R") # Load plotting and data management packages that you have installed.

# Load an image to display in the plotting grid
figure<-c(
   "NModels-43.png"
   ,"NModels-44.png"
)

# Plotting loop settings
zones<-c(1)
z=1
extrafiles<-c( 
  "NH4release"
  ,"RNO2"             # denitritation
  ,"RNO3"             # denitratation
  ,"RN2O"             # denitrousation
  ,"rnh4no2"          # deammonification
  ,"rnitrousation"    # nitrousation 
  #,"dnra"
  ,"rnitritation"     # nitritation
  ,"rno2o2"           # nitratation
  ,"ROMNO2toN2O"      # dnrn
  ,"ROMNO2toNH4"      # dnra
)

Npath.time = 365*4

i=1
files<-extrafiles
# Load other plot settings
source("ColourSettings.R")
source("MultiplotSettings.R")
source("LoadInputs.R")
start.time = 1
#margin.list<-c(2.5,6.5,6.5,5.0)# 1 bottom; 2 left; 3 top; 4 right
margin.list<-c(0,1,0,0)# 1 bottom; 2 left; 3 top; 4 right

npath.table<-matrix(ncol = length(extrafiles)
                      ,nrow=3
                      ,dimnames=list(c("Maximum rate"
                                       ,"Total rate"
                                       ,"Average rate 5 cm"
                                       ),extrafiles)
)  ;npath.table

      


for(i in 1:length(extrafiles)){
#for(i in 1:6){
folder<-paste0("../results/candi_aed/")
print(extrafiles[i])
files<-extrafiles
source("LoadExtraSedDataNPaths.R")#0 Load the flux and concentration data
} ; npath.table # end i loop


npath.table.dat<-data.frame(npath.table);npath.table.dat
npath1  <-npath.table[2,1];npath1
npath2  <-npath.table[2,2];npath2
npath3  <-npath.table[2,3];npath3
npath4  <-npath.table[2,4];npath4
npath5  <-npath.table[2,5];npath5
npath5.1<-formatC(npath5, format = "e", digits = 10);npath5.1
npath6  <-npath.table[2,6];npath6
npath7  <-npath.table[2,7];npath7
npath8  <-npath.table[2,8];npath8
npath9  <-npath.table[2,9];npath9
npath10 <-npath.table[2,10];colnames(npath.table)[10];npath10








box.colour<-adjustcolor( "white", alpha.f = 0.80)
legendcex=0.75
y.int=1

png(filename=paste0(folder,"../../NPaths.png"),width=widthy,height=heighty  ,res=reso,units="mm"  )
par(mar=margin.list)# 1 bottom; 2 left; 3 top; 4 right
the.figure<-load.image(figure[2])
plot(the.figure,axes=F,ylim=c(1000,0),xlim=c(50,2200)                       ,xaxs = "i",yaxs = "i")
legend(title=expression("NH"[4]^"+"* " release")                            ,x= 50 , y=0,   legend = npath1  ,cex = legendcex,ncol=2,bty="o",text.col="chocolate4" ,title.col = "chocolate4" ,y.intersp=y.int,box.col = "grey30",bg=box.colour,box.lwd = 0.2,box.lty=5)
legend(title=expression("R"["NO"[2]^"-"])                                   ,x= 900 , y=0,   legend = npath2 ,cex = legendcex,ncol=2,bty="o",text.col="chocolate4" ,title.col = "chocolate4" ,y.intersp=y.int,box.col = "grey30",bg=box.colour,box.lwd = 0.2)
legend(title=expression("R"["NO"[3]^"-"])                                   ,x= 1600, y=0,   legend = npath3 ,cex = legendcex,ncol=2,bty="o",text.col="chocolate4" ,title.col = "chocolate4" ,y.intersp=y.int,box.col = "grey30",bg=box.colour,box.lwd = 0.2)
legend(title=expression("R"["N"[2]*"O"])                                    ,x= 700 , y=900, legend = npath4 ,cex = legendcex,ncol=2,bty="o",text.col="chocolate4" ,title.col = "chocolate4" ,y.intersp=y.int,box.col = "grey30",bg=box.colour,box.lwd = 0.2)
legend(title=expression("Deammonification: R"["NH"[4]^"+"*"NO"[2]^"-"])     ,x= 1200, y=700, legend = npath5 ,cex = legendcex,ncol=2,bty="o",text.col="blue3"      ,title.col = "blue3"      ,y.intersp=y.int,box.col = "grey30",bg=box.colour,box.lwd = 0.2)
#legend(title=expression("R"["NH"[4]^"+"*"O"[2]])                           ,x= 150 , y=550, legend = npath7 ,cex = legendcex,ncol=2,bty="o",text.col="darkgreen"       ,title.col = "darkgreen"       ,y.intersp=y.int,box.col = "grey30",bg=box.colour,box.lwd = 0.2)
legend(title=expression("R"["NH"[4]^"+"*"O"[2]]*"× k/(k+O"[2]*")" )     ,x= 450 , y=500, legend = npath6 ,cex = legendcex,ncol=2,bty="o",text.col="red3"       ,title.col = "red3"       ,y.intersp=y.int,box.col = "grey30",bg=box.colour,box.lwd = 0.2)
legend(title=expression("R"["NH"[4]^"+"*"O"[2]]*"× O"[2]*"/(k+O"[2]*")"),x= 1000, y=300, legend = npath7 ,cex = legendcex,ncol=2,bty="o",text.col="red3"       ,title.col = "red3"       ,y.intersp=y.int,box.col = "grey30",bg=box.colour,box.lwd = 0.2)
legend(title=expression("Nitratation: R"["NO"[2]^"-" *"O"[2]])              ,x= 1600, y=400, legend = npath8 ,cex = legendcex,ncol=2,bty="o",text.col="red3"       ,title.col = "red3"       ,y.intersp=y.int,box.col = "grey30",bg=box.colour,box.lwd = 0.2)
legend(title=expression("R"["NO"[2]^"-"]*"× NO"[2]^"-"*"/(k+NO"[2]^"-"*")") ,x= 650 , y=350, legend = npath9 ,cex = legendcex,ncol=2,bty="o",text.col="chocolate4" ,title.col = "chocolate4" ,y.intersp=y.int,box.col = "grey30",bg=box.colour,box.lwd = 0.2)
legend(title=expression("R"["NO"[2]^"-"]*"× k/(k+NO"[2]^"-"*")")            ,x= 175 , y=250, legend = npath10,cex = legendcex,ncol=2,bty="o",text.col="chocolate4" ,title.col = "chocolate4" ,y.intersp=y.int,box.col = "grey30",bg=box.colour,box.lwd = 0.2)

dev.off();dev.off();dev.off()

source("LoadAEDParameters.R")
aed.params
OMModel
xlab
ylab
nh4release=paste0(ylab," N per ",xlab, " C");nh4release
poml2dic
poml2dic
poml2dic
knh4no2
knh4no2.1<-formatC(knh4no2, format = "e", digits = 2);knh4no2.1
kNH4OX
kNH4OX.1<-format(kNH4OX, "scipen"=4);kNH4OX.1
kNH4OX.2<-formatC(kNH4OX, format = "e", digits = 2);kNH4OX.2
kno2o2
kno2o2.1<-formatC(kno2o2, format = "e", digits = 2);kno2o2.1
kpart_denitrit
kpart_denitrit.1<-formatC(kpart_denitrit, format = "e", digits = 2);kpart_denitrit.1
kpart_ammox


png(filename=paste0(folder,"../../NPath_ks.png"),width=widthy,height=heighty  ,res=reso,units="mm"  )
par(mar=margin.list)# 1 bottom; 2 left; 3 top; 4 right
the.figure<-load.image(figure[2])
plot(the.figure,axes=F,ylim=c(1000,0),xlim=c(50,2200)                               ,xaxs = "i",yaxs = "i")
legend(title=expression("NH"[4]^"+"* " release")                                    ,x= 50  , y=0,   legend = nh4release      ,cex = legendcex,ncol=2,bty="o",text.col="chocolate4" ,title.col = "chocolate4" ,y.intersp=y.int,box.col = "grey30",bg=box.colour,box.lwd = 0.2,box.lty=5)
legend(title=expression("R"["NO"[2]^"-"]*"; k"["OM"]*" = ")                         ,x= 900 , y=0,   legend = poml2dic        ,cex = legendcex,ncol=2,bty="o",text.col="chocolate4" ,title.col = "chocolate4" ,y.intersp=y.int,box.col = "grey30",bg=box.colour,box.lwd = 0.2)
legend(title=expression("R"["NO"[3]^"-"]*"; k"["OM"]*" = ")                         ,x= 1600, y=0,   legend = poml2dic        ,cex = legendcex,ncol=2,bty="o",text.col="chocolate4" ,title.col = "chocolate4" ,y.intersp=y.int,box.col = "grey30",bg=box.colour,box.lwd = 0.2)
legend(title=expression("R"["N"[2]*"O"]*"; k"["OM"]*" = ")                          ,x= 700 , y=900, legend = poml2dic        ,cex = legendcex,ncol=2,bty="o",text.col="chocolate4" ,title.col = "chocolate4" ,y.intersp=y.int,box.col = "grey30",bg=box.colour,box.lwd = 0.2)
legend(title=expression("k"["NH"[4]^"+"*"NO"[2]^"-"]* "= "),x= 1200, y=700, legend = knh4no2.1       ,cex = legendcex,ncol=2,bty="o",text.col="blue3"      ,title.col = "blue3"      ,y.intersp=y.int,box.col = "grey30",bg=box.colour,box.lwd = 0.2)
legend(title=expression("R"["NH"[4]^"+"*"O"[2]]*"× k/(k+O"[2]*"); k = " )           ,x= 425 , y=500, legend = kpart_denitrit.1,cex = legendcex,ncol=2,bty="o",text.col="red3"       ,title.col = "red3"       ,y.intersp=y.int,box.col = "grey30",bg=box.colour,box.lwd = 0.2)
legend(title=expression("R"["NH"[4]^"+"*"O"[2]]*"× O"[2]*"/(k+O"[2]*"); k = ")      ,x= 950 , y=300, legend = kpart_denitrit.1,cex = legendcex,ncol=2,bty="o",text.col="red3"       ,title.col = "red3"       ,y.intersp=y.int,box.col = "grey30",bg=box.colour,box.lwd = 0.2)
legend(title=expression("k"["NO"[2]^"-" *"O"[2]]*" = ")                             ,x= 1600, y=400, legend = kno2o2.1        ,cex = legendcex,ncol=2,bty="o",text.col="red3"       ,title.col = "red3"       ,y.intersp=y.int,box.col = "grey30",bg=box.colour,box.lwd = 0.2,xjust=0.5)
legend(title=expression("k"["NH"[4]^"+" *"O"[2]]*" = ")                             ,x= 200,  y=500, legend = kNH4OX.2        ,cex = legendcex,ncol=2,bty="o",text.col="red3"       ,title.col = "red3"       ,y.intersp=y.int,box.col = "grey30",bg=box.colour,box.lwd = 0.2,xjust=0.5)
legend(title=expression("R"["NO"[2]^"-"]*"× NO"[2]^"-"*"/(k+NO"[2]^"-"*"); k = ")   ,x= 650 , y=350, legend = kpart_ammox     ,cex = legendcex,ncol=2,bty="o",text.col="chocolate4" ,title.col = "chocolate4" ,y.intersp=y.int,box.col = "grey30",bg=box.colour,box.lwd = 0.2)
legend(title=expression("R"["NO"[2]^"-"]*"× k/(k+NO"[2]^"-"*"); k = ")              ,x= 175 , y=250, legend = kpart_ammox     ,cex = legendcex,ncol=2,bty="o",text.col="chocolate4" ,title.col = "chocolate4" ,y.intersp=y.int,box.col = "grey30",bg=box.colour,box.lwd = 0.2)
dev.off();dev.off();dev.off()
