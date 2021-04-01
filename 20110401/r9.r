install.packages('corrplot')
library('corrplot')
dat <- read.table('cordat.txt', header = T, sep = '\t')
dat <- as.matrix(dat)

corr <- cor(dat)

corrplot(corr)
corrplot(corr, tl.col = 'black')
corrplot(corr, tl.col = 'black', order = 'hclust')

corr1 <- cor.mtest(dat)
corr1$p

corrplot(corr, tl.col = 'black', order = 'hclust', p.mat = corr1$p, insig = 'blank')

corrplot(corr, tl.col = 'black', order = 'hclust', p.mat = corr1$p, 
         insig = 'label_sig', sig.level = c(0.001,0.01,0.05), pch.cex = 0.9,
         pch.col = 'green')

corrplot(corr, tl.col = 'black', order = 'hclust', p.mat = corr1$p, 
         insig = 'label_sig', sig.level = c(0.001,0.01,0.05), pch.cex = 0.9,
         pch.col = 'green', type = 'lower')

corrplot(corr, tl.col = 'black', order = 'hclust', p.mat = corr1$p, 
         insig = 'label_sig', sig.level = c(0.001,0.01,0.05), pch.cex = 0.9,
         pch.col = 'green', type = 'lower', method = 'color')
