#!/usr/bin/env Rscript

for_rerun <- read.table("for_rerun.txt", header=T)
head(for_rerun)

ok <- read.table("input_glm_split_with_iteration_results_for_rerun_01_02_03_04_05_06_19_ok.txt", header=F)
head(ok)

for_rererun <- for_rerun[!for_rerun$V2 %in% ok$V2, , drop = FALSE]

write.table(for_rererun, "for_rererun.txt")
