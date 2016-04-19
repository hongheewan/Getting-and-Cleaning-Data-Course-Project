# CodeBook of Getting and Cleaning Data Course Project

This codebook is to describe the variables, the data, and any transformations or work that you performed to clean up the data sets.

Step 1:
  - Unzip the file 'getdata-projectfiles-UCI HAR Dataset.zip' to the working directory.
  - variable 'activity' : Read the file of 'activity_labels.txt'
  - Variable 'feature' : Read the file of 'features.txt'.
  - Variable 'x_test' : Read the file of '/test/X_test.txt'.
  - Variable 'x_train' : Read the file of '/train/X_train.txt'.
  - Variable 'y_test' : Read the file of '/test/y_test.txt'.
  - Variable 'y_train' : Read the file of '/train/y_train.txt'.
  - Variable 'subject_test' : Read the file of '/test/subject_test.txt'.
  - Variable 'subject_train' : Read the file of /'train'subject_train.txt'.
  - Variable 'data_x': Merge the x_test and x_train by row with rbind().
  - Variable 'data_y' : Merge the y_test and y_train by row with rbind().
  - Variable 'data_subject' : Merge the subject_test and subject_train by row with rbind().
  - Variable 'data_ysub' : Merge the 'data_y' and 'data_subject' by column with cbind().
  - Variable 'data_all' : Merge the 'data_ysub' and 'data_x' by column with cbind() which results the merging of test and training data sets.
