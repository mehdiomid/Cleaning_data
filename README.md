

## R script to clean and organize a given set of data



A set of data to test the humen activity recognition apps is available at

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

published in reference below.


[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

These sets of data are collected from a series of experiments carried out with a group
of 30 volunteers using Samsung Galaxy S smartphones. 

===============================================================================

R scrript, named run_analysis.R is provided here to clean and organize these sets of data as described below.  

1- The data included two sets of training and the test sets that are combuned to create one data set.  
2- The measurements on the mean and standard deviation for each measurement were extracted.  
3- The activities in the data set are renamed to be more descriptive.  
4- The data set was labeled with descriptive variable names.  
5- From the data set in step 4, an independent tidy data set with the average of each variable for each activity
and each subject was created. This data set is stored in a file named tidy_data.txt.

In addition, a codebook is also provided here that describes the variables, the data, and any transformations or 
work that was performed to clean up the data. This file is named CodeBook.md
