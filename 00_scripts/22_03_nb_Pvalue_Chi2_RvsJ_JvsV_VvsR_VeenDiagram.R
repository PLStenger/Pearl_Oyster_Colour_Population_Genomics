#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_chi2")

#######################################################################################################################
# Calculs sur les Pvalues brutes
#######################################################################################################################


dat <- read.table("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex.vcf._chi2", skip=1)
colnames(dat) <- c("CHROM", "POS", "REF", "ALT", "raw_pval_VvsR", "raw_pval_VvsJ", "raw_pval_RvsJ")
head(dat)
dat <- data.frame(paste(dat$CHROM, dat$POS, sep="_"), dat$POS, dat$REF, dat$ALT, dat$raw_pval_VvsR, dat$raw_pval_VvsJ, dat$raw_pval_RvsJ)
colnames(dat) <- c("CHROM", "POS", "REF", "ALT", "raw_pval_VvsR", "raw_pval_VvsJ", "raw_pval_RvsJ")
head(dat)

length(dat$raw_pval_VvsR)
# 2165589

length(dat$raw_pval_VvsJ)
# 2165589

length(dat$raw_pval_RvsJ)
# 2165589

THRESHOLD <- 0.00001

###################################################
##### raw_pval_VvsR
dat2 <- subset(dat, raw_pval_VvsR<THRESHOLD) ## A.cds.result was generated from DESeq 

head(dat2)

length(dat2$raw_pval_VvsR)
#  13234

# Pvalue la plus "forte"
min(dat[dat$raw_pval_VvsR > 0, ]$raw_pval_VvsR, na.rm = T)
#  2.469603e-90


13234/2165589 # 0.611104 % de SNP outliers...


###################################################
##### raw_pval_VvsJ
dat2.1 <- subset(dat, raw_pval_VvsJ<THRESHOLD) 

head(dat2.1)

length(dat2.1$raw_pval_VvsJ)
#  18054

# Pvalue la plus "forte"
min(dat[dat$raw_pval_VvsJ > 0, ]$raw_pval_VvsJ, na.rm = T)
#  8.067177e-110


18054/2165589 # 0.8336762 % de SNP outliers...



###################################################
##### raw_pval_RvsJ
dat2.2 <- subset(dat, raw_pval_RvsJ<THRESHOLD) 

head(dat2.2)


length(dat2.2$raw_pval_RvsJ)
# 16922

# Pvalue la plus "forte"
min(dat[dat$raw_pval_RvsJ > 0, ]$raw_pval_RvsJ, na.rm = T)
# 6.121055e-125


16922/2165589 # 0.781404 % de SNP outliers...


dat2 <- data.frame(dat2$CHROM, dat2$raw_pval_VvsR, dat2$CHROM, dat2$raw_pval_VvsJ, dat2$CHROM, dat2$raw_pval_RvsJ)
head(dat2)
colnames(dat2) <- c("CHROM", "raw_pval_VvsR", "CHROM", "raw_pval_VvsJ", "CHROM", "raw_pval_RvsJ")
head(dat2)

dat2.1 <- data.frame(dat2.1$CHROM, dat2.1$raw_pval_VvsR, dat2.1$CHROM, dat2.1$raw_pval_VvsJ, dat2.1$CHROM, dat2.1$raw_pval_RvsJ)
head(dat2.1)
colnames(dat2.1) <- c("CHROM", "raw_pval_VvsR", "CHROM", "raw_pval_VvsJ", "CHROM", "raw_pval_RvsJ")
head(dat2.1)

dat2.2 <- data.frame(dat2.2$CHROM, dat2.2$raw_pval_VvsR, dat2.2$CHROM, dat2.2$raw_pval_VvsJ, dat2.2$CHROM, dat2.2$raw_pval_RvsJ)
head(dat2.2)
colnames(dat2.2) <- c("CHROM", "raw_pval_VvsR", "CHROM", "raw_pval_VvsJ", "CHROM", "raw_pval_RvsJ")
head(dat2.2)

### SNP COMMUN ENTRE raw_pval_VvsR & raw_pval_VvsJ
# SNP propres au vert
commun <- intersect(dat2$CHROM, dat2.1$CHROM)
length(commun) # 1383

### SNP COMMUN ENTRE raw_pval_VvsR & raw_pval_RvsJ
# SNP propres au rouge
commun1 <- intersect(dat2$CHROM, dat2.2$CHROM)
length(commun1) # 1213

### SNP COMMUN ENTRE raw_pval_RvsJ & raw_pval_VvsJ
# SNP propres au jaune
commun2 <- intersect(dat2.2$CHROM, dat2.1$CHROM)
length(commun2) # 3797

### SNP COMMUN ENTRE raw_pval_RvsJ & raw_pval_VvsJ & raw_pval_VvsR
# SNP propres au jaune
communTot <- intersect(commun1, commun2)
communTot2 <- intersect(commun, communTot)
length(communTot2) # 13

##############################################################################################################
############################################
# Veen Diagramm

# raw_pval_VvsR
head(dat2$CHROM)

# raw_pval_VvsJ
head(dat2.1$CHROM)

# raw_pval_RvsJ
head(dat2.2$CHROM)

library(VennDiagram)

venn.diagram(
  list(raw_pval_VvsR = dat2$CHROM, raw_pval_VvsJ = dat2.1$CHROM, raw_pval_RvsJ=dat2.2$CHROM), 
  "Venn_raw_pval_VvsR_VS_raw_pval_VvsJ_VS_raw_pval_RvsJ_NoComplex.tiff",
  fill = c("yellow","greenyellow","orange"),
  cat.col = c("yellow", "greenyellow", "orange")
)


######################################################################################################
# Avec correction de Bonferroni
######################################################################################################
dat3 <- data.frame(dat$CHROM, dat$POS, dat$REF, dat$ALT,p.adjust(dat$raw_pval_VvsR, method = "bonferroni", n = length(dat$raw_pval_VvsR)), p.adjust(dat$raw_pval_VvsJ, method = "bonferroni", n = length(dat$raw_pval_VvsJ)), p.adjust(dat$raw_pval_RvsJ, method = "bonferroni", n = length(dat$raw_pval_RvsJ)))
colnames(dat3) <- c("CHROM", "POS", "REF", "ALT", "pval_VvsR_Bonf", "pval_VvsJ_Bonf", "pval_RvsJ_Bonf")
head(dat3)

length(dat3$pval_VvsR_Bonf)
# 2165589

length(dat3$pval_VvsJ_Bonf)
# 2165589

length(dat3$pval_RvsJ_Bonf)
# 2165589


###################################################
##### pval_VvsR_Bonf

THRESHOLD <- 0.00001
dat4 <- subset(dat3, pval_VvsR_Bonf<THRESHOLD) ## A.cds.result was generated from DESeq 
length(dat4$pval_VvsR_Bonf)                
# 115

# Pvalue la plus "forte"
min(dat3[dat3$pval_VvsR_Bonf > 0, ]$pval_VvsR_Bonf, na.rm = T)
# 5.348145e-84

115/22169780 #5.187241e-04 % de SNP outliers...

write.table(dat4, "snp_ind_DP20_NoComplex_pval_VvsR_Bonf.txt")

###################################################
##### pval_VvsJ_Bonf

THRESHOLD <- 0.00001
dat5 <- subset(dat3, pval_VvsJ_Bonf<THRESHOLD) ## A.cds.result was generated from DESeq 
head(dat5)
length(dat5$pval_VvsJ_Bonf)                
# 331

min(dat3[dat3$pval_VvsJ_Bonf > 0, ]$pval_VvsJ_Bonf, na.rm = T)
# 1.747019e-103

331/22169780 #1.493023e-03 % de SNP outliers...

write.table(dat5, "snp_ind_DP20_NoComplex_pval_VvsJ_Bonf.txt")



###################################################
##### pval_RvsJ_Bonf

THRESHOLD <- 0.00001
dat6 <- subset(dat3, pval_RvsJ_Bonf<THRESHOLD) ## A.cds.result was generated from DESeq 
length(dat6$pval_RvsJ_Bonf)                
# 335

min(dat3[dat3$pval_RvsJ_Bonf > 0, ]$pval_RvsJ_Bonf, na.rm = T)
# 1.325569e-118

335/22169780 #1.511066e-03 % de SNP outliers...

write.table(dat6, "snp_ind_DP20_NoComplex_pval_RvsJ_Bonf.txt")

# pval_VvsR_Bonf
#dat4.1 <- data.frame(dat4$CHROM, dat4$pval_VvsR_Bonf, dat4$CHROM, dat4$pval_VvsJ_Bonf, dat4$CHROM, dat4$pval_RvsJ_Bonf)
#head(dat4.1)
dat4.1 <- data.frame(dat4$CHROM, dat4$pval_VvsR_Bonf)
head(dat4.1)
#colnames(dat4.1) <- c("CHROM", "pval_VvsR_Bonf", "CHROM", "pval_VvsJ_Bonf", "CHROM", "pval_RvsJ_Bonf")
#head(dat4.1)
colnames(dat4.1) <- c("CHROM", "pval_VvsR_Bonf")
head(dat4.1)

# pval_VvsJ_Bonf 
#dat5.1 <- data.frame(dat5$CHROM, dat5$pval_VvsR_Bonf, dat5$CHROM, dat5$pval_VvsJ_Bonf, dat5$CHROM, dat5$pval_RvsJ_Bonf)
#head(dat5.1)
#colnames(dat5.1) <- c("CHROM", "pval_VvsR_Bonf", "CHROM", "pval_VvsJ_Bonf", "CHROM", "pval_RvsJ_Bonf")
#head(dat5.1)
dat5.1 <- data.frame(dat5$CHROM, dat5$pval_VvsJ_Bonf)
head(dat5.1)
colnames(dat5.1) <- c("CHROM", "pval_VvsJ_Bonf")
head(dat5.1)

# pval_RvsJ_Bonf
#dat6.1 <- data.frame(dat6$CHROM, dat6$pval_VvsR_Bonf, dat6$CHROM, dat6$pval_VvsJ_Bonf, dat6$CHROM, dat6$pval_RvsJ_Bonf)
#head(dat6.1)
#colnames(dat6.1) <- c("CHROM", "pval_VvsR_Bonf", "CHROM", "pval_VvsJ_Bonf", "CHROM", "pval_RvsJ_Bonf")
#head(dat6.1)
dat6.1 <- data.frame(dat6$CHROM, dat6$pval_RvsJ_Bonf)
head(dat6.1)
colnames(dat6.1) <- c("CHROM", "pval_RvsJ_Bonf")
head(dat6.1)

### SNP COMMUN ENTRE pval_VvsR_Bonf & pval_VvsJ_Bonf 
# SNP propres au vert
commun <- intersect(dat4.1$CHROM, dat5.1$CHROM)
length(commun) # 15
write.table(commun, "SNP_COMMUN_pval_VvsR_Bonf_and_pval_VvsJ_Bonf.txt")

### SNP COMMUN ENTRE pval_VvsR_Bonf & pval_RvsJ_Bonf
# SNP propres au rouge
commun1 <- intersect(dat4.1$CHROM, dat6.1$CHROM)
length(commun1) # 31
write.table(commun1, "SNP_COMMUN_pval_VvsR_Bonf_and_pval_RvsJ_Bonf.txt")

### SNP COMMUN ENTRE pval_RvsJ_Bonf & pval_VvsJ_Bonf 
# SNP propres au jaune
commun2 <- intersect(dat6.1$CHROM, dat5.1$CHROM)
#length(dat6.1$CHROM)
#length(dat5.1$CHROM)
length(commun2) # 84
#length(Reduce(intersect, list(dat6.1$CHROM,dat5.1$CHROM)))
write.table(commun2, "SNP_COMMUN_pval_RvsJ_Bonf_and_pval_VvsJ_Bonf.txt")



### SNP COMMUN ENTRE pval_RvsJ_Bonf & pval_VvsJ_Bonf & pval_VvsR_Bonf
# SNP propres au jaune
communTot <- intersect(commun1, commun2)
communTot2 <- intersect(commun, communTot)
length(communTot2) # 2
write.table(communTot2, "SNP_COMMUN_pval_RvsJ_Bonf_and_pval_VvsJ_Bonf_and_pval_VvsR_Bonf.txt")




# Maintenant on va chercher a prendre les noms de ces 12355 snp et on va voir sur combien de scaffolds et combien de régions sur ces scaffolds elles tombent

head(dat4)

#write.table(dat4, file = "snp_ind_DP20.txt", sep = "\t", quote = FALSE)

dat5 <- data.frame(SNP=paste(dat4$CHROM,dat4$POS, sep="_"),REF=dat4$REF, ALT=dat4$ALT, P=dat4$P)
head(dat5)




##############################################################################################################
############################################
# Veen Diagramm

# pval_VvsR_Bonf
head(dat4.1$CHROM)
length(dat4.1$CHROM) #115

# pval_VvsJ_Bonf
head(dat5.1$CHROM)
length(dat5.1$CHROM) # 331

# pval_RvsJ_Bonf
head(dat6.1$CHROM)
length(dat6.1$CHROM) #335

library(VennDiagram)

venn.diagram(
  list(pval_VvsR_Bonf = dat4.1$CHROM, pval_VvsJ_Bonf = dat5.1$CHROM, pval_RvsJ_Bonf=dat6.1$CHROM), 
  "Venn_pval_VvsR_Bonf_VS_pval_VvsJ_Bonf_VS_pval_RvsJ_Bonf_NoComplex.tiff",
  fill = c("yellow","greenyellow","orange"),
  cat.col = c("yellow", "greenyellow", "orange"),
  euler.d = TRUE
)

venn<-VennDiagram::get.venn.partitions(list(VvsR = dat4.1$CHROM, VvsJ = dat5.1$CHROM, RvsJ=dat6.1$CHROM))
venn


all <-venn$..values..$"1"
write.table(all, "SNP_commun_a_tous.txt", quote=FALSE, row.names=FALSE, col.names=FALSE)

VvsJ_vs_RvsJ <-venn$..values..$"2"
write.table(VvsJ_vs_RvsJ, "SNP_commun_VvsJ_vs_RvsJ.txt", quote=FALSE, row.names=FALSE, col.names=FALSE)

VvsR_vs_RvsJ <-venn$..values..$"3"
write.table(VvsR_vs_RvsJ, "SNP_commun_VvsR_vs_RvsJ.txt", quote=FALSE, row.names=FALSE, col.names=FALSE)

RvsJ <-venn$..values..$"4"
write.table(RvsJ, "SNP_commun_RvsJ.txt", quote=FALSE, row.names=FALSE, col.names=FALSE)

VvsR_vs_VvsJ <-venn$..values..$"5"
write.table(VvsR_vs_VvsJ, "SNP_commun_VvsR_vs_VvsJ.txt", quote=FALSE, row.names=FALSE, col.names=FALSE)

VvsJ <-venn$..values..$"6"
write.table(VvsJ, "SNP_commun_VvsJ.txt", quote=FALSE, row.names=FALSE, col.names=FALSE)

VvsR <-venn$..values..$"7"
write.table(VvsR, "SNP_commun_VvsR.txt", quote=FALSE, row.names=FALSE, col.names=FALSE)






