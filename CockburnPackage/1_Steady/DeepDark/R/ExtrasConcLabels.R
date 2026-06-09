# makelabels     <- function( thisfile ) {
  # label=NULL
  # label=as.character()
  thisfile <- files[i]
  top=3
  neg=NA  
  if(thisfile=="FDHyd")      {the.label=expression("F"[D[Hyd]]);                         issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FIN_O2")     {the.label=expression("F"[In[O[2]]]);                       issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FO2")        {the.label=expression("F"[O[2]]);                           issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FNO3")       {the.label=expression("F"[NO[3]]);                          issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FNO2")       {the.label=expression("F"[NO[2]]);                          issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FN2O")       {the.label=expression("F"[N[2]*"O"]);                       issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FMnO2")      {the.label=expression("F"[MnO[2]]);                         issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FFeOH")      {the.label=expression("F"[Fe(OH)[3]]);                      issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FSO4")       {the.label=expression("F"[SO[4]]);                          issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FMet")       {the.label=expression("F"[Met]);                            issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FTAerOAc")   {the.label=expression("F"[T[AerOAc]]);                      issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FTDenH2")    {the.label=expression("F"[T[DenH2]]);                       issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FTDenOAc")   {the.label=expression("F"[T[DenOAc]]);                      issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FTEA_FeOH")  {the.label=expression("F"[TEA[Fe]]);                        issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FTEA_MnO2")  {the.label=expression("F"[TEA[Mn]]);                        issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FTEA_NO3")   {the.label=expression("F"[TEA[NO[3]]]);                     issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FTEA_O2")    {the.label=expression("F"[TEA[O[2]]]);                      issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FTEA_SO4")   {the.label=expression("F"[TEA[SO[4]]]);                     issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FTFerDHyd")  {the.label=expression("F"[T[Fermentation]]);                issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FTIroOAc")   {the.label=expression("F"[T[IroOAc]]);                      issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FTIroH2")    {the.label=expression("F"[T[IroH[2]]]);                     issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FTManOAc")   {the.label=expression("F"[T[ManOAc]]);                      issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FTMetH2")    {the.label=expression("F"[T[MetH[2]]]);                     issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FTMetOAc")   {the.label=expression("F"[T[MetOAc]]);                      issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FTSulOAc")   {the.label=expression("F"[T[SulOAc]]);                      issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FTSulH2")    {the.label=expression("F"[T[SulH[2]]]);                     issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="bioturb")    {the.label=expression("Bioturbation")  ;                    issolid=F; mmass=(1);unit=expression("cm"^2*" y"^-1);neg=F}
  if(thisfile=="cirrig")     {the.label=expression("Irrigation")  ;                      issolid=F; mmass=(1);unit=expression("cm"^2*" y"^-1);neg=F}
  if(thisfile=="RO2")        {the.label=expression("R"[O2])  ;                           issolid=F; mmass=(16);unit=expression("mmol O"[2]*" L"^-1*" y"^-1);neg=F}
  if(thisfile=="RNO3")       {the.label=expression("R"[NO[3]^"-"*" OM"])  ; issolid=F; mmass=(14)}
  if(thisfile=="RNO2")       {the.label=expression("R"[NO[2]^"-"*" OM"])  ; issolid=F; mmass=(14)}
  if(thisfile=="RN2O")       {the.label=expression("R"[N[2]*"O OM"])  ; issolid=F; mmass=(14)}
  if(thisfile=="RFeOH")      {the.label=expression("R"[FeOH])  ;                         issolid=T; mmass=(56);unit=expression("mmol Fe L"^-1*" y"^-1);neg=F}
  if(thisfile=="RMnO2")      {the.label=expression("R"[MnO2])  ;                         issolid=T; mmass=(55);unit=expression("mmol Mn L"^-1*" y"^-1);neg=F}
  if(thisfile=="RNH4OX")     {the.label=expression("R"[NH4OX])  ;                        issolid=F; mmass=(14);unit=expression("mmol N L"^-1*" y"^-1);neg=F}
  if(thisfile=="rnh4no2")    {the.label=expression("R"[NH[4]^"-"*"NO"[2]^"-"])  ;        issolid=F; mmass=(14);unit=expression("mmol N L"^-1*" y"^-1);neg=F}
  if(thisfile=="RNO2O2")     {the.label=expression("R"[NO[2]^"-"*"O"[2]])  ;             issolid=F; mmass=(14);unit=expression("mmol N L"^-1*" y"^-1);neg=F}
  if(thisfile=="FSal")       {the.label=expression("FSal")  ;                            issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="FSul")       {the.label=expression("FSul")  ;                            issolid=F; mmass=(1);unit=expression("-");neg=F}
  if(thisfile=="TerminalOxidation"){the.label=expression("TerminalOxidation")  ;         issolid=T; mmass=(12);unit=expression("mmol C L"^-1*" y"^-1);neg=F}
  if(thisfile=="TerminalOxidationPerTEA"){the.label=expression("Organic matter oxidation (per oxidant)")  ; issolid=F; mmass=(1);unit=expression("mmol C L"^-1*" y"^-1);neg=F}
  if(thisfile=="TerminalOxidationPerPOC"){the.label=expression("Organic matter oxidation");  issolid=T; mmass=(12);unit=expression("mmol C L"^-1*" y"^-1);neg=F}
  if(thisfile=="RDIC")       {the.label=expression("R"["DIC production"])  ;             issolid=F; mmass=(12);unit=expression("mmol C L"^-1*" y"^-1);neg=F}
  if(thisfile=="RTDIC")      {the.label=expression("R"["DIC production"])  ;             issolid=F; mmass=(12);unit=expression("mmol C L"^-1*" y"^-1);neg=F}
  if(thisfile=="RCO2")       {the.label=expression("RCO2")  ;                            issolid=F; mmass=(13);unit=expression("mmol C L"^-1*" y"^-1);neg=F}
  if(thisfile=="NH4release") {the.label=expression("NH"[4]^"+"* " release")  ;           issolid=F; mmass=(14);unit=expression("mmol N L"^-1*" y"^-1);neg=F}
  if(thisfile=="ROMO2")      {the.label=expression("R"["OM O"[2]])  ;                    issolid=T; mmass=(12);unit=expression("mmol C L"^-1*" y"^-1);neg=F}
  if(thisfile=="ROMNO3")     {the.label=expression("R"["OM NO"[3]^"-"])  ;               issolid=T; mmass=(12);unit=expression("mmol C L"^-1*" y"^-1);neg=F}
  if(thisfile=="ROMNO2")     {the.label=expression("R"["OM NO"[2]^"-"])  ;               issolid=T; mmass=(12);unit=expression("mmol C L"^-1*" y"^-1);neg=F}
  if(thisfile=="ROMN2O")     {the.label=expression("R"["OM N"[2]*"O"])  ;                issolid=T; mmass=(12);unit=expression("mmol C L"^-1*" y"^-1);neg=F}
  if(thisfile=="ROMMnO2")    {the.label=expression("R"["OM MnO"[2]])  ;                  issolid=T; mmass=(12);unit=expression("mmol C L"^-1*" y"^-1);neg=F}
  if(thisfile=="ROMFeOH")    {the.label=expression("R"["OM Fe(OH)"[3]])  ;               issolid=T; mmass=(12);unit=expression("mmol C L"^-1*" y"^-1);neg=F}
  if(thisfile=="ROMSO4")     {the.label=expression("R"["OM SO"[4]^"2-"])  ;              issolid=T; mmass=(12);unit=expression("mmol C L"^-1*" y"^-1);neg=F}
  if(thisfile=="ROMMet")     {the.label=expression("R"["OM CH"[4]])  ;                   issolid=T; mmass=(12);unit=expression("mmol C L"^-1*" y"^-1);neg=F}
  if(thisfile=="Rgpp")       {the.label=expression("R"["Gross primary production"])  ;   issolid=F; mmass=(16);unit=expression("mmol O"[2]* " L"^-1*" y"^-1);neg=F}
  if(thisfile=="Rrsp")       {the.label=expression("R"["Respiration"])  ;                issolid=F; mmass=(16);unit=expression("mmol O"[2]* " L"^-1*" y"^-1);neg=F}
  if(thisfile=="RRootsO2")   {the.label=expression("O"[2]*" from roots ")  ;             issolid=F; mmass=(16);unit=expression("mmol O"[2]* " L"^-1*" y"^-1);neg=F}
  if(thisfile=="reac_O2")    {the.label=expression("All O"[2]*" consumption")  ;         issolid=F; mmass=(16);unit=expression("(mmol O"[2]* " L"^-1*" y"^-1*")");neg=F}
  if(thisfile=="reac_POML")  {the.label=expression("All POM"[L]*" consumption")  ;       issolid=T; mmass=(12);unit=expression("(mmol C"[2]* " L"^-1*" y"^-1*")");neg=F}
  if(thisfile=="RFeOX")      {the.label=expression("Fe "^"2+"*" O"[2]*" reaction")  ;    issolid=F; mmass=(56);unit=expression("(mmol O"[2]* " L"^-1*" y"^-1*")");neg=F}
  if(thisfile=="RTSOX")      {the.label=expression("HS "^"-"*" O"[2]*" reaction")  ;     issolid=F; mmass=(1);unit=expression("(mmol O"[2]* " L"^-1*" y"^-1*")");neg=F}
  if(thisfile=="rnitrousation"){the.label=expression("R"[NH[4]^"+"*" to N"[2]*"O"])  ;   issolid=F; mmass=(14)}
  if(thisfile=="rnitritation") {the.label=expression("R"[NH[4]^"+"*" to NO"[2]^"-"])  ;  issolid=F; mmass=(14)}

neg  
  the.label<- the.label
  issolid<- issolid
  the.label<<-the.label
  return(the.label)
