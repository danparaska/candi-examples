C.2.figure<-load.image("C2Figure.png")

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
pocr.text<-c(simulation.table.dat$pocr,units.solid)
pocl.text<-c(simulation.table.dat$pocl,units.solid)
docr.text<-c(simulation.table.dat$docr,units.solute)
docl.text<-c(simulation.table.dat$docl,units.solute)
dic.text <-c(simulation.table.dat$dic, units.solute)

png(file=paste0(folder,"../CProcess2.png"),units="mm",res=800,width=150,height=120)
plot(C.2.figure,axes=F,ylim=c(1400,000),xlim=c(600,1400),xaxs = "i",yaxs = "i")
box(bty="n")
legend(title="POCR",x= 000, y=60 , legend = pocr.text ,cex = legendcex,ncol=2,bty="o",text.col=process.map.col,title.col = "black",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)
legend(title="POCL",x= 600,  y=60, legend = pocl.text,cex = legendcex,ncol=2,bty="o",text.col=process.map.col,title.col = "black",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)
legend(title="DOCR",x= 000, y=1100, legend = docr.text,cex = legendcex,ncol=2,bty="o",text.col=process.map.col,title.col = "black",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)
legend(title="DOCL",x= 600,  y=1100, legend = docl.text,cex = legendcex,ncol=2,bty="o",text.col=process.map.col,title.col = "black",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)
legend(title=expression("∑CO"[2]) ,x= 1300,  y=800, legend = dic.text,cex = legendcex,ncol=2,bty="o",text.col=process.map.col,title.col = "black",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)

legend(title=expression(italic("pocr2docr")),x=000, y=700, legend = pocr2docr,cex = legendcex,ncol=1,bty="n",text.col="black",title.col = "black",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)
legend(title=expression(italic("pocl2docl")),x=700, y=700, legend = pocl2docl,cex = legendcex,ncol=1,bty="n",text.col="black",title.col = "black",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)
legend(title=expression(italic("docr2docl")),x=400, y=1000,legend = docr2docl,cex = legendcex,ncol=1,bty="n",text.col="black",title.col = "black",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)
legend(title=expression(italic("docl2dic" )), x=800,y=1000,legend = docl2dic, cex = legendcex,ncol=1,bty="n",text.col="black",title.col = "black",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)

legend(title="Legend" ,x= 1300,  y=000, legend = rownames(simulation.table.dat),cex = legendcex,ncol=1,bty="o",text.col=process.map.col,title.col = "black",y.intersp=y.int*1,box.col = "black")
dev.off()
