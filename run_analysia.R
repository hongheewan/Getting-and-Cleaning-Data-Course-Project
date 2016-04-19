library(dplyr)

# 1) Reading and merging the data set of test and training 
  zipfile<- unzip("getdata-projectfiles-UCI HAR Dataset.zip")
  print(zipfile)
  
  activity<- read.table("./UCI HAR Dataset/activity_labels.txt")
  feature<- read.table("./UCI HAR Dataset/features.txt")
  
  x_test<- read.table("./UCI HAR Dataset/test/X_test.txt")
  x_train<- read.table("./UCI HAR Dataset/train/X_train.txt")
  
  y_test<- read.table("./UCI HAR Dataset/test/Y_test.txt")
  y_train<- read.table("./UCI HAR Dataset/train/Y_train.txt")
  
  subject_test<- read.table("./UCI HAR Dataset/test/subject_test.txt")
  subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
  
  data_x<- rbind(x_train, x_test)
  names(data_x)<- feature$V2
  
  data_y<- rbind(y_train, y_test)
  data_subject<-rbind(subject_train, subject_test)
  
  colnames(data_y)<- "Activity"
  colnames(data_subject)<- "Subject"
  
  data_ysub<- cbind(data_y, data_subject)
  data_all<- cbind(data_ysub, data_x)

# 2) Extracting the measurement with mean and standard deviation for each
# measurement
  featureName<- feature[grep(".mean\\(\\).|.std\\(\\).", feature$V2),2]
  featureName<- as.character(featureName)
  select_col<- c("Subject", "Activity", featureName)
  
  data_meanstd<-subset.data.frame(data_all, select = select_col )

# 3) Uses descriptive activity names to name the activities in the data set
  data_meanstd$Activity<- as.factor(data_meanstd$Activity)
  levels(data_meanstd$Activity)<- activity$V2

# 4) Appropriately labels the data set with descriptive variable names
#  * prefix t is replaced by time
#  * prefix f is replaced by frequency
#  * Acc is replaced by Accelerometer
#  * Gyro is replaced by Gyroscope
#  * Mag is replaced by Magnitude
#  * BodyBody is replaced by Body

  names(data_meanstd) = gsub("^t","time", names(data_meanstd))
  names(data_meanstd) = gsub("^f", "frequency", names(data_meanstd))
  names(data_meanstd) = gsub("Acc", "Accelerometer", names(data_meanstd))
  names(data_meanstd) = gsub("Gyro", "Gyroscope", names(data_meanstd))
  names(data_meanstd) = gsub("Mag", "Magnitude", names(data_meanstd))
  names(data_meanstd) = gsub("BodyBody", "Body", names(data_meanstd))

# 5) A new data set with the average of each variable for activity and each subject
  aggdata<- aggregate(. ~ Subject + Activity, data = data_meanstd, mean)
  aggdata<- tbl_df(aggdata)
  aggdata<- arrange(aggdata,Subject, Activity)
  write.table(aggdata, file ="./result.txt", quote = FALSE)



