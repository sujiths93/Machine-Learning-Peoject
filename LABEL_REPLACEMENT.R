
#ASSIGNING NEW ATTRIBUTES
train_train[,"MORNING"]=0
train_train[,"NIGHT"]=0
train_train[,"EVENING"]=0

train_train$MORNING=as.numeric(train_train$Hour%in%day)
train_train$EVENING=as.numeric(train_train$Hour%in%evening)
train_train$NIGHT=as.numeric(train_train$Hour%in%night)

train_train$Hour=NULL
train_train$Minute=NULL
train_train$Second=NULL


#NEW DATA LABELS ACCORDING TO THE CLASSES OBSERVED.
new_labels=c("NON-CRIMINAL","ASSAULT","OTHER OFFENSES","NON-CRIMINAL","LARCENY/THEFT","DRUG/NARCOTIC","BURGLARY","ROBBERY","WARRANTS","TRESPASS","FRAUD","VEHICLE THEFT","WARRANTS")

#REPLACING labels
CATEGORY=train_train$Category
CATEGORY[which(as.numeric(train_train$Category%in%new_labels)==0)]="OTHERS"
train_train$Category=CATEGORY

#PERFORMING REGRESSION ON THE GIVEN DATA.
indexes=sample(1:nrow(train_train),size=0.75*nrow(train_train))
#SPLIT THE DATA
train1=train_train[indexes,]
test=train_train[-indexes,]
Y=test$Category
test$Category=NULL

#RUN LOGISTIC REGRESSION
library(nnet)
a=multinom(Category~.,train1,maxit=100,MaxNWts=20000)
p1=predict(a,test,"prob")

x=apply(p1,1,function(x)names(which.max(x)))
print(sum(as.numeric(Y==x))/nrow(test))


indexes=sample(1:nrow(train),size=0.5*nrow(train))
#SPLIT THE DATA
train_trian=train[indexes,]


