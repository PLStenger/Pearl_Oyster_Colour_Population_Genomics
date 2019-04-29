#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified")

for_rerun <- read.table("input_glm_split_with_iteration_all", header=F)
head(for_rerun)

ok <- read.table("all_results_ok_from_glm_with_iteration_unique_final.txt", header=T)
head(ok)

for_rererun <- for_rerun[for_rerun$V2 %in% ok$V2, , drop = FALSE]

write.table(for_rererun, "les_fucking_derniers_qui_ne_passent_pas_et_qui_casse_les.txt")
