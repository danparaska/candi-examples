# Steady boundary conditions
## Deep dark environment

This simulation folder is set up to run the Deep dark environment for five years of spin up and then two years of simulation. The boundary concentrations and fluxes at the sediment-water interface are constant for the whole simulation. 

The executable 'glm+' in this folder runs the model. 

To change the set up the simulation, use 'glm3.nml', as well as the folder 'aed_sdg' for files 'aed.nml', 'aed_candi_params.csv', 'aed_sdg.vars.csv' and 'swibc.dat'.

To create a figure that plots concentrations, fluxes and masses for each variable, use the plotting script R/'1_DiagnosticPanel.R'. This script also plots a diagram of some of the key rates and concentrations of organic matter reactions, 'CProcess1'. This script also plots a summary table of each variable plotted in the diagnostic panel, which is printed to the screen, saved as an image 'simulation.table.units.png' and a csv 'simulation.table.uni.csv'.

To create figures with different reaction rates plotted on common axes, use the plotting script R/'2_Rates_all.r'. 

Plots and tables appear in the 'results' folder.