#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified")

for_rerererun <- read.table("for_rerererun.txt", header=T)
head(for_rerererun)

ok <- read.table("input_glm_split_with_iteration_results_from_rerererun_00_01_02_03_04_05_06_07_08_09_10_11_ok.txt", header=F)
head(ok)

for_rererererun <- for_rerererun[!for_rerererun$V2 %in% ok$V2, , drop = FALSE]

write.table(for_rererererun, "for_rererererun.txt")
