#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified")

ok <- read.table("input_glm_split_with_iteration_for_rererun_ok.txt", header=F)
head(ok)
all <- read.table("for_rererererun.txt")

for_rererererun <- all[!all$V2 %in% ok$V2, , drop = FALSE]
write.table(for_rererererun, "for_rerererererun_final.txt")
