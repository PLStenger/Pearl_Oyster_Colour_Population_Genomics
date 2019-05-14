#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified")

ok <- read.table("input_glm_tuckey_without_iteration_order_for_second_round_results_01.txt_ok.txt", header=F)
head(ok)
all <- read.table("input_glm_tuckey_without_iteration_order_for_second_round.txt", header=F, skip=1)
head(all)

for_rererererun <- all[!all$V3 %in% ok$V2, , drop = FALSE]
write.table(for_rererererun, "input_glm_tuckey_without_iteration_order_for_third_round.txt")
