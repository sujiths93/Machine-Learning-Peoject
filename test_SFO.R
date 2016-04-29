library(lubridate)
test$Id<-NULL
test$Address<-NULL

test$Year <- year(ymd_hms(test$Dates))

test$Month<- month(ymd_hms(test$Dates))

test$Day<- day(ymd_hms(test$Dates))

test$Hour<- hour(ymd_hms(test$Dates))

test$Minute<- minute(ymd_hms(test$Dates))

test$Second<- second(ymd_hms(test$Dates))
test$Second<-NULL
test$Dates<-NULL
a_test=with(test,data.frame(model.matrix(~DayOfWeek,test),PdDistrict,X,Y,Year,Month,Day,Hour,Minute))
a_test$X.Intercept.<-NULL
#performing dummy encoding on PdDistrict
a_test=with(a_test,data.frame(model.matrix(~PdDistrict,a_test),DayOfWeekMonday,DayOfWeekSaturday,DayOfWeekThursday,DayOfWeekTuesday,DayOfWeekWednesday,X,Y,Year,Month,Day,Hour,Minute))
a_test$X.Intercept.<-NULL
