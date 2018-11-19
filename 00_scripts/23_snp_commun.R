# Les SNP sont-ils les memes selon les différentes méthodes ?

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_chi2")

library(ggplot2)
library(dplyr)

# Données DP20 individuels avec regression logistique + Chi2
dat <- read.table("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf.copy.logitR.txt", skip=1)
colnames(dat) <- c("CHROM", "POS", "REF", "ALT", "P_origin", "P_color", "P_count")

datRL <- data.frame(dat$CHROM, dat$POS, dat$REF, dat$ALT,p.adjust(dat$P_origin, method = "bonferroni", n = length(dat$P_origin)), p.adjust(dat$P_color, method = "bonferroni", n = length(dat$P_color)), p.adjust(dat$P_count, method = "bonferroni", n = length(dat$P_count)))
colnames(datRL) <- c("CHROM", "POS", "REF", "ALT", "P_origin_Bonf", "P_color_Bonf", "P_count_Bonf")

datRL$NAME <- paste(dat$CHROM,dat$POS)

THRESHOLD <- 0.00001
datRL2 <- subset(datRL, datRL$P_origin_Bonf<THRESHOLD, select = c(datRL$NAME, "REF", "ALT", "P_origin_Bonf"))
# Nombre de SNP Données DP20 individuels avec regression logistique + Chi2 pour THRESHOLD <- 0.00001
length(datRL2$P_origin_Bonf)

# Données DP20 individuels avec uniquement Chi2

dat3 <- read.table("individuals.vcf_DP10_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf.copy.modif_chi2_v3", skip=1)
colnames(dat3) <- c("CHROM", "POS", "REF", "ALT", "P")

datChi2 <- data.frame(dat3$CHROM, dat3$POS, dat3$REF, dat3$ALT, p.adjust(dat3$P, method = "bonferroni", n = length(dat$P)))
colnames(datChi2) <- c("CHROM", "POS", "REF", "ALT", "P_Bonf")

datChi2$NAME <- paste(datChi$CHROM,datChi2$POS)

THRESHOLD <- 0.00001
datChi22 <- subset(datChi2, datChi2$P_Bonf<THRESHOLD, select = c(datChi2$NAME, "REF", "ALT", "P_Bonf"))



commun <- intersect(datRL2$NAME, datChi22$NAME)

length(commun)
