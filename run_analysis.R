substrReplace <-function(x) {
        
        ##
        ## substitution vectors
        ## droping end spaces, parentheses, dashes
        ## replacing spaces with undersores, dashes with double underscores
        ## and also using double underscores to denote a space, "comma"
        fromsub<-c("^t", "^f", "-" , "Acc" , "Gyro", "-XYZ", "BodyBody","Body",
                   "Gravity", "Jerk", "Mag", "mean", "std", "Freq", "\\(\\)", 
                   "X$","Y$","Z$", " $" )
        tosub  <-c("time_", "frequency_domain_", "_", "accelerometer_", 
                   "gyroscope_", "3-axial_", "body_", "body_", "gravity_",
                   "jerk_","magnitude", "mean_", "standard_deviation_", 
                   "frequency_", "", "X_axis", "Y_axis", "Z_axis", "")
        
        sub1<-x
        for (i in 1:length(tosub)) {
                sub1<-gsub(fromsub[i], tosub[i],sub1)
        }
        ##
        ## drop the trailing "_"
        sub1<-gsub("_$", "", sub1)
        
        
        ##
        ## return
        sub1
}

library(dplyr)



##
## unzip expected file
unzip("getdata-projectfiles-UCI HAR Dataset.zip")


## 
## read the names of the columns for the X files
## then just keep the needed columns

xcolnamesTemp<- read.table("UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)

## the instructions say I keep all means and standard deviations
## according to the features_info.txt, these have the names mean and std in them
## so i can use substring matching (ignoring case)
## This gives me a logical vector I can use for subsetting the raw data
## match "-std" or "-mean"
## note: 
neededCols<-grep ("-std|-mean", xcolnamesTemp$V2)

##
## apply the change of names. Now needed columns are well-named
## and in a vector
xcolnames<-sapply(xcolnamesTemp[neededCols, 2],substrReplace )



##
## read the activity labels

activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)
names(activityLabels)<-c("activityN", "activity") #name the activities for easy access

##
## read test activities and train activities
tstrawact <- read.table("UCI HAR Dataset/test/y_test.txt", stringsAsFactors=FALSE)
trnrawact <- read.table("UCI HAR Dataset/train/y_train.txt", stringsAsFactors=FALSE)
names(tstrawact) <- "activityN"
names(trnrawact)<- "activityN"

## 
## read the subject data

##
## read in raw X_test data and X_Train data

tstrawx<-read.table("UCI HAR Dataset/test/X_test.txt",  stringsAsFactors=FALSE)
trnrawx<-read.table("UCI HAR Dataset/train/X_train.txt",  stringsAsFactors=FALSE)



##
## column-bind the activity data for each set
tstrawx <-cbind(tstrawx,tstrawact )
trnrawx <-cbind(trnrawx, trnrawact)

##
## column-bind the subject data for each set


##
## add the activity and subject columns to the "needed" set
## add one more item to the vector, and this is the last column number of the 
## two sets
neededCols<-c(neededCols, dim(tstrawx)[2])
xcolnames<-c(xcolnames, names(tstrawact))

##
## row-bind all data, subset it to the needed columns
## and finally name them 

allraw<-rbind(tstrawx, trnrawx)
allraw<-allraw[,neededCols]
names(allraw)<-xcolnames

##
## join and get nice names for the activity, instead of numbers
## and then drop the numeric column

joinedDF<-inner_join(allraw, activityLabels)
joinedDF<-joinedDF[,names(joinedDF) !="activityN"]

##
## read the subscribers and rowbind them
## then column bind them to the joined set

testsub <- read.table("UCI HAR Dataset/test/subject_test.txt", stringsAsFactors=FALSE)
trainsub <- read.table("UCI HAR Dataset/train/subject_train.txt", stringsAsFactors=FALSE)
subs<-rbind(testsub, trainsub)
names(subs)<-"subject"
joinedDF<-cbind(joinedDF, subs)

##
## Group by subject and activity
groupdf<-group_by(joinedDF, subject, activity)

##
## final set is calculating mean() over all variables.
finalDF<-summarize_each(groupdf, funs(mean))

##
## write to a csv
write.csv(finalDF, file="finalAverageTidy.csv", row.names=FALSE)