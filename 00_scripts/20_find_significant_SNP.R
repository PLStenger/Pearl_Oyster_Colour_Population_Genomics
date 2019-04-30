#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_glm_tuckey")

dat <- read.table("all_results_ok_from_glm_with_iteration_unique_final.txt", header=T)
head(dat)

dat$RedVsGreen <- as.numeric(dat$RedVsGreen)
dat$YellowVsGreen <- as.numeric(dat$YellowVsGreen)
dat$YellowVsRed <- as.numeric(dat$YellowVsRed)
dat$HatcheryVsGambier <- as.numeric(dat$HatcheryVsGambier)
dat$KatiuVsGambier <- as.numeric(dat$KatiuVsGambier)
dat$TakapotoVsGambier <- as.numeric(dat$TakapotoVsGambier)
dat$KatiuVsHatchery <- as.numeric(dat$KatiuVsHatchery)
dat$TakapotoVsHatchery <- as.numeric(dat$TakapotoVsHatchery)
dat$TakapotoVsKatiu <- as.numeric(dat$TakapotoVsKatiu)


######################################################################################################
## RedVsGreen
datRedVsGreen <- subset(dat, RedVsGreen<0.000001)
write.table(datRedVsGreen$SNP, "RedVsGreen_P_0_000001.txt")
datRedVsGreen <- subset(dat, RedVsGreen<0.001)
write.table(datRedVsGreen$SNP, "RedVsGreen_P_0_001.txt")
datRedVsGreen <- subset(dat, RedVsGreen<0.01)
write.table(datRedVsGreen$SNP, "RedVsGreen_P_0_01.txt")

######################################################################################################
## YellowVsGreen
datYellowVsGreen <- subset(dat, YellowVsGreen<0.000001)
write.table(datYellowVsGreen$SNP, "YellowVsGreen_P_0_000001.txt")
datYellowVsGreen <- subset(dat, YellowVsGreen<0.001)
write.table(datYellowVsGreen$SNP, "YellowVsGreen_P_0_001.txt")
datYellowVsGreen <- subset(dat, YellowVsGreen<0.01)
write.table(datYellowVsGreen$SNP, "YellowVsGreen_P_0_01.txt")

######################################################################################################
## YellowVsRed
datYellowVsRed <- subset(dat, YellowVsRed<0.000001)
write.table(datYellowVsRed$SNP, "YellowVsRed_P_0_000001.txt")
datYellowVsRed <- subset(dat, YellowVsRed<0.001)
write.table(datYellowVsRed$SNP, "YellowVsRed_P_0_001.txt")
datYellowVsRed <- subset(dat, YellowVsRed<0.01)
write.table(datYellowVsRed$SNP, "YellowVsRed_P_0_01.txt")


######################################################################################################
## HatcheryVsGambier
datHatcheryVsGambier <- subset(dat, HatcheryVsGambier<0.000001)
write.table(datHatcheryVsGambier$SNP, "HatcheryVsGambier_P_0_000001.txt")
datHatcheryVsGambier <- subset(dat, HatcheryVsGambier<0.001)
write.table(datHatcheryVsGambier$SNP, "HatcheryVsGambier_P_0_001.txt")
datHatcheryVsGambier <- subset(dat, HatcheryVsGambier<0.01)
write.table(datHatcheryVsGambier$SNP, "HatcheryVsGambier_P_0_01.txt")

######################################################################################################
## KatiuVsGambier
datKatiuVsGambier <- subset(dat, KatiuVsGambier<0.000001)
write.table(datKatiuVsGambier$SNP, "KatiuVsGambier_P_0_000001.txt")
datKatiuVsGambier <- subset(dat, KatiuVsGambier<0.001)
write.table(datKatiuVsGambier$SNP, "KatiuVsGambier_P_0_001.txt")
datKatiuVsGambier <- subset(dat, KatiuVsGambier<0.01)
write.table(datKatiuVsGambier$SNP, "KatiuVsGambier_P_0_01.txt")

######################################################################################################
## TakapotoVsGambier
datTakapotoVsGambier <- subset(dat, TakapotoVsGambier<0.000001)
write.table(datTakapotoVsGambier$SNP, "TakapotoVsGambier_P_0_000001.txt")
datTakapotoVsGambier <- subset(dat, TakapotoVsGambier<0.001)
write.table(datTakapotoVsGambier$SNP, "TakapotoVsGambier_P_0_001.txt")
datTakapotoVsGambier <- subset(dat, TakapotoVsGambier<0.01)
write.table(datTakapotoVsGambier$SNP, "TakapotoVsGambier_P_0_01.txt")

######################################################################################################
## KatiuVsHatchery
datKatiuVsHatchery <- subset(dat, KatiuVsHatchery<0.000001)
write.table(datKatiuVsHatchery$SNP, "KatiuVsHatchery_P_0_000001.txt")
datKatiuVsHatchery <- subset(dat, KatiuVsHatchery<0.001)
write.table(datKatiuVsHatchery$SNP, "KatiuVsHatchery_P_0_001.txt")
datKatiuVsHatchery <- subset(dat, KatiuVsHatchery<0.01)
write.table(datKatiuVsHatchery$SNP, "KatiuVsHatchery_P_0_01.txt")

######################################################################################################
## TakapotoVsHatchery
datTakapotoVsHatchery <- subset(dat, TakapotoVsHatchery<0.000001)
write.table(datTakapotoVsHatchery$SNP, "TakapotoVsHatchery_P_0_000001.txt")
datTakapotoVsHatchery <- subset(dat, TakapotoVsHatchery<0.001)
write.table(datTakapotoVsHatchery$SNP, "TakapotoVsHatchery_P_0_001.txt")
datTakapotoVsHatchery <- subset(dat, TakapotoVsHatchery<0.01)
write.table(datTakapotoVsHatchery$SNP, "TakapotoVsHatchery_P_0_01.txt")

######################################################################################################
## TakapotoVsKatiu
datTakapotoVsKatiu <- subset(dat, TakapotoVsKatiu<0.000001)
write.table(datTakapotoVsKatiu$SNP, "TakapotoVsKatiu_P_0_000001.txt")
datTakapotoVsKatiu <- subset(dat, TakapotoVsKatiu<0.001)
write.table(datTakapotoVsKatiu$SNP, "TakapotoVsKatiu_P_0_001.txt")
datTakapotoVsKatiu <- subset(dat, TakapotoVsKatiu<0.01)
write.table(datTakapotoVsKatiu$SNP, "TakapotoVsKatiu_P_0_01.txt")
