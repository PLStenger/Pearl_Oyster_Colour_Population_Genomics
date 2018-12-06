# Ce fichier a été tournée en local

setwd("~/Documents/Thèse/Génomique des Populations/04 - Analyses PWGS/07 - vcf files")


library(readr)
library(dplyr)
library(stringr)

# Catch trinity name with scaffold and position and snp

# importer le fichier de snpEff
trinity <- read.table("snpEff_individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_genes_summary.txt", skip=1)

head(trinity)
# Importer le fichier vcf annotate
# couper et obtenir les prmeieres colonnes

# Combien y a t-il de colonnes dans ce fichier ?
max(count.fields("vcfAnotatedTest.txt", sep = ','))

# Ajouter la valeur du nombre max de colonne dans seq_len()
dat<- read.table(file="vcfAnotatedTest.txt", header=FALSE, col.names = paste0("V",seq_len(38)), fill = TRUE)
head(dat)

dat2 <- data.frame(dat$V1, dat$V2, dat$V4, dat$V5, dat$V6, dat$V8)
dat2

vcf <- read_tsv("vcfAnotatedTest.txt", col_names = FALSE)
str(vcf)

trinity_col <- (vcf %>% 
  mutate(trinity = (str_extract_all(X8, "TRINITY((?!TRINITY).)*?path[:digit:]")))%>%
  mutate(trinity = sapply(trinity, paste, collapse=":")))

dat3 <- data.frame(dat$V1, dat$V2, dat$V4, dat$V5, dat$V6, trinity_col$trinity)
dat3

# Obtenir la frequence allelique (et enlever les ***** de tabulation en trop sur certaines lignes)
dat$freq_all <- paste(dat$V8, dat$V9, 
                      dat$V10, dat$V11, dat$V12, dat$V13, dat$V14, dat$V15, dat$V16, dat$V17, dat$V18, dat$V19, 
                      dat$V20, dat$V21, dat$V22, dat$V23, dat$V24, dat$V25, dat$V26, dat$V27, dat$V28, dat$V29,
                      dat$V30, dat$V31, dat$V32, dat$V33, dat$V34, dat$V35, dat$V36, dat$V37, dat$V38)


# connaitre l'emplacement du début du pattern "GT:DP:AD:RO:QR:AO:QA:GL"
pos = gregexpr('GT:DP:AD:RO:QR:AO:QA:GL', dat$freq_all)
# pos

dat$freq_all2 <- substr(dat$freq_all, pos, nchar(dat$freq_all))
# dat$freq_all2

dat4 <- data.frame(dat$V1, dat$V2, dat$V4, dat$V5, dat$V6, trinity_col$trinity, dat$freq_all2)
dat4

# write.csv(dat4, "meta_data.csv")

dat4[7,]

dat4$dat.freq_all2

dat4$dat.freq_all3 <- gsub("0/1", ";0/1", dat4$dat.freq_all2)
dat4$dat.freq_all4 <- gsub("0/0", ";0/0", dat4$dat.freq_all3)
dat4$dat.freq_all5 <- gsub("1/1", ";1/1", dat4$dat.freq_all4)
dat4$dat.freq_all6 <- gsub("NA", "", dat4$dat.freq_all5)
dat4$dat.freq_all6
  

dat5 <- data.frame(dat$V1, dat$V2, dat$V4, dat$V5, dat$V6, trinity_col$trinity, dat4$dat.freq_all6)
dat5

# write.csv(dat5, "meta_data.csv")

# GT: "Genotype" (ex: 0/1)
# DP: "Read Depth" (ex: 119)
# AD: "Reference allele observation, Alternate allele observation" (ex: 105,14)
# RO: "Reference allele observation" (ex: 105)
# QR: "Sum of quality of the reference observations" (ex: 4176)
# AO: "Alternate allele observation" (ex: 14)
# QA: "Sum of quality of the alternate observations" (ex: 519)
# GL: "?" (ex: -11.2077,0)


foo <- data.frame(do.call('rbind', strsplit(as.character(dat5$dat4.dat.freq_all6),';',fixed=TRUE)))
foo

dat6 <- data.frame(dat$V1, dat$V2, dat$V4, dat$V5, dat$V6, trinity_col$trinity, foo$X2, foo$X3, foo$X4, foo$X5, foo$X6, foo$X7, foo$X8, foo$X9, foo$X10, foo$X11, foo$X12, foo$X13)
dat6


pool7KR <- data.frame(do.call('rbind', strsplit(as.character(dat6$foo.X2),':',fixed=TRUE)))
pool6GV <- data.frame(do.call('rbind', strsplit(as.character(dat6$foo.X3),':',fixed=TRUE)))
pool5GJ <- data.frame(do.call('rbind', strsplit(as.character(dat6$foo.X4),':',fixed=TRUE)))
pool4GR <- data.frame(do.call('rbind', strsplit(as.character(dat6$foo.X5),':',fixed=TRUE)))
pool3TV <- data.frame(do.call('rbind', strsplit(as.character(dat6$foo.X6),':',fixed=TRUE)))
pool2TJ <- data.frame(do.call('rbind', strsplit(as.character(dat6$foo.X7),':',fixed=TRUE)))
pool1TR <- data.frame(do.call('rbind', strsplit(as.character(dat6$foo.X8),':',fixed=TRUE)))
pool12EV <- data.frame(do.call('rbind', strsplit(as.character(dat6$foo.X9),':',fixed=TRUE)))
pool11EJ <- data.frame(do.call('rbind', strsplit(as.character(dat6$foo.X10),':',fixed=TRUE)))
pool10ER <- data.frame(do.call('rbind', strsplit(as.character(dat6$foo.X11),':',fixed=TRUE)))
pool9KV <- data.frame(do.call('rbind', strsplit(as.character(dat6$foo.X12),':',fixed=TRUE)))



datx <- paste(dat$V1, dat$V2, sep="_")
datx

dat7 <- data.frame(datx, dat$V1, dat$V2, dat$V4, dat$V5, trinity_col$trinity, pool7KR, pool6GV, pool5GJ, pool4GR, pool3TV, pool2TJ, pool1TR, pool12EV, pool11EJ, pool10ER, pool9KV)
dat7

colnames(dat7) <- c("SNP_name", "scaffold", "position", "REF", "ALT", "transcript", "GT_pool7KR", "DP_pool7KR", "AD_pool7KR", "RO_pool7KR", "QR_pool7KR", "AO_pool7KR", "QA_pool7KR", "GL_pool7KR", "GT_pool6GV", "DP_pool6GV", "AD_pool6GV", "RO_pool6GV", "QR_pool6GV", "AO_pool6GV", "QA_pool6GV", "GL_pool6GV", "GT_pool5GJ", "DP_pool5GJ", "AD_pool5GJ", "RO_pool5GJ", "QR_pool5GJ", "AO_pool5GJ", "QA_pool5GJ", "GL_pool5GJ", "GT_pool4GR", "DP_pool4GR", "AD_pool4GR", "RO_pool4GR", "QR_pool4GR", "AO_pool4GR", "QA_pool4GR", "GL_pool4GR", "GT_pool3TV", "DP_pool3TV", "AD_pool3TV", "RO_pool3TV", "QR_pool3TV", "AO_pool3TV", "QA_pool3TV", "GL_pool3TV", "GT_pool2TJ", "DP_pool2TJ", "AD_pool2TJ", "RO_pool2TJ", "QR_pool2TJ", "AO_pool2TJ", "QA_pool2TJ", "GL_pool2TJ", "GT_pool1TR", "DP_pool1TR", "AD_pool1TR", "RO_pool1TR", "QR_pool1TR", "AO_pool1TR", "QA_pool1TR", "GL_pool1TR", "GT_pool12EV", "DP_pool12EV", "AD_pool12EV", "RO_pool12EV", "QR_pool12EV", "AO_pool12EV", "QA_pool12EV", "GL_pool12EV", "GT_pool11EJ", "DP_pool11EJ", "AD_pool11EJ", "RO_pool11EJ", "QR_pool11EJ", "AO_pool11EJ", "QA_pool11EJ", "GL_pool11EJ", "GT_pool10ER", "DP_pool10ER", "AD_pool10ER", "RO_pool10ER", "QR_pool10ER", "AO_pool10ER", "QA_pool10ER", "GL_pool10ER", "GT_pool9KV", "DP_pool9KV", "AD_pool9KV", "RO_pool9KV", "QR_pool9KV", "AO_pool9KV", "QA_pool9KV", "GL_pool9KV")
dat7

dat7$Freq_all_pool7KR <- as.numeric(as.character((dat7$RO_pool7KR)))/as.numeric(as.character((dat7$DP_pool7KR)))
dat7$Freq_all_pool6GV <- as.numeric(as.character((dat7$RO_pool6GV)))/as.numeric(as.character((dat7$DP_pool6GV)))
dat7$Freq_all_pool5GJ <- as.numeric(as.character((dat7$RO_pool5GJ)))/as.numeric(as.character((dat7$DP_pool5GJ)))
dat7$Freq_all_pool4GR <- as.numeric(as.character((dat7$RO_pool4GR)))/as.numeric(as.character((dat7$DP_pool4GR)))
dat7$Freq_all_pool3TV <- as.numeric(as.character((dat7$RO_pool3TV)))/as.numeric(as.character((dat7$DP_pool3TV)))
dat7$Freq_all_pool2TJ <- as.numeric(as.character((dat7$RO_pool2TJ)))/as.numeric(as.character((dat7$DP_pool2TJ)))
dat7$Freq_all_pool1TR <- as.numeric(as.character((dat7$RO_pool1TR)))/as.numeric(as.character((dat7$DP_pool1TR)))
dat7$Freq_all_pool12EV <- as.numeric(as.character((dat7$RO_pool12EV)))/as.numeric(as.character((dat7$DP_pool12EV)))
dat7$Freq_all_pool11EJ <- as.numeric(as.character((dat7$RO_pool11EJ)))/as.numeric(as.character((dat7$DP_pool11EJ)))
dat7$Freq_all_pool10ER <- as.numeric(as.character((dat7$RO_pool10ER)))/as.numeric(as.character((dat7$DP_pool10ER)))
dat7$Freq_all_pool9KV <- as.numeric(as.character((dat7$RO_pool9KV)))/as.numeric(as.character((dat7$DP_pool9KV)))
dat7

dat8 <- data.frame(dat7$Freq_all_pool7KR, dat7$Freq_all_pool6GV, dat7$Freq_all_pool5GJ, dat7$Freq_all_pool4GR, dat7$Freq_all_pool3TV, dat7$Freq_all_pool2TJ, dat7$Freq_all_pool1TR, dat7$Freq_all_pool12E, dat7$Freq_all_pool11E, dat7$Freq_all_pool10E, dat7$Freq_all_pool9KV) 

dat8

write.csv(dat7, "meta_data.csv")

# quelle est la freq all la plus basse ? --> là ou il y a l'allele alternatif qui est le plus représanté ?

plot(dat8[1,])
