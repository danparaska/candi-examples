  axis.tick.size=0.7
  ifelse( abs(max(timey,na.rm=T))>1
          ,roundx   <- 10^floor(log10(abs(max(timey,na.rm=T))) )/10
          ,roundx   <- 10^floor(log10(abs(min(timey,na.rm=T))) )/10
  );roundx
 timey
  axis.sequence.y = round_any(seq(min(timey),max(timey),length.out=tick.master.x),roundx,f=floor);axis.sequence.y
  spinindex   <-which.min(abs(timey - spinuplength))
  roundy=1
  ifelse( abs(max(linematrix,na.rm=T))>1
        ,roundy <- 10^floor(log10(abs(max(linematrix,na.rm=T))) )/10
        ,roundy <- 10^floor(log10(abs(min(linematrix,na.rm=T))) )/10
  );roundy
  ifelse(max(linematrix,na.rm = T)<0
         ,f.choice<-ceiling
         ,f.choice<-floor
          )
  y.axis.sequence      = round_any(seq(from=min(linematrix,na.rm = T),to=max(linematrix,na.rm = T)
                                       ,length.out=tick.master.y)
                                   ,roundy,f=f.choice);y.axis.sequence
  limy                 <-c(min(y.axis.sequence)-roundy,max(y.axis.sequence)+roundy);limy
  if(max(abs(y.axis.sequence)) > 1e5){
  #y.axis.sequence <- as.numeric(format(y.axis.sequence
  y.axis.sequence <- (format(y.axis.sequence
                              , scientific = TRUE
                              , digits = 2
                              )); y.axis.sequence
  }
  if(max(abs(as.numeric(y.axis.sequence))) < 1e-5){
  y.axis.sequence <- format(y.axis.sequence
                              , scientific = TRUE
                              , digits = 2
                              ); y.axis.sequence
  }


  
  plot(timey,linematrix[,1]
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
for(i in 1:length(files)){
  
  lines(timey, linematrix[,i]    ,col=multiflux.colours[i] ,lwd=1.5,lty=multiflux.lty[i] )
}

  box(bty="o")
  axis(3,tck=T,tcl=-0.3,xaxs="i",yaxs="i",line=0,col.axis="white"
       ,at=axis.sequence.y
  ) # The ticks
  axis(3,cex.axis=axis.tick.size,xaxs="i",yaxs="i",line=-0.50,lwd = 0 
       ,at=axis.sequence.y
  ) # The labels
 # axis(1,tck=T,tcl=-0.3,xaxs="i",yaxs="i",line=0,col.axis="white"
 #      ,at=axis.sequence.y
 # ) # The ticks
 # axis(1,cex.axis=axis.tick.size,xaxs="i",yaxs="i",line=-0.50,lwd = 0
 #      ,at=axis.sequence.y
 #      ,labels=date.axis.sequence.2
 # ) # The labels
  axis(2,cex.axis=axis.tick.size,cex.lab=1.0,tck=T,tcl=-0.2,line=0,at=y.axis.sequence,las=1,labels=y.axis.sequence)
  axis(2,cex.axis=axis.tick.size,cex.lab=1.0,tck=T,tcl=-0.2,line=-0.75,at=0,las=1,labels=0)
  mtext(3,text="Time (number of years)",cex=axis.label.size,line=1.5, adj=0.55)
 # mtext(1,text="Time (date)",cex=axis.label.size,line=1.5, adj=0.55)
  mtext(3,text=paste0("Positive = into sediment")  ,cex=axis.label.size,line=2.5,adj=1.2,col="black")
  mtext(3,text=paste0("Negative = to bottom water"),cex=axis.label.size,line=1.5,adj=1.2,col="black")
  mtext(2,text=expression("Sediment water flux (mmol m "^-2*"y "^-1*")"),cex=axis.label.size,line=3.5)
  par(xpd=T)
  legend(
          "topright"
          ,inset=c(-0.22,0)
          ,legend = legend.names
          ,col= multiflux.colours
          ,cex = axis.label.size
          ,lty= multiflux.lty
          ,lwd=2
          ,seg.len=5
          ,y.intersp=2
          )
