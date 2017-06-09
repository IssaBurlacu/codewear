# change working directory to the UCI HAR Dataset unzipped folder
#setwd("E:/3.DA/courses/3.Getting and Cleaning Data/course4/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset")

#	1. Merges the training and the test sets to create one data set.

#get data from files
dt_X_train <- read.table("train/X_train.txt", header = FALSE)
dt_X_test <- read.table("test/X_test.txt", header = FALSE)
dt_y_train <- read.table("train/y_train.txt", header = FALSE)
dt_y_test <- read.table("test/y_test.txt", header = FALSE)
dt_subject_train <- read.table("train/subject_train.txt", header = FALSE)
dt_subject_test <- read.table("test/subject_test.txt", header = FALSE)

#combine train and test data
dt_X <- rbind(dt_X_train, dt_X_test)
dt_y <- rbind(dt_y_train, dt_y_test)
dt_subject <- rbind(dt_subject_train, dt_subject_test)


#	2. Extracts only the measurements on the mean and standard deviation for each measurement

features <- read.table("features.txt")
#get only features of the mean and standard deviation
features_mean_std <- grep("-mean\\(\\)|-std\\(\\)", features$V2) 
#get data for these features
dt_X <- dt_X[, features_mean_std] 
#set the apropriate feature names 
colnames(dt_X) <- gsub("\\(|\\)", "", (features[features_mean_std, 2]))


#	3. Uses descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")
dt_y[, 1] = activities[dt_y[, 1], 2]


#	4. Appropriately labels the data set with descriptive variable names

colnames(dt_subject) <- "Subject"
colnames(dt_y) <- "Activity"

# put together the clear columns
dt_tidy <- cbind(dt_subject, dt_y, dt_X)
#print(head(dt_tidy))


#	5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject

dt_tidy_avg <- aggregate(dt_tidy[, 3:dim(dt_tidy)[2]] ,list(dt_tidy$Subject, dt_tidy$Activity), mean)
#print(head(dt_tidy_avg))
colnames(dt_tidy_avg)[1] <- "Subject"
colnames(dt_tidy_avg)[2] <- "Activity"


# create file with average tidy data
write.csv(dt_tidy_avg, "./dt_tidy_avg.txt",row.names=F)

# create csv with average tidy data
write.csv(dt_tidy_avg, "./dt_tidy_avg.csv")
