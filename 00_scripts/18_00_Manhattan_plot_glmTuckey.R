#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified")

library(ggplot2)
library(dplyr)
library(gridExtra)

dat <- read.table("all_results_ok_from_glm_with_iteration_unique_final_no_header.txt", header=F)
colnames(dat) <- c("nb", "Ten", "SNP", "RedVsGreen", "YellowVsGreen", "YellowVsRed", "HatcheryVsGambier", "KatiuVsGambier", "TakapotoVsGambier", "KatiuVsHatchery","TakapotoVsHatchery", "TakapotoVsKatiu") 
dat <- dat[order(dat$SNP),]
head(dat)

# Visualizing two or more data points where they overlap
linecolors <- c("#714C02", "#01587A", "#024E37")
fillcolors <- c("#9D6C06", "#077DAA", "#026D4E")


CHR = dat$SNP
P = as.numeric(dat$RedVsGreen)
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


P = as.numeric(dat$YellowVsGreen)
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

P = as.numeric(dat$YellowVsRed)
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

P = as.numeric(dat$HatcheryVsGambier)
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


P = as.numeric(dat$KatiuVsGambier)
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


P = as.numeric(dat$TakapotoVsGambier)
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


P = as.numeric(dat$KatiuVsHatchery)
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


P = as.numeric(dat$TakapotoVsHatchery)
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


P = as.numeric(dat$TakapotoVsKatiu)
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



#grid.arrange(RedVsGreen, YellowVsGreen, YellowVsRed, HatcheryVsGambier, KatiuVsGambier, TakapotoVsGambier, KatiuVsHatchery,TakapotoVsHatchery, TakapotoVsKatiu,
 #            ncol=2)

ggsave(filename = "Manhattan_plots_glm_tuckey.pdf", grid.arrange(RedVsGreen, YellowVsGreen, YellowVsRed, HatcheryVsGambier, KatiuVsGambier, TakapotoVsGambier, KatiuVsHatchery,TakapotoVsHatchery, TakapotoVsKatiu,
                                             ncol=2),
       width = 10, height = 20, dpi = 3000, units = "in", device='pdf')

#ggsave("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf.copy.logitR_ORIGIN_ggplot2.png")
