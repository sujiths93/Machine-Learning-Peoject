y_cap=x
y=train_test$Category
y=data.frame(y)
y=as.matrix(y)
count=0;

for(i in 1:length(rownames(x)))
{
  if(as.character(x[i,1])==as.character(y[i,1]))
    count=count+1;   
}
library(caret)
library(e1071)
#registerDoMC(5)
dummy=dummyVars("~DayOfWeek+PdDistrict+Address+Year+Month+Day+Hour+Minute",data=train)
testing=data.frame(predict(dummy,newdata=train))
testing["X"]=train$X
testing["Y"]=train$Y
testing["Category"]=train$Category

#Setting the Training and testing data.
set.seed(12)
train_train1=testing[sample(seq_len(nrow(testing)),size=400000),];

size=floor(0.75*nrow(train_train1))
set.seed(1)
train_ind <- sample(seq_len(nrow(train_train1)), size=size)
train_train=train_train1[train_ind,]
train_test=train_train1[-train_ind,]


#LOGISTIC REGRESSION on THREE VARIABLES
library(nnet)
a=multinom(Category~.,train_train,maxit=100,MaxNWts=20000)
p1=predict(a,train_test,"prob")

#model=svm(Category~.,data=train_train,scale=FALSE,probability=TRUE)
#p1=predict(model,train_test,probability=TRUE)
 
x=apply(p1,1,function(x)names(which.max(x)))
print(sum(as.numeric(train_test$Category==x))/nrow(train_test))
