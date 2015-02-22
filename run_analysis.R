	## reading the training data from X_train
	TrainData = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
	## adding the activity set
	TrainData [,562] = read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
	## adding users
	TrainData [,563] = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

	## similarly getting the test data.
	TestingData = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
	TestingData[,562] = read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
	TestingData[,563] = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

	## merging training and test data
	Data = rbind(TrainData,TestingData)

	## activity set: which is mapped to numbers in Y_train.txt and Y_test.txt 
	ActData = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

	## Feature set
	FeatureSet = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)

	## we want only mean and std feature
	ColMeanStd = grep("mean|std",FeatureSet[,2],ignore.case=TRUE)
	FeatureSet<-FeatureSet[ColMeanStd,]
	## adding column for Activity and Subject
	ColMeanStd<-c(ColMeanStd, 562, 563)
	Data = Data[,ColMeanStd]
	colnames(Data)= c(as.character(FeatureSet$V2), "Activity", "Subject")
	for(i in 1:nrow(Data))
	{
		if(Data[i,"Activity"] == 1)
		{
			Data[i,"Activity"]=as.character(ActData[1,2])
		}
		else if(Data[i,"Activity"] == 2)
		{
			Data[i,"Activity"]=as.character(ActData[2,2])
		}
		else if(Data[i,"Activity"] == 3)
		{
			Data[i,"Activity"]=as.character(ActData[3,2])
		}
		else if(Data[i,"Activity"] == 4)
		{
			Data[i,"Activity"]=as.character(ActData[4,2])
		}
		else if(Data[i,"Activity"] == 5)
		{
			Data[i,"Activity"]=as.character(ActData[5,2])
		}
		else if(Data[i,"Activity"] == 6)
		{
			Data[i,"Activity"]=as.character(ActData[6,2])
		}

	}

	Data$Activity<- as.factor(Data$Activity)
	Data$Subject<- as.factor(Data$Subject)
	tidy = aggregate(Data, by=list(Activity = Data$Activity, Subject=Data$Subject), mean)
	tidy[,90] = NULL
	tidy[,89] = NULL
	write.table(tidy, "tidy.txt", sep="\t",row.name=FALSE)




