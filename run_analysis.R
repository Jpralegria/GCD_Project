rm(list = ls())

## Requirement 1

## Paste the correponding path where Train data is located
setwd("D:/Users/Username/Documents/MOCCS/R codes/2015/Coursera/Getting and cleaning data/Getting and Cleaning Data/Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals")
files_train <-  list.files(path="D:/Users/Username/Documents/MOCCS/R codes/2015/Coursera/Getting and cleaning data/Getting and Cleaning Data/Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals", pattern=".txt")
train <- lapply(files_train, read.table, sep="\t", header=FALSE)
names(train) <- files_train

## Paste the correponding path where Test data is located
setwd("D:/Users/Username/Documents/MOCCS/R codes/2015/Coursera/Getting and cleaning data/Getting and Cleaning Data/Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals")
files_test <-  list.files(path="D:/Users/Username/Documents/MOCCS/R codes/2015/Coursera/Getting and cleaning data/Getting and Cleaning Data/Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals", pattern=".txt")
test <- lapply(files_test, read.table, sep="\t", header=FALSE)
names(test) <- files_test

train_test_merge <- mapply(c, train, test, SIMPLIFY = FALSE)

## Requirement 6.
xx <- lapply(train_test_merge, unlist)
max <- max(sapply(xx,length))
xxx <- do.call(rbind, lapply(xx, function(z)c(z, rep(NA, max-length(z)))))
write.table(xxx, "D:/Users/Username/Documents/MOCCS/R codes/2015/Coursera/Getting and cleaning data/Getting and Cleaning Data/Project/mydata.txt", row.names=FALSE)
