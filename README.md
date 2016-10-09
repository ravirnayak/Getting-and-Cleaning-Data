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



