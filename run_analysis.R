## Import Files
features<-read.table("./UCI HAR Dataset/features.txt",header = F)
activityLabels<-read.table("./UCI HAR Dataset/activity_labels.txt",header = F)

trainX<-read.table("./UCI HAR Dataset/train/X_train.txt",header = F)
trainY<-read.table("./UCI HAR Dataset/train/Y_train.txt",header = F)
testX<-read.table("./UCI HAR Dataset/test/X_test.txt",header = F)
testY<-read.table("./UCI HAR Dataset/test/Y_test.txt",header = F)

trainSubject<-read.table("./UCI HAR Dataset/train/subject_train.txt",header = F)
testSubject<-read.table("./UCI HAR Dataset/test/subject_test.txt",header = F)

trainTAx<-read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt",header = F)
trainTAy<-read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt",header = F)
trainTAz<-read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt",header = F)
testTAx<-read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt",header = F)
testTAy<-read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt",header = F)
testTAz<-read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt",header = F)

trainBAx<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt",header = F)
trainBAy<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt",header = F)
trainBAz<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt",header = F)
testBAx<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt",header = F)
testBAy<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt",header = F)
testBAz<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt",header = F)

trainBGx<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt",header = F)
trainBGy<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt",header = F)
trainBGz<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt",header = F)
testBGx<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt",header = F)
testBGy<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt",header = F)
testBGz<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt",header = F)

## 4. ASSIGN DESCRIPTIVE VARIABLE NAMES
names(testBAx)<-gsub(" ","", paste("BAx",1:128))
names(testBAy)<-gsub(" ","", paste("BAy",1:128))
names(testBAz)<-gsub(" ","", paste("BAz",1:128))
names(testBGx)<-gsub(" ","", paste("BGx",1:128))
names(testBGy)<-gsub(" ","", paste("BGy",1:128))
names(testBGz)<-gsub(" ","", paste("BGz",1:128))
names(testTAx)<-gsub(" ","", paste("TAx",1:128))
names(testTAy)<-gsub(" ","", paste("TAy",1:128))
names(testTAz)<-gsub(" ","", paste("TAz",1:128))

names(trainBAx)<-gsub(" ","", paste("BAx",1:128))
names(trainBAy)<-gsub(" ","", paste("BAy",1:128))
names(trainBAz)<-gsub(" ","", paste("BAz",1:128))
names(trainBGx)<-gsub(" ","", paste("BGx",1:128))
names(trainBGy)<-gsub(" ","", paste("BGy",1:128))
names(trainBGz)<-gsub(" ","", paste("BGz",1:128))
names(trainTAx)<-gsub(" ","", paste("TAx",1:128))
names(trainTAy)<-gsub(" ","", paste("TAy",1:128))
names(trainTAz)<-gsub(" ","", paste("TAz",1:128))

names(testSubject)<-"Subject"
names(trainSubject)<-"Subject"

names(trainX)<-features$V2
names(testX)<-features$V2

names(activityLabels)<-c("aID","Activity")
names(testY)<-"aID"
names(trainY)<-"aID"

## 3. ASSIGN DESCRIPTIVE ACTIVITY NAMES
testYaID <- cbind(data.frame(1:2947),testY$aID)
names(testYaID)<-c("count","aID")
testYaID$aID[testYaID$aID=="1"]<-"WALKING"
testYaID$aID[testYaID$aID=="2"]<-"WALKING_UPSTAIRS"
testYaID$aID[testYaID$aID=="3"]<-"WALKING_DOWNSTAIRS"
testYaID$aID[testYaID$aID=="4"]<-"SITTING"
testYaID$aID[testYaID$aID=="5"]<-"STANDING"
testYaID$aID[testYaID$aID=="6"]<-"LAYING"

trainYaID <- cbind(data.frame(1:7352),trainY$aID)
names(trainYaID)<-c("count","aID")
trainYaID$aID[trainYaID$aID=="1"]<-"WALKING"
trainYaID$aID[trainYaID$aID=="2"]<-"WALKING_UPSTAIRS"
trainYaID$aID[trainYaID$aID=="3"]<-"WALKING_DOWNSTAIRS"
trainYaID$aID[trainYaID$aID=="4"]<-"SITTING"
trainYaID$aID[trainYaID$aID=="5"]<-"STANDING"
trainYaID$aID[trainYaID$aID=="6"]<-"LAYING"

testYaID<-testYaID[-c(1)]
trainYaID<-trainYaID[-c(1)]

## 1. MERGE 'TEST' AND 'TRAIN' DATA SETS
testLabels<-data.frame(rep("test",each=2947))
names(testLabels)<-"type"
test<-cbind(testLabels,testSubject,testYaID,testX,testBAx,testBAy,testBAz,testBGx,testBGy,testBGz,testTAx,testTAy,testTAz)
rm(testLabels)

trainLabels<-data.frame(rep("train",each=7352))
names(trainLabels)<-"type"
train<-cbind(trainLabels,trainSubject,trainYaID,trainX,trainBAx,trainBAy,trainBAz,trainBGx,trainBGy,trainBGz,trainTAx,trainTAy,trainTAz)
rm(trainLabels)

combined<-rbind(test,train)

## 2. EXTRACT MEAN AND STANDARD DEVIATION MEASUREMENTS
library(stringr)
combinedMeanStd<-cbind(combined[str_detect(names(combined), "mean")],combined[str_detect(names(combined), "std")])

## 5. CREATE DATA SET WITH AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND AVERAGE OF EACH VARIABLE FOR EACH SUBJECT
ActSubMeans<-rbind(aggregate(combined[, 4:1716], list(combined$aID), mean),aggregate(combined[, 4:1716], list(combined$Subject), mean))
colnames(ActSubMeans)[1] <- "aID (descriptive) or Subject (numeric)"
write.table(ActSubMeans,file="./Activity and Subject Means.txt",row.names = F)

## Cleanup
rm(activityLabels)
rm(combined)
rm(combinedMeanStd)
rm(features)
rm(test,testBAx,testBAy,testBAz,testBGx,testBGy,testBGz,testSubject,testTAx,testTAy,testTAz,testX,testY,testYaID)
rm(train,trainBAx,trainBAy,trainBAz,trainBGx,trainBGy,trainBGz,trainSubject,trainTAx,trainTAy,trainTAz,trainX,trainY,trainYaID)
