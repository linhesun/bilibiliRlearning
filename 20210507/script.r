install.packages("agricolae")
library(agricolae)
library(ggplot2)
dat <- read.table('DAT.txt', header = TRUE, sep = '\t')
datnames <- names(dat)
shapiro.test(dat$GA24)
bartlett.test(GA24~sample, data = dat)

shapiro.test(dat$TP.mg.L.)
bartlett.test(TP.mg.L.~Group, data = dat)

anova <- aov(GA12~sample, data = dat)
xx <- TukeyHSD(anova)
yy <- HSD.test(anova, 'sample')
zz <-duncan.test(anova, 'sample')
result <- LSD.test(anova, 'sample')

datmeans <- result$means
datgroups <- result$groups
print(datgroups)
ind <- match(row.names(datmeans), row.names(datgroups))
datmeans$groups <- datgroups$groups[ind]
names(datmeans)[1] <- datnames[1]
plotdata <- as.data.frame(cbind(row.names(datmeans), datmeans[, 1], datmeans$std, as.character(datmeans$groups)))
names(plotdata) <- c("Treat", "y", "std", "groups")
plotdata$y <- as.numeric(as.character(plotdata$y))
plotdata$std <- as.numeric(as.character(plotdata$std))

theplot <- ggplot(plotdata, aes(x = Treat, y = y, fill = Treat)) + 
  geom_col()  + labs(title = datnames[1], x = "Samples", y= datnames[1]) + 
  geom_errorbar(aes(ymin = y - std, ymax = y + std), width = 0.2, position=position_dodge(0.9)) + 
  ylim(min(0,min(plotdata$y)-max(plotdata$std)), max(max(plotdata$y)+max(plotdata$std), max(plotdata$y) * 1.2)) + 
  geom_text(mapping = aes(y = y + std, label = groups), vjust = -1)
print(theplot)

pdf('t.pdf')
for(i in 2:ncol(dat)) { 
anova <- aov(dat[,i]~dat[,1])
xx <- TukeyHSD(anova)
yy <- HSD.test(anova, 'sample')
zz <-duncan.test(anova, 'sample')
result <- LSD.test(anova, "dat[, 1]")

datmeans <- result$means
datgroups <- result$groups
print(datgroups)
ind <- match(row.names(datmeans), row.names(datgroups))
datmeans$groups <- datgroups$groups[ind]
names(datmeans)[1] <- datnames[1]
plotdata <- as.data.frame(cbind(row.names(datmeans), datmeans[, 1], datmeans$std, as.character(datmeans$groups)))
names(plotdata) <- c("Treat", "y", "std", "groups")
plotdata$y <- as.numeric(as.character(plotdata$y))
plotdata$std <- as.numeric(as.character(plotdata$std))

theplot <- ggplot(plotdata, aes(x = Treat, y = y, fill = Treat)) + 
  geom_col()  + labs(title = datnames[i], x = "Samples", y= datnames[i]) + 
  geom_errorbar(aes(ymin = y - std, ymax = y + std), width = 0.2, position=position_dodge(0.9)) + 
  ylim(min(0,min(plotdata$y)-max(plotdata$std)), max(max(plotdata$y)+max(plotdata$std), max(plotdata$y) * 1.2)) + 
  geom_text(mapping = aes(y = y + std, label = groups), vjust = -1)
print(theplot)
}
dev.off()
