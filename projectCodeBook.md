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

##Creating the tidy datafile

###Guide to create the tidy data file

To create the data set:

1. Donwload the dataset ZIP file, if not already available, from 
[here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

2. Obtain the 
[run_analysis.R script](https://github.com/GitAlexGit/tidyDataProjectRepo/blob/master/run_analysis.R) 

3. Place the data set ZIP file and the run_analysis.R script in the same directory. 

4. Run the script. The new tidy data set will be generated in the same directory,
named "finalAverageTidy.txt"

Please refer to the 
[README](https://github.com/GitAlexGit/tidyDataProjectRepo/blob/master/README.md) 
for information on prerequisites

###Cleaning of the data
The script collates the train and test data from the provided raw dataset, renames
variables to more readable forms, keeps the variables relevant to mean and 
standard deviation, collates the subject and (meaningfully-named) activities
and then proceeds to calculate the means for all variables for each 
subject and activity.

A detailed description of the process is presented in the 
[README](https://github.com/GitAlexGit/tidyDataProjectRepo/blob/master/README.md) 


##Description of the variables in the finalAverageTidy.txt file
* **Dimensions:** it's a 180 x 81 dataset
* **Fixed variables:** The "subject" and "activity" variables are fixed over the 
dataset, i.e., they are non-experimental. The dataset is fully crossed, containing
all combinations of subjects and activities. All 30 subjects performed all 6 
activities resulting in 180 rows of data. The values of the activities are 
* **Non-fixed Variables:**  The 79 variables are the means per subject and 
activity of all variables from the original set 
* **Naming:** 
    * columns: column names were altered from the original dataset, in order to
    derive a more human-readable strings. The processing was automated: 
        * A substitution matrix was used for substring substrings. For example, 
        substring "Gyro" was substituted to "gyroscope"
        * parentheses, spaces and dashes ("-"") where dropped. 
        * word separation was accomplished via underscores ("_")
        * where semanticaly important, double underscores ("__") were used as 
        separators. This was the case in the places where dashes were previously 
        used, for example. 
    * variables: the activity numbers were substituted by the corresponding 
    descriptive strings. 


General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)
```{r}
head(aa)
```


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

###Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.

Some information on the variable including:
 - Class of the variable
 - Unique values/levels of the variable
 - Unit of measurement (if no unit of measurement list this as well)
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels). 

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

####Notes on variable 1:
If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.

##Sources
Sources you used if any, otherise leave out.

##Annex
If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)