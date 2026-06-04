C.1.figure<-load.image("C1Figure.png")

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
pomr.text<-c(simulation.table.dat$pomr,units.solid)
poml.text<-c(simulation.table.dat$poml,units.solid)
dic.text <-c(simulation.table.dat$dic, units.solute)

png(file=paste0(folder,"../CProcess1.png"),units="mm",res=800,width=130,height=100)
plot(C.1.figure,axes=F,ylim=c(1500,000),xlim=c(000,800),xaxs = "i",yaxs = "i")
box(bty="n")
legend(title="POMR",x= -400, y=100 , legend = pomr.text ,cex = legendcex,ncol=2,bty="o",text.col=process.map.col,title.col = "black",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)
legend(title="POML",x= 500,  y=100, legend = poml.text,cex = legendcex,ncol=2,bty="o",text.col=process.map.col,title.col = "black",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)
legend(title=expression("∑CO"[2]) ,x= -500,  y=1000, legend = dic.text,cex = legendcex,ncol=2,bty="o",text.col=process.map.col,title.col = "black",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)
legend(title="Legend" ,x= 700,  y=900, legend = rownames(simulation.table.dat),cex = legendcex,ncol=1,bty="o",text.col=process.map.col,title.col = "black",y.intersp=y.int*1,box.col = "black")

legend(title=expression(italic("poml2dic" )), x=-400,y=700,legend = poml2dic,cex = legendcex,ncol=1,bty="n",text.col="black",title.col = "black",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)
legend(title=expression(italic("pomr2dic" )), x=700 ,y=700,legend = pomr2dic,cex = legendcex,ncol=1,bty="n",text.col="black",title.col = "black",y.intersp=y.int,box.col = "grey50",box.lwd = 0.1)

dev.off()

