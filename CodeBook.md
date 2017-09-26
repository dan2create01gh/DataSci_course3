# Data Science Course n.3: Getting and Cleaning Data
## Peer-graded end-of-course assignment - 

# CodeBook file for the project

# Activity:
Refers to the activities performed by the participants of the experiments, and includes the following: 
* WALKING 
* WALKING_UPSTAIRS 
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

# Subject:
Refers to the participants in the experiment. They are numbered from 1 to 30

# Measurement columns
Explanations on the original measurements are provided in detail in rawdata\README.txt and rawdata\features_info.txt files

In short:

Measurements were performed using the accelerometer and gyroscope embedded in smartphones. The obtained signals (after processing, as described in the files mentioned above) are as follows (where'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions):

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

The dataset includes a column for mean and for the standard deviation of each of these signals, averaged over the subjects and activities (per subject, per activity).

Column-names for measurements will be of the form signal.stat...XYZ, for example:

"tBodyAcc.mean...Y" denotes the mean value of the signal tBodyAcc in the Y direction.
"fBodyAccJerk.std...Z" denotes the standard deviation of the fBodyAccJerk signal in the Z direction
"fBodyAccMag.mean" denotes the mean value of the signal fBodyAccMag.

As mentioned above, each measurement is the average of this signal per subject, per activity.


