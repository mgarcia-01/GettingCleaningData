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
SubTest <- "/Users/michaelgarcia/CloudStation/data_toolbox/GettingCleaningData/UCI HAR Dataset/train/subject_test.txt"
SubTrain <- "/Users/michaelgarcia/CloudStation/data_toolbox/GettingCleaningData/UCI HAR Dataset/train/subject_train.txt"  
featuresURL <- "/Users/michaelgarcia/CloudStation/data_toolbox/GettingCleaningData/UCI HAR Dataset/features.txt"  
activityURL <- "/Users/michaelgarcia/CloudStation/data_toolbox/GettingCleaningData/UCI HAR Dataset/activity_labels.txt"  
run_analysis(Xtest, Xtrain, Ytest, Ytrain ){
  
    ### 1. merged data and training sets create one set ##
      Xtest <- read.table(XtestURL)
      Xtrain <- read.table(XtrainURL)
      Ytest <- read.table(YtestURL)
      Ytrain <- read.table(YtrainURL)
      features <- read.table(featuresURL)
      activityLabels <- read.table(activityURL)
      
     # replaced cbind() with 
       #TrainSets <- cbind(cbind(Xtrain,Ytrain),SubTrain)
       #TestSets <- cbind(cbind(Xtest,Ytest),SubTest)
      XSets <- rbind(Xtrain,Xtest)
      YSets <- rbind(Ytrain,Ytest)[, 1]
    ### 2. Extracts only the measurements on the mean and standard deviation for each measurement.###
      #need to rename to get measurements 
       XSetsNames <- features
      # renamed the xsets to the vector 2 of features as a list
       names(XSets) <- XSetsNames[,2]
       mean_std <- grep("(mean|std)\\(\\)", names(XSets))
      # now create variable for only mean and std dev. 
        mean_stdSet <- XSets[, mean_std]
    ### 3. Uses descriptive activity names to name the activities in the data set ###
        #YSetsNames <- activityLabels
        #list the elements in vector 2 for the names of activities
        activityrelabel <- as.character(activityLabels[,2])
        activity <- activityrelabel[YSets]
    ### 4. Appropriately labels the data set with descriptive variable names.
        
    ### 5. From the data set in step 4, creates a second, independent tidy data set with the average
    ###    of each variable for each activity and each subject.
        
        
  }



