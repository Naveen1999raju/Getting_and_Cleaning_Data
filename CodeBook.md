# Getting_and_Cleaning_Data
## CodeBook 

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
 ### Variables in the run_analysis.R
 * xbind is the data which is merged using rbind of xtest and xtrain
 * ybind is the data which is merged using rbind of ytest and ytrain
 * subbind is the data which is merged using rbind of subtest and subtrain
 * all_merge is the data which is merged using cbind of all the 3 ie ybind,subbind,xbind
 * activityId is the column name for ybind
 * variable in features are the column names for xbind
 * Mean is the datatable containing avg of each subject
