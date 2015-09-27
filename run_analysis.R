# Code for the Course Project in "Getting and Cleaning Data" on Coursera
# Submission deadline on 27 September 2015
library(downloader)
library(dplyr)


# The base directory.
dirName <- "getdata-projectfiles-UCI HAR Dataset"

# Check if the base directory exists, if not, download the zipped data and unzip
if (!file.exists(dirName)) {
  # Link to data
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  # Download the file using downloader package
  download(fileUrl, dest="dataset.zip", mode="wb") 
  # Unzip to folder
  unzip ("dataset.zip", exdir = dirName)
}

# Path to activity labels
actLabelPath <- paste(dirName, "/UCI HAR Dataset/", sep="")

# Read in activity labels
activityLabels <- read.table(paste(actLabelPath, "activity_labels.txt", sep=""))

# Path to feature labels
featLabelPath <- paste(dirName, "/UCI HAR Dataset/", sep="")

# Read in feature labels
featureLabels <- read.table(paste(actLabelPath, "features.txt", sep=""))

# Path to test data
testPath <- paste(dirName, "/UCI HAR Dataset/test/", sep="")

# Read in test data
test_X <- read.table(paste(testPath, "X_test.txt", sep=""))
test_y <- read.table(paste(testPath, "y_test.txt", sep=""))
test_subj <- read.table(paste(testPath, "subject_test.txt", sep=""))

# Loop through test_y to add activity description in the second column
# Could do with an apply command, but choose to be old fashioned!
for (i in 1:nrow(test_y)){
   test_y[i,2] <- activityLabels[test_y[i,1],2]
}

# Path to training data
trainPath <- paste(dirName, "/UCI HAR Dataset/train/", sep="")

# Read in training data
train_X <- read.table(paste(trainPath, "X_train.txt", sep=""))
train_y <- read.table(paste(trainPath, "y_train.txt", sep=""))
train_subj <- read.table(paste(trainPath, "subject_train.txt", sep=""))

# Loop through train_y to add activity description in the second column
# Could do with an apply command, but choose to be old fashioned!
for (i in 1:nrow(train_y)){
  train_y[i,2] <- activityLabels[train_y[i,1],2]
}


# Collect all the test data into one big table
testTotal <- cbind(test_y, test_subj, test_X)
trainTotal <- cbind(train_y, train_subj, train_X)

# Combine the two datasets
data <- rbind(testTotal, trainTotal)

# Rename columns
colnames(data)[1] <- "ActivityId"
colnames(data)[2] <- "ActivityName"
colnames(data)[3] <- "SubjectId"
colnames(data)[c(4:564)] <- as.character(featureLabels[,2])

# data now contains ALL the data, with labeled columns

# Find the the column numbers of columns in data that include the words 
# "mean" and "std", sorted in ascending order. We remove the columns that
# belong to the meanFreq() measurement to only capture mean() and std()
meansAndStdCols <- sort(c(grep("mean", colnames(data)), grep("std", colnames(data))))
freqMeanCols <- grep("meanFreq", colnames(data))
useMeanAndStdCols <- setdiff(meansAndStdCols, freqMeanCols)

# Add the first three columns with subject and activity info
useInd <- c(1:3, useMeanAndStdCols)

# The data frame meanAndStdData contains all the mean() and std() measurements
# from the test and training data combined.  The first column has the activity Id, 
# the second one the activity descriptions, and the third one the subject Id.
# The remainder of the columns contain the measurements.
meanAndStdData <- data[,useInd]

# Now to create the tidy data set with the average of each variable for 
# each activity and each subject.  There are six activites and 30 subjects
tidyData <- data.frame(matrix(0, ncol=69, nrow=0))
  
# Loop through each catergory using double for-loops.  Yes, there are
# fancier ways, but this works too.
for (actNo in 1:6){
  for (subNo in 1:30){
    
    # Find the rows with a certain activity and subject
    temp <-  filter(meanAndStdData, ActivityId == actNo & SubjectId == subNo)
    
    # If such rows exist calculate the mean
    if (nrow(temp) > 0){
    
      # Calculate the means of the columns
      tempMean <- summarise_each(temp, funs(mean))

      # Re-add activity name
      tempMean[1,2] <- as.character(temp[1,2])

      # Add the mean value to the tidyData dataframe
      tidyData <- rbind(tidyData, tempMean)
      
    }
  }
}

# Write out tidyData to txt file
write.table(tidyData, "tidyData.txt", row.names=FALSE) 


