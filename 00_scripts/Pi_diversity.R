setwd("~/CARNATION/Thèse/Génomique des Populations/04 - Analyses PWGS/07 - vcf files/01 - VCF files - Tests statistiques - fichiers/02 - Test stat adapté PL/03 - without iterations/29 - Pi diversity analysis")


TR <- read.table("results_pi_TR.txt", header=T)
TJ <- read.table("results_pi_TJ.txt", header=T)
KV <- read.table("results_pi_KV.txt", header=T)
KR <- read.table("results_pi_KR.txt", header=T)
KJ <- read.table("results_pi_KJ.txt", header=T)
GV <- read.table("results_pi_GV.txt", header=T)
GR <- read.table("results_pi_GR.txt", header=T)
GJ <- read.table("results_pi_GJ.txt", header=T)
EV <- read.table("results_pi_EV.txt", header=T)
ER <- read.table("results_pi_ER.txt", header=T)
EJ <- read.table("results_pi_EJ.txt", header=T)
TV <- read.table("results_pi_TV.txt", header=T)




TR_TJ <- merge(TR, TJ, by="row.names", all = T)
colnames(TR_TJ) <- c("RN", "TR", "TJ")
head(TR_TJ)

KV_KR <- merge(KV, KR, by="row.names", all = T)
colnames(KV_KR) <- c("RN", "KV", "KR")

KJ_GV <- merge(KJ, GV, by="row.names", all = T)
colnames(KJ_GV) <- c("RN", "KJ", "GV")

GR_GJ <- merge(GR, GJ, by="row.names", all = T)
colnames(GR_GJ) <- c("RN", "GR", "GJ")

EV_ER <- merge(EV, ER, by="row.names", all = T)
colnames(EV_ER) <- c("RN", "EV", "ER")

EJ_TV <- merge(EJ, TV, by="row.names", all = T)
colnames(EJ_TV) <- c("RN", "EJ", "TV")

TR_TJ_KV_KR <- merge(TR_TJ, KV_KR, by="row.names", all = T)
KJ_GV_GR_GJ <- merge(KJ_GV, GR_GJ, by="row.names", all = T)
EV_ER_EJ_TV <- merge(EV_ER, EJ_TV, by="row.names", all = T)

TR_TJ_KV_KR_KJ_GV_GR_GJ <- merge(TR_TJ_KV_KR, KJ_GV_GR_GJ, by="row.names", all = T)
dat <- merge(TR_TJ_KV_KR_KJ_GV_GR_GJ, EV_ER_EJ_TV, by="row.names", all = T)

head(dat)


colnames(dat) <- c("rn", "rn2", "rn3", "rn4", "TR", "TJ", "RN", "KV", "KR", "rn4", "Rn5", "KJ", "GV", "Rn6", "GR", "GJ", "Rn7", "Rn8", "EV", "ER", "Rn9", "EJ", "TV")

dat$RN <- NULL
dat$rn <- NULL
dat$rn2 <- NULL
dat$rn3 <- NULL
dat$rn4 <- NULL
dat$Rn5 <- NULL
dat$Rn6 <- NULL
dat$Rn7 <- NULL
dat$Rn8 <- NULL
dat$Rn9 <- NULL

tail(dat)

library(dplyr)
library(tidyr)

TR2 <- data.frame(dat$TR, rep("TR", length(dat$TR)))
colnames(TR2) <- c("value", "condition")
head(TR2)

TJ2 <- data.frame(dat$TJ, rep("TJ", length(dat$TJ)))
colnames(TJ2) <- c("value", "condition")
head(TJ2)

KV2 <- data.frame(dat$KV, rep("KV", length(dat$KV)))
colnames(KV2) <- c("value", "condition")
head(KV2)

KR2 <- data.frame(dat$KR, rep("KR", length(dat$KR)))
colnames(KR2) <- c("value", "condition")
head(KR2)

KJ2 <- data.frame(dat$KJ, rep("KJ", length(dat$KJ)))
colnames(KJ2) <- c("value", "condition")
head(KJ2)

GV2 <- data.frame(dat$GV, rep("GV", length(dat$GV)))
colnames(GV2) <- c("value", "condition")
head(GV2)

GR2 <- data.frame(dat$GR, rep("GR", length(dat$GR)))
colnames(GR2) <- c("value", "condition")
head(GR2)

GJ2 <- data.frame(dat$GJ, rep("GJ", length(dat$GJ)))
colnames(GJ2) <- c("value", "condition")
head(GJ2)

EV2 <- data.frame(dat$EV, rep("EV", length(dat$EV)))
colnames(EV2) <- c("value", "condition")
head(EV2)

ER2 <- data.frame(dat$ER, rep("ER", length(dat$ER)))
colnames(ER2) <- c("value", "condition")
head(ER2)

EJ2 <- data.frame(dat$EJ, rep("EJ", length(dat$EJ)))
colnames(EJ2) <- c("value", "condition")
head(EJ2)

TV2 <- data.frame(dat$TV, rep("TV", length(dat$TV)))
colnames(TV2) <- c("value", "condition")
head(TV2)


dat2 <- rbind(rbind(rbind(rbind(rbind(rbind(rbind(rbind(rbind(rbind(rbind(TV2, EJ2), ER2), EV2), GJ2), GR2), GV2), KJ2), KR2), KV2), TJ2), TR2)
head(dat2)

library(ggplot2)
library(ggpubr)

str(dat2)
dat2$value <- as.numeric(dat2$value)

unique(dat2$condition)

my_comparisons <- list( c("TV", "EJ"), c("ER", "EV"), c("GV", "KR") )


ggplot(dat2, aes(x=condition, y=value)) + 
  geom_boxplot() + stat_compare_means()




kruskal.test(value ~ condition, data = dat2) #p-value = 0.9796

res <- pairwise.wilcox.test(dat2$value, dat2$condition,
                            p.adjust.method = "BH")
