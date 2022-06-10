library(ggplot2)
library(ggnewscale)

oridat <-  read.csv('micro.csv', header = TRUE)
oridat1 <- oridat[,1:2]
oridat2 <- oridat[,c(1,3)]
oridat1$x <-1
oridat1$dens <- oridat1$WCH1/sum(oridat1$WCH1)
oridat1 <- oridat1[order(oridat1$WCH1, decreasing = TRUE),]
dat1 <- oridat1[1:20,]
names(dat1)[1:2] <- c('lab','abun')
dat1$y <- 20:1

oridat2$x <-2
oridat2$dens <- oridat2$WXH1/sum(oridat2$WXH1)
oridat2 <- oridat2[order(oridat2$WXH1, decreasing = TRUE),]
dat2 <- oridat2[1:20,]
names(dat2)[1:2] <- c('lab','abun')
dat2$y <- 20:1

dat <- rbind(dat1,dat2)
dat3 <- data.frame(name = c('Cigu', 'Xiangpu'),
                   x = 1:2,
                   y = 21.5)



ggplot(dat, aes(x,y)) + geom_text(aes(label = lab, hjust = ifelse(x ==1,1,0))) + geom_line(aes(group = lab))+
  geom_segment(data = dat2,aes(x = x+1, xend = x + 1 + (dens*30), y = y, yend = y, color = dens), size = 6) +
  geom_segment(data = dat1,aes(x = x-1, xend = x - 1 - (dens*30), y = y, yend = y, color = dens), size = 6) +
  scale_color_gradientn(
    colours = c("grey90", "pink", "darkorchid4"),
    breaks = c(0, 0.05, 0.13)
    ) +
  theme_void() +
  theme(legend.position = "none") +
  new_scale_color() +
  geom_text(data = dat2, aes(x = x +1, y = y, label = scales::percent(dens, accuracy = .01), color = I(ifelse(dens > 0.1, 'white', 'black'))), hjust = 0) +
  geom_text(data = dat1, aes(x = x -1, y = y, label = scales::percent(dens, accuracy = .01), color = I(ifelse(dens > 0.1, 'white', 'black'))), hjust = 1) +
  geom_text(data = dat3,aes(label = name, hjust = ifelse(x ==1,1,0)), size = 8 )
  
