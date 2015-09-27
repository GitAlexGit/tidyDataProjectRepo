---
title: "Coursera Getting and Cleaning Data Course Project Codebook"
author: "GitAlexGit"
date: "26.09.2015"
output:
  html_document:
    keep_md: yes
---

## Project Description
This project uses samsung mobile phone sensor data. 
The data relevant to means and standard deviations are collated, post processed 
and sumamrized to a new tidy data set.

##Study design and data processing

###Collection of the raw data
Raw data are made available by the UCI Machine Learning repository. Full
information of the data set can be found 
[here](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

From the original project:
```
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

```

##Creating the tidy datafile

###Guide to create the tidy data file

To create the data set:

1.  Donwload the dataset ZIP file, if not already available, from 
[here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

2.  Obtain the 
[run_analysis.R script](https://github.com/GitAlexGit/tidyDataProjectRepo/blob/master/run_analysis.R) 

3.  Place the data set ZIP file and the run_analysis.R script in the same directory. 

4.  Run the script. The new tidy data set will be generated in the same directory,
named **"finalAverageTidy.txt"**

Please refer to the 
[README](https://github.com/GitAlexGit/tidyDataProjectRepo/blob/master/README.md) 
for information on prerequisites

###Cleaning of the data
The script 

*  collates the train and test data from the provided raw dataset to form a 
single dataset with all data
*  renames the measured variables to more readable forms 
*  drops all variables from the original set not relevant to mean and 
standard deviation 
*  collates the subject and (meaningfully-named) activities (fixed) variables to 
the same set
*  finally calculates the means for all variables per each subject and activity 

A detailed description of the process is presented in the 
[README](https://github.com/GitAlexGit/tidyDataProjectRepo/blob/master/README.md) 


#Variables

##Short Description 
* **Dimensions:** The resulting dataset dimensions are 180 x 81
* **Fixed variables:** The "subject" and "activity" variables are fixed over the 
dataset, i.e., they are non-experimental. The dataset is fully crossed, containing
all combinations of subjects and activities. All 30 subjects performed all 6 
activities resulting in 180 rows of data. The values of the activities are 
* **Measured Variables:**  The 79 variables are the means per subject and 
activity of all variables from the original raw set which were representing
means and standard deviations (exact details of how the list of variables 
was derived can be found in the 
[README](https://github.com/GitAlexGit/tidyDataProjectRepo/blob/master/README.md) )


###Original Variables
The original, full measurements dataset description: 
```
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
```


From the above raw dataset, the following variables were chosen for processing.
They all represent means and stardard deviations

```
[1] "tBodyAcc-mean()-X"               "tBodyAcc-mean()-Y"               "tBodyAcc-mean()-Z"              
 [4] "tBodyAcc-std()-X"                "tBodyAcc-std()-Y"                "tBodyAcc-std()-Z"               
 [7] "tGravityAcc-mean()-X"            "tGravityAcc-mean()-Y"            "tGravityAcc-mean()-Z"           
[10] "tGravityAcc-std()-X"             "tGravityAcc-std()-Y"             "tGravityAcc-std()-Z"            
[13] "tBodyAccJerk-mean()-X"           "tBodyAccJerk-mean()-Y"           "tBodyAccJerk-mean()-Z"          
[16] "tBodyAccJerk-std()-X"            "tBodyAccJerk-std()-Y"            "tBodyAccJerk-std()-Z"           
[19] "tBodyGyro-mean()-X"              "tBodyGyro-mean()-Y"              "tBodyGyro-mean()-Z"             
[22] "tBodyGyro-std()-X"               "tBodyGyro-std()-Y"               "tBodyGyro-std()-Z"              
[25] "tBodyGyroJerk-mean()-X"          "tBodyGyroJerk-mean()-Y"          "tBodyGyroJerk-mean()-Z"         
[28] "tBodyGyroJerk-std()-X"           "tBodyGyroJerk-std()-Y"           "tBodyGyroJerk-std()-Z"          
[31] "tBodyAccMag-mean()"              "tBodyAccMag-std()"               "tGravityAccMag-mean()"          
[34] "tGravityAccMag-std()"            "tBodyAccJerkMag-mean()"          "tBodyAccJerkMag-std()"          
[37] "tBodyGyroMag-mean()"             "tBodyGyroMag-std()"              "tBodyGyroJerkMag-mean()"        
[40] "tBodyGyroJerkMag-std()"          "fBodyAcc-mean()-X"               "fBodyAcc-mean()-Y"              
[43] "fBodyAcc-mean()-Z"               "fBodyAcc-std()-X"                "fBodyAcc-std()-Y"               
[46] "fBodyAcc-std()-Z"                "fBodyAcc-meanFreq()-X"           "fBodyAcc-meanFreq()-Y"          
[49] "fBodyAcc-meanFreq()-Z"           "fBodyAccJerk-mean()-X"           "fBodyAccJerk-mean()-Y"          
[52] "fBodyAccJerk-mean()-Z"           "fBodyAccJerk-std()-X"            "fBodyAccJerk-std()-Y"           
[55] "fBodyAccJerk-std()-Z"            "fBodyAccJerk-meanFreq()-X"       "fBodyAccJerk-meanFreq()-Y"      
[58] "fBodyAccJerk-meanFreq()-Z"       "fBodyGyro-mean()-X"              "fBodyGyro-mean()-Y"             
[61] "fBodyGyro-mean()-Z"              "fBodyGyro-std()-X"               "fBodyGyro-std()-Y"              
[64] "fBodyGyro-std()-Z"               "fBodyGyro-meanFreq()-X"          "fBodyGyro-meanFreq()-Y"         
[67] "fBodyGyro-meanFreq()-Z"          "fBodyAccMag-mean()"              "fBodyAccMag-std()"              
[70] "fBodyAccMag-meanFreq()"          "fBodyBodyAccJerkMag-mean()"      "fBodyBodyAccJerkMag-std()"      
[73] "fBodyBodyAccJerkMag-meanFreq()"  "fBodyBodyGyroMag-mean()"         "fBodyBodyGyroMag-std()"         
[76] "fBodyBodyGyroMag-meanFreq()"     "fBodyBodyGyroJerkMag-mean()"     "fBodyBodyGyroJerkMag-std()"     
[79] "fBodyBodyGyroJerkMag-meanFreq()"
```

Ater adding the "subject" and "activity" variables, these 79 measurement 
variables were averaged by subject and activity. Each of the
79 corresponding columns of the resulting dataset represents, therefore, is the 
**mean** of the original, raw variable, summarized per subject and activity. 

###Fixed variables
- The "subject" variable takes values from the set [1:30] and corresponds
to the individuals who took part in the experiments
- the "activity" variable represents the 6 activities measured. The set of values is
 ```
 WALKING, 
 WALKING_UPSTAIRS, 
 WALKING_DOWNSTAIRS
 SITTING, 
 STANDING and
 LAYING.
```
The dataset is fully crossed, i.e., all subjects performed all activities. 

Note that in the original raw set the data from 70% of the subjects were
placed in a "training" set, and the rest in a test set. In the final analysis
all data was collated in a single set.

###Measured Variables

Descriptions of the original raw variables are presented in section
[Original Variables][], above

As explained above the final data is comprised of the  averages of the
chosen 79 variables. Since *all* of the final measured variables are 
averages, the names of the columns were not renamed to include the word "mean", 
this would add very little value

Further information for the measured variables:

- Variable class: all measured variables are numeric
- Unit of measurement: all measurements are normalized and bound between 
[-1, 1], therefore there is no unit of measurement
- Naming Scheme:  The original raw variables, as listed in 
the [Original Variables][] section were renamed to the below set. The meaning
of the name constituents was therefore preserved and the explanations presented
in the [Original Variables][] section apply

```
[1] "time_body_accelerometer__mean__X_axis"                                
 [2] "time_body_accelerometer__mean__Y_axis"                                
 [3] "time_body_accelerometer__mean__Z_axis"                                
 [4] "time_body_accelerometer__standard_deviation__X_axis"                  
 [5] "time_body_accelerometer__standard_deviation__Y_axis"                  
 [6] "time_body_accelerometer__standard_deviation__Z_axis"                  
 [7] "time_gravity_accelerometer__mean__X_axis"                             
 [8] "time_gravity_accelerometer__mean__Y_axis"                             
 [9] "time_gravity_accelerometer__mean__Z_axis"                             
[10] "time_gravity_accelerometer__standard_deviation__X_axis"               
[11] "time_gravity_accelerometer__standard_deviation__Y_axis"               
[12] "time_gravity_accelerometer__standard_deviation__Z_axis"               
[13] "time_body_accelerometer_jerk__mean__X_axis"                           
[14] "time_body_accelerometer_jerk__mean__Y_axis"                           
[15] "time_body_accelerometer_jerk__mean__Z_axis"                           
[16] "time_body_accelerometer_jerk__standard_deviation__X_axis"             
[17] "time_body_accelerometer_jerk__standard_deviation__Y_axis"             
[18] "time_body_accelerometer_jerk__standard_deviation__Z_axis"             
[19] "time_body_gyroscope__mean__X_axis"                                    
[20] "time_body_gyroscope__mean__Y_axis"                                    
[21] "time_body_gyroscope__mean__Z_axis"                                    
[22] "time_body_gyroscope__standard_deviation__X_axis"                      
[23] "time_body_gyroscope__standard_deviation__Y_axis"                      
[24] "time_body_gyroscope__standard_deviation__Z_axis"                      
[25] "time_body_gyroscope_jerk__mean__X_axis"                               
[26] "time_body_gyroscope_jerk__mean__Y_axis"                               
[27] "time_body_gyroscope_jerk__mean__Z_axis"                               
[28] "time_body_gyroscope_jerk__standard_deviation__X_axis"                 
[29] "time_body_gyroscope_jerk__standard_deviation__Y_axis"                 
[30] "time_body_gyroscope_jerk__standard_deviation__Z_axis"                 
[31] "time_body_accelerometer_magnitude_mean"                               
[32] "time_body_accelerometer_magnitude_standard_deviation"                 
[33] "time_gravity_accelerometer_magnitude_mean"                            
[34] "time_gravity_accelerometer_magnitude_standard_deviation"              
[35] "time_body_accelerometer_jerk_magnitude_mean"                          
[36] "time_body_accelerometer_jerk_magnitude_standard_deviation"            
[37] "time_body_gyroscope_magnitude_mean"                                   
[38] "time_body_gyroscope_magnitude_standard_deviation"                     
[39] "time_body_gyroscope_jerk_magnitude_mean"                              
[40] "time_body_gyroscope_jerk_magnitude_standard_deviation"                
[41] "frequency_domain_body_accelerometer__mean__X_axis"                    
[42] "frequency_domain_body_accelerometer__mean__Y_axis"                    
[43] "frequency_domain_body_accelerometer__mean__Z_axis"                    
[44] "frequency_domain_body_accelerometer__standard_deviation__X_axis"      
[45] "frequency_domain_body_accelerometer__standard_deviation__Y_axis"      
[46] "frequency_domain_body_accelerometer__standard_deviation__Z_axis"      
[47] "frequency_domain_body_accelerometer__mean_frequency__X_axis"          
[48] "frequency_domain_body_accelerometer__mean_frequency__Y_axis"          
[49] "frequency_domain_body_accelerometer__mean_frequency__Z_axis"          
[50] "frequency_domain_body_accelerometer_jerk__mean__X_axis"               
[51] "frequency_domain_body_accelerometer_jerk__mean__Y_axis"               
[52] "frequency_domain_body_accelerometer_jerk__mean__Z_axis"               
[53] "frequency_domain_body_accelerometer_jerk__standard_deviation__X_axis" 
[54] "frequency_domain_body_accelerometer_jerk__standard_deviation__Y_axis" 
[55] "frequency_domain_body_accelerometer_jerk__standard_deviation__Z_axis" 
[56] "frequency_domain_body_accelerometer_jerk__mean_frequency__X_axis"     
[57] "frequency_domain_body_accelerometer_jerk__mean_frequency__Y_axis"     
[58] "frequency_domain_body_accelerometer_jerk__mean_frequency__Z_axis"     
[59] "frequency_domain_body_gyroscope__mean__X_axis"                        
[60] "frequency_domain_body_gyroscope__mean__Y_axis"                        
[61] "frequency_domain_body_gyroscope__mean__Z_axis"                        
[62] "frequency_domain_body_gyroscope__standard_deviation__X_axis"          
[63] "frequency_domain_body_gyroscope__standard_deviation__Y_axis"          
[64] "frequency_domain_body_gyroscope__standard_deviation__Z_axis"          
[65] "frequency_domain_body_gyroscope__mean_frequency__X_axis"              
[66] "frequency_domain_body_gyroscope__mean_frequency__Y_axis"              
[67] "frequency_domain_body_gyroscope__mean_frequency__Z_axis"              
[68] "frequency_domain_body_accelerometer_magnitude_mean"                   
[69] "frequency_domain_body_accelerometer_magnitude_standard_deviation"     
[70] "frequency_domain_body_accelerometer_magnitude_mean_frequency"         
[71] "frequency_domain_body_accelerometer_jerk_magnitude_mean"              
[72] "frequency_domain_body_accelerometer_jerk_magnitude_standard_deviation"
[73] "frequency_domain_body_accelerometer_jerk_magnitude_mean_frequency"    
[74] "frequency_domain_body_gyroscope_magnitude_mean"                       
[75] "frequency_domain_body_gyroscope_magnitude_standard_deviation"         
[76] "frequency_domain_body_gyroscope_magnitude_mean_frequency"             
[77] "frequency_domain_body_gyroscope_jerk_magnitude_mean"                  
[78] "frequency_domain_body_gyroscope_jerk_magnitude_standard_deviation"    
[79] "frequency_domain_body_gyroscope_jerk_magnitude_mean_frequency"
```

#Acknowledgments
Ideas and general clarifications were obtained from the very helpful page from 
David Hood [Hood], one of the TCAs 

The template for the used Codebook was obtained from Joris Schut [Schut]

#References
-  [Hood] : Hood, David. 2015. “GETTING AND CLEANING THE ASSIGNMENT.” https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/.
-  [Schut] : Schut, Joris. 2015. “Codebook Template.” https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41.
