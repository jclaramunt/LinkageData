library(RecordLinkage)
load("ExampleDataset.Rdata")
source("deterPairs.R")
source("probPairs.R")



#Examples deterministic

#Example 1
#Without errors

#Preprocessiong: Keep only common variables to be used for linkage
DatasetAE1l<-as.data.frame(DatasetAE1[,c(1,4,5)])
DatasetBE1l<-as.data.frame(DatasetBE1[,c(1,6,7)])



minCorrectVariables<-3


ex1 <- compare.linkage(DatasetAE1l, DatasetBE1l, blockfld = FALSE)
head(ex1$pairs)


ex1$pairs<-ex1$pairs[which(rowSums(ex1$pairs[,c(3,4,5)])==minCorrectVariables),]


linksE1 <- deterPairs(DatasetAE1,DatasetBE1,ex1$pairs)
head(linksE1)  

View(linksE1)



#Example 2
#With errors

#Preprocessiong: Keep only common variables to be used for linkage
DatasetAE2l<-as.data.frame(DatasetAE2a[,c(1,4,5)])
DatasetBE2l<-as.data.frame(DatasetBE2a[,c(1,6,7)])


minCorrectVariables<-3

ex2 <- compare.linkage(DatasetAE2l, DatasetBE2l, blockfld = FALSE)



ex2$pairs<-ex2$pairs[which(rowSums(ex2$pairs[,c(3,4,5)])==minCorrectVariables),]


linksE2 <- deterPairs(DatasetAE2a,DatasetBE2a,ex2$pairs)
head(linksE2)  


View(linksE2)





#Examples Probabilistic


#Example 1
#Without errors

ex1P <- compare.linkage(DatasetAE1l, DatasetBE1l, blockfld = FALSE)
head(ex1P$pairs)


ex1P_weight <- emWeights(ex1P)

summary(ex1P_weight)
allPairsE1 <- getPairs(ex1P_weight, min.weight=20)
head(allPairsE1)


linksE1P<-probPairs(DatasetAE1,DatasetBE1,allPairsE1)


View(linksE1P)


identical(linksE1,linksE1P)



#Example 2
#With errors


ex2P <- compare.linkage(DatasetAE2l, DatasetBE2l, blockfld = FALSE)
head(ex2P$pairs)



ex2P_weight <- emWeights(ex2P)

summary(ex2P_weight)
allPairsE2 <- getPairs(ex2P_weight, min.weight=10)
head(allPairsE2)


linksE2P<-probPairs(DatasetAE2a,DatasetBE2a,allPairsE2)

View(linksE2P)





