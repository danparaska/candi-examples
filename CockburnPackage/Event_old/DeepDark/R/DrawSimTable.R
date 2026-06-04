units.solid.1<-matrix(nrow=5,ncol=1
                      ,data=c(
                        "mmol m-2 y-1"  
                        ,"mmol m-2 y-1"  
                        ,"mmol L-1"  
                        ,"g m-2"  
                        ,"mmol L-1"  
                      )
);units.solid.1
colnames(units.solid.1)<-"solidunit";units.solid.1
units.solute.1<-matrix(nrow=5,ncol=1
                       ,data=c(
                         "mmol m-3"  
                         ,"mmol m-2 y-1"  
                         ,"mmol L-1"  
                         ,"g m-2"  
                         ,"mmol L-1"  
                       )
);units.solute.1
colnames(units.solute.1)<-"soluteunit";units.solute.1
simulation.table.uni<-cbind(simulation.table,units.solid.1,units.solute.1);simulation.table.uni
write.csv(simulation.table.uni,file=paste0(folder,"../../simulation.table.uni.csv"))
print(simulation.table)
png(file=paste0(folder,"../../simulation.table.units.png"),units="mm",res=100,width=500,height=50)
grid.table.theme<-  ttheme_minimal(
  core=list(bg_params = list(fill = NA, col=NA),
                              fg_params=list(fontface=1)),
  colhead=list(fg_params=list(col="black", fontface=2)),
  rowhead=list(fg_params=list(col="black", fontface=1))
)
# );dev.off();grid.table(simulation.table.uni, theme = grid.table.theme )


g<-tableGrob(simulation.table.uni, theme =grid.table.theme)
g <- gtable_add_grob(g,
                     grobs = segmentsGrob(            x0 = unit(0,"npc"),
                                                      y0 = unit(1,"npc"),
                                                      x1 = unit(1,"npc"),
                                                      y1 = unit(1,"npc"),
                                                      gp = gpar(lwd = 1.0)),
                     t = 1, l = 1, r = ncol(g)
)
g <- gtable_add_grob(g,
                     grobs = segmentsGrob(            x0 = unit(0,"npc"),
                                                      y0 = unit(1,"npc"),
                                                      x1 = unit(1,"npc"),
                                                      y1 = unit(1,"npc"),
                                                      gp = gpar(lwd = 1.0)),
                     t = 2, l = 1, r = ncol(g)
)
g <- gtable_add_grob(g,
                     grobs = segmentsGrob(            x0 = unit(0,"npc"),
                                                      y0 = unit(0,"npc"),
                                                      x1 = unit(10,"npc"),
                                                      y1 = unit(0,"npc"),
                                                      gp = gpar(lwd = 1.0)),
                     t = nrow(g), b = nrow(g), l = 1, r = ncol(g)
)
g <- gtable_add_grob(g,
                     grobs = segmentsGrob(            x0 = unit(0,"npc"),
                                                      y0 = unit(10,"npc"),
                                                      x1 = unit(0,"npc"),
                                                      y1 = unit(0,"npc"),
                                                      gp = gpar(lwd = 1.0)),
                     t = 2, b = nrow(g), l = 2, r = 2
)
g <- gtable_add_grob(g,
                     grobs = segmentsGrob(            x0 = unit(0,"npc"),
                                                      y0 = unit(10,"npc"),
                                                      x1 = unit(0,"npc"),
                                                      y1 = unit(0,"npc"),
                                                      gp = gpar(lwd = 1.0)),
                     t = 1, b = nrow(g), l = ncol(g)-1, r = ncol(g)-1
)
grid.draw(g)
dev.off()
