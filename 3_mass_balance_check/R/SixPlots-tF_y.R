  yy=NA; yydd=NA
  # uno  <- as.numeric(as.matrix(fluxdata[3:length(as.matrix(fluxdata[,1])) ,1]) )
  headings <- as.matrix(fluxdata[1,])
  fluxcol  <- as.numeric(which(headings==files[i]))
  issolid  <- as.logical(as.matrix(fluxdata[2, ..fluxcol]))
  chemcol  <- as.matrix(fluxdata[ 3:length(as.matrix(fluxdata[,1])) , ..fluxcol ])
  chem     <- as.matrix(chemcol[ time.start.index:time.stop.index ])
  chem     <- as.numeric(chem)/1 # /365 to convert from yearly to daily
  for(cc in 1:length(chem)){
    if(is.na(chem[cc])){chem[cc]=0}
  }
  # chem    <-as.numeric(chem)/365.35 # /365 to convert from yearly to daily
  yy<-NA
  xx        <-c(min(times),max(times))
  flux.mmol <- chem # mmol m^-2 y^-1  
  flux.mol  <- flux.mmol/1000 # mol m^-2 y^-1  
  flux.g    <- flux.mol*mmass  # g m^-2 y^-1  
  flux.cumul<-NULL;flux.cumul[1:2]=0
  for(fg in 2:length(flux.g)){
    flux.cumul[fg]<-flux.cumul[fg-1]+(flux.g[fg])*(times[fg]-times[fg-1])/365.25
    }
  chemneg=NULL; chempos=NULL
  for (j in 1:length(chem)){
    ifelse(chem[j]<=0
           ,chemneg[j]<-chem[j]
           ,chemneg[j]<-NA)
    ifelse(chem[j]>0
           ,chempos[j]<-chem[j]
           ,chempos[j]<-NA)
  }
  
  chemspin=NULL;chemfarm=NULL;chemrecov.1=NULL;chemrecov.2=NULL
  ifelse( abs(max(timey,na.rm=T))>1
          ,roundx   <- 10^floor(log10(abs(max(timey,na.rm=T))) )/10
          ,roundx   <- 10^floor(log10(abs(min(timey,na.rm=T))) )/10
  );roundx
  
  timey
  axis.sequence.y = round_any(seq(min(timey),max(timey),length.out=tick.master.x),roundx,f=floor);axis.sequence.y
  spinindex   <-which.min(abs(timey - spinuplength))
  chem.1<-chem[1:spinindex]              ;timey.1<-timey[1:spinindex];              avchem.1<- mean(chem.1) # Spinup
  
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
  limy                 <-c(min(y.axis.sequence)-roundy,max(y.axis.sequence)+roundy);limy
  
  
  
  plot(timey,chem
       ,axes=F
       ,ylab="",xlab=""
       ,pch=20
       ,cex=0.5
       ,col="white"
       ,ylim = limy
       ,xaxs = "i"
       ,xlim = c(min(axis.sequence.y),max(axis.sequence.y))
  )
  xoffset=0.9
  yoffset=1.03

  lines(x=c(min(axis.sequence),max(axis.sequence)),y=c(0,0),lty=2,col="grey80")
  lines(timey, chem    ,col="purple"  )
  lines(timey, chemneg ,col=fluxcolours[1])
  lines(timey, chempos ,col=fluxcolours[2]    )
  box(bty="o")
  axis(3,tck=T,tcl=-0.3,xaxs="i",yaxs="i",line=0,col.axis="white"
       ,at=axis.sequence.y
  ) # The ticks
  axis(3,cex.axis=axis.tick.size,xaxs="i",yaxs="i",line=-0.50,lwd = 0 
       ,at=axis.sequence.y
  ) # The labels
  axis(1,tck=T,tcl=-0.3,xaxs="i",yaxs="i",line=0,col.axis="white"
       ,at=axis.sequence.y
  ) # The ticks
  axis(1,cex.axis=axis.tick.size,xaxs="i",yaxs="i",line=-0.50,lwd = 0
       ,at=axis.sequence.y
       ,labels=date.axis.sequence.2
  ) # The labels
  axis(2,cex.axis=axis.tick.size,cex.lab=1.0,tck=T,tcl=-0.2,line=0,at=y.axis.sequence,las=1)
  # axis(2,cex.axis=0.7,cex.lab=1.0,tck=T,tcl=-0.2,line=0,at=0,las=1)
  mtext(3,text="Time (number of years)",cex=axis.label.size,line=1.5, adj=0.55)
  mtext(1,text="Time (date)",cex=axis.label.size,line=1.5, adj=0.55)
  mtext(3,text=label.bold.nounit,cex=1.0,line=2.5,adj=-0.05)
  # mtext(3,text=paste0("Zone ",zones[z]),cex=0.7,line=1.5,adj=0.07)
  mtext(3,text=paste0("Positive = into sediment")  ,cex=axis.label.size*.8,line=2.5,adj=1.2,col=fluxcolours[2])
  mtext(3,text=paste0("Negative = to bottom water"),cex=axis.label.size*.8,line=1.5,adj=1.2,col=fluxcolours[1])
  # mtext(2,text="Sediment water flux",cex=axis.label.size,line=4.1)
  # mtext(2,text=expression("(mmol m"^-2*"d"^-1*")"),cex=axis.label.size,line=2.8)
  # mtext(2,text=expression("Sediment water flux (mmol m "^-2*"d "^-1*")"),cex=axis.label.size,line=3.7)
  mtext(2,text=expression("Sediment water flux (mmol m "^-2*"y "^-1*")"),cex=axis.label.size,line=3.7)
  par(xpd=T)
  # legend(
  #   # "bottomright",inset=legend.inset
  #   x = max(timey)*0.75, y = (limy[1]+limy[2])*0.92
  #   # x = max(timey)*0.75, y = (limy[1]+limy[2])*0.5
  #        ,legend = c("Positive = into sediment"
  #                    ,"Negative = to bottom water")
  #        ,col=c(fluxcolours[2], fluxcolours[1])
  #        ,cex = axis.label.size
  #        ,lty=c(1)
  #        )
  
  # points(times,flux.cumul*1e3,col="blue",pch=16)
  # points(times, chem    ,col="purple4",pch=16  )
# } # End function

  

