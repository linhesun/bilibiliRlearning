library(tidyverse)
library(ggrepel)

dat <- read_tsv('trans_sample.txt')
dat2 <- dat
dat2$regulate <- ifelse(dat2$log2FoldChange >= 0, 'up', 'down')
dat2$regulate[dat2$padj > 0.05] = 'no'
dat2$regulate[abs(dat2$log2FoldChange) < 1] <- 'no' 
dat2$regulate <- factor(dat2$regulate, levels = c('up', 'down', 'no'))
dat2$target <- dat2$gene_id
dat2$target[abs(dat2$log2FoldChange) < 5| dat2$padj > 0.05] <- NA


ggplot(dat2, aes(log2FoldChange, y = -log10(padj), color = regulate )) +
  geom_point() +
  geom_hline(aes(yintercept = -log10(0.05)), colour="gray88", linetype="dashed") +
  geom_vline(xintercept = c(-log2(1.5),log2(1.5)),  colour="gray88", linetype="dashed") +
  scale_color_manual(breaks = c("no", "up", "down"), values = c('gray', 'red', 'blue')) +
  ylab('-log10(p)') + xlab('log2(Fold change)') +
  theme_bw() + 
  theme(panel.grid = element_blank(),
        axis.text = element_text(size = 12)) +
  geom_text_repel(aes(label = target),max.overlaps = Inf,
                  fontface = 'italic',
                  show.legend = FALSE)

ind <- read_tsv('index.txt')
dat3 <- left_join(dat2, ind, by = 'gene_id')
ggplot(dat3, aes(log2FoldChange, y = -log10(padj), color = regulate )) +
  geom_point() +
  geom_hline(aes(yintercept = -log10(0.05)), colour="gray88", linetype="dashed") +
  geom_vline(xintercept = c(-log2(1.5),log2(1.5)),  colour="gray88", linetype="dashed") +
  scale_color_manual(breaks = c("no", "up", "down"), values = c('gray', 'red', 'blue')) +
  ylab('-log10(p)') + xlab('log2(Fold change)') +
  theme_bw() + 
  theme(panel.grid = element_blank(),
        axis.text = element_text(size = 12)) +
  geom_text_repel(aes(label = gene_name),max.overlaps = Inf,
                  fontface = 'italic',
                  show.legend = FALSE,
                  nudge_x = ifelse(abs(dat3$log2FoldChange) <5,-3,0),)

