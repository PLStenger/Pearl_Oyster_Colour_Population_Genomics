#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified")

all_results_ok <- read.table("all_results_ok_from_glm_with_iteration.txt")
print("length(all_results_ok$V2)")
length(all_results_ok$V2)
print("length(unique(all_results_ok$V2))")
length(unique(all_results_ok$V2))
dat <- data.frame(unique(all_results_ok$V2))
colnames(dat) <- "SNP"

write.table(dat, "all_results_ok_from_glm_with_iteration_only_SNP_name.txt")
