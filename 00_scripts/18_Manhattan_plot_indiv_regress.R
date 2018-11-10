#!/usr/bin/env Rscript

# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf.copy.logitR.txt

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_chi2")

library(ggplot2)
library(dplyr)


dat <- read.table("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf.copy.logitR.txt", skip=1)
colnames(dat) <- c("CHROM", "POS", "REF", "ALT", "P_origin", "P_color", "P_count")

# Bonferroni correction for Pvalue (Chi2) 
dat2 <- data.frame(dat$CHROM, dat$POS, dat$REF, dat$ALT,p.adjust(dat$P_origin, method = "bonferroni", n = length(dat$P_origin)), p.adjust(dat$P_color, method = "bonferroni", n = length(dat$P_color)), p.adjust(dat$P_count, method = "bonferroni", n = length(dat$P_count)))
colnames(dat2) <- c("CHROM", "POS", "REF", "ALT", "P_origin_Bonf", "P_color_Bonf", "P_count_Bonf")


# Manhattan plot for ORIGIN
datO <- data.frame(dat2$CHROM, dat2$POS, dat2$POS, dat2$P_origin_Bonf)
colnames(datO) <- c("SNP", "CHR", "BP", "P")


don <- datO

CHR = datO$CHR
P = datO$P
SNP = datO$SNP
BP = datO$BP

ggplot(don, aes(x=CHR, y=-log10(P))) +
    
    # Show all points
    geom_point( aes(color=as.factor(CHR)), alpha=0.8, size=1.3) +
    
    ggtitle("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf.copy.logitR_ORIGIN) +
    
  
    # Custom the theme:
    theme_bw() +
    theme( 
      legend.position="none",
      panel.border = element_blank(),
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank()
    )

ggsave("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf.copy.logitR_ORIGIN_ggplot2.png")

# Manhattan plot for COLOR
datC <- data.frame(dat2$CHROM, dat2$POS, dat2$POS, dat2$P_color_Bonf)
colnames(datC) <- c("SNP", "CHR", "BP", "P")


don <- datC

CHR = datC$CHR
P = datC$P
SNP = datC$SNP
BP = datC$BP

ggplot(don, aes(x=CHR, y=-log10(P))) +
    
    # Show all points
    geom_point( aes(color=as.factor(CHR)), alpha=0.8, size=1.3) +
    
      ggtitle("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf.copy.logitR_COLOR) +

    # Custom the theme:
    theme_bw() +
    theme( 
      legend.position="none",
      panel.border = element_blank(),
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank()
    )

ggsave("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf.copy.logitR_COLOR_ggplot2.png")


# Manhattan plot for NUMBER_OF_INDIVIDUALS
datI <- data.frame(dat2$CHROM, dat2$POS, dat2$POS, dat2$P_count_Bonf)
colnames(datI) <- c("SNP", "CHR", "BP", "P")


don <- datI

CHR = datI$CHR
P = datI$P
SNP = datI$SNP
BP = datI$BP

ggplot(don, aes(x=CHR, y=-log10(P))) +
    
    # Show all points
    geom_point( aes(color=as.factor(CHR)), alpha=0.8, size=1.3) +
    
      ggtitle("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf.copy.logitR_NUMBER_OF_INDIVIDUALS) +

    # Custom the theme:
    theme_bw() +
    theme( 
      legend.position="none",
      panel.border = element_blank(),
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank()
    )

ggsave("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf.copy.logitR_NUMBER_OF_INDIVIDUALS_ggplot2.png")


