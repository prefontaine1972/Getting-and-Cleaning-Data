#CodeBook
The script run_analysis.R is described here and it fulfils the 5 goals of the course project (as described in the README.md file).

The code will be briefly outlined here:
*similar data was merged using the rbind() function. 
*those columns with the mean and standard deviation measures are taken from the dataset. After extracting these columns, they are given names found from the features.txt file.
*as activity data is described from 1-6, the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
*on the whole dataset, those columns with vague column names are corrected.
*finally, a new dataset is created with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called averages_data.txt, and uploaded to this repository.

#Variables used in the R code
*x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
*x_data, y_data and subject_data merge the previous datasets to further analysis.
*features contains the correct names for the x_data dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data.
*a similar approach is taken with activity names through the activities variable.
*all_data merges x_data, y_data and subject_data in a big dataset.
*lastly, final_tidy_data contains the relevant averages which will be later stored in a .txt file. ddply() from the plyr package is used to apply colMeans() and ease the development.