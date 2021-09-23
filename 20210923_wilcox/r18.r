library(ggplot2)
library(ggpubr)
dat <- read.table('dat18.txt', sep = '\t', row.name = 1, header = TRUE)
dat <- t(dat)
boxdat <- as.data.frame(dat[,1])
names(boxdat)[1] <- 'Abundance'
boxdat$OTU <- colnames(dat)[1]

for(i in 2:ncol(dat)){
  onedat <- as.data.frame(dat[,i])
  names(onedat)[1] <- 'Abundance'
  onedat$OTU <- colnames(dat)[i]
  boxdat <- rbind(boxdat, onedat)
}

ggplot(boxdat, aes(reorder(OTU,Abundance), Abundance)) + geom_boxplot()

compaired <- list(c('E', 'A'), c('E', "B"), c('E', 'C'),
                  c('E', 'D'), c('E', 'F'), c('E', 'G'))
ggplot(boxdat, aes(reorder(OTU,Abundance), Abundance)) + 
  geom_boxplot(width = 0.2) + stat_boxplot(geom = 'errorbar', width = 0.15) +
  stat_compare_means(comparisons = compaired, label = "p.signif")

compaired <- list(c('E', 'C'), c('E', "A"), c('E', 'G'),
                  c('E', 'B'), c('E', 'D'), c('E', 'F'))
ggplot(boxdat, aes(reorder(OTU,Abundance), Abundance)) + 
  stat_boxplot(geom = 'errorbar', width = 0.15) +
  geom_boxplot(width = 0.2, outlier.colour = NA) + 
  stat_compare_means(comparisons = compaired, label = "p.signif") +
  theme_bw() + theme(panel.grid.major = element_line(colour = NA), panel.grid.minor = element_blank()) +
  geom_jitter(aes(colour = OTU, group = OTU), width = 0.3, size = 1, alpha = 0.5) +
  xlab('OTU')

             
