#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified/")

library(readr)
library(dplyr)
library(tidyr)
library(stringr)
library(multcomp)
library(foreach)
library(doParallel)

df <- read.table("input_glm_split_with_iteration_for_rerererun_02", header=F)
colnames(df) <- c("nb", "nothing", "SNP", "Site", "Color", "Frequence")
head(df)

registerDoParallel()

  foreach(i=1:length(unique(df$SNP)), .combine=c) %dopar% {
    sink("input_glm_split_with_iteration_results_from_rerererun_02.txt", append=TRUE)
    SNP_name <- as.character(unique(df$SNP)[i])
    ok <- filter(df, df$SNP  == unique(df$SNP)[i])
    mod <- glm(Frequence ~ Color + Site, data = ok)
    K1 <- glht(mod, mcp(Color = "Tukey"))$linfct
    K2 <- glht(mod, mcp(Site = "Tukey"))$linfct
    pvaleur <- summary(glht(mod, linfct = rbind(K1, K2)))$test$pvalues[1:9]
    pvaleur <- c(pvaleur)
    test <- c(SNP_name, pvaleur)
    test2 <- data.frame(as.list(test))
    names(test2) <- NULL
    print(test2, row.names=FALSE)
    sink()
  }




registerDoSEQ()
