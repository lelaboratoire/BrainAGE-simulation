# A nonlinear simulation framework supports adjusting for age when analyzing BrainAGE.
Now published (open access) in *Frontiers in Aging Neuroscience* doi: [10.3389/fnagi.2018.00317](https://doi.org/10.3389/fnagi.2018.00317)


## Trang T. Le, Rayus Kuplicki, Brett A. McKinney, Hung-wen Yeh, Wesley K. Thompson, Martin P. Paulus

### Keywords: 
BrainAGE, simulation, false positives, SVR

### Abstract
Several imaging modalities, including T1-weighted structural imaging, diffusion tensor imaging, and functional MRI can show chronological age related changes.
Employing machine learning algorithms, an individual's imaging data can predict their age with reasonable accuracy. While details vary according to modality, the general strategy is to: (1) extract image-related features, (2) build a model on a training set that uses those features to predict an individual's age, (3) validate the model on a test dataset, producing a predicted age for each individual, (4) define the “Brain Age Gap Estimate” (BrainAGE) as the difference between an individual's predicted age and his/her chronological age, (5) estimate the relationship between BrainAGE and other variables of interest, and (6) make inferences about those variables and accelerated or delayed brain aging.
For example, a group of individuals with overall positive BrainAGE may show signs of accelerated aging in other variables as well.
There is inevitably an overestimation of the age of younger individuals and an underestimation of the age of older individuals due to "regression to the mean."
The correlation between chronological age and BrainAGE may significantly impact the relationship between BrainAGE and other variables of interest when they are also related to age.
In this study, we examine the detectability of variable effects under different assumptions.
We use empirical results from two separate datasets [training = 475 healthy volunteers, aged 18–60 years (259 female); testing = 489 participants including people with mood/anxiety, substance use, eating disorders and healthy controls, aged 18–56 years (312 female)] to inform simulation parameter selection.
Outcomes in simulated and empirical data strongly support the proposal that models incorporating BrainAGE should include chronological age as a covariate. We propose either including age as a covariate in step 5 of the above framework, or employing a multistep procedure where age is regressed on BrainAGE prior to step 5, producing BrainAGE Residualized (BrainAGER) scores.


### Citation
[Google scholar citation](https://scholar.google.com/scholar?hl=en&as_sdt=0%2C39&q=A+Nonlinear+Simulation+Framework+Supports+Adjusting+for+Age+When+Analyzing+BrainAGE&btnG=#d=gs_cit&u=%2Fscholar%3Fq%3Dinfo%3An7w33yTDdeQJ%3Ascholar.google.com%2F%26output%3Dcite%26scirp%3D0%26hl%3Den)


### Correction to published version of the paper
We apologize to the reader for a few typographical errors in the published version of the paper.
We thank [Dr. Kefei Liu](https://scholar.google.com/citations?user=-Dh-Tp8AAAAJ&hl=en) for pointing out these oversights.
These are the corrections:

#### Main text
##### p.4. Right column.
- within-participant should be inter-participant.
- Equation 4b. \sigma_v^2 should be removed.

##### p.5. 
- Figure 1: \omega_{1k} should be \omega_{1ik} and so on; \epsilon_{Z_i} should be \epsilon_{ij}.
- Left column, last paragraph, first sentence should read: linear regression of BrainAGE on the covariates of interest
- Right column, Simulation Steps:
  - 2\. \sigma_w should be \sigma_w^2
  - 3\. Equation 4 should be Equation 2
  - 4\. Equation 2 should be Equation 3

##### p.6. 
- Equation (3) should be Equation (6)
- \bar{w}\_{mik} should be \bar{w}\_{m\cdot k}
- \bar{D}\_{mik} should be \bar{D}

#### Supplement

*Clarification*:
Supplementary Figure S1. Simple linear simulation, demonstrating the correlation between residuals **(predicted - observed values)** and observed values **on the test set**. Here, y = x + \epsilon where \epsilon was normally distributed with mean 0 and standard deviation \sigma. After **obtaining the age prediction on the test set and** fitting a line, the residuals are correlated with observed values of y, and that correlation decreases with decreasing \sigma. 

*Typographical error fix*: Supplementary Figure S3:
The second age-basis function f_2(A) should have included an intercept of -100:
f_2(A) = a\sqrt{b^5 - A^5} - 100.
\[...\]
In the final revision of the study, the age range was restricted to (20, 56) to closely resemble the real gray matter density data in the study.


