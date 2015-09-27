#Datascience - Getting and Cleaning Data - Project

## Original Codebook:
> For this study Is located on the Machine Learning Repository site at
     <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones> 

## Purpose:
 To build a tidy data set that summarized the data for “mean” and “std” measurements on data furnished by the UCI study.

## Data:
>Original Data Source
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
*    activity_labels.txt   - character labels for each of the 6 activities      
    *    features.txt          - description for each of 561 measurement acquired
    *    subject_test.txt      -  integer ids for each of the 30 subjects
    *    X_test.txt            - [-1,1]  normalized measurements for the test dataset
    *    y_test.txt            -  integer activity values for each measurement
    *    subject_train.txt     -  integer ids for each of the 30 subjects
    *    X_train.txt           - [-1,1]  normalized measurements for the training dataset 
    *    y_train.txt           -  integer activity values for each measurement
### Measurement values were normalized by UIC
 
## Platform:
   ### OS: Windows 7 64 bit 6 GB ram
              x86_64-w64-mingw32/x64 (64-bit)
   ### Tools: RStudio Version 0.99.467
              R version 3.2.2 (2015-08-14) -- "Fire Safety"
           R Packages
           * dplyr    (V 0.4.3)
           * Hmisc    (V 3.16-0)
           * plyr     (V 1.8.3)
           * stringr  (V 1.0.0)


## Process used to create the summarized data output “mttasSum  dataframe”:
   ### fetch data
    *    activity labels from activity_labels.txt     [describes the 6 activity catagories that were measured]
    *    measurement features from features.txt       [describes the types of measurements captured] 
    *    test subject ids from subject_test.txt       [maps subject to measurements]
    *    test measurements from X_test.txt            [measurement values for each variable]
    *    test activity map from y_test.txt            [maps activity to measurements]
    *    training subject ids from subject_train.txt  [maps subject to measurement]
    *    training measurements from X_train.txt       [measurement values for each variable]
    *    training activity map from y_train.txt       [ maps activities to measurement]
    ### load required R packages
    ### create named activity columns for test and training
    ### rename activity and subject columns for test and training 
    ### assign the variable names for test and training measurement columns
    ### extract from features measurements those matching "mean" and "std" attributes
    ### reduce test and training measurements to variables with “mean” and” std” attributes
    ### build the test and training tables from the activities, subject, and measurements data
    ### merge test and training tables
    ### insure no NAs in merged table
    ### group by the merged table by activity and subject
    ### summarize the data applying the mean for each measurement

