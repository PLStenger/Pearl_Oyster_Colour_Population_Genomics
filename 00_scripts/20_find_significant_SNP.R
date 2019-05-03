#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified")

dat <- read.table("all_results_ok_from_glm_with_iteration_unique_final_1000.txt", header=T)
head(dat)

attach(dat)

print("dat$RedVsGreen <- as.numeric(dat$RedVsGreen)")
dat$RedVsGreen <- as.numeric(dat$RedVsGreen)
#dat$YellowVsGreen <- as.numeric(dat$YellowVsGreen)
#dat$YellowVsRed <- as.numeric(dat$YellowVsRed)
#dat$HatcheryVsGambier <- as.numeric(dat$HatcheryVsGambier)
#dat$KatiuVsGambier <- as.numeric(dat$KatiuVsGambier)
#dat$TakapotoVsGambier <- as.numeric(dat$TakapotoVsGambier)
#dat$KatiuVsHatchery <- as.numeric(dat$KatiuVsHatchery)
#dat$TakapotoVsHatchery <- as.numeric(dat$TakapotoVsHatchery)
#dat$TakapotoVsKatiu <- as.numeric(dat$TakapotoVsKatiu)


######################################################################################################
## RedVsGreen
print("head(dat$RedVsGreen)")
head(dat$RedVsGreen)

print("max(dat$RedVsGreen)")
max(dat$RedVsGreen)

print("datRedVsGreen <- subset(dat, dat$RedVsGreen<0.000001)")
datRedVsGreen <- subset(dat, dat$RedVsGreen<0.000001)
print("head(datRedVsGreen)")
head(datRedVsGreen)


write.table(datRedVsGreen$SNP, "RedVsGreen_P_0_000001.txt")
#datRedVsGreen <- subset(dat, dat$RedVsGreen<0.001)
#write.table(datRedVsGreen$SNP, "RedVsGreen_P_0_001.txt")
#datRedVsGreen <- subset(dat, dat$RedVsGreen<0.01)
#write.table(datRedVsGreen$SNP, "RedVsGreen_P_0_01.txt")

#######################################################################################################
### YellowVsGreen
#datYellowVsGreen <- subset(dat, dat$YellowVsGreen<0.000001)
#write.table(datYellowVsGreen$SNP, "YellowVsGreen_P_0_000001.txt")
#datYellowVsGreen <- subset(dat, dat$YellowVsGreen<0.001)
#write.table(datYellowVsGreen$SNP, "YellowVsGreen_P_0_001.txt")
#datYellowVsGreen <- subset(dat, dat$YellowVsGreen<0.01)
#write.table(datYellowVsGreen$SNP, "YellowVsGreen_P_0_01.txt")
#
#######################################################################################################
### YellowVsRed
#datYellowVsRed <- subset(dat, dat$YellowVsRed<0.000001)
#write.table(datYellowVsRed$SNP, "YellowVsRed_P_0_000001.txt")
#datYellowVsRed <- subset(dat, dat$YellowVsRed<0.001)
#write.table(datYellowVsRed$SNP, "YellowVsRed_P_0_001.txt")
#datYellowVsRed <- subset(dat, dat$YellowVsRed<0.01)
#write.table(datYellowVsRed$SNP, "YellowVsRed_P_0_01.txt")
#
#
#######################################################################################################
### HatcheryVsGambier
#datHatcheryVsGambier <- subset(dat, dat$HatcheryVsGambier<0.000001)
#write.table(datHatcheryVsGambier$SNP, "HatcheryVsGambier_P_0_000001.txt")
#datHatcheryVsGambier <- subset(dat, dat$HatcheryVsGambier<0.001)
#write.table(datHatcheryVsGambier$SNP, "HatcheryVsGambier_P_0_001.txt")
#datHatcheryVsGambier <- subset(dat, dat$HatcheryVsGambier<0.01)
#write.table(datHatcheryVsGambier$SNP, "HatcheryVsGambier_P_0_01.txt")
#
#######################################################################################################
### KatiuVsGambier
#datKatiuVsGambier <- subset(dat, dat$KatiuVsGambier<0.000001)
#write.table(datKatiuVsGambier$SNP, "KatiuVsGambier_P_0_000001.txt")
#datKatiuVsGambier <- subset(dat, dat$KatiuVsGambier<0.001)
#write.table(datKatiuVsGambier$SNP, "KatiuVsGambier_P_0_001.txt")
#datKatiuVsGambier <- subset(dat, dat$KatiuVsGambier<0.01)
#write.table(datKatiuVsGambier$SNP, "KatiuVsGambier_P_0_01.txt")
#
#######################################################################################################
### TakapotoVsGambier
#datTakapotoVsGambier <- subset(dat, dat$TakapotoVsGambier<0.000001)
#write.table(datTakapotoVsGambier$SNP, "TakapotoVsGambier_P_0_000001.txt")
#datTakapotoVsGambier <- subset(dat, dat$TakapotoVsGambier<0.001)
#write.table(datTakapotoVsGambier$SNP, "TakapotoVsGambier_P_0_001.txt")
#datTakapotoVsGambier <- subset(dat, dat$TakapotoVsGambier<0.01)
#write.table(datTakapotoVsGambier$SNP, "TakapotoVsGambier_P_0_01.txt")
#
#######################################################################################################
### KatiuVsHatchery
#datKatiuVsHatchery <- subset(dat, dat$KatiuVsHatchery<0.000001)
#write.table(datKatiuVsHatchery$SNP, "KatiuVsHatchery_P_0_000001.txt")
#datKatiuVsHatchery <- subset(dat, dat$KatiuVsHatchery<0.001)
#write.table(datKatiuVsHatchery$SNP, "KatiuVsHatchery_P_0_001.txt")
#datKatiuVsHatchery <- subset(dat, dat$KatiuVsHatchery<0.01)
#write.table(datKatiuVsHatchery$SNP, "KatiuVsHatchery_P_0_01.txt")
#
#######################################################################################################
### TakapotoVsHatchery
#datTakapotoVsHatchery <- subset(dat, dat$TakapotoVsHatchery<0.000001)
#write.table(datTakapotoVsHatchery$SNP, "TakapotoVsHatchery_P_0_000001.txt")
#datTakapotoVsHatchery <- subset(dat, dat$TakapotoVsHatchery<0.001)
#write.table(datTakapotoVsHatchery$SNP, "TakapotoVsHatchery_P_0_001.txt")
#datTakapotoVsHatchery <- subset(dat, dat$TakapotoVsHatchery<0.01)
#write.table(datTakapotoVsHatchery$SNP, "TakapotoVsHatchery_P_0_01.txt")
#
#######################################################################################################
### TakapotoVsKatiu
#datTakapotoVsKatiu <- subset(dat, dat$TakapotoVsKatiu<0.000001)
#write.table(datTakapotoVsKatiu$SNP, "TakapotoVsKatiu_P_0_000001.txt")
#datTakapotoVsKatiu <- subset(dat, dat$TakapotoVsKatiu<0.001)
#write.table(datTakapotoVsKatiu$SNP, "TakapotoVsKatiu_P_0_001.txt")
#datTakapotoVsKatiu <- subset(dat, dat$TakapotoVsKatiu<0.01)
#write.table(datTakapotoVsKatiu$SNP, "TakapotoVsKatiu_P_0_01.txt")
