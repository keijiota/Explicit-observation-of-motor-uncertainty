# Sub-optimality in motor planning is not improved by explicit observation of motor uncertainty

This repository accompanies the manusript by Ota et al., (2019), accepted in Scientific Reports. It includes subject's data and the scripts for generating figures reported in the paper.

# Overview of the data structure
The data structure is as follows:

Decision task
<li>bdt_optAim: optimal aim point in each block</li>
<li>bdt_optEG: maximized expected gain</li>
<li>sigma: standard deviation of subject's endpoint</li>
<li>aimpoint: subject's mean endpoint</li>
<li>miss: number of mistrials</li>
<li>EG: expected gain, subject's total score / 50 trials</li>
<li>to: number of timeout trials</li>

<br>
Full information task
<li>dot_noise: standard deviation used in a sample from a Gaussian distribution</li>
<li>dot_optAim: theoretical optimal setting</li>
<li>dot_endpoint: subjective optimal setting in each trial</li>
Variables of dotsL, gauss, gaussL, uni, and uniL have the same structure above.
L means a wide width condition. <br>
gauss and uni indicate a Gaussian probability density function and uniform PDF, respectively.

# Reference
Ota, K., Shinya, M., Maloney, L. T., & Kudo, K. (in press). Sub-optimality in motor planning is not improved by explicit observation of motor uncertainty. Scientific Reports.
