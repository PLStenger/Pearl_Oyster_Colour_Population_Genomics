#!/bin/bash

#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g



DATADIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified
#DATAOUTPUT=/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_fastqc_raw_data
SCRIPT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/17_glm_with_iterations
#HEADER=/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/header.txt
SNP=$SNP
linfct=$linfct
test=$test
pvalues=$pvalues



for FILE in $(ls $DATADIRECTORY/input_glm_tuckey_without_iteration_order_split_*)
do
        echo "#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified/")

library(readr)
library(dplyr)
library(tidyr)
library(stringr)
library(multcomp)
library(foreach)
library(doParallel)" >> $SCRIPT/script_loop_${FILE##*/}.R ;
        echo "df <- read.table("${FILE##*/}", header=F)"  >> $SCRIPT/script_loop_${FILE##*/}.R ;
        echo "colnames(df) <- c("nothing", "SNP", "Site", "Color", "Frequence")
head(df)

registerDoParallel()

  foreach(i=1:length(unique(df$SNP)), .combine=c) %dopar% {
    sink("${FILE##*/}_results_00.txt", append=TRUE)
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




registerDoSEQ()"  >> $SCRIPT/script_loop_${FILE##*/}.R ;

done ;


