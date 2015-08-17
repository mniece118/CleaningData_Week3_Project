==================================================================
Coursera Week 3 Course Project - Getting and Cleaning Data
==================================================================
This project used downloaded data from the following site:

	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This data was extracted and modified to produce a clean set of data for analysis.


Data modifications to the original files are the following (found in run_analysis.R):
======================================
 - merge subject_test.txt, y_test.txt, x_test.txt to produce the test data set
 - merge subject_train.txt, y_train.txt, x_train.txt to produce the train data set
 - combine the test data set and train data set to produce a complete sample data set
 - add headers to the columns including:
          - "Subject_ID" to represent the subject* data
          - "Activity" to represent the y_* data
          - data from features.txt was used for the remaining headers
 - delete the duplicated columns
 - extract only Subject_ID, Activity, mean(), and std() columns
 - update the names of the Activities based on activity_labels.txt
 - collapse the data into an average value for each Subject_ID + Activity
 - write the tidy dataset to tidy_dataset.txt


Reading the Tidy Dataset
=========================
 - to read the Tidy Dataset, please use the following code:

 data <- read.table("tidy_dataset.txt", header = TRUE);
 data


Notes: 
======
 - packages "dplyr", "reshape2", and "tidyr" were used in run_analysis.R
 - "mydataset" contains the data based on steps 1 - 4 in the Course Project
 - "tidyData" contains the data based on step 5 in the Course Project
For more information about this dataset contact: m_niece@hotmail.com
