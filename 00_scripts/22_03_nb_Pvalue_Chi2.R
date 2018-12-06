# Fichier et scripts réalisés et tournés en local

setwd("~/Documents/Thèse/Génomique des Populations/04 - Analyses PWGS/07 - vcf files/Connaitre nb p-value après chi2")

dat <- read.table("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf.copy.modif_chi2_v3", skip=1)
colnames(dat) <- c("CHROM", "POS", "REF", "ALT", "P")

length(dat$P)
# 22169780

THRESHOLD <- 0.00001
dat2 <- subset(dat, P<THRESHOLD) ## A.cds.result was generated from DESeq 

head(dat2)

length(dat2$P)
# 579204

# min(dat$P, na.rm = TRUE)
min(dat[dat$P > 0, ]$P, na.rm = T)
# 9.874498e-307


579204/22169780 # 2.612583 % de SNP outliers...

# Avec correction de Bonferroni
dat3 <- data.frame(dat$CHROM, dat$POS, dat$REF, dat$ALT,p.adjust(dat$P, method = "bonferroni", n = length(dat$P)))
colnames(dat3) <- c("CHROM", "POS", "REF", "ALT", "P")

length(dat3$P)                
min(dat3[dat3$P > 0, ]$P, na.rm = T)
# 2.189154e-299

THRESHOLD <- 0.00001
dat4 <- subset(dat3, P<THRESHOLD) ## A.cds.result was generated from DESeq 
length(dat4$P)                
# 12355

12355/22169780 #0.05572901 % de SNP outliers...

# Avec Bonferroni, je passe de 579204 outlier à 12355 outliers.
# Avant, les outliers représentaient 2.6 % des données, et après Bonferroni, ils ne représentent “que” 0.055 % des données.
# Avant Bonferroni, la P min était de 9.874498e-307 et maintenant elle est de 2.189154e-299. Ce qui n’est pas énorme comme changement non plus.


# Maintenant on va chercher a prendre les noms de ces 12355 snp et on va voir sur combien de scaffolds et combien de régions sur ces scaffolds elles tombent

head(dat4)

write.table(dat4, file = "snp_ind_DP20.txt", sep = "\t", quote = FALSE)

dat5 <- data.frame(SNP=paste(dat4$CHROM,dat4$POS, sep="_"),REF=dat4$REF, ALT=dat4$ALT, P=dat4$P)
head(dat5)
