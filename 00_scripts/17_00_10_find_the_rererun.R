#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified/")

all <- read.table("input_glm_split_with_iteration_all", header=F)

ok <- read.table("input_glm_split_with_iteration_results_for_rerun_00_01_02_03_04_05_06_07_08_09_10_11_12_13_14_15_16_17_18_rerun_01_02_03_04_05_06_19_ok.txt", header=F)

for_rerun <- all[!all$V2 %in% ok$V2, , drop = FALSE]

write.table(for_rererun, "for_rererun.txt")
