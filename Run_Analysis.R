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
  train_or_test <- factor(rep("train",nrow(x_train)),levels = c("test","train"))
  train_data <- cbind(subject_train,train_or_test,activity, x_train)
  #
  # =====================================================
  # Constructing test_data
  x_test <- x_test[mean_std_location] # Extracting required features
  activity <-factor(y_test$V1,labels = activity_labels$V2)
  train_or_test <- factor(rep("test",nrow(x_test)),levels = c("test","train"))
  test_data <- cbind(subject_test,train_or_test,activity, x_test)
  #
  ## Combining training and test data together
  tidy_data <- rbind(train_data,test_data)
  colnames(tidy_data) <-c("Subject No", "train or test", "Activity",features_mean_std)
  write.table(tidy_data, "tidy_data.txt")

}