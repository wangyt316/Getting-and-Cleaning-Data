#Read X_test.txt into X_test
X_test = read.table('./UCI HAR Dataset/test/X_test.txt', header = F)
head(X_test)
#Read X_train.txt into X_train
X_train = read.table('./UCI HAR Dataset/train/X_train.txt', header = F)
nrow(X_test)
nrow(X_train)
#Read y_test.txt into y_test
y_test = read.table('./UCI HAR Dataset/test/y_test.txt', header = F)
#Read y_train.txt into y_train
y_train = read.table('./UCI HAR Dataset/train/y_train.txt', header = F)
nrow(y_test)
nrow(y_train)
head(y_test)
head(y_train)

#Read feature mapping into features
features = read.table('./UCI HAR Dataset/features.txt', header = F)
head(features)
nrow(features)

#Merge training and testing data
DF_X = rbind(X_train, X_test)
nrow(DF_X)
ncol(DF_X)

#Extract features that contain "mean()" and "std()"
mean = features[grep("mean()", features$V2), ]
std = features[grep("std()", features$V2), ] 

#Get column number index for mean and std values
col_number = c(mean[,1],std[,1])
#Get column names for mean and std values
col_name = c(as.character(mean[,2]) ,as.character(std[,2]))

#Extract mean and std columns from merged dataset
result_X = DF_X[, col_number]
ncol(result_X)
#Reset column names
names(result_X) = col_name
head(result_X)

#Get y value of dataset, merge with X value
result_y = rbind(y_train, y_test)
head(result_y)
#Rename y value to 'y'
names(result_y) = 'y'
result = cbind(result_X, result_y)
head(result)

#Export result data into 'tidydata.txt'
write.table(result, 'tidydata.txt', sep = ' ')
