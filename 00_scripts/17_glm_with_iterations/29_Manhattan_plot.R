#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_02_input_pvalued_without_iteration")

library(ggplot2)
library(dplyr)
library(gridExtra)

dat <- read.table("all_glm_tuckey_without_iteration_results.txt", header=F, fill=TRUE)
colnames(dat) <- c("Ten", "SNP", "RedVsGreen", "YellowVsGreen", "YellowVsRed", "HatcheryVsGambier", "KatiuVsGambier", "TakapotoVsGambier", "KatiuVsHatchery","TakapotoVsHatchery", "TakapotoVsKatiu")

dat$RedVsGreen <- as.numeric(as.character(dat$RedVsGreen))
dat$YellowVsGreen <- as.numeric(as.character(dat$YellowVsGreen))
dat$YellowVsRed <- as.numeric(as.character(dat$YellowVsRed))
dat$HatcheryVsGambier <- as.numeric(as.character(dat$HatcheryVsGambier))
dat$KatiuVsGambier <- as.numeric(as.character(dat$KatiuVsGambier))
dat$TakapotoVsGambier <- as.numeric(as.character(dat$TakapotoVsGambier))
dat$KatiuVsHatchery <- as.numeric(as.character(dat$KatiuVsHatchery))
dat$TakapotoVsHatchery <- as.numeric(as.character(dat$TakapotoVsHatchery))
dat$TakapotoVsKatiu <- as.numeric(as.character(dat$TakapotoVsKatiu))
dat$RedVsGreen <- as.numeric(as.character(dat$RedVsGreen))
dat$YellowVsGreen <- as.numeric(as.character(dat$YellowVsGreen))
dat$YellowVsRed <- as.numeric(as.character(dat$YellowVsRed))
dat$HatcheryVsGambier <- as.numeric(as.character(dat$HatcheryVsGambier))
dat$KatiuVsGambier <- as.numeric(as.character(dat$KatiuVsGambier))
dat$TakapotoVsGambier <- as.numeric(as.character(dat$TakapotoVsGambier))
dat$KatiuVsHatchery <- as.numeric(as.character(dat$KatiuVsHatchery))
dat$TakapotoVsHatchery <- as.numeric(as.character(dat$TakapotoVsHatchery))
dat$TakapotoVsKatiu <- as.numeric(as.character(dat$TakapotoVsKatiu))

dat <- dat[order(dat$SNP),]
head(dat)

# Visualizing two or more data points where they overlap
linecolors <- c("#714C02", "#01587A", "#024E37")
fillcolors <- c("#9D6C06", "#077DAA", "#026D4E")


CHR = dat$SNP
P = dat$RedVsGreen
str(P)
# partially transparent points by setting `alpha = 0.5`
RedVsGreen <- ggplot(dat, aes(x=CHR, y=-log10(P))) +
  geom_point(position=position_jitter(h=0.1, w=0.1), #  or overlap
             shape = 20, alpha = 0.5, size = 3) + #  If you want smaller point, change the size by 2 or 1
  scale_color_manual(values=linecolors) + # For overlap
  scale_fill_manual(values=fillcolors) + # For overlap
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) + # remove grid, background color and top and right borders
  labs(x = "Ordered by position", y="-Log10Pvalue") +
  labs(subtitle = "-Log10Pvalue by position of all scaffolds")+
  labs(title = "Red vs Green")


ggsave("Manhattan_plots_glm_tuckey_RedVsGreen.png", width = 30, height = 10)

P = dat$YellowVsGreen
# partially transparent points by setting `alpha = 0.5`
YellowVsGreen <- ggplot(dat, aes(x=CHR, y=-log10(P))) +
  geom_point(position=position_jitter(h=0.1, w=0.1), #  or overlap
             shape = 20, alpha = 0.5, size = 3) + #  If you want smaller point, change the size by 2 or 1
  scale_color_manual(values=linecolors) + # For overlap
  scale_fill_manual(values=fillcolors) + # For overlap
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) + # remove grid, background color and top and right borders
  labs(x = "Ordered by position", y="-Log10Pvalue") +
  labs(subtitle = "-Log10Pvalue by position of all scaffolds")+
  labs(title = "Yellow Vs Green")

ggsave("Manhattan_plots_glm_tuckey_YellowVsGreen.png", width = 30, height = 10)


P = dat$YellowVsRed
# partially transparent points by setting `alpha = 0.5`
YellowVsRed <- ggplot(dat, aes(x=CHR, y=-log10(P))) +
  geom_point(position=position_jitter(h=0.1, w=0.1), #  or overlap
             shape = 20, alpha = 0.5, size = 3) + #  If you want smaller point, change the size by 2 or 1
  scale_color_manual(values=linecolors) + # For overlap
  scale_fill_manual(values=fillcolors) + # For overlap
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) + # remove grid, background color and top and right borders
  labs(x = "Ordered by position", y="-Log10Pvalue") +
  labs(subtitle = "-Log10Pvalue by position of all scaffolds")+
  labs(title = "Yellow Vs Red")

ggsave("Manhattan_plots_glm_tuckey_YellowVsRed.png", width = 30, height = 10)


P = dat$HatcheryVsGambier
# partially transparent points by setting `alpha = 0.5`
HatcheryVsGambier <- ggplot(dat, aes(x=CHR, y=-log10(P))) +
  geom_point(position=position_jitter(h=0.1, w=0.1), #  or overlap
             shape = 20, alpha = 0.5, size = 3) + #  If you want smaller point, change the size by 2 or 1
  scale_color_manual(values=linecolors) + # For overlap
  scale_fill_manual(values=fillcolors) + # For overlap
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) + # remove grid, background color and top and right borders
  labs(x = "Ordered by position", y="-Log10Pvalue") +
  labs(subtitle = "-Log10Pvalue by position of all scaffolds")+
  labs(title = "Hatchery Vs Gambier")

ggsave("Manhattan_plots_glm_tuckey_HatcheryVsGambier.png", width = 30, height = 10)


P = dat$KatiuVsGambier
# partially transparent points by setting `alpha = 0.5`
KatiuVsGambier <- ggplot(dat, aes(x=CHR, y=-log10(P))) +
  geom_point(position=position_jitter(h=0.1, w=0.1), #  or overlap
             shape = 20, alpha = 0.5, size = 3) + #  If you want smaller point, change the size by 2 or 1
  scale_color_manual(values=linecolors) + # For overlap
  scale_fill_manual(values=fillcolors) + # For overlap
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) + # remove grid, background color and top and right borders
  labs(x = "Ordered by position", y="-Log10Pvalue") +
  labs(subtitle = "-Log10Pvalue by position of all scaffolds")+
  labs(title = "Katiu Vs Gambier")

ggsave("Manhattan_plots_glm_tuckey_KatiuVsGambier.png", width = 30, height = 10)


P = dat$TakapotoVsGambier
# partially transparent points by setting `alpha = 0.5`
TakapotoVsGambier <- ggplot(dat, aes(x=CHR, y=-log10(P))) +
  geom_point(position=position_jitter(h=0.1, w=0.1), #  or overlap
             shape = 20, alpha = 0.5, size = 3) + #  If you want smaller point, change the size by 2 or 1
  scale_color_manual(values=linecolors) + # For overlap
  scale_fill_manual(values=fillcolors) + # For overlap
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) + # remove grid, background color and top and right borders
  labs(x = "Ordered by position", y="-Log10Pvalue") +
  labs(subtitle = "-Log10Pvalue by position of all scaffolds")+
  labs(title = "Takapoto Vs Gambier")

ggsave("Manhattan_plots_glm_tuckey_TakapotoVsGambier.png", width = 30, height = 10)



P = dat$KatiuVsHatchery
# partially transparent points by setting `alpha = 0.5`
KatiuVsHatchery <- ggplot(dat, aes(x=CHR, y=-log10(P))) +
  geom_point(position=position_jitter(h=0.1, w=0.1), #  or overlap
             shape = 20, alpha = 0.5, size = 3) + #  If you want smaller point, change the size by 2 or 1
  scale_color_manual(values=linecolors) + # For overlap
  scale_fill_manual(values=fillcolors) + # For overlap
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) + # remove grid, background color and top and right borders
  labs(x = "Ordered by position", y="-Log10Pvalue") +
  labs(subtitle = "-Log10Pvalue by position of all scaffolds")+
  labs(title = "KatiuVsHatchery")

ggsave("Manhattan_plots_glm_tuckey_KatiuVsHatchery.png", width = 30, height = 10)


P = dat$TakapotoVsHatchery
# partially transparent points by setting `alpha = 0.5`
TakapotoVsHatchery <- ggplot(dat, aes(x=CHR, y=-log10(P))) +
  geom_point(position=position_jitter(h=0.1, w=0.1), #  or overlap
             shape = 20, alpha = 0.5, size = 3) + #  If you want smaller point, change the size by 2 or 1
  scale_color_manual(values=linecolors) + # For overlap
  scale_fill_manual(values=fillcolors) + # For overlap
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) + # remove grid, background color and top and right borders
  labs(x = "Ordered by position", y="-Log10Pvalue") +
  labs(subtitle = "-Log10Pvalue by position of all scaffolds")+
  labs(title = "Takapoto Vs Hatchery")

ggsave("Manhattan_plots_glm_tuckey_TakapotoVsHatchery.png", width = 30, height = 10)


P = dat$TakapotoVsKatiu
# partially transparent points by setting `alpha = 0.5`
TakapotoVsKatiu <- ggplot(dat, aes(x=CHR, y=-log10(P))) +
  geom_point(position=position_jitter(h=0.1, w=0.1), #  or overlap
             shape = 20, alpha = 0.5, size = 3) + #  If you want smaller point, change the size by 2 or 1
  scale_color_manual(values=linecolors) + # For overlap
  scale_fill_manual(values=fillcolors) + # For overlap
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) + # remove grid, background color and top and right borders
  labs(x = "Ordered by position", y="-Log10Pvalue") +
  labs(subtitle = "-Log10Pvalue by position of all scaffolds")+
  labs(title = "TakapotoVsKatiu")

ggsave("Manhattan_plots_glm_tuckey_TakapotoVsKatiu.png", width = 30, height = 10)



#grid.arrange(RedVsGreen, YellowVsGreen, YellowVsRed, HatcheryVsGambier, KatiuVsGambier, TakapotoVsGambier, KatiuVsHatchery,TakapotoVsHatchery, TakapotoVsKatiu,
 #            ncol=2)

#ggsave(filename = "Manhattan_plots_glm_tuckey.png", grid.arrange(RedVsGreen, YellowVsGreen, YellowVsRed, HatcheryVsGambier, KatiuVsGambier, TakapotoVsGambier, KatiuVsHatchery,TakapotoVsHatchery, TakapotoVsKatiu,
#                                             ncol=2),
#       width = 10, height = 20, dpi = 300, units = "in", device='png')

#ggsave("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf.copy.logitR_ORIGIN_ggplot2.png")

