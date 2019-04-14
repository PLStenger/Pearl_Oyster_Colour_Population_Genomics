#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified/")


df <- read.table("df.txt", header=T)
df2 <- df[order(df$SNP),]
names(df2) <- NULL
write.table(df2, file ="df2.txt")
system('split -d -l 2400000 df2.txt input_glm_split_with_iteration_')
