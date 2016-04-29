lab=unique(train_train$PdDistrict)
lab=as.character(lab)
par(mfrow=c(1,2),mar=c(9,4,1,0))

for(i in 1:length(lab))
{
  
  mypath=file.path("C:","Users","sujit_000","Desktop","PLOTS",paste("PDdistrict",i,".pdf",sep="")) 
 jpeg(file=mypath,quality=100,width=1024,height=768)
   a=plot(table(train_train[train_train$PdDistrict==lab[i],1]),las=2,main=lab[i])
  
}
dev.off()
lab=unique(train_train$DayOfWeek)
lab=as.character(lab)
par(mfrow=c(1,2),mar=c(9,4,1,0))

for(i in 1:length(lab))
{
  mypath=file.path("C:","Users","sujit_000","Desktop","PLOTS",paste("DayOfweek",i,".jpeg",sep=""))  
  jpeg(file=mypath,quality=100,width=1024,height=768)
  title=paste("DayofWeek",lab[i],sep=" ")
  a=plot(table(train_train[train_train$DayOfWeek==lab[i],1]),las=3,main=title)
  dev.off()
}

lab=unique(train_train$Year)
lab=as.character(lab)
par(mfrow=c(2,2),mar=c(9,4,1,0))

for(i in 1:length(lab))
{
  mypath=file.path("C:","Users","sujit_000","Desktop","PLOTS",paste("Year",i,".jpeg",sep=""))
  jpeg(file=mypath,quality=100,width=1024,height=768)
  title=paste("YEAR",lab[i],sep=" ")
  a=plot(table(train_train[train_train$Year==lab[i],1]),las=3,main=lab[i])
  dev.off()
}

lab=unique(train_train$Month)
lab=as.character(lab)
par(mfrow=c(1,2),mar=c(9,4,1,0))

for(i in 1:length(lab))
{
  mypath=file.path("C:","Users","sujit_000","Desktop","PLOTS",paste("Month",i,".jpeg",sep=""))
    jpeg(file=mypath,quality=100,width=1024,height=768)
  title=paste("MONTH",lab[i],sep=" ")
  a=plot(table(train_train[train_train$Month==lab[i],1]),las=3,main=title)
  dev.off()
}


lab=unique(train_train$Day)
lab=as.character(lab)
par(mfrow=c(1,2),mar=c(9,4,1,0))

for(i in 1:length(lab))
{
  mypath=file.path("C:","Users","sujit_000","Desktop","PLOTS",paste("Day",i,".jpeg",sep=""))
  jpeg(file=mypath,quality=100,width=1024,height=768)
  title=paste("DAY",lab[i],sep=" ")
  a=plot(table(train_train[train_train$Day==lab[i],1]),las=3,main=title)
  dev.off()
}

lab=unique(train_train$Hour)
lab=as.character(lab)
par(mfrow=c(1,2),mar=c(9,4,1,0))

for(i in 1:length(lab))
{
  mypath=file.path("C:","Users","sujit_000","Desktop","PLOTS",paste("Hour",i,".jpeg",sep=""))
  jpeg(file=mypath,quality=100,width=1024,height=768)
  title=paste("HOUR",lab[i],sep=" ")
  a=plot(table(train_train[train_train$Hour==lab[i],1]),las=3,main=title)
  dev.off()
}