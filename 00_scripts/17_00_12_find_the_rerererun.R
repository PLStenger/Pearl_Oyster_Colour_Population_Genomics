#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified")

for_rererun <- read.table("for_rererun.txt", header=T)
head(for_rererun)

ok <- read.table("input_glm_split_with_iteration_for_rererun_ok.txt", header=F)
head(ok)

for_rerererun <- for_rererun[!for_rererun$V2 %in% ok$V2, , drop = FALSE]

write.table(for_rerererun, "for_rerererun.txt")
