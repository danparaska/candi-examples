# Mass conservation check

This folder outlines a method for ensuring that a simulation is conserving mass in the upper layers of the sediment. It is important to check this, because with the wrong settings, numerical errors can lead to the wrong calculation of sediment mass.

The method for checking this is comparing the boundary concentrations and fluxes with what accumlates in the sediment layers. 

After showing how to set it up so that it works, a number of exercises are listed to demonstrate ways that the model can have errors, above all, the porosity settings.

At the end you have a method for ensuring model accuracy, which is good practice for any new simulation. 

## Approach

A non-reactive solid and a non-reactive solute are introduced at the sediment-water interface (SWI) as 'tracers'. As they enter at the SWI, the tracers' fluxes and concentrations are converted to mass units, per 1 m$^2$. The concentrations in the sediment are similarly summmed per 1 m$^2$, across all depths. 

The simulation allows half a year of model time for the model to spin up, then the tracers are introduced at the SWI for one year, then the model continues to run without them. 

The plotting script displays the mass of the incoming and accumulated tracers (per m$^2$). Even with the best setup, there can be a difference of approximately 10% in the calculated mass of either tracer.

## Setup

### Time parameters 

In 'aed.nml', adjust the time settings as follows:

- 'substep_0' = 72 (hours per timestep). This is the substep until 'firststeps'.
- 'substep_1' = 48 (hours per timestep). This is the substep after 'firststeps'. 
- 'firststeps' = 0.5 (years). This is the time when the substep changes to 'substep_1'. We will set this to coincide with the input of tracers. In this way, the model goes through the spinup period quickly, then slows down to process the increased boundary load of the tracers. 
- 'timeswitch' = 2 (integer switch). This setting allows the substep settings above to function.

### SWI settings

In 'aed.nml' adjust the settings as follows:

- 'swibc_mode' = 10 (integer switch). This parameter sets the boundary to the file listed in 'swibc_file'.
- 'swibc_file' = 'swibc.dat' (filename). This is the name of the sediment-water interface boundary condition (SWIBC) file in the aed_sdg folder.
- 'swibc_filevars' = 'pomspecial', 'n2' (variable names). These are the variables that will be taken from the swibc file in this simulation. 

In 'aed_candi_params.csv' set

- 'OMModel' = 1 (integer switch). This sets it to the simplest organic matter reaction model. 
- 'pomspecial2dic' = 0 (y$^{-1}$). Setting this to zero makes the 'pomspecial' that fluxes in unreactive.

Use the file 'swibc.dat'. Note that the 'pomspecial' flux is 1.0E-08 (mmol m$^{-2}$ y$^{-1}$) and the 'n2' concentration is 1.0E-08 (mmol m$^{-3}$) for most of the simulation. The model converts the concentration from mmol m$^{-3}$ to mmol L$^{-1}$, but check that your plot corresponds with this. 

At time 183 days (or 0.5 years) the flux and concentration increase to 1.0E+02 (mmol m$^{-2}$ y$^{-1}$) and 1.0E+05 (mmol m$^{-3}$). At 548 days (or 1.5 years) the flux and concentration return to the very low number. 

<p align="center">
<img src = "Readmeimages/Swibc-01.png" width=50%>
</p>

### Grid settings

In 'aed_candi_params.csv' set

- 'job' = 0 (integer switch). This has an evenly-spaced grid.
- 'p0'  = 0.5 (fraction between 0 and 1). This is the porosity at the sediment-water interface.
- 'p00' = 0.5 (fraction between 0 and 1). This is the porosity at depth. These porosities are set to be the same, which gives the most reliable results.
- 'imix' = 2 (integer switch). This sets bioturbation to have exponential decay rather than the sharper cutoffs with 'imix' = 1.
- 'maxnpts' = 41 (layers). This is adequate for the simulation but it can be increased. Remember to have it as a multiple of the depth (cm) + 1 layer (for the zeroth layer), for example, 81, 201 or 401.
- 'xl' = 20 (cm). This depth is adequate for this simulation.
- 'xirrig' = 3 (cm). This is the depth of irrigation.
- 'xs' = 5. This sets the shape of the decay curve for bioturbation. 

## Plotting

Use the plotting script 'SixPlotsCandi-Examples.R' and make the multi-panel plot for variables 'n2' and 'pomspecial'. Pay attention to the mass plot. The red line is the result of accumulated mass calculated from the influx of the tracer. The brown columns are the cumulative mass. They are set to be plotted on the same axes, so the lines should correspond.

## Generate errors

This section lists ways to show how a mass error can be created. These are pitfalls that you can avoid when you set up a simulation. Change these settings, then run the model again, then make a plot.

### High porosity

Set both 'p0' and 'p00' to 0.75. This should result in a good solid balance but a higher sediment mass than influxed mass for solutes.

<p align="center">
<img src = "aed_sdg_high-porosity/Bioturbation_.png" width=33%>
</p>

<p align="center">
<img src = "aed_sdg_high-porosity/Porosity_.png" width=33%>
</p>

With high porosity, the solid mass reconciles well but the solute mass is higher in the sediment than from the influx. The maximum mass of solute is around 350 g m$^2$. 

<p align="center">
<img src = "aed_sdg_high-porosity/1P_Mass_pomspecial_.png" width=50%>
</p>

<p align="center">
<img src = "aed_sdg_high-porosity/1P_Mass_n2_.png" width=50%>
</p>

### Low porosity

Set both 'p0' and 'p00' to 0.25. This should result in a good solid balance but a lower sediment mass than influxed mass for solids.

<p align="center">
<img src = "aed_sdg_low-porosity/Bioturbation_.png" width=33%>
</p>

<p align="center">
<img src = "aed_sdg_low-porosity/Porosity_.png" width=33%>
</p>

With low porosity, as with high porosity, the solid mass reconciles well but the solute mass is higher in the sediment than from the influx. The absolute mass of solid is the same with high or low porosity, however, the maximum mass of solute is approximately 100 g m$^2$. 

<p align="center">
<img src = "aed_sdg_low-porosity/1P_Mass_n2_.png" width=50%>
</p>

<p align="center">
<img src = "aed_sdg_low-porosity/1P_Mass_pomspecial_.png" width=50%>
</p>

### Porosity gradient

Set 'p0' to 0.9 and 'p00' to 0.5. This should result in less sediment mass than influxed mass for both solids and solutes.

<p align="center">
<img src = "aed_sdg_porosity-gradient/Bioturbation_.png" width=33%>
</p>

<p align="center">
<img src = "aed_sdg_porosity-gradient/Porosity_.png" width=33%>
</p>

<p align="center">
<img src = "aed_sdg_porosity-gradient/1P_Mass_n2_.png" width=50%>
</p>

<p align="center">
<img src = "aed_sdg_porosity-gradient/1P_Mass_pomspecial_.png" width=50%>
</p>

### Bioturbation settings

In this setup, bioturbation does not cause a problem with mass. However, in future simulations, if you have different bioturbation settings, make sure to check it for mass conservation. One of the primary risks is having a sharp cutoff for bioturation at two depths.

<p align="center">
<img src = "Readmeimages/Bioturb-02.png" width=50%>
</p>

The bioturbation intensity, 'DB0', might also affect the mass conservation. 

### Space and time increments

With this setup, this simulation can run with a fast timestep and a coarse grid. However, if future simulations have mass balance errors, try increasing the number of layers and decreasing the length of the time steps. 

## Mass calculation method. 

This section outlines the method for calculating the mass. There are many steps in the path to convert all of the quantities, starting with input parameters, calculations in the model, outputs from the model, and post-processing in R. An error in the assumptions behind or calculation of any of these steps would give a false idea of whether mass was being maintained. 

### Parameter inputs

Porosity is assigned in aed_candi_params.csv, using the parameters 'p0' and 'p00', setting porosity at the highest and lowest layers. 

### Internal calculations

'aed_secandi' calculates the variable 'poros' as an exponential decay from 'p0' to 'p00'. 

'poros' is used to calculate 'ps' (1 - poros). 'ps' and 'poros' are used to calculate the 'psp' and 'pps' as 'ps'/'poros' and 'poros'/'ps'. These are ratios of porosity that are used to convert solid and solute units elsewhere in candi. For example, as 'Fe(OH)3A' (solid) reduces to 'Fe$^{2+}$ (solute) it is multiplied by 'psp' to convert the units from mmol L $^{-1}$ solids to  mmol L $^{-1}$ (porewater). 

Two other variables are calculated within 'aed_sedcandi', using 'dh', which is the distance between sediment layers (cm). The porewater volume variable, 'porevol', is calculated as 'dh' / 100 $multiply$ $times$ 'poros'. The solid volume variable, 'solvol', is calculated as 'dh' / 100 $\multiply\$ $\times\$ 1 - 'poros'. These are then expressed as m$^3$ of porewater or solids per 1 m $^2$. 

### Model outputs

The model produces solid variables in units of mmol / L $^{-1}$ (solids) and solute variables in units of mmol L $^{-1}$ (porewater). These are written as concentrations over time, across all depths. 

The model also produces a time series of SWI fluxes. These are in units of mmol m$^{-2}$ y^{-1}, where the area component is total area of space, rather than the area of solids or porewater.

It also outputs 'porevol' and 'solvol', with entries per depth, but without time, since they do not change over time. 

### R post-processing

In processing the SWI fluxes file, the fluxes are converted via the following steps:

- raw output is in mmol m^-2 y^-1 / 1000
- mol m^-2 y^-1 $\times\$ molecular mass 
- cumulative [t] g m^-2 = cumulative[t-1] g m^-2 + g m^-2 y^-1 [t] $\times\$ (time[t] - time[t-1])

This gives a time series of influxed mass per 1 m^-2. 

The mass in the sediment is converted via the following steps:

- raw output is in mmol L^-1
- if the variable is a solid, the concentration is multiplied by solvol and 1000. 
  mmol L^-1 $\times\$ m$^3$ of solids per 1 m $^2$
  = mmol solids per 1 m $^2$

  - if the variable is a solute, the concentration is multiplied by porevol and 1000. 
  mmol L^-1 $\times\$ m$^3$ of porewater per 1 m $^2$
  = mmol porewater per 1 m $^2$

- mmol m^{-2} / 1000 = mol m^{-2} 
- mol m^{-2} $\times\$ molecular mass = g  m^{-2}
- this matrix of mass m^{-2} is then summed over all depths at each time. This gives a similar time series of mass per 1 m^{-2}.
- for plotting, this is then carved into three sections, 0 cm to 1 cm, 1 cm to 2 cm, and 2 cm to the bottom. This does not affect the total mass. 