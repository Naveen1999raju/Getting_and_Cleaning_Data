# Getting_and_Cleaning_Data

## Source and its components
source = https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
### Content of zipfile
UCI HAR Dataset 
1. activity_labels 
2. features.txt
3. README.txt
4. test
      * X_test.txt 
      * Y_test.txt
      * subject_test.txt
5. train
      * X_train.txt 
      * Y_train.txt
      * subject_train.txt
                                 
## Overall Flow of creating a tidydata.
1. Q1 Merges the training and the test sets to create one data set.
   * Dataset downloaded using the above URL, by download.file and unziped the file
   * Files are read using read.table
   * The files in test and train are merged using rbind where according to there textfile names.
   * This is named as xbind,ybind,subbind
2. Q4 Appropriately labels the data set with descriptive variable names.
   * xbind,ybind,subbind are column named useing features textfile
   * All this file are merged using cbind and named as all_merge
3. Q2 Extracts only the measurements on the mean and standard deviation for each measurement.
   * Column names with mean and std is searched and assigned to new varible mean_and_std 
4. Q3 Uses descriptive activity names to name the activities in the data set
   * New column called activityType is created and its values are assigned using acitivtyId which are availaible is activity_lables testfile.
5. Q5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
   * New tidy dataset is created using write.table which contains the acitityType,activityId etc

