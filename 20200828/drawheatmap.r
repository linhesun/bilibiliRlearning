Args <- commandArgs(T)

transdata <- read.table(Args[1], header = TRUE, row.names = 1, sep = '\t')
class(transdata)
transdata <- as.matrix(transdata)
class(transdata)

transdata <- log10(transdata + 1)

# 请先安装pheatmap包
# install.packages('pheatmap')
library(pheatmap)


pdf(Args[2], width = 10, height = 10)
pheatmap(transdata, cluster_cols = FALSE)
dev.off()

