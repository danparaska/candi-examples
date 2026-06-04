N.2.figure<-load.image(paste0(folder,"../../N2Figure.png"))

units.solid<-matrix(nrow=5,ncol=1
                    ,data=c(
                      expression("mmol m"^-2*"y"^-1  )
                      ,expression("mmol m"^-2*"y"^-1  )
                      ,expression("mmol L"^-1  )
                      ,expression("g m"^-2  )
                      ,expression("mmol L"^-1  )
                    )
);units.solid
units.solute<-matrix(nrow=5,ncol=1
                     ,data=c(
                       expression("mmol m"^-3  )
                       ,expression("mmol m"^-2*"y"^-1  )
                       ,expression("mmol L"^-1  )
                       ,expression("g m"^-2  )
                       ,expression("mmol L"^-1  )
                     )
);units.solute

legendcex=0.4
y.int=1

simulation.table.dat<-data.frame(simulation.table);simulation.table.dat
ponr.text<-c(simulation.table.dat$ponr,units.solid)
ponl.text<-c(simulation.table.dat$ponl,units.solid)
donr.text<-c(simulation.table.dat$donr,units.solute)
donl.text<-c(simulation.table.dat$donl,units.solute)
amm.text <-c(simulation.table.dat$amm,units.solute)
no2.text <-c(simulation.table.dat$no2,units.solute)
nit.text <-c(simulation.table.dat$nit,units.solute)
oxy.text <-c(simulation.table.dat$oxy,units.solute)


png(file=paste0(folder,"../../NProcess2.png"),units="mm",res=500,width=220,height=150)
plot(N.2.figure,axes=F,ylim=c(2000,-1000),xlim=c(0,2500),xaxs = "i",yaxs = "i")
box(bty="n")
legend(title="PONR",x= -600, y=-300, legend = ponr.text,cex = legendcex,ncol=2,bty="o",text.col=process.map.col,title.col = "black",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)
legend(title="PONL",x= 500,  y=-300, legend = ponl.text,cex = legendcex,ncol=2,bty="o",text.col=process.map.col,title.col = "black",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)
legend(title="DONR",x= -600, y=1200, legend = donr.text,cex = legendcex,ncol=2,bty="o",text.col=process.map.col,title.col = "black",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)
legend(title="DONL",x= 300,  y=1200, legend = donl.text,cex = legendcex,ncol=2,bty="o",text.col=process.map.col,title.col = "black",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)
legend(title=expression("NH"[4]^"+") ,x= 800,  y=400, legend = amm.text,cex = legendcex,ncol=2,bty="o",text.col=process.map.col,title.col = "black",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)
legend(title=expression("NO"[2]^"-"),x= 1400,  y=1500, legend = no2.text,cex = legendcex,ncol=2,bty="o",text.col=process.map.col,title.col = "black",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)
legend(title=expression("NO"[3]^"-") ,x= 2200,  y=800, legend = nit.text,cex = legendcex,ncol=2,bty="o",text.col=process.map.col,title.col = "black",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)
legend(title=expression("O"[2]) ,x= 2200,  y=0, legend = oxy.text,cex = legendcex,ncol=2,bty="o",text.col=process.map.col,title.col = "black",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)
legend(title="Legend" ,x= 2500,  y=-800, legend = rownames(simulation.table.dat),cex = legendcex,ncol=1,bty="o",text.col=process.map.col,title.col = "black",y.intersp=y.int*1,box.col = "black",box.lwd = 1.0)

legend(title=expression(italic("ponr2donr")),x=-600, y=500, legend = ponr2donr,cex = legendcex,ncol=1,bty="n",text.col="black",title.col = "chocolate4",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)
legend(title=expression(italic("ponl2donl")),x=-300, y=500, legend = ponl2donl,cex = legendcex,ncol=1,bty="n",text.col="black",title.col = "chocolate4",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)
legend(title=expression(italic("donr2donl")),x=400, y=1000,legend = donr2donl,cex = legendcex,ncol=1,bty="n",text.col="black",title.col = "chocolate4",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)
legend(title=expression(italic("donl2din" )), x=800,y=1000,legend = donl2din,cex = legendcex,ncol=1,bty="n",text.col="black",title.col = "chocolate4",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)

legend(title=expression(italic("kno2o2" )), x=2300,y=1300,legend = kno2o2, cex = legendcex,ncol=1,bty="n",text.col="black",title.col = "darkred",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)
legend(title=expression(italic("knh4no2")), x=2300,y=500 ,legend = knh4no2,cex = legendcex,ncol=1,bty="n",text.col="black",title.col = "royalblue4",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)
legend(title=expression(italic("kNH4OX")),  x=2300,y=1600,legend = kNH4OX, cex = legendcex,ncol=1,bty="n",text.col="black",title.col = "darkred",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)

dev.off()
