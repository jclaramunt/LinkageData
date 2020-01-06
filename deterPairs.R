#deterPairs.R


deterPairs<-function(datasetA, datasetB, pairs){
  
  links<-cbind(datasetA[pairs$id1,],datasetB[pairs$id2,])
  
  return(links)
  
  
}