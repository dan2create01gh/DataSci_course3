# script to merge the test and train data-sets  

# 1. Load relevant libraries
 library(dplyr)
 library(plyr)
 library(tidyverse)

# 2. load all the data from the files
#   change column names according to context. 
features_list  <-read.table("rawdata/features.txt",col.names = c("featurelabel","features"))
activity_labels<-read.table("rawdata/activity_labels.txt",col.names=c("activitylabel","activity"))

# use the features_list for the column names of X_train or X_test
X_train <-read.table("rawdata/train/X_train.txt",col.names=features_list$features)
X_test  <-read.table("rawdata/test/X_test.txt",col.names=features_list$features)

y_train <-read.table("rawdata/train/y_train.txt",col.names = "activitylabel")
y_test  <-read.table("rawdata/test/y_test.txt",  col.names = "activitylabel")

subject_train<-read.table("rawdata/train/subject_train.txt",col.names="subject")
subject_test<-read.table("rawdata/test/subject_test.txt",col.names="subject")

# 3. add a column with the row ID:for X, y and activitiy_labels - 

y_train <-tibble::rowid_to_column(y_train, "ID")
y_test  <-tibble::rowid_to_column(y_test, "ID")
X_train <-tibble::rowid_to_column(X_train, "ID")
X_test  <-tibble::rowid_to_column(X_test, "ID")
subject_train <-tibble::rowid_to_column(subject_train,"ID")
subject_test  <-tibble::rowid_to_column(subject_test,"ID")

# 4. join all train dataframes, and then the test dataframes
train_d <-join_all(list(subject_train,y_train,X_train),by="ID")
test_d  <-join_all(list(subject_test, y_test, X_test ),by="ID") # the 'by="ID" here is not necessary

 
# 5. use rbind to bind the test dat and the train_data. 

  # Option 1 (not chosen)- add a column split that will tell train\test
  # train_d$split<-"train"
  # test_d$split <-"test"

  # Option 2: differentiate by the ID. 
test_d$ID<-test_d$ID+max(train_d$ID)
data_f<-rbind(train_d,test_d)

# 6. Select only the relevant columns
data_f<-data_f[,c(1,2,3,grep("mean\\(\\)|std\\(\\)",features_list$features)+3)]

# now create a column - activities that will hold the name of the activities
# this will be done by merging with the activity_labels dataset.

data_f<-merge(activity_labels,data_f,by.x = "activitylabel",by.y = "activitylabel")

# get rid of variable activitylabel - it is no longer necessary:
data_f<-data_f[,-1]

# clean up variables no longer in use
rm(list = c("activity_labels","features_list","subject_test","subject_train","test_d","train_d"))
rm(list = c("X_test","X_train","y_test","y_train"))
  
# get mean values 
#   aggregate - perform mean on each measurements, for each activity and each subject

data_ag<-aggregate(data_f[,4:length(names(data_f))],list(activity=data_f$activity,subject=data_f$subject),mean)

# save the data set as "data5.txt"
# write.table(data_ag,"data5.txt", row.name=FALSE)

# to read this dataframe need to type:
# read.table("data5.txt",header =TRUE)

