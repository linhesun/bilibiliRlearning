states=row.names(USArrests)
states
names(USArrests)
apply(USArrests, 2, mean)
apply(USArrests, 2, var)
pr.out=prcomp(USArrests, scale=TRUE)
names(pr.out)
pr.out$center
pr.out$scale
pr.out$rotation
dim(pr.out$x)
biplot(pr.out, scale=0)

pr.out$sdev
pr.var=pr.out$sdev^2
pr.var
pve=pr.var/sum(pr.var)
pve
summary(pr.out)

plotdat <- as.data.frame(pr.out$x[,1:2])
plotdat$state <- rownames(plotdat)
rotdat <- as.data.frame(pr.out$rotation[,1:2])
rotdat$crime <- rownames(rotdat)
library(ggplot2)
library(ggforce)
ggplot() + geom_text(data = plotdat, aes(x = PC1, y = PC2, label = state),size = 3) +
  theme_bw() + theme(panel.grid.major=element_line(colour=NA), panel.grid.minor = element_blank()) +
  geom_hline(aes(yintercept = 0), colour="gray88", linetype="dashed") + 
  geom_vline(aes(xintercept = 0), colour="gray88", linetype="dashed") +
  scale_y_continuous(sec.axis = sec_axis(~./4)) + scale_x_continuous(sec.axis = sec_axis(~./4)) +
  geom_segment(data = rotdat,aes(x=0, xend= PC1*4, y=0, yend= PC2*4), arrow = arrow(length = unit(0.03, "npc")), colour = 'red') +
  geom_text(data = rotdat,aes(x = PC1*4.4, y = PC2*4.4, label = crime), size = 4, colour = 'red')
  

dat <- read.table('trans.txt', header = TRUE, row.names = 1, sep = '\t')
dat <- t(dat)
pcadat <- prcomp(dat)
biplot(pcadat, scale = 0)

plotdat <- as.data.frame(pcadat$x[,1:2])
rownames(plotdat)
plotdat$genotype <- rep(c(rep('rht12',6),rep('Rht12',6)),2)
plotdat$treatment <- rep(c(rep('H2O', 3), rep('GA',3)),4)

library(ggplot2)
library(ggforce)
ggplot(plotdat, aes(x = PC1, y = PC2, colour = genotype, shape = treatment, group = genotype)) + geom_point(size = 3) +
  theme_bw() + theme(panel.grid.major=element_line(colour=NA), panel.grid.minor = element_blank()) +
  stat_ellipse(type ="t", linetype =2) +
  geom_hline(aes(yintercept = 0), colour="gray88", linetype="dashed") + 
  geom_vline(aes(xintercept = 0), colour="gray88", linetype="dashed") 
  