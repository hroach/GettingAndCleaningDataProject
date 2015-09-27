
## DataScience - Getting and Cleaning Data - Project
## fetch data
##    activity labels
run_analysis <- function(){
    actLabels <- read.table("./data/activity_labels.txt", stringsAsFactors = FALSE)
    ##    measurement features (labels)
    mNames <- read.table("./data/features.txt", stringsAsFactors = FALSE)
    ##    test subject ids
    testSubj = read.table("./data/subject_test.txt", stringsAsFactors = FALSE)
    ##    test measurements
    testMeas <- read.table("./data/X_test.txt", stringsAsFactors = FALSE)
    ##    test activity map
    testAct = read.table("./data/y_test.txt", stringsAsFactors = FALSE)
    ##    training subject ids
    trainingSubj <- read.table("./data/subject_train.txt", stringsAsFactors = FALSE)
    ##    training measurements
    trainingMeas <- read.table("./data/X_train.txt", stringsAsFactors = FALSE)
    ##    training activity map
    trainingAct <- read.table("./data/y_train.txt", stringsAsFactors = FALSE)
    library(plyr)
    library(Hmisc)
    library(dplyr)
    library(stringr)
    ## create column of named activitys
    testActNames <- actLabels$V2[testAct$V1]
    testAct <- mutate(testAct, activity = testActNames)
    trainingActNames <- actLabels$V2[trainingAct$V1]
    trainingAct <- mutate(trainingAct, activity = trainingActNames)
    ## delete numeric columns from  test and training
    ## rename activity and subject column 
    ##names(testAct)[names(testAct) == "V1"] = "activity"
    ##names(trainingAct)[names(trainingAct) == "V1"] = "activity"
    names(testSubj)[names(testSubj) == "V1"] = "subject"
    names(trainingSubj)[names(trainingSubj) == "V1"] = "subject"
    ## assign variable names to test and training measurement tables
    names(testMeas) <- mNames$V2
    names(trainingMeas) = mNames$V2
    ## extract from features measurements those matching "mean" and "std"
    msNames <- filter(mNames,str_detect(V2,"mean")|str_detect(V2,"std"))
    ## reduce test and training measurements to variable with mean ans std
    testMeasReduced <- testMeas[, msNames$V1]
    trainingMeasReduced <- trainingMeas[,msNames$V1]
    ## build the two tables
    testDf <- cbind(testAct,testSubj,testMeasReduced)
    trainingDf <- cbind(trainingAct,trainingSubj,trainingMeasReduced)
    ## merge test and training
    mtt <- rbind(trainingDf,testDf)
    ## insure no NAs in merged data frame
    all(colSums(is.na(mtt))==0)
    ## group by 
    mttas <- group_by(mtt, activity, subject)
    mttasSum <- mtts %>% summarise_each(funs(mean))
}
