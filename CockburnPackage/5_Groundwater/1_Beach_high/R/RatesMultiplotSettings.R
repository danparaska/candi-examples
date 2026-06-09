# Multi-plot standardisation settings
startdate      = "2020-01-01"
start.time = 1 # Index for where time axis starts. You might want to cut off a spinup period
stop.time  = 30000
subsample = 1 # Load less data for big datasets
desired.depths<-c(1,2,3)
roundx = 0.1
tick.master.x = 7;  tick.master.y = 7
tick.master.x.2 = 6
margin.list=c(0.25,2.0,3,0.2) # 1 bottom; 2 left; 3 top; 4 right
axis.label.size=0.49
axis.tick.size=0.7
percentwaythrough<-c(5,50, 95)
avdep=2 # Average depth (cm) for C_at_t_av
sed=NULL; max.con=NULL
spinuplength<-1
label.line=-0.5; tick.line=0.0; tick.tcl=-0.3
# png image settings
lwidthy = 0.1;reso = 700
widthy = 55; 
heighty = 90; 
legend.inset= -0.3
max.con<-matrix(nrow = 1,  ncol = length(zones) )
desired.depth=20

processmaps<-function(){
  if(OMModel==1){
    source("ProcessMapC1.R")
  }
  if(OMModel==2){
    source("ProcessMapN2.R")
    source("ProcessMapC2.R")
  }
}
rates.colours<-c(
     #"grey20"
                #"red2" # oxy
                "goldenrod2" # oxy
                ,"lightblue1" # n2o
                ,"lightblue2" # nit
                ,"turquoise3" # no2
                ,"green4" # mno2
                ,"deepskyblue4" # feoh
                #,"goldenrod2" # so4
                ,"grey25" # so4
                #,"grey60" # met
                ,"grey75" # met
                ,"grey90" # sum
                #,"thistle1" # sum
)
