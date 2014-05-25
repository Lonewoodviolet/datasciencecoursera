
## Suhkyung Kim
## Getting and Cleaning Data: Assignment 1 week 3


setwd("/Users/LadyWinterbud/Downloads/UCI HAR Dataset/test")
subject_test= read.table("subject_test.txt")
X_test= read.table("X_test.txt")
y_test= read.table("y_test.txt")

if(getwd()=="/Users/LadyWinterbud/Downloads/UCI HAR Dataset/test"){
        setwd("/Users/LadyWinterbud/Downloads/UCI HAR Dataset/train")
}

subject_train= read.table("subject_train.txt")
X_train= read.table("X_train.txt")
y_train= read.table("y_train.txt")

sbj= rbind(subject_test,subject_train)
activity= rbind(y_test,y_train)
X= rbind(X_test, X_train)
X = X[, c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228,240:241,253:254,266:271,345:350,424:426,503:504,516:517,529:530,542:543)]

colnames(sbj)=c("sbj")
colnames(activity)=c("activity")
colnames(X)= c("tBodyAcc-meanX","tBodyAcc-meanY", 
                     "tBodyAcc-meanZ","tBodyAcc-stdX","tBodyAcc-stdY", 
                     "tBodyAcc-stdZ", "tGravityAcc-meanX","tGravityAcc-meanY", 
                     "tGravityAcc-meanZ","tGravityAcc-stdX","tGravityAcc-stdY",
                     "tGravityAcc-stdZ","tBodyAccJerk-meanX","tBodyAccJerk-meanY",
                     "tBodyAccJerk-meanZ","tBodyAccJerk-stdX","tBodyAccJerk-stdY",
                     "tBodyAccJerk-stdZ","tBodyGyro-meanX","tBodyGyro-meanY",
                     "tBodyGyro-meanZ", "tBodyGyro-stdX", "tBodyGyro-stdY",
                     "tBodyGyro-stdZ", "tBodyGyroJerk-meanX", "tBodyGyroJerk-meanY",
                     "tBodyGyroJerk-meanZ","tBodyGyroJerk-stdX","tBodyGyroJerk-stdY",
                     "tBodyGyroJerk-stdZ", "tBodyAccMag-mean","tBodyAccMag-std",
                     "tGravityAccMag-mean","tGravityAccMag-std","tBodyAccJerkMag-mean",
                     "tBodyAccJerkMag-std", "tBodyGyroMag-mean","tBodyGyroMag-std",
                     "tBodyGyroJerkMag-mean", "tBodyGyroJerkMag-std", "fBodyAcc-meanX",
                     "fBodyAcc-meanY","fBodyAcc-meanZ","fBodyAcc-stdX","fBodyAcc-stdY",
                     "fBodyAcc-stdZ","fBodyAccJerk-meanX","fBodyAccJerk-meanY",
                     "fBodyAccJerk-meanZ","fBodyAccJerk-stdX","fBodyAccJerk-stdY",
                     "fBodyAccJerk-stdZ","fBodyGyro-meanX","fBodyGyro-meanY",
                     "fBodyGyro-meanZ","fBodyAccMag-mean","fBodyAccMag-std",
                     "fBodyBodyAccJerkMag-mean","fBodyBodyAccJerkMag-std",
                     "fBodyBodyGyroMag-mean","fBodyBodyGyroMag-std",
                     "fBodyBodyGyroJerkMag-mean","fBodyBodyGyroJerkMag-std")

test.list = list(sbj,activity,X)
test.set = data.frame(test.list)

test.set$activity = mapvalues(test.set$activity, c("1","2","3","4","5","6"), 
               c("Walking","Walking_Upstairs","Walking_Downstairs",
                 "Sitting","Standing","Laying"))

test.set2 <-melt(test.set, id=c("sbj", "activity"))
test.set2 <-dcast(test.set2, sbj + activity ~ variable, fun.aggregate=mean)






