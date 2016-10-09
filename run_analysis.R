library(dplyr)

#### Download and Unzip the file

fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "Assignment_data.zip") ## download the file from the url
unzip("Assignment_data.zip", exdir = ".") ## Unzip it
setwd("UCI HAR Dataset/") ## set working directory

#### Combining Test and Train Data and Naming each column

train_x <- read.table("./train/X_train.txt", sep = "") ## read train x data
test_x <- read.table("./test/X_test.txt", sep = "" )## read test x data
train_y <- read.table("./train/y_train.txt", sep = "") #Read Activity for train
test_y <- read.table("./test/y_test.txt", sep = "") #Read Activity for test
train_sub <- read.table("./train/subject_train.txt", sep = "") #Subject for train
test_sub <- read.table("./test/subject_test.txt", sep = "") #Subject for test
data_x <-rbind(train_x,test_x)## combine x data of both train and test
data_y <-rbind(train_y,test_y)## combine y i.e. activity data of both train and test
data_sub<- rbind(train_sub, test_sub)## combine subject data for both test and train 
Data<- cbind(data_sub,data_y,data_x)## Combine Subject, Activity and x data 
features <- read.table("features.txt", sep = "") ## Read features
Var_names<- c("Subject","Activity", as.character(features$V2))## Add Subject and Activity in addition to features in Var_name
colnames(Data)<-Var_names #add variable names to data

#### Selecting only varible with mean and Standard deviation

Var_mean <- Var_names[grepl("mean",Var_names)]#Find Variable with mean in it 
Var_std <- Var_names[grepl("std",Var_names)]#Find Variable with Standard deviation in it
Var <- c("Subject","Activity", Var_mean, Var_std)# Variables of data table required
Data_mean_std <- Data[,match(Var,names(Data))]##Data with values of mean and standard deviation

#### Labeling Activity column

activity_labels <- read.table("./activity_labels.txt", sep = "")##Activities labels
Data_mean_std$Activity<-as.factor(Data_mean_std$Activity)## convert activity column as factors
levels(Data_mean_std$Activity)<-activity_labels$V2 ## leveled activity columns with factors

#### Summarise table as mean of each variable grouped by Subject and Activity

Data_mean_std$Subject <-as.factor(Data_mean_std$Subject)## convert subject as factors
data1 <- tbl_df(Data_mean_std)
group_by_sub_activity <- group_by(data1, Subject, Activity)## group the data by subject and activities
Mean_by_sub_activity<-summarise_each (group_by_sub_activity, funs = funs(mean))## summarise each column for each group
write.table(Mean_by_sub_activity, file = "Step5_table_data.txt")## Write step5 table into text file

