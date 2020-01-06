#probPairs.R


probPairs<-function(datasetA, datasetB, aPairs){
  
  rowsA<-c()
  rowsB<-c()
  countA<-1
  countB<-1
  for (i in 1:dim(aPairs)[1]) {
    
    if(i%%3==1){
      rowsA[countA]<-as.numeric(as.character(aPairs[i,]$id))
      countA<-countA+1
    }else if(i%%3==2){
      rowsB[countB]<-as.numeric(as.character(aPairs[i,]$id))
      countB<-countB+1
    }
    
  }
  
  links<-cbind(datasetA[rowsA,],datasetB[rowsB,])
  
  return(links)
  
  
}