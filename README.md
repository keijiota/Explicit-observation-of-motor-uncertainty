# Sub-optimality in motor planning is not improved by explicit observation of motor uncertainty

This repository accompanies the manusript by Ota et al., (2019), accepted in Scientific Reports. It includes subject's data and the scripts for generating figures reported in the paper.

# Overview of the data structure
The data structure is as follows:

Decision task
bdt_optAim: optimal aim point in each block 
bdt_optEG: maximized expected gain 
sigma: standard deviation of subject's endpoint 
aimpoint: subject's mean endpoint 
miss: number of mistrials
EG: expected gain, subject's total score / 50 trials 
to: number of timeout trials

Full information task
dot_noise: standard deviation used in a sample from a Gaussian distribution
dot_optAim: theoretical optimal setting 
dot_endpoint: subjective optimal setting in each trial 
Variables of dotsL, gauss, gaussL, uni, and uniL have the same structure above. 
L means a wide width condition. gauss and uni indicate a Gaussian probability density function and uniform PDF, respectively. 

# Reference
Ota, K., Shinya, M., Maloney, L. T., & Kudo, K. (in press). Sub-optimality in motor planning is not improved by explicit observation of motor uncertainty. Scientific Reports.
