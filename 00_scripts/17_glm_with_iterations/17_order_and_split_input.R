#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified/")


df <- read.table("input_glm_tuckey_without_iteration.txt", header=T)
df2 <- df[order(df$SNP),]
names(df2) <- NULL
write.table(df2, file ="input_glm_tuckey_without_iteration_order.txt")
system('split -d -l 2217162 input_glm_tuckey_without_iteration_order.txt input_glm_tuckey_without_iteration_order_split_')
