## Code Book
### Raw Data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. This data has been Downloded in the local directory.
### Source Information
* The Training and Test Data Frame is created from the Raw Data.
* Training and Test Data is merged using rbind().
* From the merged Data Set extract the columns with the mean and standard deviation. After extracting these columns, they are given the correct names, taken from features.txt.
* Added Column For Activity and subject
* Take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
*Generate a new tidy dataset with all the average measures for each subject and activity type
* create the tidy.txt file using write.table().
### Variables
* x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
* TrainData is created from x_train,y_train and subject_train
* Similarly TestingData is created from x_test,y_test and subject_test.
* ColMeanStd has the columns with mean and standard deviation.
* Data is the constructed with the columns with mean and standard deviation.
* The Activity field is added to Data
* Finally, tidy contains the relevant averages which will be later stored in a tidy.txt file
