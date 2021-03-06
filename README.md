# codewear
Getting and Cleaning a data set for wearable computing

This file walks you through the steps for GETTING AND CLEANING A DATASET.


	Data Source

Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws


	Data Description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


	Attribute Information

For each record in the dataset it is provided: 
	- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.   
	- Triaxial Angular velocity from the gyroscope.   
	- A 561-feature vector with time and frequency domain variables.   
	- Its activity label.   
	- An identifier of the subject who carried out the experiment.  


	Files

The source of the original dataset is   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The files in this repository contain the information needed in order to create a tidy data set, meant to manage attributes in the area of wearable computing:  
    - 'Readme.md' - current file   
    - 'CodeBook.md' - description of variables  
    - 'run_analysis.R' - the R code for getting and cleaning the dataset  
	

	Purpose of code

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

This set of steps should validate the ability to prepare tidy data that can be used for later analysis.


	Prerequisites		
	
The run_analysis.R file should be placed in the UCI HAR Dataset folder (which you will get after unzipping the original data downloaded from link above). 
To run the code without errors, the following files/folders must remain at all times in the folder:  
	- 'features_info.txt': Shows information about the variables used on the feature vector.  
	- 'features.txt': List of all features.  
	- 'activity_labels.txt': Links the class labels with their activity name.  
	- 'train/X_train.txt': Training set.  
	- 'train/y_train.txt': Training labels.  
	- 'test/X_test.txt': Test set.  
	- 'test/y_test.txt': Test labels.  
	*The following files are available for the train and test data. Their descriptions are equivalent.   
	- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.   
	- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.   
	- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.   
	- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.   

The libraries needed to run the code should be installed and loaded in the R environment.
Before running the code you should change directory to the UCI HAR Dataset folder.


	Reading the code

1. Read and combine the data from the traininig and test files: X_train.txt, y_train.txt, subject_train.txt, X_test.txt, y_test.txt, subject_test.txt
2. Read and filter the data from features.txt to select only those which are means or standard deviations. Set the features as column names for the data.
3. Read the data from activity_label.txt and replace the activity ids from data with the activity label associated.
4. Save all the tidy data with clear column names.
5. Create a new data set by aggregating the mean for each activity and subject.

All the variables need to better understand the code are in the CodeBook.md		
		
	Output	
	
After running the code you should expect to see, in the working directory, 2 files:  
	- dt_tidy_avg.txt  
	- dt_tidy_avg.csv   
		

