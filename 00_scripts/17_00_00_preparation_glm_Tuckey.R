#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified/")

library(readr)
library(dplyr)
library(tidyr)
library(stringr)
library(multcomp)

# AD: Allelic Depth
# DP: Read Depth
# Allelic frequencies: AD/DP
# https://gatkforums.broadinstitute.org/gatk/discussion/6202/vcf-file-and-allele-frequency

# Used input from 16_08_deleted_header_singleID.sh
vcf <- read.table("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt")


colnames(vcf) <- c("SNP_NAME", "CHROM","POS","ID","REF","ALT","QUAL", "Nothing", "Decomplexed",
                   "pool9KV","pool6GV","pool4GR","pool8KJ","pool2TJ",
                   "pool10ER","pool5GJ","pool1TR","pool7KR","pool3TV",
                   "pool11EJ","pool12EV")





# Now we will separate the needed information (split the columns) for the 12 columns:

############################################################################################################################################
# pool9KV
pool9KV <- data.frame(do.call('rbind', strsplit(as.character(vcf$pool9KV),':',fixed=TRUE))) 
colnames(pool9KV) <- c("DP_pool9KV", "AD_pool9KV", "RO_pool9KV", "QR_pool9KV", "AO_pool9KV", "QA_pool9KV", "GL_pool9KV") 
write.table(pool9KV, file="pool9KV.txt")
# pool6GV
pool6GV <- data.frame(do.call('rbind', strsplit(as.character(vcf$pool6GV),':',fixed=TRUE))) 
colnames(pool6GV) <- c("DP_pool6GV", "AD_pool6GV", "RO_pool6GV", "QR_pool6GV", "AO_pool6GV", "QA_pool6GV", "GL_pool6GV") 
write.table(pool6GV, file="pool6GV.txt")
# pool4GR
pool4GR <- data.frame(do.call('rbind', strsplit(as.character(vcf$pool4GR),':',fixed=TRUE))) 
colnames(pool4GR) <- c("DP_pool4GR", "AD_pool4GR", "RO_pool4GR", "QR_pool4GR", "AO_pool4GR", "QA_pool4GR", "GL_pool4GR") 
write.table(pool4GR, file="pool4GR.txt")
# pool8KJ
pool8KJ <- data.frame(do.call('rbind', strsplit(as.character(vcf$pool8KJ),':',fixed=TRUE))) 
colnames(pool8KJ) <- c("DP_pool8KJ", "AD_pool8KJ", "RO_pool8KJ", "QR_pool8KJ", "AO_pool8KJ", "QA_pool8KJ", "GL_pool8KJ") 
write.table(pool8KJ, file="pool8KJ.txt")
# pool2TJ
pool2TJ <- data.frame(do.call('rbind', strsplit(as.character(vcf$pool2TJ),':',fixed=TRUE))) 
colnames(pool2TJ) <- c("DP_pool2TJ", "AD_pool2TJ", "RO_pool2TJ", "QR_pool2TJ", "AO_pool2TJ", "QA_pool2TJ", "GL_pool2TJ") 
write.table(pool2TJ, file="pool2TJ.txt")
# pool10ER
pool10ER <- data.frame(do.call('rbind', strsplit(as.character(vcf$pool10ER),':',fixed=TRUE))) 
colnames(pool10ER) <- c("DP_pool10ER", "AD_pool10ER", "RO_pool10ER", "QR_pool10ER", "AO_pool10ER", "QA_pool10ER", "GL_pool10ER") 
write.table(pool10ER, file="pool10ER.txt")
# pool5GJ
pool5GJ <- data.frame(do.call('rbind', strsplit(as.character(vcf$pool5GJ),':',fixed=TRUE))) 
colnames(pool5GJ) <- c("DP_pool5GJ", "AD_pool5GJ", "RO_pool5GJ", "QR_pool5GJ", "AO_pool5GJ", "QA_pool5GJ", "GL_pool5GJ") 
write.table(pool5GJ, file="pool5GJ.txt")
# pool1TR
pool1TR <- data.frame(do.call('rbind', strsplit(as.character(vcf$pool1TR),':',fixed=TRUE))) 
colnames(pool1TR) <- c("DP_pool1TR", "AD_pool1TR", "RO_pool1TR", "QR_pool1TR", "AO_pool1TR", "QA_pool1TR", "GL_pool1TR") 
write.table(pool1TR, file="pool1TR.txt")
# pool7KR
pool7KR <- data.frame(do.call('rbind', strsplit(as.character(vcf$pool7KR),':',fixed=TRUE))) 
colnames(pool7KR) <- c("DP_pool7KR", "AD_pool7KR", "RO_pool7KR", "QR_pool7KR", "AO_pool7KR", "QA_pool7KR", "GL_pool7KR") 
write.table(pool7KR, file="pool7KR.txt")
# pool3TV
pool3TV <- data.frame(do.call('rbind', strsplit(as.character(vcf$pool3TV),':',fixed=TRUE))) 
colnames(pool3TV) <- c("DP_pool3TV", "AD_pool3TV", "RO_pool3TV", "QR_pool3TV", "AO_pool3TV", "QA_pool3TV", "GL_pool3TV") 
write.table(pool3TV, file="pool3TV.txt")
# pool11EJ
pool11EJ <- data.frame(do.call('rbind', strsplit(as.character(vcf$pool11EJ),':',fixed=TRUE))) 
colnames(pool11EJ) <- c("DP_pool11EJ", "AD_pool11EJ", "RO_pool11EJ", "QR_pool11EJ", "AO_pool11EJ", "QA_pool11EJ", "GL_pool11EJ") 
write.table(pool11EJ, file="pool11EJ.txt")
# pool12EV
pool12EV <- data.frame(do.call('rbind', strsplit(as.character(vcf$pool12EV),':',fixed=TRUE))) 
colnames(pool12EV) <- c("DP_pool12EV", "AD_pool12EV", "RO_pool12EV", "QR_pool12EV", "AO_pool12EV", "QA_pool12EV", "GL_pool12EV") 
write.table(pool12EV, file="pool12EV.txt")
############################################################################################################################################


# Now, we want to create a data.frame with the allelic frequencies (AD/DP). But, there are commas into some variable, we need to change them by point by this code: as.numeric(gsub(",", ".", gsub("\\.", "", VARIABLE)))


# For some AD, there is no juste REF, ALT (eg DP: 20, AD: 11,9) but sometimes there is (multiallelic ?): DP: 20, AD: 1, 9, 10.
# So, I take the first "AD number" as the REF, and I sum the others as ALT:
df_pool9KV <- as.data.frame(str_split_fixed(pool9KV$AD_pool9KV, ",", 2))
df2_pool9KV <- data.frame(pool9KV$DP_pool9KV, df_pool9KV$V1, df_pool9KV$V2)
df2_pool9KV$df_pool9KV.V2 <- as.character(df2_pool9KV$df_pool9KV.V2)
# So, this is the AD for ALT:
#sapply(strsplit(df2_pool9KV$df_pool9KV.V2, ','), function(x) sum(as.numeric(x)))
# So, AF is AD/DP:
AF_pool9KV <- ( sapply(strsplit(df2_pool9KV$df_pool9KV.V2, ','), function(x) sum(as.numeric(x))) ) / (as.numeric(as.character(pool9KV$DP_pool9KV)))
write.table(AF_pool9KV, file="AF_pool9KV.txt")

# Same for the others:
df_pool6GV <- as.data.frame(str_split_fixed(pool6GV$AD_pool6GV, ",", 2))
df2_pool6GV <- data.frame(pool6GV$DP_pool6GV, df_pool6GV$V1, df_pool6GV$V2)
df2_pool6GV$df_pool6GV.V2 <- as.character(df2_pool6GV$df_pool6GV.V2)
AF_pool6GV <- ( sapply(strsplit(df2_pool6GV$df_pool6GV.V2, ','), function(x) sum(as.numeric(x))) ) / (as.numeric(as.character(pool6GV$DP_pool6GV)))
write.table(AF_pool6GV, file="AF_pool6GV.txt")

df_pool4GR <- as.data.frame(str_split_fixed(pool4GR$AD_pool4GR, ",", 2))
df2_pool4GR <- data.frame(pool4GR$DP_pool4GR, df_pool4GR$V1, df_pool4GR$V2)
df2_pool4GR$df_pool4GR.V2 <- as.character(df2_pool4GR$df_pool4GR.V2)
AF_pool4GR <- ( sapply(strsplit(df2_pool4GR$df_pool4GR.V2, ','), function(x) sum(as.numeric(x))) ) / (as.numeric(as.character(pool4GR$DP_pool4GR)))
write.table(AF_pool4GR, file="AF_pool4GR.txt")

df_pool8KJ <- as.data.frame(str_split_fixed(pool8KJ$AD_pool8KJ, ",", 2))
df2_pool8KJ <- data.frame(pool8KJ$DP_pool8KJ, df_pool8KJ$V1, df_pool8KJ$V2)
df2_pool8KJ$df_pool8KJ.V2 <- as.character(df2_pool8KJ$df_pool8KJ.V2)
AF_pool8KJ <- ( sapply(strsplit(df2_pool8KJ$df_pool8KJ.V2, ','), function(x) sum(as.numeric(x))) ) / (as.numeric(as.character(pool8KJ$DP_pool8KJ)))
write.table(AF_pool8KJ, file="AF_pool8KJ.txt")

df_pool2TJ <- as.data.frame(str_split_fixed(pool2TJ$AD_pool2TJ, ",", 2))
df2_pool2TJ <- data.frame(pool2TJ$DP_pool2TJ, df_pool2TJ$V1, df_pool2TJ$V2)
df2_pool2TJ$df_pool2TJ.V2 <- as.character(df2_pool2TJ$df_pool2TJ.V2)
AF_pool2TJ <- ( sapply(strsplit(df2_pool2TJ$df_pool2TJ.V2, ','), function(x) sum(as.numeric(x))) ) / (as.numeric(as.character(pool2TJ$DP_pool2TJ)))
write.table(AF_pool2TJ, file="AF_pool2TJ.txt")

df_pool10ER <- as.data.frame(str_split_fixed(pool10ER$AD_pool10ER, ",", 2))
df2_pool10ER <- data.frame(pool10ER$DP_pool10ER, df_pool10ER$V1, df_pool10ER$V2)
df2_pool10ER$df_pool10ER.V2 <- as.character(df2_pool10ER$df_pool10ER.V2)
AF_pool10ER <- ( sapply(strsplit(df2_pool10ER$df_pool10ER.V2, ','), function(x) sum(as.numeric(x))) ) / (as.numeric(as.character(pool10ER$DP_pool10ER)))
write.table(AF_pool10ER, file="AF_pool10ER.txt")

df_pool5GJ <- as.data.frame(str_split_fixed(pool5GJ$AD_pool5GJ, ",", 2))
df2_pool5GJ <- data.frame(pool5GJ$DP_pool5GJ, df_pool5GJ$V1, df_pool5GJ$V2)
df2_pool5GJ$df_pool5GJ.V2 <- as.character(df2_pool5GJ$df_pool5GJ.V2)
AF_pool5GJ <- ( sapply(strsplit(df2_pool5GJ$df_pool5GJ.V2, ','), function(x) sum(as.numeric(x))) ) / (as.numeric(as.character(pool5GJ$DP_pool5GJ)))
write.table(AF_pool5GJ, file="AF_pool5GJ.txt")

df_pool1TR <- as.data.frame(str_split_fixed(pool1TR$AD_pool1TR, ",", 2))
df2_pool1TR <- data.frame(pool1TR$DP_pool1TR, df_pool1TR$V1, df_pool1TR$V2)
df2_pool1TR$df_pool1TR.V2 <- as.character(df2_pool1TR$df_pool1TR.V2)
AF_pool1TR <- ( sapply(strsplit(df2_pool1TR$df_pool1TR.V2, ','), function(x) sum(as.numeric(x))) ) / (as.numeric(as.character(pool1TR$DP_pool1TR)))
write.table(AF_pool1TR, file="AF_pool1TR.txt")

df_pool7KR <- as.data.frame(str_split_fixed(pool7KR$AD_pool7KR, ",", 2))
df2_pool7KR <- data.frame(pool7KR$DP_pool7KR, df_pool7KR$V1, df_pool7KR$V2)
df2_pool7KR$df_pool7KR.V2 <- as.character(df2_pool7KR$df_pool7KR.V2)
AF_pool7KR <- ( sapply(strsplit(df2_pool7KR$df_pool7KR.V2, ','), function(x) sum(as.numeric(x))) ) / (as.numeric(as.character(pool7KR$DP_pool7KR)))
write.table(AF_pool7KR, file="AF_pool7KR.txt")

df_pool3TV <- as.data.frame(str_split_fixed(pool3TV$AD_pool3TV, ",", 2))
df2_pool3TV <- data.frame(pool3TV$DP_pool3TV, df_pool3TV$V1, df_pool3TV$V2)
df2_pool3TV$df_pool3TV.V2 <- as.character(df2_pool3TV$df_pool3TV.V2)
AF_pool3TV <- ( sapply(strsplit(df2_pool3TV$df_pool3TV.V2, ','), function(x) sum(as.numeric(x))) ) / (as.numeric(as.character(pool3TV$DP_pool3TV)))
write.table(AF_pool3TV, file="AF_pool3TV.txt")

df_pool11EJ <- as.data.frame(str_split_fixed(pool11EJ$AD_pool11EJ, ",", 2))
df2_pool11EJ <- data.frame(pool11EJ$DP_pool11EJ, df_pool11EJ$V1, df_pool11EJ$V2)
df2_pool11EJ$df_pool11EJ.V2 <- as.character(df2_pool11EJ$df_pool11EJ.V2)
AF_pool11EJ <- ( sapply(strsplit(df2_pool11EJ$df_pool11EJ.V2, ','), function(x) sum(as.numeric(x))) ) / (as.numeric(as.character(pool11EJ$DP_pool11EJ)))
write.table(AF_pool11EJ, file="AF_pool11EJ.txt")

df_pool12EV <- as.data.frame(str_split_fixed(pool12EV$AD_pool12EV, ",", 2))
df2_pool12EV <- data.frame(pool12EV$DP_pool12EV, df_pool12EV$V1, df_pool12EV$V2)
df2_pool12EV$df_pool12EV.V2 <- as.character(df2_pool12EV$df_pool12EV.V2)
AF_pool12EV <- ( sapply(strsplit(df2_pool12EV$df_pool12EV.V2, ','), function(x) sum(as.numeric(x))) ) / (as.numeric(as.character(pool12EV$DP_pool12EV)))
write.table(AF_pool12EV, file="AF_pool12EV.txt")

####
# Now, because the allelic frequencies were calculated from a pool of a different number of individuals, and it's not "statistically correct" to compare frequencies which were calculated from different number of individuals,
# We do 10 000 "tirages" if there were 20 hypothethycal individuals (here, 40 because it's biallélique)
# We do that only for pools with less than 20 individuals

for (i in 1:length(AF_pool9KV)){
  sink("AF_pool9KV_new_preparation.txt", append=TRUE)
  print(mean(rbinom(10000,40,AF_pool9KV[i]))/40)
  sink()
  sink()
  sink()
}

AF_pool9KV_new <- read.table("AF_pool9KV_new_preparation.txt")
AF_pool9KV <- AF_pool9KV_new$V2
#file.remove("AF_pool9KV_new_preparation.txt")

for (i in 1:length(AF_pool6GV)){
  sink("AF_pool6GV_new_preparation.txt", append=TRUE)
  print(mean(rbinom(10000,40,AF_pool6GV[i]))/40)
  sink()
  sink()
  sink()
}

AF_pool6GV_new <- read.table("AF_pool6GV_new_preparation.txt")
AF_pool6GV <- AF_pool6GV_new$V2
#file.remove("AF_pool6GV_new_preparation.txt")

for (i in 1:length(AF_pool4GR)){
  sink("AF_pool4GR_new_preparation.txt", append=TRUE)
  print(mean(rbinom(10000,40,AF_pool4GR[i]))/40)
  sink()
  sink()
  sink()
}

AF_pool4GR_new <- read.table("AF_pool4GR_new_preparation.txt")
AF_pool4GR <- AF_pool4GR_new$V2
#file.remove("AF_pool4GR_new_preparation.txt")

for (i in 1:length(AF_pool8KJ)){
  sink("AF_pool8KJ_new_preparation.txt", append=TRUE)
  print(mean(rbinom(10000,40,AF_pool8KJ[i]))/40)
  sink()
  sink()
  sink()
}

AF_pool8KJ_new <- read.table("AF_pool8KJ_new_preparation.txt")
AF_pool8KJ <- AF_pool8KJ_new$V2
#file.remove("AF_pool8KJ_new_preparation.txt")

for (i in 1:length(AF_pool2TJ)){
  sink("AF_pool2TJ_new_preparation.txt", append=TRUE)
  print(mean(rbinom(10000,40,AF_pool2TJ[i]))/40)
  sink()
  sink()
  sink()
}

AF_pool2TJ_new <- read.table("AF_pool2TJ_new_preparation.txt")
AF_pool2TJ <- AF_pool2TJ_new$V2
#file.remove("AF_pool2TJ_new_preparation.txt")

for (i in 1:length(AF_pool10ER)){
  sink("AF_pool10ER_new_preparation.txt", append=TRUE)
  print(mean(rbinom(10000,40,AF_pool10ER[i]))/40)
  sink()
  sink()
  sink()
}

AF_pool10ER_new <- read.table("AF_pool10ER_new_preparation.txt")
AF_pool10ER <- AF_pool10ER_new$V2
#file.remove("AF_pool10ER_new_preparation.txt")


for (i in 1:length(AF_pool5GJ )){
  sink("AF_pool5GJ _new_preparation.txt", append=TRUE)
  print(mean(rbinom(10000,40,AF_pool5GJ [i]))/40)
  sink()
  sink()
  sink()
}

AF_pool5GJ_new <- read.table("AF_pool5GJ _new_preparation.txt")
AF_pool5GJ  <- AF_pool5GJ_new$V2
#file.remove("AF_pool5GJ _new_preparation.txt")

for (i in 1:length(AF_pool1TR)){
  sink("AF_pool1TR_new_preparation.txt", append=TRUE)
  print(mean(rbinom(10000,40,AF_pool1TR[i]))/40)
  sink()
  sink()
  sink()
}

AF_pool1TR_new <- read.table("AF_pool1TR_new_preparation.txt")
AF_pool1TR <- AF_pool1TR_new$V2
#file.remove("AF_pool1TR_new_preparation.txt")

for (i in 1:length(AF_pool7KR)){
  sink("AF_pool7KR_new_preparation.txt", append=TRUE)
  print(mean(rbinom(10000,40,AF_pool7KR[i]))/40)
  sink()
  sink()
  sink()
}

AF_pool7KR_new <- read.table("AF_pool7KR_new_preparation.txt")
AF_pool7KR <- AF_pool7KR_new$V2
#file.remove("AF_pool7KR_new_preparation.txt")


for (i in 1:length(AF_pool3TV)){
  sink("AF_pool3TV_new_preparation.txt", append=TRUE)
  print(mean(rbinom(10000,40,AF_pool3TV[i]))/40)
  sink()
  sink()
  sink()
}

AF_pool3TV_new <- read.table("AF_pool3TV_new_preparation.txt")
AF_pool3TV <- AF_pool3TV_new$V2
#file.remove("AF_pool3TV_new_preparation.txt")


for (i in 1:length(AF_pool11EJ)){
  sink("AF_pool11EJ_new_preparation.txt", append=TRUE)
  print(mean(rbinom(10000,40,AF_pool11EJ[i]))/40)
  sink()
  sink()
  sink()
}

AF_pool11EJ_new <- read.table("AF_pool11EJ_new_preparation.txt")
AF_pool11EJ <- AF_pool11EJ_new$V2
#file.remove("AF_pool11EJ_new_preparation.txt")

# Rellstab et al 2013
# LES SNP SONT INDEPENDANTS STATISTIQUEMENT MEME SI BIOLOGIQUEMENT ILS LE SONT


AF <- data.frame(vcf$SNP, AF_pool9KV, AF_pool6GV, AF_pool4GR, AF_pool8KJ, AF_pool2TJ, AF_pool10ER, AF_pool5GJ, AF_pool1TR, AF_pool7KR, AF_pool3TV, AF_pool11EJ, AF_pool12EV) 
colnames(AF) <- c("SNP", "Katiu_Green", "Gambier_Green", "Gambier_Red", "Katiu_Yellow", "Takapoto_Yellow", "Hatchery_Red", "Gambier_Yellow", 
                  "Takapoto_Red", "Katiu_Red", "Takapoto_Green", "Hatchery_Yellow", "Hatchery_Green") 


dat <- gather(AF, condition, frequence, -SNP)
condition <- data.frame(str_split_fixed(dat$condition, "_", 2))
df <- data.frame(dat$SNP, condition$X1, condition$X2, dat$frequence)
colnames(df) <- c("SNP", "Site", "Color", "Frequence")


write.table(df, file ="df.txt")
