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

# We want to work on the individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header.vcf file
# But, soemtime, between the pools there is no tabulation, so the number of column are not the same and R don't arrive to upload it.
# So, with bash, we will delete all the tabulation, and then all the 0/0:, 0/1: and 1/1: and remplace them by a tubulation. So, there will not be anymore the genotyping info but the probleme will desappears.
system('scp -r /home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header.vcf  /home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header.txt
')


# We create a other file with just the first column and put it in new file named "only_start.txt"(= only first column)
system('awk \'{$7=$8=$9=$10=$11=$12=$13=$14=$15=$16=$17=$18=$19=$20=$21=""; print $0}\' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header.txt > only_start.txt')
system('awk \'{print $1"_"$2"\t"$1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6}\' only_start.txt > only_start2.txt')
# We create a other file with the 9th first column and put it in new file named "only_end.txt"
#system('awk \'{$1=$2=$3=$4=$5=$6=$7=$8=$9=""; print $0}\' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header.txt > only_end.txt')
system('awk \'{$3=$4=$5=$6=$7=$8=$9=""; print $0}\' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header.txt > only_end.txt')
system('awk \'{print $1"_"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$10"\t"$11"\t"$12"\t"$13"\t"$14"\t"$15"\t"$16"\t"$17"\t"$18}\' only_end.txt > only_endTest.txt')

# On the only end file, remove all tabulation
system('sed \'s/\t//\' only_endTest.txt > only_end2.txt')
# remove all spaces
system('sed \'s/ //g\' only_end2.txt > only_end3.txt')
# remove the 0/0:, 0/1: and 1/1: in three step
system('cat only_end3.txt | awk \'{gsub("0/1:", "\t", $0); print $0}\' > only_end4.txt')
system('cat only_end4.txt | awk \'{gsub("0/0:", "\t", $0); print $0}\' > only_end5.txt')
system('cat only_end5.txt | awk \'{gsub("1/1:", "\t", $0); print $0}\' > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header_only_end.txt')
# Delete the unecessary files
file.remove("only_end.txt", "only_end2.txt", "only_end3.txt", "only_end4.txt", "only_end5.txt", "only_endTest.txt", "only_start.txt")

# Merge the start and the end together
system('join -a1 only_start2.txt individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header_only_end.txt > join.txt')

# If there is a row with less than 18 column, delete the row:
system('awk \'NF>=19\' join.txt > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header_only_endOK.txt')


file.remove("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header_only_end.txt", "only_start2.txt")

vcf <- read.table("individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header_only_endOK.txt")

colnames(vcf) <- c("SNP_NAME", "CHROM","POS","ID","REF","ALT","QUAL",
                   "pool9KV","pool6GV","pool4GR","pool8KJ","pool2TJ",
                   "pool10ER","pool5GJ","pool1TR","pool7KR","pool3TV",
                   "pool11EJ","pool12EV")

file.remove("join.txt")


#write.csv(vcf, file = "vcf.csv")
#vcf <- read.csv("vcf.csv")


#compute_model <- function(chunk){
# chunk 
#  vcf <- read.csv("vcf.csv") 
# Merge CHROM and POS in order to have unique SNP name
vcf$SNP <- paste(vcf$CHROM, vcf$POS, sep= "_") 
# Now we will separate the needed information (split the columns) for the 12 columns:

############################################################################################################################################
# pool9KV
pool9KV <- data.frame(do.call('rbind', strsplit(as.character(vcf$pool9KV),':',fixed=TRUE))) 
colnames(pool9KV) <- c("DP_pool9KV", "AD_pool9KV", "RO_pool9KV", "QR_pool9KV", "AO_pool9KV", "QA_pool9KV", "GL_pool9KV") 
# pool6GV
pool6GV <- data.frame(do.call('rbind', strsplit(as.character(vcf$pool6GV),':',fixed=TRUE))) 
colnames(pool6GV) <- c("DP_pool6GV", "AD_pool6GV", "RO_pool6GV", "QR_pool6GV", "AO_pool6GV", "QA_pool6GV", "GL_pool6GV") 
# pool4GR
pool4GR <- data.frame(do.call('rbind', strsplit(as.character(vcf$pool4GR),':',fixed=TRUE))) 
colnames(pool4GR) <- c("DP_pool4GR", "AD_pool4GR", "RO_pool4GR", "QR_pool4GR", "AO_pool4GR", "QA_pool4GR", "GL_pool4GR") 
# pool8KJ
pool8KJ <- data.frame(do.call('rbind', strsplit(as.character(vcf$pool8KJ),':',fixed=TRUE))) 
colnames(pool8KJ) <- c("DP_pool8KJ", "AD_pool8KJ", "RO_pool8KJ", "QR_pool8KJ", "AO_pool8KJ", "QA_pool8KJ", "GL_pool8KJ") 
# pool2TJ
pool2TJ <- data.frame(do.call('rbind', strsplit(as.character(vcf$pool2TJ),':',fixed=TRUE))) 
colnames(pool2TJ) <- c("DP_pool2TJ", "AD_pool2TJ", "RO_pool2TJ", "QR_pool2TJ", "AO_pool2TJ", "QA_pool2TJ", "GL_pool2TJ") 
# pool10ER
pool10ER <- data.frame(do.call('rbind', strsplit(as.character(vcf$pool10ER),':',fixed=TRUE))) 
colnames(pool10ER) <- c("DP_pool10ER", "AD_pool10ER", "RO_pool10ER", "QR_pool10ER", "AO_pool10ER", "QA_pool10ER", "GL_pool10ER") 
# pool5GJ
pool5GJ <- data.frame(do.call('rbind', strsplit(as.character(vcf$pool5GJ),':',fixed=TRUE))) 
colnames(pool5GJ) <- c("DP_pool5GJ", "AD_pool5GJ", "RO_pool5GJ", "QR_pool5GJ", "AO_pool5GJ", "QA_pool5GJ", "GL_pool5GJ") 
# pool1TR
pool1TR <- data.frame(do.call('rbind', strsplit(as.character(vcf$pool1TR),':',fixed=TRUE))) 
colnames(pool1TR) <- c("DP_pool1TR", "AD_pool1TR", "RO_pool1TR", "QR_pool1TR", "AO_pool1TR", "QA_pool1TR", "GL_pool1TR") 
# pool7KR
pool7KR <- data.frame(do.call('rbind', strsplit(as.character(vcf$pool7KR),':',fixed=TRUE))) 
colnames(pool7KR) <- c("DP_pool7KR", "AD_pool7KR", "RO_pool7KR", "QR_pool7KR", "AO_pool7KR", "QA_pool7KR", "GL_pool7KR") 
# pool3TV
pool3TV <- data.frame(do.call('rbind', strsplit(as.character(vcf$pool3TV),':',fixed=TRUE))) 
colnames(pool3TV) <- c("DP_pool3TV", "AD_pool3TV", "RO_pool3TV", "QR_pool3TV", "AO_pool3TV", "QA_pool3TV", "GL_pool3TV") 
# pool11EJ
pool11EJ <- data.frame(do.call('rbind', strsplit(as.character(vcf$pool11EJ),':',fixed=TRUE))) 
colnames(pool11EJ) <- c("DP_pool11EJ", "AD_pool11EJ", "RO_pool11EJ", "QR_pool11EJ", "AO_pool11EJ", "QA_pool11EJ", "GL_pool11EJ") 
# pool12EV
pool12EV <- data.frame(do.call('rbind', strsplit(as.character(vcf$pool12EV),':',fixed=TRUE))) 
colnames(pool12EV) <- c("DP_pool12EV", "AD_pool12EV", "RO_pool12EV", "QR_pool12EV", "AO_pool12EV", "QA_pool12EV", "GL_pool12EV") 

############################################################################################################################################


# Now, we want to create a data.frame with the allelic frequencies (AD/DP). But, there are commas into some variable, we need to change them by point by this code: as.numeric(gsub(",", ".", gsub("\\.", "", VARIABLE)))

AF_pool9KV <- (as.numeric(gsub(",", ".", gsub("\\.", "", pool9KV$AD_pool9KV)  )))/(as.numeric(gsub(",", ".", gsub("\\.", "", pool9KV$DP_pool9KV  )))) 
AF_pool6GV <- (as.numeric(gsub(",", ".", gsub("\\.", "", pool6GV$AD_pool6GV)  )))/(as.numeric(gsub(",", ".", gsub("\\.", "", pool6GV$DP_pool6GV  )))) 
AF_pool4GR <- (as.numeric(gsub(",", ".", gsub("\\.", "", pool4GR$AD_pool4GR)  )))/(as.numeric(gsub(",", ".", gsub("\\.", "", pool4GR$DP_pool4GR  )))) 
AF_pool8KJ <- (as.numeric(gsub(",", ".", gsub("\\.", "", pool8KJ$AD_pool8KJ)  )))/(as.numeric(gsub(",", ".", gsub("\\.", "", pool8KJ$DP_pool8KJ  )))) 
AF_pool2TJ <- (as.numeric(gsub(",", ".", gsub("\\.", "", pool2TJ$AD_pool2TJ)  )))/(as.numeric(gsub(",", ".", gsub("\\.", "", pool2TJ$DP_pool2TJ  )))) 
AF_pool10ER <- (as.numeric(gsub(",", ".", gsub("\\.", "", pool10ER$AD_pool10ER))))/(as.numeric(gsub(",", ".", gsub("\\.", "", pool10ER$DP_pool10ER)))) 
AF_pool5GJ <- (as.numeric(gsub(",", ".", gsub("\\.", "", pool5GJ$AD_pool5GJ)  )))/(as.numeric(gsub(",", ".", gsub("\\.", "", pool5GJ$DP_pool5GJ  )))) 
AF_pool1TR <- (as.numeric(gsub(",", ".", gsub("\\.", "", pool1TR$AD_pool1TR)  )))/(as.numeric(gsub(",", ".", gsub("\\.", "", pool1TR$DP_pool1TR  )))) 
AF_pool7KR <- (as.numeric(gsub(",", ".", gsub("\\.", "", pool7KR$AD_pool7KR)  )))/(as.numeric(gsub(",", ".", gsub("\\.", "", pool7KR$DP_pool7KR  )))) 
AF_pool3TV <- (as.numeric(gsub(",", ".", gsub("\\.", "", pool3TV$AD_pool3TV)  )))/(as.numeric(gsub(",", ".", gsub("\\.", "", pool3TV$DP_pool3TV  )))) 
AF_pool11EJ <- (as.numeric(gsub(",", ".", gsub("\\.", "", pool11EJ$AD_pool11EJ))))/(as.numeric(gsub(",", ".", gsub("\\.", "", pool11EJ$DP_pool11EJ)))) 
AF_pool12EV <- (as.numeric(gsub(",", ".", gsub("\\.", "", pool12EV$AD_pool12EV))))/(as.numeric(gsub(",", ".", gsub("\\.", "", pool12EV$DP_pool12EV)))) 


# Rellstab et al 2013
# LES SNP SONT INDEPENDANTS STATISTIQUEMENT MEME SI BIOLOGIQUEMENT ILS LE SONT


AF <- data.frame(vcf$SNP, AF_pool9KV, AF_pool6GV, AF_pool4GR, AF_pool8KJ, AF_pool2TJ, AF_pool10ER, AF_pool5GJ, AF_pool1TR, AF_pool7KR, AF_pool3TV, AF_pool11EJ, AF_pool12EV) 
colnames(AF) <- c("SNP", "Katiu_Green", "Gambier_Green", "Gambier_Red", "Katiu_Yellow", "Takapoto_Yellow", "Hatchery_Red", "Gambier_Yellow", 
                  "Takapoto_Red", "Katiu_Red", "Takapoto_Green", "Hatchery_Yellow", "Hatchery_Green") 


dat <- gather(AF, condition, frequence, -SNP)
condition <- data.frame(str_split_fixed(dat$condition, "_", 2))
df <- data.frame(dat$SNP, condition$X1, condition$X2, dat$frequence)
colnames(df) <- c("SNP", "Site", "Color", "Frequence")


# Run the model in loop



ok <- filter(df, df$SNP  == AF$SNP[2])
mod <- glm(Frequence ~ Color + Site, data = ok, family=quasibinomial)
summary(mod)
K1 <- glht(mod, mcp(Color = "Tukey"))$linfct
summary(K1)
K2 <- glht(mod, mcp(Site = "Tukey"))$linfct
pvaleur <- summary(glht(mod, linfct = rbind(K1, K2)))$test$pvalues[1:9]


for (i in 1:length(AF$SNP)){
sink("OutPutAnalysis.txt", append=TRUE)
ok <- filter(df, df$SNP  == AF$SNP[i])
mod <- glm(Frequence ~ Color + Site, data = ok)
K1 <- glht(mod, mcp(Color = "Tukey"))$linfct
K2 <- glht(mod, mcp(Site = "Tukey"))$linfct
pvaleur <- summary(glht(mod, linfct = rbind(K1, K2)))$test$pvalues[1:9]
#noms_SNP <- append(noms_SNP, as.character(AF$SNP[i]))
#combine <- c(noms_SNP, pvaleur)
#matrixOK <- matrix(pvaleur, nrow=1)
pvaleur <- c(pvaleur)
print(pvaleur)
sink()
sink()
sink()
#write.csv(matrixOK, file = "MyData.csv")
}

for (i in 1:length(AF$SNP)){
  sink("OutPutAnalysisSNP.txt", append=TRUE)
  ok <- as.character(AF$SNP[i])
  print(ok)
  sink()
  sink()
  sink()
  #write.csv(matrixOK, file = "MyData.csv")
}

SNP <- read.table("OutPutAnalysisSNP.txt")
head(SNP)

Pvaleur <- read.table("OutPutAnalysis.txt")
head(Pvaleur)

dat <- data.frame(SNP$V2, Pvaleur$V2, Pvaleur$V3, Pvaleur$V4, Pvaleur$V5, Pvaleur$V6, Pvaleur$V7, Pvaleur$V8, Pvaleur$V9, Pvaleur$V10)
colnames(dat) <- c("SNP", "RedVsGreen", "YellowVsGreen", "YellowVsRed", "HatcheryVsGambier", "KatiuVsGambier", "TakapotoVsGambier", "KatiuVsHatchery","TakapotoVsHatchery", "TakapotoVsKatiu") 

head(dat)
write.table(dat, file = "results.csv", sep=";")
# Delete the unecessary files
file.remove("OutPutAnalysis.txt", "OutPutAnalysisSNP.txt")




