  # fluxcol  <- as.numeric(which(headings==files[i]))  
  # nnrows=length(file)-3# Load sed data 
  # fluxcol  <- as.numeric(which(headings==files[i]))
  # issolid  <- as.logical(as.matrix(fluxdata[2, ..fluxcol])) ; issolid
  # eins<-as.matrix(file[1,]) # First column
  # uno <-as.matrix(file[,1])
  ifelse( max(uno) < start.time ,time.start.index<-length(uno) ,time.start.index<-which.min(abs(uno - start.time)))
  ifelse( max(uno) < stop.time  ,time.stop.index<-length(uno)  ,time.stop.index <-which.min(abs(uno - stop.time )))
  # time<-as.matrix(file[1:which.max(file[,1]),1])/1#365.25 # Adjust this to change time unit
  time<-as.matrix(uno[time.start.index:time.stop.index])/1#365.25 # Adjust this to change time unit
  halftime   <-time[length(time)/2]
  ifelse( max(as.numeric(eins)) < desired.depth ,depthindex<-length(eins),depthindex<-which.min(abs(eins - desired.depth)))
  row1<-as.matrix(     file[1,2:depthindex  ]    )            #layernum]) # Top row
  halfdepth <-max(as.numeric(row1))/2
  # depths<-(which.min(row1):which.max(row1))
  #con<-                  row2 2:max time ,   column 2:
  con <-as.matrix( file [time.start.index+2 :time.stop.index  ,  2:depthindex  ] ) # Concentration matrix
  class(con)<-"numeric"
  
  min(con,na.rm = T)
  max(con,na.rm = T)
  
  bw.depth=4; bw.depths= seq(from=(-1*bw.depth), by=1, length.out=bw.depth); bw.mat=matrix(bw.depths);bw.mat
  bw.conc<-0;if(issolid==F){bw.conc=con[,1]}
  bottom.water<-matrix(nrow = dim(con)[1]  , ncol=bw.depth, bw.conc )
  bw.sed.depths<-as.numeric(cbind(t(bw.mat),row1));bw.sed.depths
  time.y<-as.vector(t(time)) #  Transpose time #
  if(time.y[2]==0){time.y[2]<-1e-5}

  
  time.s<-time.y[seq(from=1,to=length(time.y)-1,by=subsample)]
  # rm(con.s)
  con.s<-as.matrix(con[seq(from=1,to=length(time.y)-1,by=subsample),])
  class(con.s)<-"numeric"
  z.max=(max(con.s, na.rm = T));z.max
  z.max=as.numeric(max(con.s, na.rm = T));z.max
  z.min=as.numeric(max(min(con.s, na.rm = T), 0));z.min
  if(z.min==z.max){z.max=z.min*1.00001}
  bottom.water.s <- as.matrix(bottom.water[seq(from=1,to=length(time.y)-1,by=subsample),])
  class(bottom.water.s)<-"numeric"
  con.s.bw       <- cbind(bottom.water.s,con.s)
  dim(con.s.bw)
  dim(bottom.water.s)
  dim(con.s)
  length(con.s.bw)
  con.s.bw[is.na(con.s.bw)] <- 0 # replace any NA values
  anyNA(con.s.bw)
  
  # con.s.bw.num<-sapply(con.s.bw,FUN = as.numeric)
  class(con.s.bw) <- "numeric"
  class(con.s.bw)
  dim(con.s.bw)
  length(time.s)
  min(con.s.bw)
  max(con.s.bw)
  datey<-as.Date(time.s,origin = startdate)
  class(datey)
  datex<-format(datey, sep="/", format = "%Y-%b");datex
  # class(datex)
  monthy<-(time.y*12) # Use monthly values if necessary
  
  ifelse( abs(max(time,na.rm=T))>1
          ,roundy   <- 10^floor(log10(abs(max(time,na.rm=T))) )/10
          ,roundy   <- 10^floor(log10(abs(min(time,na.rm=T))) )/10
  );roundy
  
  axis.sequence.raw    = round_any(seq(min(time),max(time),length.out=tick.master.x),roundy,f=floor);axis.sequence
  x.axis.sequence.y    = round_any(seq(min(time)/365.25,max(time)/365.25,length.out=tick.master.x),roundx,f=floor);x.axis.sequence.y
  y.axis.sequence      = round_any(seq(from=max(bw.sed.depths),to=min(bw.sed.depths)
                                       ,length.out=tick.master.y+1),5,f=floor);y.axis.sequence
  # date.axis.sequence = round_any(seq(min(datey),max(time.s),length.out=5),100,f=floor);date.axis.sequence
  length(time.s)
  dim(row1)
  dim(con.s.bw)
  image.plot(time.s,bw.sed.depths,con.s.bw,cex.lab=0.001
             ,axes=F,ylab="",xlab=""
             ,ylim=c(max(bw.sed.depths),-1*bw.depth)
             ,zlim=c(z.min,z.max)
             ,xlim=c(min(time.s),max(time.s))
             ,bigplot=c(0.12,0.83,0.12,0.78)# 1 left; 2 right; 3 bottom; 4 top
             ,smallplot=c(0.85,0.88,0.11,0.77)# 1 left; 2 right; 3 bottom; 4 top
             ,col=newglen(5000)
             ,xaxs = "i"
             ,graphics.reset = F
             ,axis.args=list(cex.axis=axis.tick.size)
             # ,legend.width = 1.10
             
  )
  min(con.s.bw)
  max(bw.sed.depths)
  par(new=T)
  if(issolid==T){
    polygon(x=c(min(time.s),max(time.s)
                ,max(time.s),min(time.s))
          ,y=c(-bw.depth,-bw.depth,-0.1,-0.1)
          ,col="gray90")
          # ,col="lightsteelblue1")
  }
  
  par(xpd=TRUE)
  box(bty="o")
  par(mgp=c(1.5,1,0))
  axis(2,cex.axis=axis.tick.size,cex.lab=1.0,tck=T,tcl=-0.2,line=0
       ,at=y.axis.sequence,las=1)
  
  axis(3,tck=T,tcl=-0.3,xaxs="i",yaxs="i",line=0,col.axis="white"
       ,at=axis.sequence.raw
  ) # The ticks
  axis(3,cex.axis=axis.tick.size,xaxs="i",yaxs="i",line=-0.50,lwd = 0 
       ,at=axis.sequence.raw
       ,labels=x.axis.sequence.y
  ) # The labels
  axis(1,tck=T,tcl=-0.3,xaxs="i",yaxs="i",line=0,col.axis="white"
       ,at=axis.sequence.raw
  ) # The ticks
  axis(1,cex.axis=axis.tick.size,xaxs="i",yaxs="i",line=-0.50,lwd = 0
       ,at=axis.sequence.raw
       ,labels=date.axis.sequence.2
  ) # The labels

  lines(c(min(axis.sequence),max(axis.sequence)),c(0,0)  ,lty=2,col="white")
  # lines(c(min(axis.sequence),max(axis.sequence)),c(5,5)  ,lty=2,col="white")
  # lines(c(min(axis.sequence),max(axis.sequence)),c(10,10),lty=2,col="white")
  # lines(c(min(axis.sequence),max(axis.sequence)),c(15,15),lty=2,col="white")
  # 

  
    par(mgp=c(1.5,0.2,0))
    # mtext(2,text="Depth",cex=axis.label.size,line=4.0) # 1=bottom, 2=left, 3=top, 4=right
    # mtext(2,text="(cm)",cex=axis.label.size,line=2.8) # 1=bottom, 2=left, 3=top, 4=right
    mtext(2,text="Depth (cm)",cex=axis.label.size,line=3.5) # 1=bottom, 2=left, 3=top, 4=right
    conc.text=expression("(mmol L"^"-1"*")")
    mtext(3,text="Concentration",cex=axis.label.size*0.9,line=2.5,adj = 1.2) # 1=bottom, 2=left, 3=top, 4=right
    mtext(3,text=conc.text,cex=axis.label.size*0.9,line=1.0, adj=1.2) # 1=bottom, 2=left, 3=top, 4=right
    mtext(3,text="Time (number of years)",cex=axis.label.size,line=1.5, adj=0.55)
    mtext(1,text="Time (date)",cex=axis.label.size,line=1.5, adj=0.55)
# } #End for variables i
    
    