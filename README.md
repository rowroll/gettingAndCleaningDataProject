# The Getting and Cleaning Data Project Repo

This repo contains, besides this README.md file, the files

* __getdata-projectfiles-UCI HAR Dataset__ folder (the original data)
* __CodeBook.md__, describing the contents of tidyData.txt
* __run_analysis.R__, the R code script used to product tidyData.txt from the data folder
* __tidyData.txt__, the output of run_analysis.R, summarizing the mean and std data in the original dataset

## run_analysis.R

The script run_analysis.R does the following:

* Checks to see if the original data folder exists locally, if not, the zip file is downloaded and unzipped.

* The data from the original folder is read in.  They are:
   + activityLabels from "activity_labels.txt"
   + featureLabels from "features.txt"
   + test_X.txt (measurements, used for testing)
   + test_y.txt (activites corresponding to test_X.txt, as integers 1-6)
   + test_subj.txt (subjects corresponding to test_X.txt, as integers 1-30)
   + train_X.txt (measurements, used for training)
   + train_y.txt (activites corresponding to train_X.txt, as integers 1-6)
   + train_subj.txt (subjects corresponding to train_X.txt, as integers 1-30)
   
* The names of the activities (see activity_labels.txt)  were added to the activity identifying data in y_test.txt and y_train.txt.

* The data in y_test.txt (ActivityId, and ActivityName), subject_test.txt (SubjectId), X_test.txt (measurements) was combined into one table. 

* The data in y_train.txt (ActivityId, and ActivityName), subject_train.txt (SubjectId), X_train.txt (measurements) was combined into one table.

* The two big tables were combined, and given header names for the activity columns, and subject Id.  The remainder of columns got names derived directly from features.txt, which contains the identifying name of each measurement.

*  Using this big table, a subset of it was created including only the activity and subjectId info, as well as only the mean() and std() measurements.

* This table-subset was then used to only select observations belonging to one activity and one subject, and the average of each mean() and std() measurement was found and recorded, one number per measurement type.

* The averaged data were collected into a new table (tidyData), along with the corresponding activity info and subjectId, and writted out to tidyData.txt.
