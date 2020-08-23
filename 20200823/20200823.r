mydata <- matrix(runif(30000,-1,1),10000,3)
laoqing <- mean(mydata[,1])

yourdata <- mydata
for(i in 1:nrow(yourdata)){
  yourdata[i,] <- scale(mydata[i,])
}

plotdata <- mydata[1:100,]
plot(plotdata[,1:2])

ggdata <- as.data.frame(plotdata)
library(ggplot2)
ggplot(data = ggdata, aes(x = V1, y = V2)) + geom_point()
