# Code Book

## Project Overview

This project's purpose is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. This project involves data collected from the accelerometers of the Samsung Galaxy S smartphone. The data is linked from the course website and represents a comprehensive dataset on human activity recognition.

## Data Source

The data used in this project was obtained from the UCI Machine Learning Repository: [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### Downloaded Dataset

[Dataset Download Link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Script Overview

The R script `run_analysis.R` performs the following operations:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Variables

### Original Dataset Variables

The original dataset contains the following files:

- `features.txt`: List of all features.
- `activity_labels.txt`: Links the class labels with their activity name.
- `train/X_train.txt`: Training set.
- `train/y_train.txt`: Training labels.
- `test/X_test.txt`: Test set.
- `test/y_test.txt`: Test labels.
- `train/subject_train.txt`: Subject who performed the activity in the training set.
- `test/subject_test.txt`: Subject who performed the activity in the test set.

### Extracted Measurements

From the original dataset, we extracted measurements on the mean and standard deviation for each measurement. These variables include:

- `tBodyAcc-mean()-X`
- `tBodyAcc-mean()-Y`
- `tBodyAcc-mean()-Z`
- `tBodyAcc-std()-X`
- `tBodyAcc-std()-Y`
- `tBodyAcc-std()-Z`
- `tGravityAcc-mean()-X`
- `tGravityAcc-mean()-Y`
- `tGravityAcc-mean()-Z`
- `tGravityAcc-std()-X`
- `tGravityAcc-std()-Y`
- `tGravityAcc-std()-Z`
- ... and many others.

### Activity Labels

The activities in the dataset are labeled as follows:

- `1`: WALKING
- `2`: WALKING_UPSTAIRS
- `3`: WALKING_DOWNSTAIRS
- `4`: SITTING
- `5`: STANDING
- `6`: LAYING

### Data Transformations

The following transformations were performed on the data:

1. **Merging Datasets**: The training and test datasets were merged to create one data set using `rbind`.
   
2. **Extracting Mean and Standard Deviation**: Only the measurements on the mean and standard deviation for each measurement were extracted using `grep` to identify the relevant columns.

3. **Descriptive Activity Names**: The activity labels were applied to the dataset using the `factor` function to replace each activity ID in the merged data with their respective names.

4. **Labeling Data Set**: Descriptive variable names were applied to the dataset by renaming the columns with meaningful names (e.g., `tBodyAcc-mean()-X` to `TimeBodyAccelerationMeanX`).

5. **Creating Independent Tidy Data Set**: A second, independent tidy data set was created with the average of each variable for each activity and each subject using `reshape2` function `melt` and `dlpyr` functions `group` and `sumarize`, afterward a new txt file was created with the function `fwrite` on the `tidy_mean` dataset created.

## Final Data Set

The final tidy data set includes the average of each variable for each activity and each subject. It has the following columns:

- `subjectlabel`: Subject identifier (1 to 30).
- `activity`: Activity name (e.g., WALKING, SITTING).
- `TimeBodyAccelerationMeanX`: Average of TimeBodyAccelerationMeanX for each subject and activity.
- `TimeBodyAccelerationMeanY`: Average of TimeBodyAccelerationMeanY for each subject and activity.
- ... and so on for each extracted measurement.

## Instructions for Running the Script

To run the `run_analysis.R` script and generate the tidy data set:

1. Ensure you have the required data files from the UCI HAR Dataset.
2. Place the `run_analysis.R` script in the directory containing the unzipped data files.
3. Set your working directory to the directory containing the data and the script.
4. Run the script using the following command in R:

   ```R
   source("run_analysis.R")
