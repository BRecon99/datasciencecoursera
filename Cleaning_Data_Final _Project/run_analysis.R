setwd("C:/Users/giova/Documents/datasciencecoursera")

#Load Packages:

packages <- c("data.table", "reshape2")
sapply(packages, require, character.only=TRUE, quietly=TRUE)

# Load data and unzip:
#here we set a general directory and further we make partial calls inside the folders
path <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, file.path(path, "dataFiles.zip"))
unzip(zipfile = "dataFiles.zip")

#Load activity labels
#we use general folder on path and call folder/document inside it:
activityLabels <- fread(file.path(path, "UCI HAR Dataset/activity_labels.txt")
                        , col.names = c("labelnumber", "activityname"))
#load features
features <- fread(file.path(path, "UCI HAR Dataset/features.txt")
                  , col.names = c("labelindex", "featurename"))
#here we opened the documents and set col names that were before V1 and V2

#Extracts only the measurements on the mean and standard deviation for each measurement. 
#to do that we use grep to get only mean or sd on the col featurename.
wantedfeatures <- grep("(mean|std)\\(\\)", features[, featurename])
#on wanted features grep gives us a logical vector with the rows were mean or sd are true
#next we will use measurements to get a vector with the names of these features isntead of the rows they occur.
measurements <- features[wantedfeatures, featurename]
measurements <- gsub('[()]', '', measurements)
#after that we used gsub to ger rid of the () and replace them with nothing on that vector.

#to merge train and tests we firs load them

#load test, on text X wich is the data of the 66 measurements we chose (means or sd):
test <- fread(file.path(path, "UCI HAR Dataset/test/X_test.txt"))[, wantedfeatures, with=FALSE]
data.table::setnames(test, colnames(test), measurements)
#here we assigned the name of each measurement on that vector as a variable (col) of the test data.
#now we assign activities to the variables measured on Y test:
testactivity <- fread(file.path(path, "UCI HAR Dataset/test/Y_test.txt")
                        , col.names = c("activity"))
#this table has the activity lable (number) of the activities described in activity labels.
#now we load the subject_test that has the lables (numbers) each subject tested:
testsubject <- fread(file.path(path, "UCI HAR Dataset/test/subject_test.txt")
                     , col.names = c("subjectlable"))
#the test activities and the test subjects have the same dimentions, once the serve the same porpose.

#now that the three components are loaded and named we merge them into a table with 2947 obs and 68 variables.
#this table will contain as variables the 66 tests with their results as rows, plus the activitities and subjects
#these two will have the lables as their rows to identify the means and sd`s of the different activities and subjects:
testtable <- cbind(test, testactivity, testsubject)

#load train data sets:
#here we will do the same, train X has the means and sd`s, and the Y and subject thei cathegories:
train <- fread(file.path(path,"UCI HAR Dataset/train/X_train.txt"))[, wantedfeatures, with = FALSE]
data.table::setnames(train, colnames(train), measurements)
#now make the activity and subject tables that will be cols to the train table:
trainactivity <- fread(file.path(path, "UCI HAR Dataset/train/Y_train.txt")
                       , col.names = c("activity"))
trainsubject <- fread(file.path(path, "UCI HAR Dataset/train/subject_train.txt")
                      , col.names = c("subjectlable"))
#Merge all into a train table:
traintable <- cbind(train, trainactivity, trainsubject)

#now we can merge train and test into one big table.
#To do that we have to use something they have with the same lenth
#this is the number of cols, they have the same variables.
#but first we should find a way for them to differentiate between train and test:
testtable <- mutate(testtable, volunteer = "test")
traintable <- mutate(traintable, volunteer = "train")
fulltabble <- rbind(testtable, traintable)

#Now make sure you table "Uses descriptive activity names to name the activities in the data set".
#to do this we will replace each number of each activity with their name:
fulltabble[["activity"]] <- factor(fulltabble[, activity]
                                 , levels = activityLabels[["labelnumber"]]
                                 , labels = activityLabels[["activityname"]])

#Last step:
#"creates a second, independent tidy data set with the average of each variable for each activity and each subject."
#To do that we create a subset of full table and make cols with activity and subject:
fulltabble[["subjectlable"]] <- as.factor(fulltabble[, subjectlable])
#now we groub by subject, then activity and summarize each test with their mean relative to those two variables:
tidy_mean <- fulltabble %>%
  group_by(subjectlable, activity) %>%
  summarise(across(everything(), mean, na.rm = TRUE))
#now, as oriented we make a text file called tidy data with these changes on full table:
data.table::fwrite(x = tidy_mean, file = "tidyData.txt", quote = FALSE)
