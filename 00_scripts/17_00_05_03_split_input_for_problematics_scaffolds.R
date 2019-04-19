#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified/")

system('split -d -l 12000000 for_rerun.txt input_glm_split_with_iteration_for_rerun_')
