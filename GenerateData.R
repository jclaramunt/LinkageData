# Example1 #

# Not unique key
dimA<-20

#Dataset A
set.seed(11)
day<-sample(x=1:28, size = dimA, replace=TRUE)
month<-sample(x=1:12, size = dimA, replace=TRUE)
year<-sample(x=1920:2020, size = dimA, replace=TRUE)
datebirth<-paste(day,month,year,sep = '/')  
hair<-sample(x=c("Blond","Brown","Black","Red","White","Bold","Other"),size = dimA, replace=TRUE)
eye<-sample(x=c("Blue","Brown","Black","Green","Grey","Other"),size = dimA, replace=TRUE)
height<-sample(x=140:210, size = dimA, replace=TRUE)
weight<-sample(x=40:120, size = dimA, replace=TRUE)

DatasetAE1<-data.frame(datebirth,hair,eye,height,weight)

#Dataset B
reord<-sample(1:dimA, size = dimA, replace=FALSE)
datebirthB<-datebirth[reord]
smoke<-sample(x=0:1, size = dimA, replace=TRUE)
drink<-sample(x=0:1, size = dimA, replace=TRUE)
sportWeek<-sample(x=0:7, size = dimA, replace=TRUE)
strokes<-sample(x=0:5, prob = c(0.8,0.185,0.011,0.0025,0.001,0.0005), size = dimA, replace=TRUE)
heightB<-height[reord]
weightB<-weight[reord]

DatasetBE1<-data.frame(datebirthB,smoke,drink,sportWeek,strokes,heightB,weightB)






# Example2 a #
#Not unique key with random errors.


dimA<-20

#Dataset A
set.seed(11)

error<-sample(x=c(0,1), prob = c(0.9,0.1), size = dimA, replace = TRUE)



day<-sample(x=1:28, size = dimA, replace=TRUE)
month<-sample(x=1:12, size = dimA, replace=TRUE)
year<-sample(x=1920:2020, size = dimA, replace=TRUE)
datebirth<-paste(day,month,year,sep = '/')  
hair<-sample(x=c("Blond","Brown","Black","Red","White","Bold","Other"),size = dimA, replace=TRUE)
eye<-sample(x=c("Blue","Brown","Black","Green","Grey","Other"),size = dimA, replace=TRUE)
height<-sample(x=140:210, size = dimA, replace=TRUE)
weight<-sample(x=40:120, size = dimA, replace=TRUE)

heightA<-height
weightA<-weight


for (i in 1:dimA) {
  if(error[i]==1){
    where<-sample(x=1:5, size = 1)
    if(where==1){
      day[i]<-day[i]+sample(x=c(-1,1),size=1)
    }else if(where==2){
      month[i]<-ifelse(month[i]==12, 11, month[i]+sample(x=c(-1,1),size=1))
    }else if(where==3){
      year[i]<-year[i]+sample(x=c(-1,1),size=1)
    }else if(where==4){
      heightA[i]<-height[i]+sample(x=c(-1,1),size=1)
    }else if(where==5){
      weightA[i]<-weight[i]+sample(x=c(-1,1),size=1)
    }  
    
    
  }  
}


datebirthA<-paste(day,month,year,sep = '/')  

DatasetAE2a<-data.frame(datebirthA,hair,eye,heightA,weightA)

#Dataset B. No errors. Errors only in A
reord<-sample(1:dimA, size = dimA, replace=FALSE)
datebirthB<-datebirth[reord]
smoke<-sample(x=0:1, size = dimA, replace=TRUE)
drink<-sample(x=0:1, size = dimA, replace=TRUE)
sportWeek<-sample(x=0:7, size = dimA, replace=TRUE)
strokes<-sample(x=0:5, prob = c(0.8,0.185,0.011,0.0025,0.001,0.0005), size = dimA, replace=TRUE)
heightB<-height[reord]
weightB<-weight[reord]

DatasetBE2a<-data.frame(datebirthB,smoke,drink,sportWeek,strokes,heightB,weightB)








# Example 2b #
#Not unique key with random errors. Larger datasets


dimA<-2000

#Dataset A
set.seed(11)

error<-sample(x=c(0,1), prob = c(0.8,0.2), size = dimA, replace = TRUE)



day<-sample(x=1:28, size = dimA, replace=TRUE)
month<-sample(x=1:12, size = dimA, replace=TRUE)
year<-sample(x=1920:2020, size = dimA, replace=TRUE)
datebirth<-paste(day,month,year,sep = '/')
hair<-sample(x=c("Blond","Brown","Black","Red","White","Bold","Other"),size = dimA, replace=TRUE)
eye<-sample(x=c("Blue","Brown","Black","Green","Grey","Other"),size = dimA, replace=TRUE)
height<-sample(x=140:210, size = dimA, replace=TRUE)
weight<-sample(x=40:120, size = dimA, replace=TRUE)


heightA<-height
weightA<-weight

for (i in 1:dimA) {
  if(error[i]==1){
    where<-sample(x=1:5, size = 1)
    if(where==1){
      day[i]<-day[i]+sample(x=c(-1,1),size=1)
    }else if(where==2){
      month[i]<-ifelse(month[i]==12, 11, month[i]+sample(x=c(-1,1),size=1))
    }else if(where==3){
      year[i]<-year[i]+sample(x=c(-1,1),size=1)
    }else if(where==4){
      heightA[i]<-height[i]+sample(x=c(-1,1),size=1)
    }else if(where==5){
      weightA[i]<-weight[i]+sample(x=c(-1,1),size=1)
    }  
    
    
  }  
}


datebirthA<-paste(day,month,year,sep = '/')  

DatasetAE2b<-data.frame(datebirthA,hair,eye,heightA,weightA)


#Dataset B. No errors. Errors only in A
reord<-sample(1:dimA, size = dimA, replace=FALSE)
datebirthB<-datebirth[reord]
smoke<-sample(x=0:1, size = dimA, replace=TRUE)
drink<-sample(x=0:1, size = dimA, replace=TRUE)
sportWeek<-sample(x=0:7, size = dimA, replace=TRUE)
strokes<-sample(x=0:5, prob = c(0.8,0.185,0.011,0.0025,0.001,0.0005), size = dimA, replace=TRUE)
heightB<-height[reord]
weightB<-weight[reord]

DatasetBE2b<-data.frame(datebirthB,smoke,drink,sportWeek,strokes,heightB,weightB)






