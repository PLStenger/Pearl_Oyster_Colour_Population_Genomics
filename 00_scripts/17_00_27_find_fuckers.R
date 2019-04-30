#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified")

dat <- read.table("input_glm_split_with_iteration_all", header=F)
head(dat)
length(unique(dat$V2))


#for_rerun <- read.table("input_glm_split_with_iteration_all", header=F)
#head(for_rerun)

#ok <- read.table("all_results_ok_from_glm_with_iteration_unique_final.txt", header=T)
#colnames(ok) <- c("V1", "V2", "V3", "V4", "V5", "V6", "V7", "V8", "V9", "V10", "V11")
#head(ok)

#for_rererun <- for_rerun[!for_rerun$V2 %in% ok$V2, , drop = FALSE]

#write.table(for_rererun, "les_fucking_derniers_qui_ne_passent_pas_et_qui_casse_les.txt")
