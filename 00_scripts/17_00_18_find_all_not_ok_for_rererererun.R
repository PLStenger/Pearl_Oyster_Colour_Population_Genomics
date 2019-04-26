#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified")

ok <- read.table("all_results_ok_from_glm_with_iteration_only_SNP_name.txt")
okok <- data.frame(ok$SNP, ok$SNP)
colnames(okok) <- c("V1", "V2")
all <- read.table("input_glm_split_with_iteration_all")

for_rererererun <- all[!all$V2 %in% okok$V2, , drop = FALSE]
write.table(for_rererererun, "for_rererererun.txt")
