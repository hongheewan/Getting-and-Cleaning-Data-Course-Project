# Getting and Cleaning Data Course Project

The datasets that are used in this project as below:
  - features.txt  : Methods used to get the measurement
  - activity_labels.txt  : List of activity 
  - train/subject_train  : Subject who performed each of the activity during training
  - train/X_train   : Each row contains the measurement which is result of the subject performs the activity during training
  - train/y_train   : Each row is the activity which subject performed during training
  - test/subject_test   : Subject who performed each of the activity during testing
  - test/X_test   : Each row contains the measurement which is result of the subject performs the activity during testing
  - test/y_test   : Each row is the activity which subject performed during testing
  
Step 1:
  - Merge the X_train and X_test together to have the both measurement of activity in training and testing.
  - Merge the y_train and y_test together to have the both activity which performed by the subject.
  - Merge the subject_train and subject_test to have both the subject who performed the activity in training and testing.
  - Merge the above 3 data sets to form a single data set which each row has the measurements of the methods used for each activity performed by an subject.
  
Step 2:
  - Extract only the mean and standard deviation method in features.txt with searching the word 'mean'and 'std' for each method.
  - After getting the result, select those methods as the column from the data set in step 1.

Step 3:
  - Retrieve the label of activity for each activity in the data set in step 2 by referring to the activity_labels.txt

Step 4:
  - As the label of the columns in the data set in step 3 is less explanatory, label each of the column by replacing the word in the label as below:
      * prefix t is replaced by time
      * prefix f is replaced by frequency
      * Acc is replaced by Accelerometer
      * Gyro is replaced by Gyroscope
      * Mag is replaced by Magnitude
      * BodyBody is replaced by Body

Step 5:
  - Using the data set in step 4, get the average for each column of each activity of each subject.
