temp     = files[i]
files[i] = "pomspecial"
  yy=NA; yydd=NA
  
  
  # if(nchar(zones[z])==1){fluxsed<-(paste0(folder,"0000",zones[z],"/swi_fluxes.sed"))} # Load sed data}
  # if(nchar(zones[z])==2){fluxsed<-(paste0(folder,"000" ,zones[z],"/swi_fluxes.sed"))} # Load sed data}
  # if(nchar(zones[z])==3){fluxsed<-(paste0(folder,"00"  ,zones[z],"/swi_fluxes.sed"))}# Load sed data}
  # fluxdata<-fread(file=fluxsed, header=FALSE, skip=2)
  # times<-as.numeric(as.matrix(fluxdata[3:length(fluxdata[,1]),1]))#/365.25 
  # uno  <- as.numeric(as.matrix(fluxdata[3:length(as.matrix(fluxdata[,1])) ,1]) )
  # ifelse( max(uno) < start.time ,time.start.index<-which.max(uno), time.start.index<-which.min(abs(uno - start.time)))
  # ifelse( max(uno) < stop.time  ,time.stop.index <-which.max(uno)-1, time.stop.index <-which.min(abs(uno - stop.time )))
  times<- uno[time.start.index:time.stop.index];length(times)
  headings<-as.matrix(fluxdata[1,])
  issolid<-as.matrix(fluxdata[2,])
  fluxcol<-which(headings==files[i])
  chemcol <-as.matrix(fluxdata[ 3:length(as.matrix(fluxdata[,1])) , ..fluxcol ])
  chem    <-as.matrix(chemcol[ time.start.index:time.stop.index ]);length(chem)
  chem    <-as.numeric(chem)/1 # /365 to convert from yearly to daily
  for(cc in 1:length(chem)){
    if(is.na(chem[cc])){chem[cc]=0}
  }
  # chem    <-as.numeric(chem)/365.35 # /365 to convert from yearly to daily
  yy<-NA
  flux.mmol <- chem # mmol m^-2 y^-1  
  flux.mol  <- flux.mmol/1000 # mol m^-2 y^-1  
  flux.g    <- flux.mol*mmass  # g m^-2 y^-1  
  flux.cumul<-NULL;flux.cumul[1:2]=0
  # for(fg in 2:length(flux.g)){
  #   flux.cumul[fg]<-flux.cumul[fg-1]+(flux.g[fg])*(times[fg]-times[fg-1])/365.25
  #   }
  chemneg=NULL; chempos=NULL
  for (j in 1:length(chem)){
    ifelse(chem[j]<=0
           ,chemneg[j]<-chem[j]
           ,chemneg[j]<-NA)
    ifelse(chem[j]>0
           ,chempos[j]<-chem[j]
           ,chempos[j]<-NA)
  }
  length(chemneg)
  length(chempos)
  length(chem)
  length(timey)
  # ifelse( abs(max(timey,na.rm=T))>1
  #         ,roundx   <- 10^floor(log10(abs(max(timey,na.rm=T))) )/10
  #         ,roundx   <- 10^floor(log10(abs(min(timey,na.rm=T))) )/10
  # );roundx
  times
  
  
  roundy=1
  ifelse( abs(max(chem,na.rm=T))>1
        ,roundy <- 10^floor(log10(abs(max(chem,na.rm=T))) )/10
        ,roundy <- 10^floor(log10(abs(min(chem,na.rm=T))) )/10
  );roundy
  
  ifelse(max(chem,na.rm = T)<0
         ,f.choice<-ceiling
         ,f.choice<-floor
          )
  y.axis.sequence      = round_any(seq(from=min(chem,na.rm = T),to=max(chem,na.rm = T)
                                       ,length.out=tick.master.y)
                                   ,roundy,f=f.choice);y.axis.sequence
  y.axis.sequence.sci <-  format(y.axis.sequence, scientific = T, digits = 2)
  limy                 <-c(min(y.axis.sequence),max(y.axis.sequence))
  par(xpd=F)
  plot(timey,chem
       ,axes=F
       ,ylab="",xlab=""
       ,pch=20
       ,cex=0.5
       ,col="white"
       ,ylim = limy
       ,xaxs = "i"
       ,xlim = c(min(axis.sequence),max(axis.sequence))
  )
  
  length(timey)
  length(chem)
  # polycolour1=adjustcolor(pompolycolours[1],alpha.f=0.50)
  # polycolour2=adjustcolor(pompolycolours[2],alpha.f=0.25)
  # polycolour3=adjustcolor(pompolycolours[3],alpha.f=0.25)
  # polycolour1a=adjustcolor(pompolycolours[1],alpha.f=0.4)
  # polycolour2a=adjustcolor(pompolycolours[2],alpha.f=0.4)
  # polycolour3a=adjustcolor(pompolycolours[3],alpha.f=0.4)
  times_y
  spinuplength_d=times_y[1]#*365
  post.1<-(times_y[2])#*365
  post.2<-(times_y[3])#*365
  # polygon(x=c(0,spinuplength_d,spinuplength_d,0)
  #         ,y=c(0,0,max(limy),max(limy))
  #         ,col=polycolour1
  #         ,border=NA
  # )
  # polygon(x=c(post.1,post.2,post.2,post.1)
  #         ,y=c(0,0,max(limy),max(limy))
  #         ,col=polycolour2
  #         ,border=NA
  # )
  # polygon(x=c(post.2,max(timey),max(timey),post.2)
  #         ,y=c(0,0,max(limy),max(limy))
  #         ,col=polycolour3
  #         ,border=NA
  # )
  
  # lines(timey, chem    ,col="grey25"  )
  lines(timey, chemneg ,col="navyblue")
  lines(timey, chempos ,col="red4"    )
  # lines(x=c(min(axis.sequence),max(axis.sequence)),y=c(0,0),lty=2,col="grey80")
  
  box(bty="o")
  axis(3,tck=T,tcl=-0.3,xaxs="i",yaxs="i",line=0,col.axis="white"
       ,at=axis.sequence
  ) # The ticks
  axis(3,cex.axis=axis.tick.size,xaxs="i",yaxs="i",line=-0.50,lwd = 0 
       ,at=axis.sequence
  ) # The labels
  axis(1,tck=T,tcl=-0.3,xaxs="i",yaxs="i",line=0,col.axis="white"
       ,at=axis.sequence
  ) # The ticks
  axis(1,cex.axis=axis.tick.size,xaxs="i",yaxs="i",line=-0.50,lwd = 0
       ,at=axis.sequence
       ,labels=date.axis.sequence.2
  ) # The labels
  axis(2,cex.axis=axis.tick.size,cex.lab=1.0,tck=T,tcl=-0.2
       ,line=0,at=y.axis.sequence.sci,las=1,format(y.axis.sequence, scientific = T, digits = 2))
  # axis(2,cex.axis=0.7,cex.lab=1.0,tck=T,tcl=-0.2,line=0,at=0,las=1)
  mtext(3,text="Time (number of years)",cex=axis.label.size,line=1.5, adj=0.55)
  mtext(1,text="Time (date)",cex=axis.label.size,line=1.5, adj=0.55)
  mtext(3,text="Irregular organic matter influx",cex=0.7,line=3.0,adj=-0.05)
  # mtext(3,text=label.bold.nounit,cex=1.0,line=3.0,adj=-0.05)
  # mtext(3,text=paste0("Zone ",zones[z]),cex=0.7,line=1.5,adj=0.05)
  # mtext(2,text="Sediment water flux",cex=axis.label.size,line=4.1)
  # mtext(2,text=expression("(mmol m"^-2*"d"^-1*")"),cex=axis.label.size,line=2.8)
  # mtext(2,text=expression("Sediment water flux (mmol m "^-2*"d "^-1*")"),cex=axis.label.size,line=3.7)
  mtext(2,text=expression("Sediment water flux (mmol m "^-2*"y "^-1*")")
        ,cex=axis.label.size,line=4)
  par(xpd=T)
  # legend( x = max(timey)*0.75, y = max(chem)*0.5
  #        ,legend = c("Before aquaculture"
  #                    ,paste0(times_y[2]-spinuplength-farminglength," to ",times_y[3]-spinuplength-farminglength," years after aquaculture ends")
  #                    ,paste0("> ",times_y[3]-spinuplength-farminglength," years after aquaculture ends"))
  #        ,fill = c(polycolour1a,polycolour2a,polycolour3a)
  #        # ,col = c(polycolour1,polycolour2,polycolour3)
  #        ,cex = axis.label.size   
  #        # ,pch = 15
  # )

  # points(times,flux.cumul*1e3,col="blue",pch=16)
  # points(times, chem    ,col="purple4",pch=16  )
# } # End function
 
files[i] = temp
fluxcol  <- as.numeric(which(headings==files[i]))  
  
