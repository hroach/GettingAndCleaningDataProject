# GettingAndCleaningDataProject
## script run_analysis.R


## this script does the following
1. extracts data from the datasets provided by
> the Machine Learning Repository 
     <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>
2. merges the test and training sets
3. applies measurement variable names to both sets
4. renames the values in the activity column to the associated activity labels
5. groups the merged data frame by activity and subject and takes the mean of each measurement
6  returns a tidy table "mttasSum" created by step 5
