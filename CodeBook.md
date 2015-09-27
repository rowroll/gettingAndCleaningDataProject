# Code Book for Course Project in Getting and Cleaning Data
## Due date 27 September 2015

This code book describes the variables, the data, and transformations or work performed to clean up the data.

## The Data and Variables
The data is contained in a file called tidyData.txt.  It is derived from data described below in the chapter "The Original Data".

tidyData.txt contains 180 observations of 69 variables, along with headers for each variable.  It was created using write.table with row.names=FALSE in R.  It can be read using tidyData <- read.table("tidyData.txt") in R.

Each observation (i.e. row) describes the average of each original variable (see columns 4 to 69) for one activity and one subject. The columns (variables) of tidyData.txt are:

1. ActivityId, which is an integer number between 1 and 6
2. ActivityName, corresponding to ActivityId, is one of: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
 
3. SubjectId, which is an integer number ranging from 1 to 30, one for each subject.
4. tBodyAcc-mean()-X
5. tBodyAcc-mean()-Y
6. tBodyAcc-mean()-Z
7. tBodyAcc-std()-X
8. tBodyAcc-std()-Y
9. tBodyAcc-std()-Z
10. tGravityAcc-mean()-X
11. tGravityAcc-mean()-Y
12. tGravityAcc-mean()-Z
13. tGravityAcc-std()-X
14. tGravityAcc-std()-Y
15. tGravityAcc-std()-Z
16. tBodyAccJerk-mean()-X
17. tBodyAccJerk-mean()-Y
18. tBodyAccJerk-mean()-Z
19. tBodyAccJerk-std()-X
20. tBodyAccJerk-std()-Y
21. tBodyAccJerk-std()-Z
22. tBodyGyro-mean()-X
23. tBodyGyro-mean()-Y
24. tBodyGyro-mean()-Z
25. tBodyGyro-std()-X
26. tBodyGyro-std()-Y
27. tBodyGyro-std()-Z
28. tBodyGyroJerk-mean()-X
29. tBodyGyroJerk-mean()-Y
30. tBodyGyroJerk-mean()-Z
31. tBodyGyroJerk-std()-X
32. tBodyGyroJerk-std()-Y
33. tBodyGyroJerk-std()-Z
34. tBodyAccMag-mean()
35. tBodyAccMag-std()
36. tGravityAccMag-mean()
37. tGravityAccMag-std()
38. tBodyAccJerkMag-mean()
39. tBodyAccJerkMag-std()
40. tBodyGyroMag-mean()
41. tBodyGyroMag-std()
42. tBodyGyroJerkMag-mean()
43. tBodyGyroJerkMag-std()
44. fBodyAcc-mean()-X
45. fBodyAcc-mean()-Y
46. fBodyAcc-mean()-Z
47. fBodyAcc-std()-X
48. fBodyAcc-std()-Y
49. fBodyAcc-std()-Z
50. fBodyAccJerk-mean()-X
51. fBodyAccJerk-mean()-Y
52. fBodyAccJerk-mean()-Z
53. fBodyAccJerk-std()-X
54. fBodyAccJerk-std()-Y
55. fBodyAccJerk-std()-Z
56. fBodyGyro-mean()-X
57. fBodyGyro-mean()-Y
58. fBodyGyro-mean()-Z
59. fBodyGyro-std()-X
60. fBodyGyro-std()-Y
61. fBodyGyro-std()-Z
62. fBodyAccMag-mean()
63. fBodyAccMag-std()
64. fBodyBodyAccJerkMag-mean()
65. fBodyBodyAccJerkMag-std()
66. fBodyBodyGyroMag-mean()
67. fBodyBodyGyroMag-std()
68. fBodyBodyGyroJerkMag-mean()
69. fBodyBodyGyroJerkMag-std()

The precise defintion of each measured variable is found in the documentation of the original data set names "features_info.txt".  It reads as follows:

### Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain 
signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass 
Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity 
acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, 
tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'




## The Original Data

The _original_ data comes from the following project:

==================================================================

Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

### Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

### License:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


## Transformation of the Original Data

The original dataset was fragmented, and the following steps were taken to unify it.  

First of all the names of the activities (see activity_labels.txt)  were added to the activity identifying data in y_test.txt and y_train.txt.

Then, the data in y_test.txt (ActivityId, and ActivityName), subject_test.txt (SubjectId), X_test.txt (measurements) was combined into one table, and the same was done with  y_train.txt (ActivityId, and ActivityName), subject_train.txt (SubjectId), X_train.txt (measurements).

Next, the two big tables were combined, and given header names for the activity columns, and subject Id.  The remainder of columns got names derived straight from features.txt, which contains the identifying name of each measurement.

Once the big table had been created, a subset of it was created including only the activity and subjectId info, as well as only the mean() and std() measurements.

This table was then used to only select observations belonging to one activity and one subject, and the average of each mean() and std() measurement was found and recorded, one number per measurement.

The averaged data were collected into a new table (tidyData), along with the corresponding activity info and subjectId, and writted out to tidyData.txt.
