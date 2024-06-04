# Multi-plot standardisation settings
startdate      = "2025-01-01"
start.time = 10 # Index for where time axis starts. You might want to cut off a spinup period
stop.time  = 1900
subsample = 1 # Load less data for big datasets
desired.depths<-c(1,2,3)
roundx = 0.1
tick.master.x = 10;  tick.master.y = 8
margin.list=c(2.5,5,4,6.3) # 1 bottom; 2 left; 3 top; 4 right
axis.label.size=0.7
axis.tick.size=0.9
percentwaythrough<-c(5,50, 95)
avdep=2 # Average depth (cm) for C_at_t_av
sed=NULL; max.con=NULL
spinuplength<-1

# png image settings
lwidthy = 0.1;reso = 200
widthy = 270; 
heighty = 180; 
legend.inset= -0.3
max.con<-matrix(nrow = 1,  ncol = length(zones) )
desired.depth=40
