------
# Codebook 
##### _Title_: Codebook for tidy.data.txt - Week 4 Assignment
##### _Author_: Nilmini W
##### _Date_: 12 June 2017
-------

## Project Description
Data on activities of 30 volunteers was collected from Samsung Galaxy S II devices. 

## Study design and data processing
### Collection of the raw data
Data was collected on 30 people aged 19-48. Each participant performed 6 activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LYING and data from the Samsung Galaxy S II device on 3-axial linear acceleration and 3-axial angular velocity were captured.


### Notes on the original (raw) data 
The data is partitioned into two sets; data for 30% of the volunteers is in the "training" set, and data for 70% of the volunteers in the "test" set.

Further information on the data can be obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Creating the tidy datafile

### Guide to create the tidy data file

1. Set the working directory

2. Download the data (zipped) from the following site: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

3. Unzip the data

4. Explore the file structure: test data is in the "test" folder, training data is in the "train" folder. In each of these folders, there is a subject_ file which gives the subject id, X_ file which gives the data for each feature measured (i.e. movement data), and the y_ file which gives the activity (as a number). In the main directory text files are available which give labels to the activities (activity_labels), and labels to the features (features).

5. Use read.table to store each data file from the "train" and "test" folder

6. Use read.table to store the label files activity_labels and features

7. Create a dataframe for the test data and a dataframe for the train data

8. Label the variables with subject, activity, and the feature vector from step 6.

9. Activity 1: merge the training and test data using rbind

10. Activity 2: extract the mean and standard deviation data.

+ 10.1 Create a name vector from the output of 9.

+ 10.2 Using grep, create a vector locating all instances of mean() and sd()

+ 10.3 Subset the dataframe from 9, using the vector from 10.2, and making sure to include the "subject" and "activity" variables

+ 10.4 As 10.2 will also identify the meanFreq() variables, create another name vector from the output of 10.3, use grep to create a vector locating all instances of meanFreq, and subset the datafram from 10.3 using this vector

11. Activity 3: Use descriptive activity labels
Replace the activity variable as a factor variable using the activity_labels created in 6

12. Activity 4: Appropriately label data using descriptive variable names.

Extract a vector containing the names of the ouput from 11.
Perform the following transformations on the vector to make the variable names more descriptive:
+ change t to time
+ change f to frequency
+ change -mean() to _mean
+ change -std() to _std
+ change GravityAcc to GravityAcceleration
+ change Mag to Magnitude
+ change - to _

Apply this new vector to the names of the dataframe output of 11.

13. Create a tidy dataset which contains the means for each of the features variables, by subject and activity.
Use aggregate: subset the features columns, and use subject and activity in the list to aggregate by.
Use write.table to create a .txt document as the output.

## Description of the variables in the tidydata.txt file
The final tidy dataset has 180 observations and 60 variables.
The subject variable gives the subject id (serial number from 1-30)
The activity variable gives the 6 types of activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LYING
The remaining 58 variables give the mean of the mean and standard deviation of the various feature measurements for that subject and activity.
The features are various combinations of time and frequency of body acceleration, gravity acceleration, and body gyration; and jerk and maginitude 
_(example variable name: time_BodyAccelerationMagnitude_mean)_
