rm(list=ls())

setwd("/Users/Nilmini/Dropbox/PhD/Coursework/JH Datascience/R programming/inputs/3-4")

## DOWNLOAD REQUIRED DATA
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(url,destfile = "./data.zip")
unzip("./data.zip",exdir="./data")

## EXPLORE FILE STRUCTURE
list.files("./data")
list.files("./data/UCI HAR Dataset")
list.files("./data/UCI HAR Dataset/test")
list.files("./data/UCI HAR Dataset/train")


## Read test files
testset <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
testlabel <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
testsubject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")


## Read train files
trainset <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
trainlabel <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
trainsubject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")


## Read feature labels
feature <- read.table("./data/UCI HAR Dataset/features.txt")
feature <- as.vector(feature[,2])

## Read activity labels
activitylabel <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
activitylabel <- as.vector(activitylabel[,2])


## Create test dataframe with labels
testdata <- data.frame(testsubject, testlabel, testset)
names(testdata) <- c('subject', 'activity', c(feature))

  #check
  addmargins(table(testdata$subject))
  addmargins(table(testdata$activity))
  str(testdata)

  
## Create train dataframe with labels
traindata <- data.frame(trainsubject, trainlabel, trainset)
names(traindata) <- c('subject', 'activity', c(feature))

  #check
  addmargins(table(traindata$subject))
  addmargins(table(traindata$activity))
  str(traindata)
  

  
## ACTIVITY 1: MERGE TRAINING AND TEST SETS TO CREATE ONE DATASET
data <- rbind(testdata,traindata)

## ACTIVITY 2: EXTRACTS ONLY MEAN AND STANDARD DEVIATION FOR EACH MEASUREMENT
names <- names(data)
meansd <- grep("mean()|std()",names)
datameansd <- data[,c(1,2,c(meansd))]
  
  # Remove meanFreq() variables
  names2 <- names(datameansd)
  meanfreq <- grep("meanFreq()",names2)
  data.msd <- datameansd[,-c(meanfreq)]
  names(data.msd)

## ACTIVITY 3: USE DESCRIPTIVE ACTIVITY NAMES
data.msd$activity <- factor(data.msd$activity,c(1:6),c(activitylabel))
  table(data.msd$activity)  #check
  
  
## ACTIVITY 4: APPROPRIATELY LABEL DATA USING DESCRIPTIVE VARIABLE NAMES
names <- names(data.msd)
newnames <- names
newnames <- gsub("^t","time_",newnames)
newnames <- gsub("^f","frequency_",newnames)
newnames <- gsub("-mean[[(][)]","_mean",newnames)
newnames <- gsub("-std[[(][)]","_std",newnames)
newnames <- gsub("GravityAcc","GravityAcceleration",newnames)
newnames <- gsub("BodyAcc","BodyAcceleration",newnames)
newnames <- gsub("Mag","Magnitude",newnames)
newnames <- gsub("-","_",newnames)
newnames

names(data.msd) <- newnames
  
  #check
  names(data.msd)

## ACTIVITY 5: TIDY DATASET
head(data.msd)
tidy.data <- aggregate(data.msd[,3:60],list(subject=data.msd$subject, activity=data.msd$activity), mean)
names(tidy.data)

write.table(tidy.data,"./tidydata.txt",row.name=FALSE,sep='\t')






  


  
  

  