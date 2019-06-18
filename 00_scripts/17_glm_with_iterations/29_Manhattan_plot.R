#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_02_input_pvalued_without_iteration")

library(ggplot2)
library(dplyr)
library(gridExtra)
library(readr)
library(tidyr)
library(stringr)
library(multcomp)
library(foreach)
library(doParallel)


#dat <- read.table("all_glm_tuckey_without_iteration_results.txt", header=F, fill=TRUE)
#colnames(dat) <- c("Ten", "SNP", "RedVsGreen", "YellowVsGreen", "YellowVsRed", "HatcheryVsGambier", "KatiuVsGambier", "TakapotoVsGambier", "KatiuVsHatchery","TakapotoVsHatchery", "TakapotoVsKatiu")
#
#dat$RedVsGreen <- as.numeric(as.character(dat$RedVsGreen))
#dat$YellowVsGreen <- as.numeric(as.character(dat$YellowVsGreen))
#dat$YellowVsRed <- as.numeric(as.character(dat$YellowVsRed))
#dat$HatcheryVsGambier <- as.numeric(as.character(dat$HatcheryVsGambier))
#dat$KatiuVsGambier <- as.numeric(as.character(dat$KatiuVsGambier))
#dat$TakapotoVsGambier <- as.numeric(as.character(dat$TakapotoVsGambier))
#dat$KatiuVsHatchery <- as.numeric(as.character(dat$KatiuVsHatchery))
#dat$TakapotoVsHatchery <- as.numeric(as.character(dat$TakapotoVsHatchery))
#dat$TakapotoVsKatiu <- as.numeric(as.character(dat$TakapotoVsKatiu))
#dat$RedVsGreen <- as.numeric(as.character(dat$RedVsGreen))
#dat$YellowVsGreen <- as.numeric(as.character(dat$YellowVsGreen))
#dat$YellowVsRed <- as.numeric(as.character(dat$YellowVsRed))
#dat$HatcheryVsGambier <- as.numeric(as.character(dat$HatcheryVsGambier))
#dat$KatiuVsGambier <- as.numeric(as.character(dat$KatiuVsGambier))
#dat$TakapotoVsGambier <- as.numeric(as.character(dat$TakapotoVsGambier))
#dat$KatiuVsHatchery <- as.numeric(as.character(dat$KatiuVsHatchery))
#dat$TakapotoVsHatchery <- as.numeric(as.character(dat$TakapotoVsHatchery))
#dat$TakapotoVsKatiu <- as.numeric(as.character(dat$TakapotoVsKatiu))
#
#dat$RedVsGreen[dat$RedVsGreen == "0"] <- "1e-323"
#dat$YellowVsGreen[dat$YellowVsGreen == "0"] <- "1e-323"
#dat$YellowVsRed[dat$YellowVsRed == "0"] <- "1e-323"
#dat$HatcheryVsGambier[dat$HatcheryVsGambier == "0"] <- "1e-323"
#dat$KatiuVsGambier[dat$KatiuVsGambier == "0"] <- "1e-323"
#dat$TakapotoVsGambier[dat$TakapotoVsGambier == "0"] <- "1e-323"
#dat$KatiuVsHatchery[dat$KatiuVsHatchery == "0"] <- "1e-323"
#dat$TakapotoVsHatchery[dat$TakapotoVsHatchery == "0"] <- "1e-323"
#dat$TakapotoVsKatiu[dat$TakapotoVsKatiu == "0"] <- "1e-323"
#dat$RedVsGreen[dat$RedVsGreen == "0"] <- "1e-323"
#dat$YellowVsGreen[dat$YellowVsGreen == "0"] <- "1e-323"
#dat$YellowVsRed[dat$YellowVsRed == "0"] <- "1e-323"
#dat$HatcheryVsGambier[dat$HatcheryVsGambier == "0"] <- "1e-323"
#dat$KatiuVsGambier[dat$KatiuVsGambier == "0"] <- "1e-323"
#dat$TakapotoVsGambier[dat$TakapotoVsGambier == "0"] <- "1e-323"
#dat$KatiuVsHatchery[dat$KatiuVsHatchery == "0"] <- "1e-323"
#dat$TakapotoVsHatchery[dat$TakapotoVsHatchery == "0"] <- "1e-323"
#dat$TakapotoVsKatiu[dat$TakapotoVsKatiu == "0"] <- "1e-323"
#
#dat$RedVsGreen <- as.numeric(as.character(dat$RedVsGreen))
#dat$YellowVsGreen <- as.numeric(as.character(dat$YellowVsGreen))
#dat$YellowVsRed <- as.numeric(as.character(dat$YellowVsRed))
#dat$HatcheryVsGambier <- as.numeric(as.character(dat$HatcheryVsGambier))
#dat$KatiuVsGambier <- as.numeric(as.character(dat$KatiuVsGambier))
#dat$TakapotoVsGambier <- as.numeric(as.character(dat$TakapotoVsGambier))
#dat$KatiuVsHatchery <- as.numeric(as.character(dat$KatiuVsHatchery))
#dat$TakapotoVsHatchery <- as.numeric(as.character(dat$TakapotoVsHatchery))
#dat$TakapotoVsKatiu <- as.numeric(as.character(dat$TakapotoVsKatiu))
#dat$RedVsGreen <- as.numeric(as.character(dat$RedVsGreen))
#dat$YellowVsGreen <- as.numeric(as.character(dat$YellowVsGreen))
#dat$YellowVsRed <- as.numeric(as.character(dat$YellowVsRed))
#dat$HatcheryVsGambier <- as.numeric(as.character(dat$HatcheryVsGambier))
#dat$KatiuVsGambier <- as.numeric(as.character(dat$KatiuVsGambier))
#dat$TakapotoVsGambier <- as.numeric(as.character(dat$TakapotoVsGambier))
#dat$KatiuVsHatchery <- as.numeric(as.character(dat$KatiuVsHatchery))
#dat$TakapotoVsHatchery <- as.numeric(as.character(dat$TakapotoVsHatchery))
#dat$TakapotoVsKatiu <- as.numeric(as.character(dat$TakapotoVsKatiu))
#
#dat <- dat[order(dat$SNP),]
#head(dat)
#
# Visualizing two or more data points where they overlap
linecolors <- c("#714C02", "#01587A", "#024E37")
fillcolors <- c("#9D6C06", "#077DAA", "#026D4E")

#save(dat, file = "dat_for_manhattan_plot.rda")

#load the rda file
load(file = "dat_for_manhattan_plot.rda")


CHR = dat$SNP


registerDoParallel()

position <- c()

#for (i in 1:length(as.character(CHR))) {
foreach(i=1:length(as.character(CHR)), .combine=c) %dopar% { 

sink("POSITION_SCAFFOLDS_SNP.txt", append=TRUE)
  ww <- as.character(CHR[i])
  
 # test <- "scaffold1021|size251611_1995"
  # Le but est de reprendre le numéro du scaffold et de mettre ensuite la position
  
  # last scaffold : scaffold19136 --> 5 characters pour 19136
  z <- gsub("scaffold", "", ww)
  z <- as.character(z)
  y <- unlist(strsplit(z,split='|size', fixed=TRUE))
  w <- data.frame(y)
  ncharacter_taille_scaffold <- nchar(as.character(w[1,]))
  nb_zero_taille_scaffold <- rep(0, each=5-ncharacter_taille_scaffold)
  v <- paste0(paste(nb_zero_taille_scaffold, collapse = ""))
  u <- paste0("scaffold_",v,w[1,])
  #u
  
  #a <- gsub("scaffold", "", test)
  b <- unlist(strsplit(ww,split='|size', fixed=TRUE))
  #b <- as.character(i)
  c <- unlist(strsplit(b,split='_', fixed=TRUE))
  d <- data.frame(c)
  #ncharacter <- nchar(as.character(d[2,]))-nchar(as.character(d[3,]))
  ncharacter2 <- nchar(as.character(d[3,]))
  ncharacter2 <- as.numeric(ncharacter2)

  if (ncharacter2>=7){
    
    nb_zero <- 8

    
  }else{
    
    nb_zero <- rep(0, each=((7-ncharacter2)))
    
  }

  # 567472 # size of longest scaffold (in nucleotids) (= 6 character) donc on va mettre 7 zéro max
  f <- paste0(paste(nb_zero, collapse = ""),as.numeric(as.character(d[3,])))
  #g <- paste0(d[1,],"_",f)
  #g <- paste0(u,"_",f)
  g <- paste0(u,f)
  h <- gsub("scaffold_", "", g)
  options("scipen"=100, "digits"=4)
  h <- as.numeric(h)
  position <- append(position, h)
  print(position)
      sink()
      sink()
      sink()
}

registerDoSEQ()

P = dat$RedVsGreen
str(P)
# partially transparent points by setting `alpha = 0.5`
RedVsGreen <- ggplot(dat, aes(x=position, y=-log10(P))) +
  geom_point(position=position_jitter(h=0.1, w=0.1), #  or overlap
             shape = 20, alpha = 0.5, size = 3) + #  If you want smaller point, change the size by 2 or 1
  scale_color_manual(values=linecolors) + # For overlap
  scale_fill_manual(values=fillcolors) + # For overlap
geom_hline(aes(yintercept=9), color="red", linetype="dashed") + geom_hline(aes(yintercept=6), color="orange", linetype="dashed")  + geom_hline(aes(yintercept=3), color="darkgoldenrod3", linetype="dashed") +
 # scale_y_log10(limits = c(1, 1e+3)) + annotation_logticks(sides = "l") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) + # remove grid, background color and top and right borders
  labs(x = "Ordered by position in genome (in bp)", y="-Log10Pvalue") +
  labs(subtitle = "-Log10Pvalue by position of all scaffolds")+
  labs(title = "Red vs Green")


ggsave("Manhattan_plots_glm_tuckey_RedVsGreen_2.png", width = 30, height = 10)

P = dat$YellowVsGreen
# partially transparent points by setting `alpha = 0.5`
YellowVsGreen <- ggplot(dat, aes(x=position, y=-log10(P))) +
  geom_point(position=position_jitter(h=0.1, w=0.1), #  or overlap
             shape = 20, alpha = 0.5, size = 3) + #  If you want smaller point, change the size by 2 or 1
  scale_color_manual(values=linecolors) + # For overlap
  scale_fill_manual(values=fillcolors) + # For overlap
geom_hline(aes(yintercept=9), color="red", linetype="dashed") + geom_hline(aes(yintercept=6), color="orange", linetype="dashed")  + geom_hline(aes(yintercept=3), color="darkgoldenrod3", linetype="dashed") +
 # scale_y_log10(limits = c(1, 1e+3)) + annotation_logticks(sides = "l") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) + # remove grid, background color and top and right borders
  labs(x = "Ordered by position in genome (in bp)", y="-Log10Pvalue") +
  labs(subtitle = "-Log10Pvalue by position of all scaffolds")+
  labs(title = "Yellow Vs Green")

ggsave("Manhattan_plots_glm_tuckey_YellowVsGreen_2.png", width = 30, height = 10)


P = dat$YellowVsRed
# partially transparent points by setting `alpha = 0.5`
YellowVsRed <- ggplot(dat, aes(x=position, y=-log10(P))) +
  geom_point(position=position_jitter(h=0.1, w=0.1), #  or overlap
             shape = 20, alpha = 0.5, size = 3) + #  If you want smaller point, change the size by 2 or 1
  scale_color_manual(values=linecolors) + # For overlap
  scale_fill_manual(values=fillcolors) + # For overlap
geom_hline(aes(yintercept=9), color="red", linetype="dashed") + geom_hline(aes(yintercept=6), color="orange", linetype="dashed")  + geom_hline(aes(yintercept=3), color="darkgoldenrod3", linetype="dashed") +
 # scale_y_log10(limits = c(1, 1e+3)) + annotation_logticks(sides = "l") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) + # remove grid, background color and top and right borders
  labs(x = "Ordered by position in genome (in bp)", y="-Log10Pvalue") +
  labs(subtitle = "-Log10Pvalue by position of all scaffolds")+
  labs(title = "Yellow Vs Red")

ggsave("Manhattan_plots_glm_tuckey_YellowVsRed_2.png", width = 30, height = 10)


P = dat$HatcheryVsGambier
# partially transparent points by setting `alpha = 0.5`
HatcheryVsGambier <- ggplot(dat, aes(x=position, y=-log10(P))) +
  geom_point(position=position_jitter(h=0.1, w=0.1), #  or overlap
             shape = 20, alpha = 0.5, size = 3) + #  If you want smaller point, change the size by 2 or 1
  scale_color_manual(values=linecolors) + # For overlap
  scale_fill_manual(values=fillcolors) + # For overlap
geom_hline(aes(yintercept=9), color="red", linetype="dashed") + geom_hline(aes(yintercept=6), color="orange", linetype="dashed")  + geom_hline(aes(yintercept=3), color="darkgoldenrod3", linetype="dashed") +
 # scale_y_log10(limits = c(1, 1e+3)) + annotation_logticks(sides = "l") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) + # remove grid, background color and top and right borders
  labs(x = "Ordered by position in genome (in bp)", y="-Log10Pvalue") +
  labs(subtitle = "-Log10Pvalue by position of all scaffolds")+
  labs(title = "Hatchery Vs Gambier")

ggsave("Manhattan_plots_glm_tuckey_HatcheryVsGambier_2.png", width = 30, height = 10)


P = dat$KatiuVsGambier
# partially transparent points by setting `alpha = 0.5`
KatiuVsGambier <- ggplot(dat, aes(x=position, y=-log10(P))) +
  geom_point(position=position_jitter(h=0.1, w=0.1), #  or overlap
             shape = 20, alpha = 0.5, size = 3) + #  If you want smaller point, change the size by 2 or 1
  scale_color_manual(values=linecolors) + # For overlap
  scale_fill_manual(values=fillcolors) + # For overlap
geom_hline(aes(yintercept=9), color="red", linetype="dashed") + geom_hline(aes(yintercept=6), color="orange", linetype="dashed")  + geom_hline(aes(yintercept=3), color="darkgoldenrod3", linetype="dashed") +
 # scale_y_log10(limits = c(1, 1e+3)) + annotation_logticks(sides = "l") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) + # remove grid, background color and top and right borders
  labs(x = "Ordered by position in genome (in bp)", y="-Log10Pvalue") +
  labs(subtitle = "-Log10Pvalue by position of all scaffolds")+
  labs(title = "Katiu Vs Gambier")

ggsave("Manhattan_plots_glm_tuckey_KatiuVsGambier_2.png", width = 30, height = 10)


P = dat$TakapotoVsGambier
# partially transparent points by setting `alpha = 0.5`
TakapotoVsGambier <- ggplot(dat, aes(x=position, y=-log10(P))) +
  geom_point(position=position_jitter(h=0.1, w=0.1), #  or overlap
             shape = 20, alpha = 0.5, size = 3) + #  If you want smaller point, change the size by 2 or 1
  scale_color_manual(values=linecolors) + # For overlap
  scale_fill_manual(values=fillcolors) + # For overlap
geom_hline(aes(yintercept=9), color="red", linetype="dashed") + geom_hline(aes(yintercept=6), color="orange", linetype="dashed")  + geom_hline(aes(yintercept=3), color="darkgoldenrod3", linetype="dashed") +
 # scale_y_log10(limits = c(1, 1e+3)) + annotation_logticks(sides = "l") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) + # remove grid, background color and top and right borders
  labs(x = "Ordered by position in genome (in bp)", y="-Log10Pvalue") +
  labs(subtitle = "-Log10Pvalue by position of all scaffolds")+
  labs(title = "Takapoto Vs Gambier")

ggsave("Manhattan_plots_glm_tuckey_TakapotoVsGambier_2.png", width = 30, height = 10)



P = dat$KatiuVsHatchery
# partially transparent points by setting `alpha = 0.5`
KatiuVsHatchery <- ggplot(dat, aes(x=position, y=-log10(P))) +
  geom_point(position=position_jitter(h=0.1, w=0.1), #  or overlap
             shape = 20, alpha = 0.5, size = 3) + #  If you want smaller point, change the size by 2 or 1
  scale_color_manual(values=linecolors) + # For overlap
  scale_fill_manual(values=fillcolors) + # For overlap
geom_hline(aes(yintercept=9), color="red", linetype="dashed") + geom_hline(aes(yintercept=6), color="orange", linetype="dashed")  + geom_hline(aes(yintercept=3), color="darkgoldenrod3", linetype="dashed") +
 # scale_y_log10(limits = c(1, 1e+3)) + annotation_logticks(sides = "l") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) + # remove grid, background color and top and right borders
  labs(x = "Ordered by position in genome (in bp)", y="-Log10Pvalue") +
  labs(subtitle = "-Log10Pvalue by position of all scaffolds")+
  labs(title = "KatiuVsHatchery")

ggsave("Manhattan_plots_glm_tuckey_KatiuVsHatchery_2.png", width = 30, height = 10)


P = dat$TakapotoVsHatchery
# partially transparent points by setting `alpha = 0.5`
TakapotoVsHatchery <- ggplot(dat, aes(x=position, y=-log10(P))) +
  geom_point(position=position_jitter(h=0.1, w=0.1), #  or overlap
             shape = 20, alpha = 0.5, size = 3) + #  If you want smaller point, change the size by 2 or 1
  scale_color_manual(values=linecolors) + # For overlap
  scale_fill_manual(values=fillcolors) + # For overlap
geom_hline(aes(yintercept=9), color="red", linetype="dashed") + geom_hline(aes(yintercept=6), color="orange", linetype="dashed")  + geom_hline(aes(yintercept=3), color="darkgoldenrod3", linetype="dashed") +
 # scale_y_log10(limits = c(1, 1e+3)) + annotation_logticks(sides = "l") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) + # remove grid, background color and top and right borders
  labs(x = "Ordered by position in genome (in bp)", y="-Log10Pvalue") +
  labs(subtitle = "-Log10Pvalue by position of all scaffolds")+
  labs(title = "Takapoto Vs Hatchery")

ggsave("Manhattan_plots_glm_tuckey_TakapotoVsHatchery_2.png", width = 30, height = 10)


P = dat$TakapotoVsKatiu
# partially transparent points by setting `alpha = 0.5`
TakapotoVsKatiu <- ggplot(dat, aes(x=position, y=-log10(P))) +
  geom_point(position=position_jitter(h=0.1, w=0.1), #  or overlap
             shape = 20, alpha = 0.5, size = 3) + #  If you want smaller point, change the size by 2 or 1
  scale_color_manual(values=linecolors) + # For overlap
  scale_fill_manual(values=fillcolors) + # For overlap
geom_hline(aes(yintercept=9), color="red", linetype="dashed") + geom_hline(aes(yintercept=6), color="orange", linetype="dashed")  + geom_hline(aes(yintercept=3), color="darkgoldenrod3", linetype="dashed") +
 # scale_y_log10(limits = c(1, 1e+3)) + annotation_logticks(sides = "l") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) + # remove grid, background color and top and right borders
  labs(x = "Ordered by position in genome (in bp)", y="-Log10Pvalue") +
  labs(subtitle = "-Log10Pvalue by position of all scaffolds")+
  labs(title = "TakapotoVsKatiu")

ggsave("Manhattan_plots_glm_tuckey_TakapotoVsKatiu_2.png", width = 30, height = 10)



#grid.arrange(RedVsGreen, YellowVsGreen, YellowVsRed, HatcheryVsGambier, KatiuVsGambier, TakapotoVsGambier, KatiuVsHatchery,TakapotoVsHatchery, TakapotoVsKatiu,
 #            ncol=2)

#ggsave(filename = "Manhattan_plots_glm_tuckey_2.png", grid.arrange(RedVsGreen, YellowVsGreen, YellowVsRed, HatcheryVsGambier, KatiuVsGambier, TakapotoVsGambier, KatiuVsHatchery,TakapotoVsHatchery, TakapotoVsKatiu,
#                                             ncol=2),
#       width = 10, height = 20, dpi = 300, units = "in", device='png')

#ggsave("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf.copy.logitR_ORIGIN_ggplot2_2.png")

