### The codes were modified from the resources below:
### http://www.bioinformatics.com.cn/static/papers/093.pdf
### https://github.com/RainCloudPlots/RainCloudPlots
library(ggplot2)
library(dplyr)
library(readr)

source("R_rainclouds.R")
source("summarySE.R")

rep_data <- read_csv("repeated_measures_data.csv", 
                     col_types = cols(group = col_factor(levels = c("1", "2")), 
                                      time = col_factor(levels = c("1", "2", "3"))))
sumrepdat <- summarySE(rep_data, measurevar = 'score', groupvars = c('group', 'time'))

ggplot(rep_data, aes(x = time, y = score, fill = group)) +
  geom_flat_violin(aes(fill = group),position = position_nudge(x = .1, y = 0),
                   adjust = 0.5, trim = FALSE, alpha = .5, colour = NA)+
  geom_dotplot(position = position_nudge(x = -0.1, y = 0), alpha = 0.5,
               binaxis='y', stackdir='down', stackratio=1.5, dotsize=0.8, binwidth = 0.2) +
  geom_boxplot(aes(x = time, y = score, fill = group),outlier.shape = NA,
               alpha = .5, width = .1, colour = "black")+
  scale_colour_brewer(palette = "Dark2")+
  scale_fill_brewer(palette = "Dark2")+ coord_flip() + theme_classic() 


ggplot(rep_data, aes(x = time, y = score, fill = group)) +
  geom_flat_violin(aes(fill = group),position = position_nudge(x = .1, y = 0),
                   adjust = 0.5, trim = FALSE, alpha = .5, colour = NA)+
  geom_dotplot(position = position_nudge(x = -0.1, y = 0), alpha = 0.5,
               binaxis='y', stackdir='down', stackratio=1.5, dotsize=0.8, binwidth = 0.2) +
  geom_boxplot(aes(x = time, y = score, fill = group),outlier.shape = NA,
               alpha = .5, width = .1, colour = "black")+
  scale_colour_brewer(palette = "Dark2")+
  scale_fill_brewer(palette = "Dark2")+ coord_flip() + theme_classic() +
  geom_line(data = sumrepdat, aes(x = as.numeric(time)+.1, y = score_mean, group = group, colour = group), linetype = 3)+
  geom_point(data = sumrepdat, aes(x = as.numeric(time)+.1, y = score_mean, group = group, colour = group), shape = 18) +
  geom_errorbar(data = sumrepdat, aes(x = as.numeric(time)+.1, y = score_mean, group = group, colour = group, ymin = score_mean - sem, ymax = score_mean + sem), width = .05)
