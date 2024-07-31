# Human Activity Recognition Using Smartphones - Data Cleaning Project

## Author
Giovanni Medola Ribeiro

## Course
Coursera Data Science Specialization by Johns Hopkins University

## Project Overview

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The project involves data collected from the accelerometers of the Samsung Galaxy S smartphone. This project is part of the Coursera Data Science Specialization by Johns Hopkins University.

## Data Source

The data for this project was obtained from the UCI Machine Learning Repository: [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### Downloaded Dataset

[Dataset Download Link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Project Components

1. **Tidy Data Set**: A cleaned and tidy data set created from the original data.
2. **GitHub Repository**: Contains the script used for performing the analysis.
3. **Code Book**: Describes the variables, the data, and any transformations or work performed to clean up the data.
4. **README**: Explains how all of the scripts work and how they are connected.

## Repository Contents

- `README.md`: This file, which provides an overview of the project.
- `run_analysis.R`: R script that performs the data cleaning and transformation.
- `CodeBook.md`: Code book that describes the variables and the transformations applied to the data.

## Analysis Script

The R script `run_analysis.R` performs the following steps:

1. **Merges the training and the test sets** to create one data set.
2. **Extracts only the measurements on the mean and standard deviation** for each measurement.
3. **Uses descriptive activity names** to name the activities in the data set.
4. **Appropriately labels the data set with descriptive variable names**.
5. **Creates a second, independent tidy data set** with the average of each variable for each activity and each subject.

### How to Run the Script

1. **Download the dataset** from the provided link.
2. **Unzip the dataset** into your working directory.
3. **Place the `run_analysis.R` script** in the directory containing the unzipped data files.
4. **Set your working directory** in R to the directory containing the data and the script.
5. **Run the script** using the following command in R:

   ```R
   source("run_analysis.R")
