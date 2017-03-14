run_analysis <- function(){
  ##
  ## This is a R script to nake clean and tidy a sets of data
  ## for coursera cleaning course (term project)
  ##
  ## =================================================
  ## Reading all data
  ## =================================================
  ##
  activity_labels <- read.table("activity_labels.txt")
  activity_labels$V2 <- gsub("_"," ",activity_labels$V2) # remove _
  features <- read.table("features.txt")
  #
  x_train <- read.table("train/x_train.txt")
  y_train<- read.table("train/y_train.txt")
  subject_train<- read.table("train/subject_train.txt")
  #
  x_test <- read.table("test/x_test.txt")
  y_test <- read.table("test/y_test.txt")
  subject_test <- read.table("test/subject_test.txt")
  # 
  ## ===================================================
  ## To find location of mean and std, extract the names from features
  ## and remove pranthesis
  mean_std_location <- c(grep("mean",features$V2),grep("std",features$V2))
  features_mean_std <-as.character(features$V2[mean_std_location])
  features_mean_std <- gsub("\\(","",features_mean_std); # To remove "("
  features_mean_std <- gsub("\\)","",features_mean_std); # To remove ")"  
  # =====================================================
  # Conscructing train_data
  x_train <- x_train[mean_std_location] # Extracting required features
  activity <-factor(y_train$V1,labels = activity_labels$V2)
  train_data <- cbind(subject_train,activity, x_train)
  #
  # =====================================================
  # Constructing test_data
  x_test <- x_test[mean_std_location] # Extracting required features
  activity <-factor(y_test$V1,labels = activity_labels$V2)
  test_data <- cbind(subject_test,activity, x_test)
  #
  ## Combining training and test data together
  All_data <- rbind(train_data,test_data)
  colnames(All_data) <-c("Subject", "Activity",features_mean_std)
  ##======================================================
  # Step 5 reshaping data 
  All_data$Subject <- factor(All_data$Subject)
  library(reshape2)
  All_data_melted <- melt(All_data, id = c("Subject", "Activity"), measure.vars = 
                            features_mean_std)
  tidy_data <- dcast(All_data_melted, Subject + Activity ~ variable, mean)
  
  write.table(tidy_data, "tidy_data.txt")

}