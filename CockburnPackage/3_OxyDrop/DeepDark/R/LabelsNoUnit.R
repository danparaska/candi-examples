# dailyfluxlabels<-function(thisfile){
  label=as.character()
  thisfile = files[i]
  if(thisfile=="oxy")       {label=expression("O"[2])}
  if(thisfile=="caco3")     {label=expression("CaCO"[3])}
  if(thisfile=="ca")        {label=expression("Ca"^"2+")}
  if(thisfile=="so4")       {label=expression("SO"[4]^"2-")}
  if(thisfile=="frp")       {label=expression("PO"[4]^"3-")}
  if(thisfile=="amm")       {label=expression("NH"[4]^"+")}
  if(thisfile=="ch4")       {label=expression("CH"[4])}
  if(thisfile=="dic")       {label=expression("DIC" )}
  if(thisfile=="h2s")       {label=expression("H"[2]*"S")}
  if(thisfile=="pomspecial"){label=expression("Organic matter")}
  if(thisfile=="pin")       {label=expression("PIN")}
  if(thisfile=="nit")       {label=expression("NO"[3]^"-")}
  if(thisfile=="feco3")     {label=expression("FeCO"["3"])}
  if(thisfile=="feoh3a")    {label=expression("Fe(OH)"["3A"])}
  if(thisfile=="feoh3b")    {label=expression("Fe(OH)"["3B"])}
  if(thisfile=="pip")       {label=expression("PIP")}
  if(thisfile=="feii")      {label=expression("Fe"^"2+")}
  if(thisfile=="mnii")      {label=expression("Mn"^"2+")}
  if(thisfile=="mno2a")     {label=expression("MnO"["2A"])}
  if(thisfile=="mno2b")     {label=expression("MnO"["2B"])}
  if(thisfile=="n2")        {label=expression("N"["2"])}
  if(thisfile=="n2o")       {label=expression("N"["2"]*"O")}
  if(thisfile=="no2")       {label=expression("NO"["2"]^"-")}
  if(thisfile=="so4")       {label=expression("SO"[4]^"2-")}
  if(thisfile=="poml")      {label=expression("Labile POM")}
  if(thisfile=="pomr")      {label=expression("Refractory POM")}
  if(thisfile=="dopr")      {label=expression("Refractory DOP")}
  if(thisfile=="pocr")      {label=expression("Refractory POC")}
  if(thisfile=="pocl")      {label=expression("Labile POC")}
  if(thisfile=="docr")      {label=expression("Refractory DOC")}
  if(thisfile=="docl")      {label=expression("Labile DOC")}
  if(thisfile=="ponl")      {label=expression("Labile PON")}
  if(thisfile=="ponr")      {label=expression("Refractory PON")}
  if(thisfile=="donl")      {label=expression("Labile DON")}
  if(thisfile=="donr")      {label=expression("Refractory DON")}
  if(thisfile=="popl")      {label=expression("Labile POP")}
  if(thisfile=="popr")      {label=expression("Refractory POP")}
  if(thisfile=="dopl")      {label=expression("Labile DOP")}
  if(thisfile=="dopr")      {label=expression("Refractory DOP")}
  if(thisfile=="mpb")       {label=expression("MPB")}
  if(thisfile=="fes")       {label=expression("FeS")}
  if(thisfile=="fes2")      {label=expression("FeS"[2])}
  if(thisfile=="salt")      {label=expression("Salinity")}
  if(thisfile=="salinity")  {label=expression("Salinity")}
  if(thisfile=="bioturb")   {label=expression("bioturbation")}
  if(thisfile=="cirrig")    {label=expression("irrigation")}
  # label<<-label
# }
  # print(label.bold.nounit)
