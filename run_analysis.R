initial.dir <- getwd()
setwd("./UCI HAR Dataset")
T1 <- read.table("activity_labels.txt")
colnames(T1) <- c("Activity","Activity Name")
T2 <- read.table("features.txt")
setwd("./Test")
D1 <- read.table("subject_test.txt")
colnames(D1) <- "Subject"
D2 <- read.table("X_test.txt")
V1 <- T2[,2]
V2 <- paste("Test",V1,sep="-")
colnames(D2) <- V2
D2_E1 <- D2[,grep("mean()",colnames(D2),fixed=TRUE,value=TRUE)]
D2_E2 <- D2[,grep("std()",colnames(D2),fixed=TRUE,value=TRUE)]
D3 <- read.table("y_test.txt")
colnames(D3) <- "Activity"
D3_E1 <- merge(D3,T1,by="Activity")
D3_E2 <- as.data.frame(D3_E1[,"Activity Name"])
colnames(D3_E2) <- "Activity Name"
DTest <- cbind(D1,D3_E2,D2_E1,D2_E2)
setwd("..")
setwd("./Train")
D4 <- read.table("subject_train.txt")
colnames(D4) <- "Subject"
D5 <- read.table("X_train.txt")
V1 <- T2[,2]
V2 <- paste("Train",V1,sep="-")
colnames(D5) <- V2
D5_E1 <- D5[,grep("mean()",colnames(D5),fixed=TRUE,value=TRUE)]
D5_E2 <- D5[,grep("std()",colnames(D5),fixed=TRUE,value=TRUE)]
D6 <- read.table("y_train.txt")
colnames(D6) <- "Activity"
D6_E1 <- merge(D6,T1,by="Activity")
D6_E2 <- as.data.frame(D6_E1[,"Activity Name"])
colnames(D6_E2) <- "Activity Name"
DTrain <- cbind(D4,D6_E2,D5_E1,D5_E2)
D_ALL <- merge(DTest, DTrain, by=c("Subject","Activity Name"),all=TRUE)
library(dplyr)
grp_cols <- names(D_ALL) [1:2]
dots <- lapply(grp_cols, as.symbol)
D_Final <- D_ALL %>% group_by_(.dots=dots) %>% summarise_each(funs(mean(.,na.rm=TRUE)),c(3:ncol(D_ALL)))
setwd(initial.dir)
write.table(D_Final,file="Tidy dataset.txt",row.names=FALSE)