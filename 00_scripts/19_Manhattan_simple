#!/usr/bin/env Rscript

setwd("/home1/scratch/creisser/PL_BAM_MD/")


dat <- read.table("individuals.vcf_DP10_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf.copy.modif_chi2_v3", header=T)
dat2 <- data.frame(dat$CHROM, dat$POS, dat$POS, dat$P)
colnames(dat2) <- c("SNP", "CHR", "BP", "P")

plot(dat2$BP, dat2$P)
