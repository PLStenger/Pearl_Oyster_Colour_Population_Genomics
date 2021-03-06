#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_chi2")

library(ggplot2)
library(dplyr)


dat <- read.table("individuals.vcf_DP10_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf.copy.modif_chi2_v3", skip=1)
colnames(dat) <- c("CHROM", "POS", "REF", "ALT", "P")
dat2 <- data.frame(dat$CHROM, dat$POS, dat$POS, dat$P)
colnames(dat2) <- c("SNP", "CHR", "BP", "P")

don <- dat2

CHR = dat2$CHR
P = dat2$P
SNP = dat2$SNP
BP = dat2$BP

ggplot(don, aes(x=CHR, y=-log10(P))) +
    
    # Show all points
    geom_point( aes(color=as.factor(CHR)), alpha=0.8, size=1.3) +
    
  
    # Custom the theme:
    theme_bw() +
    theme( 
      legend.position="none",
      panel.border = element_blank(),
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank()
    )

ggsave("individuals.vcf_DP10_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf.copy.modif_chi2_v3_ggplot2.png")


dat <- read.table("merged_bam_ryg_paralell_DP50_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf.modif_chi2_v4", skip=1)
colnames(dat) <- c("CHROM", "POS", "REF", "ALT", "P")
dat2 <- data.frame(dat$CHROM, dat$POS, dat$POS, dat$P)
colnames(dat2) <- c("SNP", "CHR", "BP", "P")

don <- dat2

CHR = dat2$CHR
P = dat2$P
SNP = dat2$SNP
BP = dat2$BP

ggplot(don, aes(x=CHR, y=-log10(P))) +
    
    # Show all points
    geom_point( aes(color=as.factor(CHR)), alpha=0.8, size=1.3) +
    
  
    # Custom the theme:
    theme_bw() +
    theme( 
      legend.position="none",
      panel.border = element_blank(),
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank()
    )

ggsave("merged_bam_ryg_paralell_DP50_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf.modif_chi2_v4_ggplot2.png")

