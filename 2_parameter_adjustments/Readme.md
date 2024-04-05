# Adjust key parameters

## Fe and SO<sub>4</sub><sup>2-</sup>

### Variables: Fe and SO42- 
### *aed_sdg_vars.csv*

Add higher concentrations of Fe(OH)3A and SO42- to the file aed_sdg_vars. Add them to the csv column ‘default_vals’, which sets the flux and concentration at the sediment-water interface. Set ‘feoh3a’ to 100.0E+03 (flux in mmol m-2 y-1) and ‘so4’ to 32.0E+03 (concentration in mmol m-3). Plot the output figures for ‘feoh3a’, ‘feii’, ‘so4’ and ‘h2s’. Also plot ‘ch4’ and compare its concentration to the previous example: the implication is that adding SO42- reduces the creation CH4. 

<p align="center">
<img src = "Readmeimages/FeSO4-24.png" width=25%>
</p>


## Grid structure

### Parameters: maxnpts, job, xl
### *aed_candi_params.csv*

Use the parameter ‘job‘ to change the grid from fixed width (0) to exponentially increasing (2).

Use ‘xl’ to change the depth of the sediment simulated, from say, 10 cm to 40 cm.

Use ‘maxnpts’ to set the number of layers simulated. Note that job 0 requires maxnpts to be depth × an integer + 1.


<p align="center">
<img src = "Readmeimages/job1job2-01.png" width=25%>
</p>

