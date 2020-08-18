# Setting the working directory
setwd("D:/R/win-library/3.6/rprogramming/Getting_and_Cleaning_Data")

# Downloading the dataset into the directory
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile = "../Getting_and_Cleaning_Data/dataset.zip")
unzip(zipfile = "../Getting_and_Cleaning_Data/dataset.zip", exdir = "../Getting_and_Cleaning_Data/datasetunzip")

# reading the train files using read.table
xtrain   <- read.table("../Getting_and_Cleaning_Data/datasetunzip/UCI HAR Dataset/train/X_train.txt")
ytrain   <- read.table("../Getting_and_Cleaning_Data/datasetunzip/UCI HAR Dataset/train/Y_train.txt")
subtrain <- read.table("../Getting_and_Cleaning_Data/datasetunzip/UCI HAR Dataset/train/subject_train.txt")

# reading the test files using read.table
xtest <- read.table("../Getting_and_Cleaning_Data/datasetunzip/UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("../Getting_and_Cleaning_Data/datasetunzip/UCI HAR Dataset/test/Y_test.txt")
subtest <- read.table("../Getting_and_Cleaning_Data/datasetunzip/UCI HAR Dataset/test/subject_test.txt")

# reading the features and activity_labels
features <- read.table("../Getting_and_Cleaning_Data/datasetunzip/UCI HAR Dataset/features.txt")
activitylabels <- read.table("../Getting_and_Cleaning_Data/datasetunzip/UCI HAR Dataset/activity_labels.txt")


# 1. Merging the training and the test sets to create one data set using rbind and cbind
xbind <- rbind(xtrain,xtest)
ybind <- rbind(ytrain,ytest)
subbind <- rbind(subtrain, subtest)
View(xbind)
View(ybind)
View(subbind)
View(features)
View(activitylabels)

# 4. Appropriately labels the data set with descriptive variable names.( Q4 is done preour to other 3 questions)
colnames(xbind) = features[,2]
colnames(ybind) = "activityId"
colnames(subbind) = "subjectId"
colnames(activitylabels) <- c('activityId','activityType')
# View the datatable to check is the column names are assigned properly
View(xbind)
View(ybind)
View(subbind)
View(activitylabels)
all_merge <- cbind(ybind,subbind,xbind)               # all the dataset is merged here
View(all_merge)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
mean_std <- features[grep("mean\\(\\)|std\\(\\)",features[,2]),]
mean_and_std <- all_merge[,mean_std[,1]]
View(mean_and_std)

# 3. Uses descriptive activity names to name the activities in the data set

ybind$activityType <- factor(ybind$activityId, labels = as.character(activitylabels[,2]))
activityType <- ybind[,-1]
View(activityType)


# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
sub_table <- cbind(ybind, subbind,xbind)
View(sub_table)
Mean <-aggregate(. ~subjectId + activityType, sub_table, mean)
Mean <-Mean[order(Mean$subjectId,Mean$activityType),]
View(Mean)
write.table(Mean, file = "../Getting_and_Cleaning_Data/tidydata.txt",row.name = FALSE)
View(read.table("../Getting_and_Cleaning_Data/tidydata.txt",header = TRUE,stringsAsFactors = FALSE))
