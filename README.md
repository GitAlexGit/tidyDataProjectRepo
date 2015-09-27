---
title: "Coursera Getting and Cleaning Data Course Project"
output: html_document
references:
- id: Wickham2014
  title: Tidy Data
  author:
  - family: Wickham
    given: Hadley
  container-title: The Journal of Statistical Software
  volume: 59
  URL: 'http://www.jstatsoft.org/article/view/v059i10'
  DOI: 10.18637/jss.v059.i10
  issue: 10
  publisher: The Foundation for Open Access Statistics
  type: article-journal
  issued:
    year: 2014
  
- id: codebooktemplate
  title: Codebook Template
  author:
  - family: Schut
    given: Joris
  URL: 'https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41'
  type: webpage
  issued:
    year: 2015
    
- id: bloke
  title: GETTING AND CLEANING THE ASSIGNMENT
  author:
  - family: Hood
    given: David
  URL: 'https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/'
  type: webpage
  issued:
    year: 2015    
---


# General
This README describes the tools, process, design decisions and justifications
for the processing and generation of a tidy data set. 

The [raw experimental data](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
 represent  sensor measurements from Samsung Galaxy smartphones, for 
 6 different types of activities, performed by 30 individuals. These are 
 processed and summarized by activity and individual

More about the data can be found in the [accompanying codebook](https://github.com/GitAlexGit/tidyDataProjectRepo/blob/master/projectCodeBook.md)

## Objective
The end objective is to subset the original raw data set, keeping only data 
variables representing to the mean and standard deviation.
The end objective is to provide a tidy dataset containing the means of the
variables of interest per activity and individual

# Technical
## Prerequisites
The processing of the data is performed in R. 
A single R script, "run_analysis.R"
is provided for this purpose. Furthermore, the 
[dplyr package](https://cran.rstudio.com/web/packages/dplyr/)
is used extensively.
The input zip file should be provided in the same directory as the R script

## Inputs
The single zip 
[file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
should be provided.

## Outputs
A single CSV file, representing a tidy dataset as per the principles 
outlined in [@Wickham2014]

The file can be loaded and viewed using the following code:
```
finaldf<-read.csv("finalAverageTidy.csv", stringsAsFactors = FALSE)
View(finaldf)
```

# Design
## Assumptions, decisions, strategy and justification
Processing of the data was based on a series of decision points. These are 
presented and justified below

* **Choice of variables:** The variables which represented average (mean) and 
standard deviations of measurements were chosen for processing, all others were 
dropped. The included variables including the strings "mean" and "std" in their
name (e.g. tBodyAcc-mean()-X), as well as variables indicating a mean
frequency (e.g., fBodyGyro-meanFreq()-Z), since the latter also 
indicate an averaged measurement (mean frequency). Means included in 
angle measurements were dropped (e.g., angle(Z,gravityMean)
since the measurement is not a mean or standard deviation but rather an angle
measurement

* **tall vs wide:** The format of choice was "wide", i.e., the original dataset
arrangement was kept where all measurements relevant to an activity of a subject
were arranged horizontally. This was deemed more appropriate than a "tall" 
set with a "measurement type" and "measurement value" arrangement. The
justification is in line with the principles outlined in [@Wickham2014]:
    * The measurements represent a set of readings taken for a specific person
    during a specific activity. They are not independent, they represent a 
    very specific experimental output. The grouping against the person and
    activity, therefore, is quite self-explanatory. A "tall" representation
    would likely falsely represent a set of independent measurements
    * The analysis of the dataset favors the wide arrangement also in the sense
    that as per [@Wickham2014] relationships are best analyzed between variables. 
    In the given dataset there is much value in the exploration and analysis 
    of the correlation of the different measurements 
    * For practical purposes, the wide arrangement is also quite more convenient. 
    A tall dataset representing 180 x 70 data items would be too unwieldly to 
    manage and present.

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
    
- ** Design decisions:** Data was read in using data table, due to the 
performance and ease-of-use benefits. Manipulation was done mostly using dplyr
(joining, grouping, summarizing) mainly for readability and performance. 
Subsetting, column naming, column exclusion, etc. was done by simple base R
expressions, re-assignments, rbind() and cbind(). 
String substitution used gsub() and regular
expression matching.


## Code walkthrough
The
[code submited](https://github.com/GitAlexGit/tidyDataProjectRepo/blob/master/run_analysis.R) 
has extensive comments throughout, explaining the process at each step. An 
outline is provided here along with some justifications, as needed:

* The provided zip file is unziped in the current directory
* the column names are read-in from the features.txt file, the needed ones are 
determined by string matching, and the substitution algorithm described above is 
applied to derive the final list of "well-formed" names. A separate function is
called for the substitution.
* the activity levels are read-in and the data frame columns are named for easy
access
* both the train and test activity sets are read-in. The column is named the same
as the relevant activity levels column (the key) so as to accomodate joining
* read the full train and test sets, attach (cbind) the activity data
read before, and row-bind the two sets into one
* the unneeded columns are dropped and all remaining ones appropriately named
* joining with the activity data, we get also meaningful names in the activities
(and we then drop the unneeded numeric activity keys from the set)
* the initial set is completed by reading in the subject data and cbind()ing them
with the full dataset
* now we group the dataset by activity and subject, using the dplyr group_by()
function, and then, using summarize_each(), we get the mean for each other variable
based on this grouping
* the final set is written back as a text file using write.table() and using
"," as separator

# Data
The resulting data are a 180x81 table, representing 30 subjects performing 
6 activities each (30x6) and 79 variables (means) per subject-activity combination
There are with no NAs (this can be verified with ```all(colSums(is.na(finaldf))==0)```)

A more detailed description can be found in the
[accompanying codebook](https://github.com/GitAlexGit/tidyDataProjectRepo/blob/master/projectCodeBook.md)

The generated CSV can be downloaded from the Coursera project submission link [here](https://s3.amazonaws.com/coursera-uploads/user-d7d31ee9e557755d96b6561c/975116/asst-3/4f259e70646811e5b91e69c27466c863.txt)


# Appendix
Ideas and general clarifications were obtained from the very helpful page from 
David Hood [@bloke], one of the TCAs 

The template for the used Codebook was obtained from [@codebooktemplate]


# References
