# Getting-and-Cleaning-Data-Course-Project

This script makes use of the UCI data set gathered from Samsung Galaxy S smartphone accelerometers.
The data can be downloaded here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Instructions for Use
1. Download dataset .zip file.
2. Extract .zip file to your working directory. This will produce a subfolder in your working directory called 'UCI HAR Dataset' that will contain all required data files and information about the original data set. Leave all files in this directory.
3. Run 'run_analysis.R' (from this repository) in R Studio

# Output
The 'run_analysis.R' script will produce three output items:

1. A data frame in R Studio called 'combinedMeanStd'
2. A data frame in R Studio called 'ActSubMeans'
3. A text file in your working directory called 'Activity and Subject Means.txt'

The first output contains all of the mean and standard deviation measurements from the original dataset. It is comprised of the 7352 training measurements followed by the 2947 testing measurements.

The contents of outputs 2 and 3 are identical: a 36 row by 1714 column table aggregating the means of 1713 measurements by the 6 activity types (rows 1-6: 'LAYING', 'SITTING', 'STANDING', 'WALKING', 'WALKING_DOWNSTAIRS', and 'WALKING_UPSTAIRS') and 30 test subjects (rows 7-36: numeric values indicating individual test subjects).

An explanation of the column headings for the outputs can be found in 'codebook.txt', included in this repository.
