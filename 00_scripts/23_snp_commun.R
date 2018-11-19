# Les SNP sont-ils les memes selon les différentes méthodes (e.g. test de Chi2 vs Regression logistique (RL) + Chi2) ?

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_chi2")

library(ggplot2)
library(dplyr)

# Données DP20 individuels avec regression logistique + Chi2
dat <- read.table("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf.copy.logitR.txt", skip=1)
colnames(dat) <- c("CHROM", "POS", "REF", "ALT", "P_origin", "P_color", "P_count")

datRL <- data.frame(dat$CHROM, dat$POS, dat$REF, dat$ALT,p.adjust(dat$P_origin, method = "bonferroni", n = length(dat$P_origin)), p.adjust(dat$P_color, method = "bonferroni", n = length(dat$P_color)), p.adjust(dat$P_count, method = "bonferroni", n = length(dat$P_count)))
colnames(datRL) <- c("CHROM", "POS", "REF", "ALT", "P_origin_Bonf", "P_color_Bonf", "P_count_Bonf")

datRL$NAME <- paste(dat$CHROM, dat$POS, sep= "_")

### ORIGIN
THRESHOLD <- 0.00001
datRL_origin <- subset(datRL, datRL$P_origin_Bonf<THRESHOLD)
# Nombre de SNP Données DP20 individuels avec regression logistique + Chi2 pour THRESHOLD <- 0.00001 ### ORIGIN
length(datRL_origin$P_origin_Bonf) # 2972

### COLOR
THRESHOLD <- 0.00001
datRL_color <- subset(datRL, datRL$P_color_Bonf<THRESHOLD)

# Nombre de SNP Données DP20 individuels avec regression logistique + Chi2 pour THRESHOLD <- 0.00001 ### COLOR
length(datRL_color$P_color_Bonf) # 949

### COUNT
THRESHOLD <- 0.00001
datRL_count <- subset(datRL, datRL$P_count_Bonf<THRESHOLD)

# Nombre de SNP Données DP20 individuels avec regression logistique + Chi2 pour THRESHOLD <- 0.00001 ### COUNT
length(datRL_count$P_count_Bonf) # 150


### SNP COMMUN ENTRE ORIGIN & COLOR
commun <- intersect(datRL_origin$NAME, datRL_color$NAME)
length(commun) # 368

### SNP COMMUN ENTRE COUNT & COLOR
commun <- intersect(datRL_count$NAME, datRL_color$NAME)
length(commun) # 72

### SNP COMMUN ENTRE COUNT & ORIGIN
commun <- intersect(datRL_count$NAME, datRL_origin$NAME)
length(commun) # 97



# Données DP20 individuels avec uniquement Chi2

dat3 <- read.table("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf.copy.modif_chi2_v3", skip=1)
colnames(dat3) <- c("CHROM", "POS", "REF", "ALT", "P")

datChi2 <- data.frame(dat3$CHROM, dat3$POS, dat3$REF, dat3$ALT, p.adjust(dat3$P, method = "bonferroni", n = length(dat3$P)))
colnames(datChi2) <- c("CHROM", "POS", "REF", "ALT", "P_Bonf")

datChi2$NAME <- paste(datChi2$CHROM,datChi2$POS, sep= "_")

THRESHOLD <- 0.00001
datChi2 <- subset(datChi2, datChi2$P_Bonf<THRESHOLD)

# Nombre de SNP Données DP20 individuels avec uniquement Chi2 pour THRESHOLD <- 0.00001
length(datChi2$P_Bonf) # 12355

# Combien y a t-il de SNP en commun entre les 2 méthodes (Chi2 vs RL+Chi2 ORIGIN) ?
commun <- intersect(datRL_origin$NAME, datChi2$NAME)
length(commun) # 714

# Combien y a t-il de SNP en commun entre les 2 méthodes (Chi2 vs RL+Chi2 COLOR ?
commun <- intersect(datRL_color$NAME, datChi2$NAME)
length(commun) # 929

# Combien y a t-il de SNP en commun entre les 2 méthodes (Chi2 vs RL+Chi2 COUNT) ?
commun <- intersect(datRL_count$NAME, datChi2$NAME)
length(commun) # 101

#### Maintenant on ajoute les données Merged
merged <- read.table("merged_bam_ryg_paralell_DP50_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf.modif_chi2_v4", skip=1)

colnames(merged) <- c("CHROM", "POS", "REF", "ALT", "P")

merged <- data.frame(merged$CHROM, merged$POS, merged$REF, merged$ALT,p.adjust(merged$P, method = "bonferroni", n = length(merged$P)))
colnames(merged) <- c("CHROM", "POS", "REF", "ALT", "P_Bonf")

merged$NAME <- paste(merged$CHROM, merged$POS, sep= "_")

### ORIGIN
THRESHOLD <- 0.00001
merged <- subset(merged, merged$P_Bonf<THRESHOLD)
# Nombre de SNP Données Merged Chi2 <- 0.00001
length(merged$P_Bonf) # 5482



# Combien y a t-il de SNP en commun entre les 2 méthodes (merged vs RL+Chi2 ORIGIN) ?
commun <- intersect(datRL_origin$NAME, merged$NAME)
length(commun) # 114

# Combien y a t-il de SNP en commun entre les 2 méthodes (merged vs RL+Chi2 COLOR ?
commun <- intersect(datRL_color$NAME, merged$NAME)
length(commun) # 162

# Combien y a t-il de SNP en commun entre les 2 méthodes (merged vs RL+Chi2 COUNT) ?
commun <- intersect(datRL_count$NAME, merged$NAME)
length(commun) # 18

# Combien y a t-il de SNP en commun entre les 3 méthodes (merged vs Chi2) ? # count
commun <- intersect(merged$NAME, datChi2$NAME, datRL_count$NAME)
length(commun) # 

# Combien y a t-il de SNP en commun entre les 3 méthodes (merged vs Chi2) ? # color
commun <- intersect(merged$NAME, datChi2$NAME, datRL_color$NAME)
length(commun) # 




####

commun <- intersect(merged$NAME, datChi2$NAME)
length(commun) # 3298

# Combien y a t-il de SNP en commun entre les 3 méthodes (merged vs Chi2) ? # count
commun <- intersect(merged$NAME, datChi2$NAME, datRL_count$NAME)
length(commun) # 

# Combien y a t-il de SNP en commun entre les 3 méthodes (merged vs Chi2) ? # color
commun <- intersect(merged$NAME, datChi2$NAME, datRL_color$NAME)
length(commun) # 

# Combien y a t-il de SNP en commun entre les 3 méthodes (merged vs Chi2) ? # origin
commun <- intersect(merged$NAME, datChi2$NAME, datRL_origin$NAME)
length(commun) # 

# Combien y a t-il de SNP en commun entre les 3 RL ? # origin - color - count
commun <- intersect(datRL_count$NAME, datRL_color$NAME, datRL_origin$NAME)
length(commun) # 

# Combien y a t-il de SNP en commun entre tous ?
commun <- intersect(datRL_count$NAME, datRL_color$NAME, datRL_origin$NAME, merged$NAME, datChi2$NAME)
length(commun) # 

# Combien y a t-il de SNP en commun entre tous ?
commun <- intersect(datRL_count$NAME, datRL_color$NAME, merged$NAME, datChi2$NAME)
length(commun) # 

# Combien y a t-il de SNP en commun entre tous ?
commun <- intersect(datRL_count$NAME, datRL_origin$NAME, merged$NAME, datChi2$NAME)
length(commun) # 

# Combien y a t-il de SNP en commun entre tous ?
commun <- intersect(datRL_color$NAME, datRL_origin$NAME, merged$NAME, datChi2$NAME)
length(commun) # 






