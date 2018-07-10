# Nonlinear simulation framework for BrainAGE and statistical modeling of age-related covariates

## Trang T. Le, Rayus Kuplicki, Brett A. McKinney, Hung-wen Yeh, Wesley K. Thompson, Martin P. Paulus

### Keywords: 
BrainAGE, simulation, false positives, SVR, keyword5. (Min.5-Max. 8)

### Abstract
Chronological age may be estimated with reasonable accuracy by machine-learning approaches that incorporate imaging modalities such as T1-weighted structural imaging, diffusion tensor imaging and functional MRI. Although the details of the modeling vary according to modality, the general strategy is to 1.) extract image-related features, 2.) build a model on a training set that uses those features to predict subject age, 3.) apply that model to a testing set, producing a predicted age for each subject, 4.) define a subject’s Brain Age Gap Estimate (BrainAGE) as the difference between that subject’s predicted age and chronological age, and 5.) test for relationships between other covariates of interest and BrainAGE, making inferences about accelerated or delayed aging. For example, one may test whether a population has an overall positive BrainAGE, indicating an effect of accelerated aging.
Thus, BrainAGE has the potential to detect age associations by constructing the residual of an age-prediction model. However, this BrainAGE residual is correlated with age, which yields an overestimation of the age of young subjects and an underestimation of the age of old subjects. Moreover, the correlation between chronological age and BrainAGE can profoundly affect the relationship with other covariates if they – in turn – are also correlated with chronological age. In this simulation study, we develop a novel simulation approach that uses a theoretical causative model of age-related brain volumetric change, and we use this approach to examine the detectability of covariate effects under different age-related assumptions. Our simulated and empirical analysis strongly support the hypothesis that the BrainAGE variable should be adjusted for chronological age. We propose either including age as a covariate in step 5 of above, or using a multistep procedure where age is regressed on BrainAGE prior to step 5, producing BrainAGE Residualized (BrainAGER). 


