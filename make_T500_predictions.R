


one_analysis <- function(training_x, training_y, testing_x, testing_y, label, prefix){
  
  png(paste(prefix, '_hist_testing_age.png', sep = ''))
  hist(testing_y, xlab = 'Age', main = paste(label, '\nHistogram of Testing Ages\nn=', length(testing_y), sep = ''))
  dev.off()
  
  png(paste(prefix, '_hist_training_age.png', sep = ''))
  hist(training_y, xlab = 'Age', main = paste(label, '\nHistogram of Training Ages\nn=', length(training_y), sep = ''))
  dev.off()
  
  
  
  library(caret)
  
  ctrl <- trainControl(method="repeatedcv", 
                       number=10,                        # 10-fold CV
                       #repeats=1,                        # repeat 5 times
                       repeats=5,                        # repeat 5 times
                       adaptive=list(min=5,              # minimum number of resamples that will be used for each tuning parameter
                                     alpha=0.05,         # confidence level that is used to remove parameter settings. 
                                     method='gls',       # 'gls' for linear models & 'BT' for Bradley-Terry model.  
                                     complete=T),
                       selectionFunction = 'oneSE',
                       savePredictions = 'final',
                       search='grid')
  
  fit.svr <- train(x = training_x, y = training_y,
                   method = 'svmRadial', 
                   trControl = ctrl,
                   preProcess = c('center', 'scale'),
                   tuneLength = 15)
  
  predicted_age <- predict(fit.svr, testing_x)
  
  
  
  #model <- svm(training_x, training_y)
  #predicted_age <- predict(model, testing_x)

  

  error <- predicted_age - testing_y


  ss_resid <- mean(error^2)
  ss_total <- mean((testing_y - mean(testing_y))^2)
  r2 <- 1 - (ss_resid / ss_total)
  print(r2)
  print(cor(error, testing_y)^2)
  print(cor(error, predicted_age)^2)
  print(cor(testing_y, predicted_age)^2)
  mae <- mean(abs(error))


  plot_data <- as.data.frame(cbind(testing_y, predicted_age))
  names(plot_data) <- c('age', 'predicted_age')

  library(ggplot2)
  p <- ggplot(plot_data) + geom_point(aes(x = age, y = predicted_age)) + geom_abline(slope = 1) +
      ggtitle(paste(label, '\nAge vs Predicted Age\nr2=', substr(r2, 1, 4), '\nmae=', substr(mae, 1, 3), sep = ''))
  ggsave(paste(prefix, 'age_vs_predicted.png', sep = ''), p, device = 'png', width = 10, height = 5, units = 'in')
  
  resid_frame <- data.frame(cbind(testing_y, error))
  resid_lm <- lm(error ~ testing_y, data = resid_frame)
  #return(fit.svr)
  return(list(svr_model = fit.svr, predictions = cbind(predicted_age, error, resid_lm$residuals))) #return BrainAGER, residualized BrainAGE
}

#to make results reproduceable
set.seed(1234)

training_data <- read.csv('training_data.csv')
testing_data <- read.csv('testing_data.csv')
vbm_col_names <- names(training_data)[substr(names(training_data), 1, 26) == 'srage_freesurfer_coarsevbm']



#training using all HCs not in T500 data, testing on all T500 data
train_x <- training_data[, names(training_data) %in% vbm_col_names]
train_y <- training_data[, 'Age']
test_x <- testing_data[, names(testing_data) %in% vbm_col_names]
test_y <- testing_data[, 'Age']
retval <- one_analysis(train_x, train_y, test_x, test_y, 'Training: All Non-T500 HCs\nTesting: All T500 Subjects', 'allnon_all' )

svr_model <- retval[[1]]
save(svr_model, file = 'trained_svr_model.RData')

     
to_save <- as.data.frame(retval[[2]])     
to_save <- cbind(as.character(testing_data$id), to_save) 

names(to_save) <- c('id', 'predicted_age', 'BrainAGE', 'BrainAGER')
write.csv(to_save, 'T500_BrainAGE.csv', row.names=FALSE)













  