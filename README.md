# A nonlinear simulation framework supports adjusting for age when analyzing BrainAGE.

## Trang T. Le, Rayus Kuplicki, Brett A. McKinney, Hung-wen Yeh, Wesley K. Thompson, Martin P. Paulus

### Keywords: 
BrainAGE, simulation, false positives, SVR, keyword5. (Min.5-Max. 8)

### Abstract
Several imaging modalities, including
T1-weighted structural imaging, diffusion tensor imaging, and functional MRI
are related to chronological age. Employing machine learning algorithms, it is
possible to use these imaging data to predict an individual’s age with
reasonable accuracy. While details vary according to modality, the general
strategy is to: 1) extract image-related features, 2) build a model on a
training set that uses those features to predict subject age, 3) validate the
model on a test dataset, producing a predicted age for each subject, 4) define
the “Brain Age Gap Estimate” (BrainAGE) as the difference between a subject’s
predicted age and his/her chronological age, and 5) estimate the relationship
between BrainAGE and other variables of interest, making inferences about these
variables and accelerated or delayed brain aging. For example, a group of
subjects with overall positive BrainAGE may show signs of accelerated aging in
other variables as well. However, the residual of an age-prediction model,
BrainAGE, is necessarily correlated with age. There is inevitably an
overestimation of the age of young subjects and an underestimation of the age
of old subjects in almost any plot of actual vs. predicted age, an effect due
to the well-known phenomenon of “regression to the mean”. This correlation
between chronological age and BrainAGE may significantly impact the
relationship between BrainAGE and other variables of interest when these are
also related to age. In this study, we examine the detectability of variable
effects under different assumptions. We use empirical results from two separate
datasets (training=475 healthy volunteers, aged 18 – 60 years; 259 female;
testing=489 participants including people with mood/anxiety, substance use,
eating disorders and healthy controls, aged 18 – 56 years, 312 female) to
inform simulation parameter selection. Results in simulated and empirical data
strongly support the proposal that models incorporating BrainAGE should be
include chronological age as a covariate. We propose either including age as a
covariate in step 5 of above, or using a multistep procedure where age is
regressed on BrainAGE prior to step 5, producing BrainAGE Residualized
(BrainAGER) scores. 


