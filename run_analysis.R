# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(tidyr)
library(plyr)
zipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zipURL, "~/data_toolbox/cleaningData_project")
download.file(zipURL, urlShare)

unzip("~/data_toolbox/cleaningData_project")

XtestURL <- "/Users/michaelgarcia/CloudStation/data_toolbox/GettingCleaningData/UCI HAR Dataset/test/X_test.txt"
XtrainURL <- "/Users/michaelgarcia/CloudStation/data_toolbox/GettingCleaningData/UCI HAR Dataset/train/X_train.txt"
YtestURL <- "/Users/michaelgarcia/CloudStation/data_toolbox/GettingCleaningData/UCI HAR Dataset/test/Y_test.txt"
YtrainURL <- "/Users/michaelgarcia/CloudStation/data_toolbox/GettingCleaningData/UCI HAR Dataset/train/Y_train.txt"
  
  
run_analysis(Xtest, Xtrain, Ytest, Ytrain ){
  Xtest <- read.table(XtestURL)
  Xtrain <- read.table(XtrainURL)
  Ytest <- read.table(YtestURL)
  Ytrain <- read.table(YtrainURL)
 # replaced cbind() with rbind()
  XSets <- rbind(Xtrain,Xtest)
  YSets <- rbind(Ytrain,Ytest)
  
}



