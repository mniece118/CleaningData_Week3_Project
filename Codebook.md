==================================================================
Coursera Week 3 Course Project - Getting and Cleaning Data
Version 1.0
==================================================================
The experiments have been carried out with a group of 30 volunteers within an age 

bracket of 19-48 years. Each person performed six activities (Walking, Walking 

Upstairs, Walking Downstairs, Sitting, Standing, Laying) wearing a smartphone 

(Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 

we captured 3-axial linear acceleration and 3-axial angular velocity at a constant 

rate of 50Hz. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying 

noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% 

overlap (128 readings/window). The sensor acceleration signal, which has 

gravitational and body motion components, was separated using a Butterworth low-

pass filter into body acceleration and gravity. The gravitational force is assumed 

to have only low frequency components, therefore a filter with 0.3 Hz cutoff 

frequency was used. From each window, a vector of features was obtained by 

calculating variables from the time and frequency domain.

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the 

estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


The dataset includes the following variables and transformations:
=========================================
 - fileURL: used to temporarily store the document's URL
 - dateDownloaded: marks the date the file was downloaded to the user's machine
 - test_subject: a temporary table used to read "subject_test.txt"
 - test_labels: a temporary table used to read "y_test.txt"
 - test_data: a temporary table used to read "x_test.txt"
 - test_full: a temporary data frame used to combine the test dataset
 - train_subject: a temporary table used to read "subject_train.txt"
 - train_labels: a temporary table used to read "y_train.txt"
 - train_data: a temporary table used to read "x_train.txt"
 - train_full: a temporary data frame used to combine the train dataset
 - features_raw: a temporary table used to read "features.txt"
 - features: a transformation of features_raw to change the titles to a vector
 - mydataset_titles: the titles from features with the addition of Subject_ID and 

Activities
 - mydataset: a full dataset combining test_full with train_full and headers 

defined. Transformation applied to update the Activity descriptions and remove 

column duplications. Sort based on Subject_ID, then Activity.
 - tidyData: mydataset transformed to take the mean of all values based on 

Subject_ID + Activity. Sort based on Subject_ID, then Activity.

The dataset includes the following files:
=========================================

- 'README.txt'
- 'run_analysis.R': a script used to collect, extract, and clean the raw data to 

create a presentable format
- 'tidy_dataset.txt': a tidy dataset output of the raw data

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 

3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' 

to denote time) were captured at a constant rate of 50 Hz. Then they were filtered 

using a median filter and a 3rd order low pass Butterworth filter with a corner 

frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then 

separated into body and gravity acceleration signals (tBodyAcc-XYZ and 

tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency 

of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in 

time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the 

magnitude of these three-dimensional signals were calculated using the Euclidean 

norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, 

tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals 

producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 

fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain 

signals). 

These signals were used to estimate variables of the feature vector for each 

pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

 - tBodyAcc-XYZ
 - tGravityAcc-XYZ
 - tBodyAccJerk-XYZ
 - tBodyGyro-XYZ
 - tBodyGyroJerk-XYZ
 - tBodyAccMag
 - tGravityAccMag
 - tBodyAccJerkMag
 - tBodyGyroMag
 - tBodyGyroJerkMag
 - fBodyAcc-XYZ
 - fBodyAccJerk-XYZ
 - fBodyGyro-XYZ
 - fBodyAccMag
 - fBodyAccJerkMag
 - fBodyGyroMag
 - fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

 - mean(): Mean value
 - std(): Standard deviation

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
