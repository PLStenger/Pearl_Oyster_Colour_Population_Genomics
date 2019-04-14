#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified/")

library(readr)
library(dplyr)
library(tidyr)
library(stringr)
library(multcomp)


vcf <- read.table("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt")
colnames(vcf) <- c("SNP", "CHROM","POS","ID","REF","ALT","QUAL", "Nothing", "Decomplexed",
                   "pool9KV","pool6GV","pool4GR","pool8KJ","pool2TJ",
                   "pool10ER","pool5GJ","pool1TR","pool7KR","pool3TV",
                   "pool11EJ","pool12EV")

AF_pool9KV  <- read.table("AF_pool9KV.txt")
AF_pool6GV  <- read.table("AF_pool6GV.txt")
AF_pool4GR  <- read.table("AF_pool4GR.txt")
AF_pool8KJ  <- read.table("AF_pool8KJ.txt")
AF_pool2TJ  <- read.table("AF_pool2TJ.txt")
AF_pool10ER <- read.table("AF_pool10ER.txt")
AF_pool5GJ  <- read.table("AF_pool5GJ.txt")
AF_pool1TR  <- read.table("AF_pool1TR.txt")
AF_pool7KR  <- read.table("AF_pool7KR.txt")
AF_pool3TV  <- read.table("AF_pool3TV.txt")
AF_pool11EJ <- read.table("AF_pool11EJ.txt")
AF_pool12EV <- read.table("AF_pool12EV.txt")


AF <- data.frame(vcf$SNP, AF_pool9KV, AF_pool6GV, AF_pool4GR, AF_pool8KJ, AF_pool2TJ, AF_pool10ER, AF_pool5GJ, AF_pool1TR, AF_pool7KR, AF_pool3TV, AF_pool11EJ, AF_pool12EV) 
colnames(AF) <- c("SNP", "Katiu_Green", "Gambier_Green", "Gambier_Red", "Katiu_Yellow", "Takapoto_Yellow", "Hatchery_Red", "Gambier_Yellow", 
                  "Takapoto_Red", "Katiu_Red", "Takapoto_Green", "Hatchery_Yellow", "Hatchery_Green") 

write.table(AF, file ="input_glm_tuckey_without_iteration_before_gather.txt")

dat <- gather(AF, condition, frequence, -SNP)
condition <- data.frame(str_split_fixed(dat$condition, "_", 2))
df <- data.frame(dat$SNP, condition$X1, condition$X2, dat$frequence)
colnames(df) <- c("SNP", "Site", "Color", "Frequence")


write.table(df, file ="input_glm_tuckey_without_iteration.txt")
