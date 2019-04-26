#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified/")

dat <- read.table("all_results_ok_from_glm_with_iteration_3.txt", header=F)
dat2 <- dat[!duplicated(dat$V2), ]
colnames(dat2) <- c("Ten", "SNP", "RedVsGreen", "YellowVsGreen", "YellowVsRed", "HatcheryVsGambier", "KatiuVsGambier", "TakapotoVsGambier", "KatiuVsHatchery","TakapotoVsHatchery", "TakapotoVsKatiu") 
write.table(dat2, "all_results_ok_from_glm_with_iteration_unique_final.txt")
