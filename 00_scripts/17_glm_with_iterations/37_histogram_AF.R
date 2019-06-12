#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified")

library(ggplot2)

data <- read.table("AF_pool10ER.txt", skip=1)
datb <- read.table("AF_pool11EJ.txt", skip=1)
datc <- read.table("AF_pool12EV.txt", skip=1)
datd <- read.table("AF_pool1TR.txt", skip=1)
date <- read.table("AF_pool2TJ.txt", skip=1)
datf <- read.table("AF_pool3TV.txt", skip=1)
datg <- read.table("AF_pool4GR.txt", skip=1)
dath <- read.table("AF_pool5GJ.txt", skip=1)
dati <- read.table("AF_pool6GV.txt", skip=1)
datj <- read.table("AF_pool7KR.txt", skip=1)
datk <- read.table("AF_pool8KJ.txt", skip=1)
datl <- read.table("AF_pool9KV.txt", skip=1)


dat <- data.frame(data$V2,  datb$V2,  datc$V2,  datd$V2,  date$V2,  datf$V2,  datg$V2,  dath$V2,  dati$V2,  datj$V2,  datk$V2,  datl$V2)
colnames(dat) <- c("AF_Hatchery_Red", "AF_Hatchery_Yellow", "AF_Hatchery_Green", "AF_Takapoto_Red", "AF_Takapoto_Yellow", "AF_Takapoto_Green", "AF_Gambier_Red", "AF_Gambier_Yellow", "AF_Gambier_Green", "AF_Katiu_Red", "AF_Katiu_Yellow", "AF_Katiu_Green")
head(dat)

#dat <- read.table("dat.txt", skip=1)
#head(dat)

# For Red Specific SNPs:

#########################################################
### red
#########################################################
AF_Hatchery_Red_ok <- subset(dat, AF_Hatchery_Red <=1)

  

  
gg_AF_Hatchery_Red <-  ggplot(AF_Hatchery_Red_ok, aes(x=AF_Hatchery_Red)) + 
  geom_histogram(color="black", fill="red") +
  xlab("Allelic frequencies") +
  theme(plot.title = element_text(size=8)) +
  #ylim(0,700) +
  ggtitle(paste0("Allelic frequencies of the specific red SNPs in Hatchery",
                 "\n",
                 "only for the red phenotype",
                 "\n",
                 "Total: ", length(dat$AF_Hatchery_Red), " SNPs"))

ggsave("gg_AF_Hatchery_Red.png", width = 15, height = 10)



AF_Takapoto_Red_ok <- subset(dat, AF_Takapoto_Red <=1)

gg_AF_Takapoto_Red <- ggplot(AF_Takapoto_Red_ok, aes(x=AF_Takapoto_Red)) + 
  geom_histogram(color="black", fill="red") +
  xlab("Allelic frequencies") +
  theme(plot.title = element_text(size=8)) +
 # ylim(0,700) +
  ggtitle(paste0("Allelic frequencies of the specific red SNPs in Takapoto",
                 "\n",
                 "only for the red phenotype",
                 "\n",
                 "Total: ", length(dat$AF_Takapoto_Red), " SNPs"))


ggsave("gg_AF_Takapoto_Red.png", width = 15, height = 10)


AF_Katiu_Red_ok <- subset(dat, AF_Katiu_Red <=1)

gg_AF_Katiu_Red <- ggplot(AF_Katiu_Red_ok, aes(x=AF_Katiu_Red)) + 
  geom_histogram(color="black", fill="red") +
  xlab("Allelic frequencies") +
  theme(plot.title = element_text(size=8)) +
 # ylim(0,700) +
  ggtitle(paste0("Allelic frequencies of the specific red SNPs in Katiu",
                 "\n",
                 "only for the red phenotype",
                 "\n",
                 "Total: ", length(dat$AF_Katiu_Red), " SNPs"))

ggsave("gg_AF_Katiu_Red.png", width = 15, height = 10)


AF_Gambier_Red_ok <- subset(dat, AF_Gambier_Red <=1)

gg_AF_Gambier_Red <- ggplot(AF_Gambier_Red_ok, aes(x=AF_Gambier_Red)) + 
  geom_histogram(color="black", fill="red") +
  xlab("Allelic frequencies") +
  theme(plot.title = element_text(size=8)) +
 # ylim(0,700) +
  ggtitle(paste0("Allelic frequencies of the specific red SNPs in Gambier",
                 "\n",
                 "only for the red phenotype",
                 "\n",
                 "Total: ", length(dat$AF_Gambier_Red), " SNPs"))

ggsave("gg_AF_Gambier_Red.png", width = 15, height = 10)

#########################################################
### yellow
#########################################################
AF_Hatchery_Yellow_ok <- subset(dat, AF_Hatchery_Yellow <=1)

gg_AF_Hatchery_Yellow <- ggplot(AF_Hatchery_Yellow_ok, aes(x=AF_Hatchery_Yellow)) + 
  geom_histogram(color="black", fill="red") +
  xlab("Allelic frequencies") +
  theme(plot.title = element_text(size=8)) +
 # ylim(0,700) +
  ggtitle(paste0("Allelic frequencies of the specific red SNPs in Hatchery",
                 "\n",
                 "only for the yellow phenotype",
                 "\n",
                 "Total: ", length(dat$AF_Hatchery_Yellow), " SNPs"))

ggsave("gg_AF_Hatchery_Yellow.png", width = 15, height = 10)

AF_Takapoto_Yellow_ok <- subset(dat, AF_Takapoto_Yellow <=1)

gg_AF_Takapoto_Yellow <- ggplot(AF_Takapoto_Yellow_ok, aes(x=AF_Takapoto_Yellow)) + 
  geom_histogram(color="black", fill="red") +
  xlab("Allelic frequencies") +
  theme(plot.title = element_text(size=8)) +
#  ylim(0,700) +
  ggtitle(paste0("Allelic frequencies of the specific red SNPs in Takapoto",
                 "\n",
                 "only for the yellow phenotype",
                 "\n",
                 "Total: ", length(dat$AF_Takapoto_Yellow), " SNPs"))

ggsave("gg_AF_Takapoto_Yellow.png", width = 15, height = 10)

AF_Katiu_Yellow_ok <- subset(dat, AF_Katiu_Yellow <=1)

gg_AF_Katiu_Yellow <- ggplot(AF_Katiu_Yellow_ok, aes(x=AF_Katiu_Yellow)) + 
  geom_histogram(color="black", fill="red") +
  xlab("Allelic frequencies") +
  theme(plot.title = element_text(size=8)) +
#  ylim(0,700) +
  ggtitle(paste0("Allelic frequencies of the specific red SNPs in Katiu",
                 "\n",
                 "only for the yellow phenotype",
                 "\n",
                 "Total: ", length(dat$AF_Katiu_Yellow), " SNPs"))

ggsave("gg_AF_Katiu_Yellow.png", width = 15, height = 10)

AF_Gambier_Yellow_ok <- subset(dat, AF_Gambier_Yellow <=1)

gg_AF_Gambier_Yellow <- ggplot(AF_Gambier_Yellow_ok, aes(x=AF_Gambier_Yellow)) + 
  geom_histogram(color="black", fill="red") +
  xlab("Allelic frequencies") +
  theme(plot.title = element_text(size=8)) +
#  ylim(0,700) +
  ggtitle(paste0("Allelic frequencies of the specific red SNPs in Gambier",
                 "\n",
                 "only for the yellow phenotype",
                 "\n",
                 "Total: ", length(dat$AF_Gambier_Yellow), " SNPs"))

ggsave("gg_AF_Gambier_Yellow.png", width = 15, height = 10)

#########################################################
### green
#########################################################
AF_Hatchery_Green_ok <- subset(dat, AF_Hatchery_Green <=1)

gg_AF_Hatchery_Green <- ggplot(AF_Hatchery_Green_ok, aes(x=AF_Hatchery_Green)) + 
  geom_histogram(color="black", fill="red") +
  xlab("Allelic frequencies") +
  theme(plot.title = element_text(size=8)) +
 # ylim(0,700) +
  ggtitle(paste0("Allelic frequencies of the specific red SNPs in Hatchery",
                 "\n",
                 "only for the green phenotype",
                 "\n",
                 "Total: ", length(dat$AF_Hatchery_Green), " SNPs"))

ggsave("gg_AF_Hatchery_Green.png", width = 15, height = 10)


AF_Takapoto_Green_ok <- subset(dat, AF_Takapoto_Green <=1)

gg_AF_Takapoto_Green <- ggplot(AF_Takapoto_Green_ok, aes(x=AF_Takapoto_Green)) + 
  geom_histogram(color="black", fill="red") +
  xlab("Allelic frequencies") +
  theme(plot.title = element_text(size=8)) +
 # ylim(0,700) +
  ggtitle(paste0("Allelic frequencies of the specific red SNPs in Takapoto",
                 "\n",
                 "only for the green phenotype",
                 "\n",
                 "Total: ", length(dat$AF_Takapoto_Green), " SNPs"))

ggsave("gg_AF_Takapoto_Green.png", width = 15, height = 10)


AF_Katiu_Green_ok <- subset(dat, AF_Katiu_Green <=1)

gg_AF_Katiu_Green <- ggplot(AF_Katiu_Green_ok, aes(x=AF_Katiu_Green)) + 
  geom_histogram(color="black", fill="red") +
  xlab("Allelic frequencies") +
  theme(plot.title = element_text(size=8)) +
#  ylim(0,700) +
  ggtitle(paste0("Allelic frequencies of the specific red SNPs in Katiu",
                 "\n",
                 "only for the green phenotype",
                 "\n",
                 "Total: ", length(dat$AF_Katiu_Green), " SNPs"))

ggsave("gg_AF_Katiu_Green.png", width = 15, height = 10)

AF_Gambier_Green_ok <- subset(dat, AF_Gambier_Green <=1)

gg_AF_Gambier_Green <- ggplot(AF_Gambier_Green_ok, aes(x=AF_Gambier_Green)) + 
  geom_histogram(color="black", fill="red") +
  xlab("Allelic frequencies") +
  theme(plot.title = element_text(size=8)) +
 # ylim(0,700) +
  ggtitle(paste0("Allelic frequencies of the specific red SNPs in Gambier",
                 "\n",
                 "only for the green phenotype",
                 "\n",
                 "Total: ", length(dat$AF_Gambier_Green), " SNPs"))

ggsave("gg_AF_Gambier_Green.png", width = 15, height = 10)



library("gridExtra")

#grid.arrange(gg_AF_Hatchery_Red, gg_AF_Takapoto_Red, gg_AF_Katiu_Red, gg_AF_Gambier_Red, gg_AF_mean_Red, gg_AF_Hatchery_Yellow , gg_AF_Takapoto_Yellow , gg_AF_Katiu_Yellow, gg_AF_Gambier_Yellow, gg_AF_mean_Yellow, gg_AF_Hatchery_Green, gg_AF_Takapoto_Green, gg_AF_Katiu_Green, gg_AF_Gambier_Green, gg_AF_mean_Green, gg_AF_mean_Hatchery, gg_AF_mean_Takapoto, gg_AF_mean_Katiu, gg_AF_mean_Gambier,
#    labels=c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S"), ncol = 5, nrow = 4)


grid.arrange(gg_AF_Hatchery_Red, gg_AF_Takapoto_Red, gg_AF_Katiu_Red, gg_AF_Gambier_Red, gg_AF_mean_Red, gg_AF_Hatchery_Yellow , gg_AF_Takapoto_Yellow , gg_AF_Katiu_Yellow, gg_AF_Gambier_Yellow, gg_AF_mean_Yellow, gg_AF_Hatchery_Green, gg_AF_Takapoto_Green, gg_AF_Katiu_Green, gg_AF_Gambier_Green, 
             ncol = 4, nrow = 3)
ggsave("gg_AF_ALL.png", width = 30, height = 25)

