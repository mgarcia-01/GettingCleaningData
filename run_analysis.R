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
SubTest <- "/Users/michaelgarcia/CloudStation/data_toolbox/GettingCleaningData/UCI HAR Dataset/test/subject_test.txt"
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
      subTrain <- read.table(SubTrain)
      subTest <- read.table(SubTest)
      
      
     # bind rows. row count the same
       #TrainSets <- cbind(cbind(Xtrain,Ytrain),SubTrain)
       #TestSets <- cbind(cbind(Xtest,Ytest),SubTest)
              #XSets <- cbind(Xtrain,Ytrain,subTrain)
        XSetsNames <- features
      names(Xtrain) <- XSetsNames[,2]
      names(Xtest) <- XSetsNames[,2]
     ## (a) added names to activities 
      Ytrain <- replace(Ytrain,Ytrain[1] == 1,"WALKING")
      Ytrain <- replace(Ytrain,Ytrain == 2,"WALKING_UPSTAIRS")
      Ytrain <- replace(Ytrain,Ytrain == 3,"WALKING_DOWNSTAIRS")
      Ytrain <- replace(Ytrain,Ytrain == 4,"SITTING")
      Ytrain <- replace(Ytrain,Ytrain == 5,"STANDING")
      Ytrain <- replace(Ytrain,Ytrain == 6,"LAYING")
     
     names(Ytrain) <- "Activity"
     names(Ytest) <- "Activity"
     names(subTrain) <- "Subject"
     names(subTest) <- "Subject"
      
      
      XSets <- cbind(Xtrain,Ytrain,subTrain)
      YSets <- cbind(Xtest,Ytest,subTest)
      CompleteSets <- rbind(XSets, YSets)
     #NotNEEDED label_feat   <- cbind(features,activityLabels)
      
    ### 2. Extracts only the measurements on the mean and standard deviation for each measurement.###
      #need to rename to get measurements 
      
      # renamed the xsets to the vector 2 of features as a list
       #names(XSets) <- XSetsNames[,2]
       mean_std <- grep(("(mean|std)\\(\\)")
                        , names(CompleteSets)
                        )
    
      # now create variable for only mean and std dev. 
        mean_stdSet <- CompleteSets[, mean_std]
        mean_stdSet <-cbind(mean_stdSet,CompleteSets[562:563])
        
    ### 3. Uses descriptive activity names to name the activities in the data set ###
        #list the elements in vector 2 for the names of activities
       ####SEE note (a) line 42. Renamed in compilation of set
       
    ### 4. Appropriately labels the data set with descriptive variable names.
        #using gsub to replace occurances of string pattern 
        #See features_info.txt for variable names and descriptions
            newMeanName <- gsub("-mean\\(\\)", "Mean", names(mean_stdSet), ignore.case=FALSE
                                )
            names(mean_stdSet) <- newMeanName
            newStdDevName <- gsub("-std\\(\\)", "StdDev", names(mean_stdSet), ignore.case=FALSE
                                       )
            names(mean_stdSet) <- newStdDevName
            timeNames <- gsub("^t", "Time", names(mean_stdSet), ignore.case=FALSE
                                       )
            names(mean_stdSet) <- timeNames
            newFreqName <- gsub("^f", "Frequency", names(mean_stdSet), ignore.case=FALSE
                                )
            names(mean_stdSet)  <- newFreqName
            
            
          #need to add the subject columns to this set of data
            
  }



