---
title: "README"
author: "Ravi Kumar"
date: "October 9, 2016"
output: html_document
---
### How Script Works

%dplyr% library has been used throughout the code.

#### Combining Test and Train Data and Naming each column

First all train and test data has been combined row wise for all x, y i.e. Activities and sub i.e. subject into data fame called Data. Then a Variable name vector was created with Subject, Activity and features as its element. Column name of Data was changed using Variable name vector. 

#### Selecting only varible with mean and Standard deviation
%grep% method was used to find vector with mean and standard deviation variables and then both were combined with Subject and Activity to form vector of all required variable. Then it was used to get data frame with requied variable using match function
#### Labeling Activity column
Activity column was changed to factors and lebels function was used to label the Activity column
#### Summarise table as mean of each variable grouped by Subject and Activity
Activity column was also changed to factors and then group by function was used to group the data frame by Subject and Activity. Then summarise each fuction used to get mean of each column grouped by Subject and Activity.

### Code Book

train_x ## read train features data
test_x ## read test features data
train_y ## Read Activity for train
test_y  ## Read Activity for test
train_sub ## Subject for train
test_sub  ## Subject for test
data_x ## combine x data of both train and test
data_y ## combine y i.e. activity data of both train and test
data_sub## combine subject data for both test and train 
Data ## Data frame with Subject, Activity and features data 
features ## Read features
Var_names ## Variable names containing Subject and Activity in addition to features 
Var_mean ## Vector of name of Variables with mean in it 
Var_std ## Vector of name of Variables with Standard deviation in it
Var ## Vector of Subject, Activity and name of Variables with mean and standard deviation
Data_mean_std ## Data table with Subject, Activity and features with mean and standard deviation
activity_labels ## Activities labels
data1 ## Data_mean_std in data frame format of dplyr
group_by_sub_activity ## group the data by subject and activities
Mean_by_sub_activity ## summarise each column for each group


