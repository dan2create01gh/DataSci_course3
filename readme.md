Testw
# Data Science Course n.3: Getting and Cleaning Data
## Peer-graded end-of-course assignment - 

Read-me file for the project

## Contents

* The raw data
* The codebook for the data
* The recipe (R-script)
* The (tidy) data set
* Sources

# The raw data

The raw data is taken from the project "Human Activity Recognition Using Smartphones Dataset", a series of experiments carried out with a group of 30 volunteers, during which each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), while wearing a smartphone on their waists. Various signals were measured using the embedded acceloerometer and gyroscope embedded in the smartphone.

* All the files of the raw data are located within the folder rawdata, and are explained within the file rawdata\README.txt in this folder.
* Information about the original variables and manipulations performed on them can be found in the rawdata\README.txt and rawdata\features_info.txt files.


# The codebook

The file codebook.md lists the all the variables in the resulting data set and how they were obtained from the original.

# The recipe

The recipe for obtaining the data set is included in one R script file run_analysis.R. This script is designed to work in a working directory that includes the folder rawdata, and it includes the following steps:

1. Load relevant libraries
2. load all the data from the files and change column names according to context. 
  * the columns of X (train and test) are provided from the features_list file.
3. Add a column of row ID for each of the dataframes, to facilitate joining
4. Join all the train dataframes, and then all the test dataframes, using the join_all command
5. Bind the test and train data
  * to keep a differentiation between test an data measurements - the ID column of the test data will be modified (the number of train measurements will be added to it). After binding there won't be any double ID numbers.
  * binding is done using the rbind command.
6. Select only relevant columns. Since the excercise instructions state to use only the mean and standard deviation on each measurements, the only columns that will be taken are those that in the feature_list include the text mean() or std(). This will not include meanFreq().
7. Replace the activitylabel (numbers from 1 to 6) column with a column of the activity names. This is done by mearing with the activity_labels dataset.

Note that at this step we already have a tidy dataset: 
  * Each measurement is in one row 
  * Each variable in a separate column
  * Columns have descriptive names

8. Clean up: remove all the original dataframes (with the rm command)- they are no longer needed.
9. Smaller data-set: use the aggregate command to perform a mean on each measurement, for each activity and each subjject.

10. Remarks - saving the resulting data and how to load it.

# The data-set:

The dataset resulting from the script above is saved in the file data5.txt. The code for saving it is given as a remark at the buttom of R script (see in **The Recipy** section)

The following R code loads this dataset: read.table("data5.txt",header=TRUE), provided that it is run from the same working directory.

# Sources

* The Coursera assignment [instructions](https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project)
* Usefull Markdown link: [Markdown quick reference](https://en.support.wordpress.com/markdown-quick-reference)
* Usefull for tips on the assignmentL:[thoughtfulbloke aka David Hood](https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment)





