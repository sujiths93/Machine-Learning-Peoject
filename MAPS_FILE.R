install.packages("ggplot2")
install.packages("ggmap")
install.packages(maps)


require(ggplot2)
require(ggmap)
require(maps)
library(ggplot2)
library(ggmap)

library(ggplot2)
library(ggmap)
data1 = data.frame(X=training_data$X,Y=training_data$Y, 
                   cat = unique(as.character(training_data$Category)))
map <- qmap('San Francisco', zoom = 4, maptype = 'hybrid')
map + geom_point(data = data1, aes(x = X, y = Y, color = cat), size=2)