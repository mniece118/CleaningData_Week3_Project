## Pre-condition Preparation Steps
##    - install dplyr
##    - download and unzip the project files
##    - set date of download
## -----------------------------------------------------------------------
## install dplyr, reshape2, tidy packages
install.packages("dplyr")
install.packages("reshape2")
install.packages("tidyr")
library(reshape2)
library(tidyr)
library(dplyr)

## download and unzip the project files
if(!file.exists("project_data")){
  dir.create("project_data")
}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./project_data/data.zip")
rm(fileURL)
unzip("./project_data/data.zip")

## set date of download
dateDownloaded <- date()
## -----------------------------------------------------------------------


## Dataset Initialization
##    - read the test dataset with labels
##    - read the train dataset with labels
##    - appropriately label the data set with descriptive variable names
##    - merge the test and train into "mydataset" with labels
## -----------------------------------------------------------------------
## read the test dataset with labels
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test_labels <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_full <- cbind(test_subject, test_labels, test_data)
rm(test_subject)
rm(test_labels)
rm(test_data)

## read the train dataset with labels
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train_labels <- read.table("./UCI HAR Dataset/train/y_train.txt")
train_data <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_full <- cbind(train_subject, train_labels, train_data)
rm(train_subject)
rm(train_labels)
rm(train_data)

## appropriately label the data set with descriptive variable names
features_raw <- read.table("./UCI HAR Dataset/features.txt")
features <- t(features_raw[2])
mydataset_titles <- c("Subject_ID", "Activity", features)
rm(features_raw)
rm(features)

## merge the test and train into "mydataset" with headers
mydataset <- rbind(test_full, train_full)
colnames(mydataset) <- mydataset_titles
rm(test_full)
rm(train_full)
rm(mydataset_titles)
## ------------------------------------------------------------------------


## Clean Dataset
##    - remove duplicated columns
##    - extract the activities, measurements on the mean, and standard deviation for each measurement
##    - add descriptive activity names to the activities in the data set
##    - sort the data based on Subject_ID, then Activity
## ------------------------------------------------------------------------
mydataset <- mydataset[, !duplicated(colnames(mydataset))]
mydataset <- select(mydataset, Subject_ID, Activity, contains("mean()"), contains("std()"))
mydataset$Activity <- factor(mydataset$Activity, levels=c("1", "2", "3", "4", "5", "6"),
                               labels = c("Walking","Walking Upstairs","Walking Downstairs","Sitting","Standing","Laying"))
mydataset <- arrange(mydataset, Subject_ID,Activity)
## ------------------------------------------------------------------------


## Produce Tidy Dataset for Evaluation
##    - use the Subject_ID and Activity as the ID
##    - calculate the mean for each column based on the unique ID
##    - separate the Subject_ID and Activity to produce a tidy dataset
##    - write the dataset results to tidy_dataset.txt
## ------------------------------------------------------------------------
tidyData <- mutate(mydataset, ID = paste(Subject_ID, Activity, sep = "_"))
tidyData <- aggregate(x = tidyData[, 3:68], by = list(ID = tidyData$ID), FUN = "mean", na.rm = T)
tidyData <- separate(tidyData, ID, c("Subject_ID","Activity"), extra = "merge")
tidyData <- arrange(tidyData, as.numeric(Subject_ID), Activity)
write.table(tidyData, "tidy_dataset.txt", sep="\t", row.name = FALSE)
## ------------------------------------------------------------------------
