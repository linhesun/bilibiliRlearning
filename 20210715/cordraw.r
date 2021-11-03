library(psych)
genedat <- read.table('index.txt', header = TRUE, sep = '\t')
antidat <- read.table('meta.txt',header = TRUE, sep = '\t')

res <- corr.test(genedat, antidat, use = 'pairwise', 
                 method = 'spearman', adjust = 'holm',
                 alpha = 0.05)
res$p.adj
res$r

library(pheatmap)
pdat <- res$r
pdat2 <- matrix(ifelse(abs(pdat) <= 0.3, 0, pdat), nrow(pdat))
pdat2 <- matrix(ifelse(res$p.adj >= 0.05, 0, pdat2), nrow(pdat))

colnames(pdat2) <- colnames(pdat)
rownames(pdat2) <- rownames(pdat)

bk <- seq(-1, 1, by = 0.1)
bk
length(bk)

mycol <- c(colorRampPalette(c('blue', 'white'))(9), 
           colorRampPalette(c('white', 'white'))(3),
           colorRampPalette(c('white', 'red'))(9))

pheatmap(pdat2, cellwidth = 15, cellheight = 15,
         cluster_cols = FALSE,
         color = mycol,
         legend_breaks = seq(-1,1,by = 0.2),
         breaks = bk)

pdat3 <- data.frame(x = rep(colnames(pdat2), each = 23),
                       y = rep(rownames(pdat2), 13),
                       r = as.vector(res$r),
                       p = as.vector(
                         ifelse(res$p.adj >= 0.05, 1, res$p.adj)
                       ))

library(ggplot2)
ggplot(pdat3, aes(x,y, colour = r, size = -log10(p))) +
  geom_point(aes(alpha = -log10(p))) + 
  scale_color_gradient2(low = 'blue',
                        mid = 'white',
                        high = 'red',
                        midpoint = 0) +
  scale_size_area() + theme_bw()
