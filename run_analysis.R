# Coursera - Getting and Cleaning Data 
# Course Project

# Prefontaine 1972

# The purpose of this R code will be outlined in 5 steps.  Further documentation will be found
# in the README.md and CodeBook.md files.  This R code assumes that the user has already 
# downloaded the UCI HAR Dataset and is using that as his/her working directory and has 
# installed all the required packages.

library(plyr)

# Step 1: Merges the training and the test sets to create one large data set.

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Creates x, y, and subject_data data sets.
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# Step 2: Extracts only the measurements on the mean and standard deviation 
# for each measurement.

features <- read.table("features.txt")

# Get only columns with mean() or std() in their names.
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# Subset the desired columns and correct the column names.
x_data <- x_data[, mean_and_std_features]
names(x_data) <- features[mean_and_std_features, 2]

# Step 3: Uses descriptive activity names to name the activities in the data set.
# The 6 activities are listed in the the activity_labels.txt file provided in the UCI HAR
# Dataset.

activities <- read.table("activity_labels.txt")

# Update values with correct activity names.
y_data[, 1] <- activities[y_data[, 1], 2]

# Correct column name.
names(y_data) <- "activity"

# Step 4: Appropriately labels the data set with descriptive variable names.

# Correct column name.
names(subject_data) <- "subject"

# Bind all the data in a single data set.
all_data <- cbind(x_data, y_data, subject_data)

# Step 5: From the data set in step 4, creates a second, independent tidy
# data set with the average of each variable for each activity and each subject.

averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(final_tidy_data, "final_tidy_data.txt", row.name=FALSE)
