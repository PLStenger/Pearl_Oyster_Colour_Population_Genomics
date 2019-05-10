#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/09_snpEff_glm")


import_annoted_files2 <- function(path_file) {
  #AF9_ann<- import_annoted_files(paste0(basePath,"output/AF9_SNP_ann_clean.txt"))
  tableau <- read.table(path_file, header = FALSE, dec = ".", sep = "\t", stringsAsFactors=F, fill =TRUE)
  if (ncol(tableau)>6) {
    tableau <- tableau[,-c(7:ncol(tableau))]
    colnames(tableau) <- tableau[1,]
    tableau <- tableau[-c(1,2),]
    if ( length(which(tableau$ALT == "") ) !=0) {
      tableau <- tableau[-which(tableau$ALT == ""),]
    }
    colnames(tableau)[1] <- "pos"
  } else {
    colnames(tableau) <- tableau[1,]
    tableau <- tableau[-c(1,2),]
    if ( length(which(tableau$ALT == "") ) !=0) {
      tableau <- tableau[-which(tableau$ALT == ""),]
    }
    colnames(tableau)[1] <- "pos"
  }
  return(tableau)
}

library(ggplot2)
library(gridExtra)

TakapotoVsGambier_OK_dat_P_0_001 <- import_annoted_files2("TakapotoVsGambier_OK_dat_P_0_001_SNPEff_SnpSift.txt")
HatcheryVsGambier_OK_dat_P_0_000001 <- import_annoted_files2("HatcheryVsGambier_OK_dat_P_0_000001_SNPEff_SnpSift.txt")
TakapotoVsGambier_OK_dat_P_0_01 <- import_annoted_files2("TakapotoVsGambier_OK_dat_P_0_01_SNPEff_SnpSift.txt")
HatcheryVsGambier_OK_dat_P_0_001 <- import_annoted_files2("HatcheryVsGambier_OK_dat_P_0_001_SNPEff_SnpSift.txt")
TakapotoVsHatchery_OK_dat_P_0_000001 <- import_annoted_files2("TakapotoVsHatchery_OK_dat_P_0_000001_SNPEff_SnpSift.txt")
HatcheryVsGambier_OK_dat_P_0_01 <- import_annoted_files2("HatcheryVsGambier_OK_dat_P_0_01_SNPEff_SnpSift.txt")
TakapotoVsHatchery_OK_dat_P_0_001 <- import_annoted_files2("TakapotoVsHatchery_OK_dat_P_0_001_SNPEff_SnpSift.txt")
KatiuVsGambier_OK_dat_P_0_000001 <- import_annoted_files2("KatiuVsGambier_OK_dat_P_0_000001_SNPEff_SnpSift.txt")
TakapotoVsHatchery_OK_dat_P_0_01 <- import_annoted_files2("TakapotoVsHatchery_OK_dat_P_0_01_SNPEff_SnpSift.txt")
KatiuVsGambier_OK_dat_P_0_001 <- import_annoted_files2("KatiuVsGambier_OK_dat_P_0_001_SNPEff_SnpSift.txt")
TakapotoVsKatiu_OK_dat_P_0_000001 <- import_annoted_files2("TakapotoVsKatiu_OK_dat_P_0_000001_SNPEff_SnpSift.txt")
KatiuVsGambier_OK_dat_P_0_01 <- import_annoted_files2("KatiuVsGambier_OK_dat_P_0_01_SNPEff_SnpSift.txt")
TakapotoVsKatiu_OK_dat_P_0_001 <- import_annoted_files2("TakapotoVsKatiu_OK_dat_P_0_001_SNPEff_SnpSift.txt")
KatiuVsHatchery_OK_dat_P_0_000001 <- import_annoted_files2("KatiuVsHatchery_OK_dat_P_0_000001_SNPEff_SnpSift.txt")
TakapotoVsKatiu_OK_dat_P_0_01 <- import_annoted_files2("TakapotoVsKatiu_OK_dat_P_0_01_SNPEff_SnpSift.txt")
KatiuVsHatchery_OK_dat_P_0_001 <- import_annoted_files2("KatiuVsHatchery_OK_dat_P_0_001_SNPEff_SnpSift.txt")
YellowVsGreen_OK_dat_P_0_000001 <- import_annoted_files2("YellowVsGreen_OK_dat_P_0_000001_SNPEff_SnpSift.txt")
KatiuVsHatchery_OK_dat_P_0_01 <- import_annoted_files2("KatiuVsHatchery_OK_dat_P_0_01_SNPEff_SnpSift.txt")
YellowVsGreen_OK_dat_P_0_001 <- import_annoted_files2("YellowVsGreen_OK_dat_P_0_001_SNPEff_SnpSift.txt")
RedVsGreen_OK_dat_P_0_000001 <- import_annoted_files2("RedVsGreen_OK_dat_P_0_000001_SNPEff_SnpSift.txt")
YellowVsGreen_OK_dat_P_0_01 <- import_annoted_files2("YellowVsGreen_OK_dat_P_0_01_SNPEff_SnpSift.txt")
RedVsGreen_OK_dat_P_0_001 <- import_annoted_files2("RedVsGreen_OK_dat_P_0_001_SNPEff_SnpSift.txt")
YellowVsRed_OK_dat_P_0_000001 <- import_annoted_files2("YellowVsRed_OK_dat_P_0_000001_SNPEff_SnpSift.txt")
RedVsGreen_OK_dat_P_0_01 <- import_annoted_files2("RedVsGreen_OK_dat_P_0_01_SNPEff_SnpSift.txt")
YellowVsRed_OK_dat_P_0_001 <- import_annoted_files2("YellowVsRed_OK_dat_P_0_001_SNPEff_SnpSift.txt")
TakapotoVsGambier_OK_dat_P_0_000001 <- import_annoted_files2("TakapotoVsGambier_OK_dat_P_0_000001_SNPEff_SnpSift.txt")
YellowVsRed_OK_dat_P_0_01 <- import_annoted_files2("YellowVsRed_OK_dat_P_0_01_SNPEff_SnpSift.txt")

head(TakapotoVsGambier_OK_dat_P_0_001)
head(TakapotoVsGambier_OK_dat_P_0_001$pos)
head(TakapotoVsGambier_OK_dat_P_0_001$POS)

length(TakapotoVsGambier_OK_dat_P_0_001$pos)
length(TakapotoVsGambier_OK_dat_P_0_001$POS)

print("head a")
a <- paste(TakapotoVsGambier_OK_dat_P_0_001$pos,TakapotoVsGambier_OK_dat_P_0_001$POS, sep="_")
head(a)

         TakapotoVsGambier_OK_dat_P_0_0012 <- data.frame(a, TakapotoVsGambier_OK_dat_P_0_001$REF, TakapotoVsGambier_OK_dat_P_0_001$ALT, TakapotoVsGambier_OK_dat_P_0_001$`ANN[0].EFFECT`)
colnames(TakapotoVsGambier_OK_dat_P_0_0012) <- c("SNP", "REF", "ALT", "Effect")
head(TakapotoVsGambier_OK_dat_P_0_0012)

         HatcheryVsGambier_OK_dat_P_0_0000012 <- data.frame(paste(
         HatcheryVsGambier_OK_dat_P_0_000001$pos, 
         HatcheryVsGambier_OK_dat_P_0_000001$POS, sep="_"), 
         HatcheryVsGambier_OK_dat_P_0_000001$REF, 
         HatcheryVsGambier_OK_dat_P_0_000001$ALT, 
         HatcheryVsGambier_OK_dat_P_0_000001$`ANN[0].EFFECT`)
colnames(HatcheryVsGambier_OK_dat_P_0_0000012) <- c("SNP", "REF", "ALT", "Effect")
         TakapotoVsGambier_OK_dat_P_0_012 <- data.frame(paste(
         TakapotoVsGambier_OK_dat_P_0_01$pos, 
         TakapotoVsGambier_OK_dat_P_0_01$POS, sep="_"), 
         TakapotoVsGambier_OK_dat_P_0_01$REF, 
         TakapotoVsGambier_OK_dat_P_0_01$ALT, 
         TakapotoVsGambier_OK_dat_P_0_01$`ANN[0].EFFECT`)
colnames(TakapotoVsGambier_OK_dat_P_0_012) <- c("SNP", "REF", "ALT", "Effect")
         HatcheryVsGambier_OK_dat_P_0_0012 <- data.frame(paste(
         HatcheryVsGambier_OK_dat_P_0_001$pos, 
         HatcheryVsGambier_OK_dat_P_0_001$POS, sep="_"), 
         HatcheryVsGambier_OK_dat_P_0_001$REF, 
         HatcheryVsGambier_OK_dat_P_0_001$ALT, 
         HatcheryVsGambier_OK_dat_P_0_001$`ANN[0].EFFECT`)
colnames(HatcheryVsGambier_OK_dat_P_0_0012) <- c("SNP", "REF", "ALT", "Effect")
         TakapotoVsHatchery_OK_dat_P_0_0000012 <- data.frame(paste(
         TakapotoVsHatchery_OK_dat_P_0_000001$pos, 
         TakapotoVsHatchery_OK_dat_P_0_000001$POS, sep="_"), 
         TakapotoVsHatchery_OK_dat_P_0_000001$REF, 
         TakapotoVsHatchery_OK_dat_P_0_000001$ALT, 
         TakapotoVsHatchery_OK_dat_P_0_000001$`ANN[0].EFFECT`)
colnames(TakapotoVsHatchery_OK_dat_P_0_0000012) <- c("SNP", "REF", "ALT", "Effect")
         HatcheryVsGambier_OK_dat_P_0_012 <- data.frame(paste(
         HatcheryVsGambier_OK_dat_P_0_01$pos, 
         HatcheryVsGambier_OK_dat_P_0_01$POS, sep="_"), 
         HatcheryVsGambier_OK_dat_P_0_01$REF, 
         HatcheryVsGambier_OK_dat_P_0_01$ALT, 
         HatcheryVsGambier_OK_dat_P_0_01$`ANN[0].EFFECT`)
colnames(HatcheryVsGambier_OK_dat_P_0_012) <- c("SNP", "REF", "ALT", "Effect")
         TakapotoVsHatchery_OK_dat_P_0_0012 <- data.frame(paste(
         TakapotoVsHatchery_OK_dat_P_0_001$pos, 
         TakapotoVsHatchery_OK_dat_P_0_001$POS, sep="_"), 
         TakapotoVsHatchery_OK_dat_P_0_001$REF, 
         TakapotoVsHatchery_OK_dat_P_0_001$ALT, 
         TakapotoVsHatchery_OK_dat_P_0_001$`ANN[0].EFFECT`)
colnames(TakapotoVsHatchery_OK_dat_P_0_0012) <- c("SNP", "REF", "ALT", "Effect")
         KatiuVsGambier_OK_dat_P_0_0000012 <- data.frame(paste(
         KatiuVsGambier_OK_dat_P_0_000001$pos, 
         KatiuVsGambier_OK_dat_P_0_000001$POS, sep="_"), 
         KatiuVsGambier_OK_dat_P_0_000001$REF, 
         KatiuVsGambier_OK_dat_P_0_000001$ALT, 
         KatiuVsGambier_OK_dat_P_0_000001$`ANN[0].EFFECT`)
colnames(KatiuVsGambier_OK_dat_P_0_0000012) <- c("SNP", "REF", "ALT", "Effect")
         TakapotoVsHatchery_OK_dat_P_0_012 <- data.frame(paste(
         TakapotoVsHatchery_OK_dat_P_0_01$pos, 
         TakapotoVsHatchery_OK_dat_P_0_01$POS, sep="_"), 
         TakapotoVsHatchery_OK_dat_P_0_01$REF, 
         TakapotoVsHatchery_OK_dat_P_0_01$ALT, 
         TakapotoVsHatchery_OK_dat_P_0_01$`ANN[0].EFFECT`)
colnames(TakapotoVsHatchery_OK_dat_P_0_012) <- c("SNP", "REF", "ALT", "Effect")
         KatiuVsGambier_OK_dat_P_0_0012 <- data.frame(paste(
         KatiuVsGambier_OK_dat_P_0_001$pos, 
         KatiuVsGambier_OK_dat_P_0_001$POS, sep="_"), 
         KatiuVsGambier_OK_dat_P_0_001$REF, 
         KatiuVsGambier_OK_dat_P_0_001$ALT, 
         KatiuVsGambier_OK_dat_P_0_001$`ANN[0].EFFECT`)
colnames(KatiuVsGambier_OK_dat_P_0_0012) <- c("SNP", "REF", "ALT", "Effect")
         TakapotoVsKatiu_OK_dat_P_0_0000012 <- data.frame(paste(
         TakapotoVsKatiu_OK_dat_P_0_000001$pos, 
         TakapotoVsKatiu_OK_dat_P_0_000001$POS, sep="_"), 
         TakapotoVsKatiu_OK_dat_P_0_000001$REF, 
         TakapotoVsKatiu_OK_dat_P_0_000001$ALT, 
         TakapotoVsKatiu_OK_dat_P_0_000001$`ANN[0].EFFECT`)
colnames(TakapotoVsKatiu_OK_dat_P_0_0000012) <- c("SNP", "REF", "ALT", "Effect")
         KatiuVsGambier_OK_dat_P_0_012 <- data.frame(paste(
         KatiuVsGambier_OK_dat_P_0_01$pos, 
         KatiuVsGambier_OK_dat_P_0_01$POS, sep="_"), 
         KatiuVsGambier_OK_dat_P_0_01$REF, 
         KatiuVsGambier_OK_dat_P_0_01$ALT, 
         KatiuVsGambier_OK_dat_P_0_01$`ANN[0].EFFECT`)
colnames(KatiuVsGambier_OK_dat_P_0_012) <- c("SNP", "REF", "ALT", "Effect")
         TakapotoVsKatiu_OK_dat_P_0_0012 <- data.frame(paste(
         TakapotoVsKatiu_OK_dat_P_0_001$pos, 
         TakapotoVsKatiu_OK_dat_P_0_001$POS, sep="_"), 
         TakapotoVsKatiu_OK_dat_P_0_001$REF, 
         TakapotoVsKatiu_OK_dat_P_0_001$ALT, 
         TakapotoVsKatiu_OK_dat_P_0_001$`ANN[0].EFFECT`)
colnames(TakapotoVsKatiu_OK_dat_P_0_0012) <- c("SNP", "REF", "ALT", "Effect")
         KatiuVsHatchery_OK_dat_P_0_0000012 <- data.frame(paste(
         KatiuVsHatchery_OK_dat_P_0_000001$pos, 
         KatiuVsHatchery_OK_dat_P_0_000001$POS, sep="_"), 
         KatiuVsHatchery_OK_dat_P_0_000001$REF, 
         KatiuVsHatchery_OK_dat_P_0_000001$ALT, 
         KatiuVsHatchery_OK_dat_P_0_000001$`ANN[0].EFFECT`)
colnames(KatiuVsHatchery_OK_dat_P_0_0000012) <- c("SNP", "REF", "ALT", "Effect")
         TakapotoVsKatiu_OK_dat_P_0_012 <- data.frame(paste(
         TakapotoVsKatiu_OK_dat_P_0_01$pos, 
         TakapotoVsKatiu_OK_dat_P_0_01$POS, sep="_"), 
         TakapotoVsKatiu_OK_dat_P_0_01$REF, 
         TakapotoVsKatiu_OK_dat_P_0_01$ALT, 
         TakapotoVsKatiu_OK_dat_P_0_01$`ANN[0].EFFECT`)
colnames(TakapotoVsKatiu_OK_dat_P_0_012) <- c("SNP", "REF", "ALT", "Effect")
         KatiuVsHatchery_OK_dat_P_0_0012 <- data.frame(paste(
         KatiuVsHatchery_OK_dat_P_0_001$pos, 
         KatiuVsHatchery_OK_dat_P_0_001$POS, sep="_"), 
         KatiuVsHatchery_OK_dat_P_0_001$REF, 
         KatiuVsHatchery_OK_dat_P_0_001$ALT, 
         KatiuVsHatchery_OK_dat_P_0_001$`ANN[0].EFFECT`)
colnames(KatiuVsHatchery_OK_dat_P_0_0012) <- c("SNP", "REF", "ALT", "Effect")
         YellowVsGreen_OK_dat_P_0_0000012 <- data.frame(paste(
         YellowVsGreen_OK_dat_P_0_000001$pos, 
         YellowVsGreen_OK_dat_P_0_000001$POS, sep="_"), 
         YellowVsGreen_OK_dat_P_0_000001$REF, 
         YellowVsGreen_OK_dat_P_0_000001$ALT, 
         YellowVsGreen_OK_dat_P_0_000001$`ANN[0].EFFECT`)
colnames(YellowVsGreen_OK_dat_P_0_0000012) <- c("SNP", "REF", "ALT", "Effect")
         KatiuVsHatchery_OK_dat_P_0_012 <- data.frame(paste(
         KatiuVsHatchery_OK_dat_P_0_01$pos, 
         KatiuVsHatchery_OK_dat_P_0_01$POS, sep="_"), 
         KatiuVsHatchery_OK_dat_P_0_01$REF, 
         KatiuVsHatchery_OK_dat_P_0_01$ALT, 
         KatiuVsHatchery_OK_dat_P_0_01$`ANN[0].EFFECT`)
colnames(KatiuVsHatchery_OK_dat_P_0_012) <- c("SNP", "REF", "ALT", "Effect")
         YellowVsGreen_OK_dat_P_0_0012 <- data.frame(paste(
         YellowVsGreen_OK_dat_P_0_001$pos, 
         YellowVsGreen_OK_dat_P_0_001$POS, sep="_"), 
         YellowVsGreen_OK_dat_P_0_001$REF, 
         YellowVsGreen_OK_dat_P_0_001$ALT, 
         YellowVsGreen_OK_dat_P_0_001$`ANN[0].EFFECT`)
colnames(YellowVsGreen_OK_dat_P_0_0012) <- c("SNP", "REF", "ALT", "Effect")
         RedVsGreen_OK_dat_P_0_0000012 <- data.frame(paste(
         RedVsGreen_OK_dat_P_0_000001$pos, 
         RedVsGreen_OK_dat_P_0_000001$POS, sep="_"), 
         RedVsGreen_OK_dat_P_0_000001$REF, 
         RedVsGreen_OK_dat_P_0_000001$ALT, 
         RedVsGreen_OK_dat_P_0_000001$`ANN[0].EFFECT`)
colnames(RedVsGreen_OK_dat_P_0_0000012) <- c("SNP", "REF", "ALT", "Effect")
         YellowVsGreen_OK_dat_P_0_012 <- data.frame(paste(
         YellowVsGreen_OK_dat_P_0_01$pos, 
         YellowVsGreen_OK_dat_P_0_01$POS, sep="_"), 
         YellowVsGreen_OK_dat_P_0_01$REF, 
         YellowVsGreen_OK_dat_P_0_01$ALT, 
         YellowVsGreen_OK_dat_P_0_01$`ANN[0].EFFECT`)
colnames(YellowVsGreen_OK_dat_P_0_012) <- c("SNP", "REF", "ALT", "Effect")
         RedVsGreen_OK_dat_P_0_0012 <- data.frame(paste(
         RedVsGreen_OK_dat_P_0_001$pos, 
         RedVsGreen_OK_dat_P_0_001$POS, sep="_"), 
         RedVsGreen_OK_dat_P_0_001$REF, 
         RedVsGreen_OK_dat_P_0_001$ALT, 
         RedVsGreen_OK_dat_P_0_001$`ANN[0].EFFECT`)
colnames(RedVsGreen_OK_dat_P_0_0012) <- c("SNP", "REF", "ALT", "Effect")
         YellowVsRed_OK_dat_P_0_0000012 <- data.frame(paste(
         YellowVsRed_OK_dat_P_0_000001$pos, 
         YellowVsRed_OK_dat_P_0_000001$POS, sep="_"), 
         YellowVsRed_OK_dat_P_0_000001$REF, 
         YellowVsRed_OK_dat_P_0_000001$ALT, 
         YellowVsRed_OK_dat_P_0_000001$`ANN[0].EFFECT`)
colnames(YellowVsRed_OK_dat_P_0_0000012) <- c("SNP", "REF", "ALT", "Effect")
         RedVsGreen_OK_dat_P_0_012 <- data.frame(paste(
         RedVsGreen_OK_dat_P_0_01$pos, 
         RedVsGreen_OK_dat_P_0_01$POS, sep="_"), 
         RedVsGreen_OK_dat_P_0_01$REF, 
         RedVsGreen_OK_dat_P_0_01$ALT, 
         RedVsGreen_OK_dat_P_0_01$`ANN[0].EFFECT`)
colnames(RedVsGreen_OK_dat_P_0_012) <- c("SNP", "REF", "ALT", "Effect")
         YellowVsRed_OK_dat_P_0_0012 <- data.frame(paste(
         YellowVsRed_OK_dat_P_0_001$pos, 
         YellowVsRed_OK_dat_P_0_001$POS, sep="_"), 
         YellowVsRed_OK_dat_P_0_001$REF, 
         YellowVsRed_OK_dat_P_0_001$ALT, 
         YellowVsRed_OK_dat_P_0_001$`ANN[0].EFFECT`)
colnames(YellowVsRed_OK_dat_P_0_0012) <- c("SNP", "REF", "ALT", "Effect")
         TakapotoVsGambier_OK_dat_P_0_0000012 <- data.frame(paste(
         TakapotoVsGambier_OK_dat_P_0_000001$pos, 
         TakapotoVsGambier_OK_dat_P_0_000001$POS, sep="_"), 
         TakapotoVsGambier_OK_dat_P_0_000001$REF, 
         TakapotoVsGambier_OK_dat_P_0_000001$ALT, 
         TakapotoVsGambier_OK_dat_P_0_000001$`ANN[0].EFFECT`)
colnames(TakapotoVsGambier_OK_dat_P_0_0000012) <- c("SNP", "REF", "ALT", "Effect")
         YellowVsRed_OK_dat_P_0_012 <- data.frame(paste(
         YellowVsRed_OK_dat_P_0_01$pos, 
         YellowVsRed_OK_dat_P_0_01$POS, sep="_"), 
         YellowVsRed_OK_dat_P_0_01$REF, 
         YellowVsRed_OK_dat_P_0_01$ALT, 
         YellowVsRed_OK_dat_P_0_01$`ANN[0].EFFECT`)
colnames(YellowVsRed_OK_dat_P_0_012) <- c("SNP", "REF", "ALT", "Effect")



TakapotoVsGambier_OK_dat_P_0_0012$SNP <- factor(TakapotoVsGambier_OK_dat_P_0_0012$SNP, levels = TakapotoVsGambier_OK_dat_P_0_0012$SNP[order(TakapotoVsGambier_OK_dat_P_0_0012$Effect)])
HatcheryVsGambier_OK_dat_P_0_0000012$SNP <- factor(HatcheryVsGambier_OK_dat_P_0_0000012$SNP, levels = HatcheryVsGambier_OK_dat_P_0_0000012$SNP[order(HatcheryVsGambier_OK_dat_P_0_0000012$Effect)])
TakapotoVsGambier_OK_dat_P_0_012$SNP <- factor(TakapotoVsGambier_OK_dat_P_0_012$SNP, levels = TakapotoVsGambier_OK_dat_P_0_012$SNP[order(TakapotoVsGambier_OK_dat_P_0_012$Effect)])
HatcheryVsGambier_OK_dat_P_0_0012$SNP <- factor(HatcheryVsGambier_OK_dat_P_0_0012$SNP, levels = HatcheryVsGambier_OK_dat_P_0_0012$SNP[order(HatcheryVsGambier_OK_dat_P_0_0012$Effect)])
TakapotoVsHatchery_OK_dat_P_0_0000012$SNP <- factor(TakapotoVsHatchery_OK_dat_P_0_0000012$SNP, levels = TakapotoVsHatchery_OK_dat_P_0_0000012$SNP[order(TakapotoVsHatchery_OK_dat_P_0_0000012$Effect)])
HatcheryVsGambier_OK_dat_P_0_012$SNP <- factor(HatcheryVsGambier_OK_dat_P_0_012$SNP, levels = HatcheryVsGambier_OK_dat_P_0_012$SNP[order(HatcheryVsGambier_OK_dat_P_0_012$Effect)])
TakapotoVsHatchery_OK_dat_P_0_0012$SNP <- factor(TakapotoVsHatchery_OK_dat_P_0_0012$SNP, levels = TakapotoVsHatchery_OK_dat_P_0_0012$SNP[order(TakapotoVsHatchery_OK_dat_P_0_0012$Effect)])
KatiuVsGambier_OK_dat_P_0_0000012$SNP <- factor(KatiuVsGambier_OK_dat_P_0_0000012$SNP, levels = KatiuVsGambier_OK_dat_P_0_0000012$SNP[order(KatiuVsGambier_OK_dat_P_0_0000012$Effect)])
TakapotoVsHatchery_OK_dat_P_0_012$SNP <- factor(TakapotoVsHatchery_OK_dat_P_0_012$SNP, levels = TakapotoVsHatchery_OK_dat_P_0_012$SNP[order(TakapotoVsHatchery_OK_dat_P_0_012$Effect)])
KatiuVsGambier_OK_dat_P_0_0012$SNP <- factor(KatiuVsGambier_OK_dat_P_0_0012$SNP, levels = KatiuVsGambier_OK_dat_P_0_0012$SNP[order(KatiuVsGambier_OK_dat_P_0_0012$Effect)])
TakapotoVsKatiu_OK_dat_P_0_0000012$SNP <- factor(TakapotoVsKatiu_OK_dat_P_0_0000012$SNP, levels = TakapotoVsKatiu_OK_dat_P_0_0000012$SNP[order(TakapotoVsKatiu_OK_dat_P_0_0000012$Effect)])
KatiuVsGambier_OK_dat_P_0_012$SNP <- factor(KatiuVsGambier_OK_dat_P_0_012$SNP, levels = KatiuVsGambier_OK_dat_P_0_012$SNP[order(KatiuVsGambier_OK_dat_P_0_012$Effect)])
TakapotoVsKatiu_OK_dat_P_0_0012$SNP <- factor(TakapotoVsKatiu_OK_dat_P_0_0012$SNP, levels = TakapotoVsKatiu_OK_dat_P_0_0012$SNP[order(TakapotoVsKatiu_OK_dat_P_0_0012$Effect)])
KatiuVsHatchery_OK_dat_P_0_0000012$SNP <- factor(KatiuVsHatchery_OK_dat_P_0_0000012$SNP, levels = KatiuVsHatchery_OK_dat_P_0_0000012$SNP[order(KatiuVsHatchery_OK_dat_P_0_0000012$Effect)])
TakapotoVsKatiu_OK_dat_P_0_012$SNP <- factor(TakapotoVsKatiu_OK_dat_P_0_012$SNP, levels = TakapotoVsKatiu_OK_dat_P_0_012$SNP[order(TakapotoVsKatiu_OK_dat_P_0_012$Effect)])
KatiuVsHatchery_OK_dat_P_0_0012$SNP <- factor(KatiuVsHatchery_OK_dat_P_0_0012$SNP, levels = KatiuVsHatchery_OK_dat_P_0_0012$SNP[order(KatiuVsHatchery_OK_dat_P_0_0012$Effect)])
YellowVsGreen_OK_dat_P_0_0000012$SNP <- factor(YellowVsGreen_OK_dat_P_0_0000012$SNP, levels = YellowVsGreen_OK_dat_P_0_0000012$SNP[order(YellowVsGreen_OK_dat_P_0_0000012$Effect)])
KatiuVsHatchery_OK_dat_P_0_012$SNP <- factor(KatiuVsHatchery_OK_dat_P_0_012$SNP, levels = KatiuVsHatchery_OK_dat_P_0_012$SNP[order(KatiuVsHatchery_OK_dat_P_0_012$Effect)])
YellowVsGreen_OK_dat_P_0_0012$SNP <- factor(YellowVsGreen_OK_dat_P_0_0012$SNP, levels = YellowVsGreen_OK_dat_P_0_0012$SNP[order(YellowVsGreen_OK_dat_P_0_0012$Effect)])
RedVsGreen_OK_dat_P_0_0000012$SNP <- factor(RedVsGreen_OK_dat_P_0_0000012$SNP, levels = RedVsGreen_OK_dat_P_0_0000012$SNP[order(RedVsGreen_OK_dat_P_0_0000012$Effect)])
YellowVsGreen_OK_dat_P_0_012$SNP <- factor(YellowVsGreen_OK_dat_P_0_012$SNP, levels = YellowVsGreen_OK_dat_P_0_012$SNP[order(YellowVsGreen_OK_dat_P_0_012$Effect)])
RedVsGreen_OK_dat_P_0_0012$SNP <- factor(RedVsGreen_OK_dat_P_0_0012$SNP, levels = RedVsGreen_OK_dat_P_0_0012$SNP[order(RedVsGreen_OK_dat_P_0_0012$Effect)])
YellowVsRed_OK_dat_P_0_0000012$SNP <- factor(YellowVsRed_OK_dat_P_0_0000012$SNP, levels = YellowVsRed_OK_dat_P_0_0000012$SNP[order(YellowVsRed_OK_dat_P_0_0000012$Effect)])
RedVsGreen_OK_dat_P_0_012$SNP <- factor(RedVsGreen_OK_dat_P_0_012$SNP, levels = RedVsGreen_OK_dat_P_0_012$SNP[order(RedVsGreen_OK_dat_P_0_012$Effect)])
YellowVsRed_OK_dat_P_0_0012$SNP <- factor(YellowVsRed_OK_dat_P_0_0012$SNP, levels = YellowVsRed_OK_dat_P_0_0012$SNP[order(YellowVsRed_OK_dat_P_0_0012$Effect)])
TakapotoVsGambier_OK_dat_P_0_0000012$SNP <- factor(TakapotoVsGambier_OK_dat_P_0_0000012$SNP, levels = TakapotoVsGambier_OK_dat_P_0_0000012$SNP[order(TakapotoVsGambier_OK_dat_P_0_0000012$Effect)])
YellowVsRed_OK_dat_P_0_012$SNP <- factor(YellowVsRed_OK_dat_P_0_012$SNP, levels = YellowVsRed_OK_dat_P_0_012$SNP[order(YellowVsRed_OK_dat_P_0_012$Effect)])

      gg_TakapotoVsGambier_OK_dat_P_0_0012 <- ggplot(
         TakapotoVsGambier_OK_dat_P_0_0012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("TakapotoVsGambier_OK_dat_P_0_0012") + coord_flip() 
      gg_HatcheryVsGambier_OK_dat_P_0_0000012 <- ggplot(
         HatcheryVsGambier_OK_dat_P_0_0000012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("HatcheryVsGambier_OK_dat_P_0_0000012") + coord_flip() 
      gg_TakapotoVsGambier_OK_dat_P_0_012 <- ggplot(
         TakapotoVsGambier_OK_dat_P_0_012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("TakapotoVsGambier_OK_dat_P_0_012") + coord_flip() 
      gg_HatcheryVsGambier_OK_dat_P_0_0012 <- ggplot(
         HatcheryVsGambier_OK_dat_P_0_0012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("HatcheryVsGambier_OK_dat_P_0_0012") + coord_flip() 
      gg_TakapotoVsHatchery_OK_dat_P_0_0000012 <- ggplot(
         TakapotoVsHatchery_OK_dat_P_0_0000012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("TakapotoVsHatchery_OK_dat_P_0_0000012") + coord_flip() 
      gg_HatcheryVsGambier_OK_dat_P_0_012 <- ggplot(
         HatcheryVsGambier_OK_dat_P_0_012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("HatcheryVsGambier_OK_dat_P_0_012") + coord_flip() 
      gg_TakapotoVsHatchery_OK_dat_P_0_0012 <- ggplot(
         TakapotoVsHatchery_OK_dat_P_0_0012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("TakapotoVsHatchery_OK_dat_P_0_0012") + coord_flip() 
      gg_KatiuVsGambier_OK_dat_P_0_0000012 <- ggplot(
         KatiuVsGambier_OK_dat_P_0_0000012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("KatiuVsGambier_OK_dat_P_0_0000012") + coord_flip() 
      gg_TakapotoVsHatchery_OK_dat_P_0_012 <- ggplot(
         TakapotoVsHatchery_OK_dat_P_0_012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("TakapotoVsHatchery_OK_dat_P_0_012") + coord_flip() 
      gg_KatiuVsGambier_OK_dat_P_0_0012 <- ggplot(
         KatiuVsGambier_OK_dat_P_0_0012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("KatiuVsGambier_OK_dat_P_0_0012") + coord_flip() 
      gg_TakapotoVsKatiu_OK_dat_P_0_0000012 <- ggplot(
         TakapotoVsKatiu_OK_dat_P_0_0000012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("TakapotoVsKatiu_OK_dat_P_0_0000012") + coord_flip() 
      gg_KatiuVsGambier_OK_dat_P_0_012 <- ggplot(
         KatiuVsGambier_OK_dat_P_0_012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("KatiuVsGambier_OK_dat_P_0_012") + coord_flip() 
      gg_TakapotoVsKatiu_OK_dat_P_0_0012 <- ggplot(
         TakapotoVsKatiu_OK_dat_P_0_0012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("TakapotoVsKatiu_OK_dat_P_0_0012") + coord_flip() 
      gg_KatiuVsHatchery_OK_dat_P_0_0000012 <- ggplot(
         KatiuVsHatchery_OK_dat_P_0_0000012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("KatiuVsHatchery_OK_dat_P_0_0000012") + coord_flip() 
      gg_TakapotoVsKatiu_OK_dat_P_0_012 <- ggplot(
         TakapotoVsKatiu_OK_dat_P_0_012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("TakapotoVsKatiu_OK_dat_P_0_012") + coord_flip() 
      gg_KatiuVsHatchery_OK_dat_P_0_0012 <- ggplot(
         KatiuVsHatchery_OK_dat_P_0_0012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("KatiuVsHatchery_OK_dat_P_0_0012") + coord_flip() 
      gg_YellowVsGreen_OK_dat_P_0_0000012 <- ggplot(
         YellowVsGreen_OK_dat_P_0_0000012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("YellowVsGreen_OK_dat_P_0_0000012") + coord_flip() 
      gg_KatiuVsHatchery_OK_dat_P_0_012 <- ggplot(
         KatiuVsHatchery_OK_dat_P_0_012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("KatiuVsHatchery_OK_dat_P_0_012") + coord_flip() 
      gg_YellowVsGreen_OK_dat_P_0_0012 <- ggplot(
         YellowVsGreen_OK_dat_P_0_0012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("YellowVsGreen_OK_dat_P_0_0012") + coord_flip() 
      gg_RedVsGreen_OK_dat_P_0_0000012 <- ggplot(
         RedVsGreen_OK_dat_P_0_0000012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("RedVsGreen_OK_dat_P_0_0000012") + coord_flip() 
      gg_YellowVsGreen_OK_dat_P_0_012 <- ggplot(
         YellowVsGreen_OK_dat_P_0_012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("YellowVsGreen_OK_dat_P_0_012") + coord_flip() 
      gg_RedVsGreen_OK_dat_P_0_0012 <- ggplot(
         RedVsGreen_OK_dat_P_0_0012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("RedVsGreen_OK_dat_P_0_0012") + coord_flip() 
      gg_YellowVsRed_OK_dat_P_0_0000012 <- ggplot(
         YellowVsRed_OK_dat_P_0_0000012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("YellowVsRed_OK_dat_P_0_0000012") + coord_flip() 
      gg_RedVsGreen_OK_dat_P_0_012 <- ggplot(
         RedVsGreen_OK_dat_P_0_012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("RedVsGreen_OK_dat_P_0_012") + coord_flip() 
      gg_YellowVsRed_OK_dat_P_0_0012 <- ggplot(
         YellowVsRed_OK_dat_P_0_0012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("YellowVsRed_OK_dat_P_0_0012") + coord_flip() 
      gg_TakapotoVsGambier_OK_dat_P_0_0000012 <- ggplot(
         TakapotoVsGambier_OK_dat_P_0_0000012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("TakapotoVsGambier_OK_dat_P_0_0000012") + coord_flip() 
      gg_YellowVsRed_OK_dat_P_0_012 <- ggplot(
         YellowVsRed_OK_dat_P_0_012, aes(x=SNP,fill=Effect)) + stat_count() + theme_minimal() + theme(legend.position="top", axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
ggtitle("YellowVsRed_OK_dat_P_0_012") + coord_flip() 


#extract legend
#https://github.com/hadley/ggplot2/wiki/Share-a-legend-between-two-ggplot2-graphs
g_legend<-function(a.gplot){
  tmp <- ggplot_gtable(ggplot_build(a.gplot))
  leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
  legend <- tmp$grobs[[leg]]
  return(legend)}

mylegend<-g_legend(gg_TakapotoVsGambier_OK_dat_P_0_0012)

p1 <- grid.arrange(arrangeGrob(
						 gg_TakapotoVsGambier_OK_dat_P_0_012 + theme(legend.position="none"),
						 gg_HatcheryVsGambier_OK_dat_P_0_012 + theme(legend.position="none"),
						 gg_TakapotoVsHatchery_OK_dat_P_0_012 + theme(legend.position="none"),
						 gg_KatiuVsGambier_OK_dat_P_0_012 + theme(legend.position="none"),
						 gg_TakapotoVsKatiu_OK_dat_P_0_012 + theme(legend.position="none"),
						 gg_KatiuVsHatchery_OK_dat_P_0_012 + theme(legend.position="none"),
						 gg_YellowVsGreen_OK_dat_P_0_012 + theme(legend.position="none"),
						 gg_RedVsGreen_OK_dat_P_0_012 + theme(legend.position="none"),
						 gg_YellowVsRed_OK_dat_P_0_012 + theme(legend.position="none"),
                               nrow=3),
                   mylegend, nrow=2,heights=c(10, 1))

ggsave("snpSift_P_0_01.png", width = 30, height = 90)			    
			    
p2 <- grid.arrange(arrangeGrob(
						 gg_TakapotoVsGambier_OK_dat_P_0_0012 + theme(legend.position="none"),
						 gg_HatcheryVsGambier_OK_dat_P_0_0012 + theme(legend.position="none"),
						 gg_TakapotoVsHatchery_OK_dat_P_0_0012 + theme(legend.position="none"),
						 gg_KatiuVsGambier_OK_dat_P_0_0012 + theme(legend.position="none"),
						 gg_TakapotoVsKatiu_OK_dat_P_0_0012 + theme(legend.position="none"),
						 gg_KatiuVsHatchery_OK_dat_P_0_0012 + theme(legend.position="none"),
						 gg_YellowVsGreen_OK_dat_P_0_0012 + theme(legend.position="none"),
						 gg_RedVsGreen_OK_dat_P_0_0012 + theme(legend.position="none"),
						 gg_YellowVsRed_OK_dat_P_0_0012 + theme(legend.position="none"),
                               nrow=3),
                   mylegend, nrow=2,heights=c(10, 1))
			    
			    
ggsave("snpSift_P_0_001.png", width = 30, height = 90)			    
			    
p3 <- grid.arrange(arrangeGrob(
						 gg_HatcheryVsGambier_OK_dat_P_0_0000012 + theme(legend.position="none"),
						 gg_TakapotoVsHatchery_OK_dat_P_0_0000012 + theme(legend.position="none"),
						 gg_KatiuVsGambier_OK_dat_P_0_0000012 + theme(legend.position="none"),
						 gg_TakapotoVsKatiu_OK_dat_P_0_0000012 + theme(legend.position="none"),
						 gg_KatiuVsHatchery_OK_dat_P_0_0000012 + theme(legend.position="none"),
						 gg_YellowVsGreen_OK_dat_P_0_0000012 + theme(legend.position="none"),
						 gg_RedVsGreen_OK_dat_P_0_0000012 + theme(legend.position="none"),
						 gg_YellowVsRed_OK_dat_P_0_0000012 + theme(legend.position="none"),
						 gg_TakapotoVsGambier_OK_dat_P_0_0000012 + theme(legend.position="none"),
                               nrow=3),
                   mylegend, nrow=2,heights=c(10, 1))
			    
			    
ggsave("snpSift_P_0_000001.png", width = 30, height = 90)
