#!/usr/bin/env Rscript

# This script is for individuals, with Chi2 on VvsR, VvsJ and RvsJ

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_chi2")

library(ggplot2)
library(dplyr)


dat <- read.table("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf._chi2", skip=1)
colnames(dat) <- c("CHROM", "POS", "REF", "ALT", "raw_pval_VvsR", "raw_pval_VvsJ", "raw_pval_RvsJ")

# Bonferroni correction for Pvalue (Chi2) 
dat2 <- data.frame(dat$CHROM, dat$POS, dat$REF, dat$ALT,p.adjust(dat$raw_pval_VvsR, method = "bonferroni", n = length(dat$raw_pval_VvsR)), p.adjust(dat$raw_pval_VvsJ, method = "bonferroni", n = length(dat$raw_pval_VvsJ)), p.adjust(dat$raw_pval_RvsJ, method = "bonferroni", n = length(dat$raw_pval_RvsJ)))
colnames(dat2) <- c("CHROM", "POS", "REF", "ALT", "pval_VvsR_Bonf", "pval_VvsJ_Bonf", "pval_RvsJ_Bonf")


# Manhattan plot for pval_VvsR_Bonf
datO <- data.frame(dat2$CHROM, dat2$POS, dat2$POS, dat2$pval_VvsR_Bonf)
colnames(datO) <- c("SNP", "CHR", "BP", "P")


don <- datO

CHR = datO$CHR
P = datO$P
SNP = datO$SNP
BP = datO$BP

ggplot(don, aes(x=CHR, y=-log10(P))) +
    
    # Show all points
    geom_point( aes(color=as.factor(CHR)), alpha=0.8, size=1.3) +
    
    ggtitle("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf._chi2_pval_VvsR_Bonf") +
    
  
    # Custom the theme:
    theme_bw() +
    theme( 
      legend.position="none",
      panel.border = element_blank(),
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank()
    )

ggsave("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf._chi2_pval_VvsR_Bonf_ggplot2.png")

# Manhattan plot for pval_VvsJ_Bonf
datC <- data.frame(dat2$CHROM, dat2$POS, dat2$POS, dat2$pval_VvsJ_Bonf)
colnames(datC) <- c("SNP", "CHR", "BP", "P")


don <- datC

CHR = datC$CHR
P = datC$P
SNP = datC$SNP
BP = datC$BP

ggplot(don, aes(x=CHR, y=-log10(P))) +
    
    # Show all points
    geom_point( aes(color=as.factor(CHR)), alpha=0.8, size=1.3) +
    
      ggtitle("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf._chi2_pval_VvsJ_Bonf") +

    # Custom the theme:
    theme_bw() +
    theme( 
      legend.position="none",
      panel.border = element_blank(),
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank()
    )

ggsave("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf._chi2_pval_VvsJ_Bonf_ggplot2.png")


# Manhattan plot for pval_RvsJ_Bonf
datI <- data.frame(dat2$CHROM, dat2$POS, dat2$POS, dat2$pval_RvsJ_Bonf)
colnames(datI) <- c("SNP", "CHR", "BP", "P")


don <- datI

CHR = datI$CHR
P = datI$P
SNP = datI$SNP
BP = datI$BP

ggplot(don, aes(x=CHR, y=-log10(P))) +
    
    # Show all points
    geom_point( aes(color=as.factor(CHR)), alpha=0.8, size=1.3) +
    
      ggtitle("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf._chi2_pval_RvsJ_Bonf") +

    # Custom the theme:
    theme_bw() +
    theme( 
      legend.position="none",
      panel.border = element_blank(),
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank()
    )

ggsave("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf._chi2_pval_RvsJ_Bonf_ggplot2.png")
