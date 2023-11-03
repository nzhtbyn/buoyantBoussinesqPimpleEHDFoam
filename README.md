# EHD-mixedHeatTransfer-singlePhase

[![Author](https://img.shields.io/badge/Author-green.svg)](https://sites.google.com/view/zehtabiyan/home)
[![Paper](https://img.shields.io/badge/Paper-Access-red.svg)](https://doi.org/10.1016/j.elstat.2019.103415)

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) 

An OpenFOAM solver to model enhancement of mixed convection heat transfer due to electrohydrodynamic (EHD) flow, developed by [Navid Zehtabiyan-Rezaie](https://sites.google.com/view/zehtabiyan/home).

# Description
The developed solver handles governing equations in mixed convection heat transfer including continuity, momentum, energy, and electrical equations. The developed solver is able to handle the coupled equations. For a comprehensive understanding of this solver, see this [publication](https://doi.org/10.1016/j.elstat.2019.103415).

# Target platform
The code has been rigorously tested and verified to be fully compatible with OpenFOAM v-4.1, ensuring its smooth integration and reliable performance with this specific release.

# How to set the model
1- Download the source code using the following command:

  `git clone https://github.com/nzhtbyn/Extended-kEpsilon-WindFarmSimulation.git`

2- To enable the momentum-source calculator of the actuator-disk model without rotation (ADM-NR) in OpenFOAM to calculate the source terms based on the disk-averaged velocity, follow these instructions:

$\bullet$ Go to your work directory via the following command:
  
`cd $WM_PROJECT_USER_DIR`
       
$\bullet$ Copy the folder _ADM_NR_diskBased_ to your work directory, and compile the new library with the following command
  
 `wmake`
 
3- Copy the folder _testCase_ to your run directory. To initiate the simulation, adjust number of _numberOfSubdomains_ in _system/decomposeParDict_, and execute the following command:

`.//Allrun`

# Evaluation of the extended model's performance
The local heat transfer coefficient over a plate with a heat flux of 187 $\text{W}/\text{m}^2$ is compared with the experimental results of [Owsenek and Seyed-Yagoobi](https://doi.org/10.1115/1.2824148). Three different voltages are applied to the wire placed at a distance of 2 cm above the heated plate. Results obtained from the developed solver show a very good agreement with the experimental data. 

  <img src="https://github.com/nzhtbyn/FiguresForCodes/blob/main/EHD-enhanced-HeatTransfer/ehdHeat_JoS_2020.jpg" width="400" height="400" alt="Local heat transfer coefficient with a single wire electrode placed 2 cm above the plate electrode for a heat flux of 187 W/m2; a comparison between experimental results of Owsenek and Seyed-Yagoobi [31] and results of the present solver.">

The performance of the solver has been further assessed through extensive testing against experimental data in the study of [Zehtabiyan-Rezaie et al. (2020)](https://doi.org/10.1016/j.elstat.2019.103415).

# How to cite
Please, cite this library as:
```
@article{ZEHTABIYANREZAIE_ehdHeat_JoE_2020,
author = {Navid Zehtabiyan-Rezaie and Majid Saffar-Avval and Kazimierz Adamiak},
title = {Forced convection heat transfer enhancement using a coaxial wire-tube corona system},
journal = {Journal of Electrostatics},
volume = {103},
pages = {103415},
year = {2020},
issn = {0304-3886},
doi = {https://doi.org/10.1016/j.elstat.2019.103415}
}
```
