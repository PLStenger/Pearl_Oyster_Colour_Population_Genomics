#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified")

library("yarrr")
library("tidyr") 

#data <- read.table("AF_pool10ER.txt", skip=1)
#datb <- read.table("AF_pool11EJ.txt", skip=1)
#datc <- read.table("AF_pool12EV.txt", skip=1)
#datd <- read.table("AF_pool1TR.txt", skip=1)
#date <- read.table("AF_pool2TJ.txt", skip=1)
#datf <- read.table("AF_pool3TV.txt", skip=1)
#datg <- read.table("AF_pool4GR.txt", skip=1)
#dath <- read.table("AF_pool5GJ.txt", skip=1)
#dati <- read.table("AF_pool6GV.txt", skip=1)
#datj <- read.table("AF_pool7KR.txt", skip=1)
#datk <- read.table("AF_pool8KJ.txt", skip=1)
#datl <- read.table("AF_pool9KV.txt", skip=1)
#
#
#dat <- data.frame(datd$V2, datj$V2, datg$V2, data$V2, date$V2, datk$V2, dath$V2, datb$V2, datf$V2, datl$V2, dati$V2, datc$V2)
#colnames(dat) <- c("Takapoto_R", "Katiu_R", "Gambier_R", "Hatchery_R", "Takapoto_Y", "Katiu_Y", "Gambier_Y", "Hatchery_Y", "Takapoto_G", "Katiu_G", "Gambier_G", "Hatchery_G")
#head(dat)
#str(dat)
#
#dat3 <- gather(dat)
#head(dat3)
#
#kruskal.test(key ~ value, data = dat3) 
#
#pairwise.wilcox.test(dat3$value, dat3$key, p.adjust.method = "BH")
#
#save(dat3, file = "pirate_plot_1.rda")

#pdf(file = "pirateplot.pdf", width = 15, height = 6)

load("pirate_plot_1.rda")

head(dat3)

Takapoto_R <- dat3[ which(dat3$key=='Takapoto_R'),]

head(Takapoto_R)

pdf(file = "Takapoto_R_pirateplot.pdf", width = 4, height = 16)

pirateplot(formula = value ~ key,
           data = Takapoto_R,
           xlab = "Populations",
           ylab = "Allelic frequencies",
           pal = c("red"),
           theme = 0,
           #pal = "southpark", # southpark color palette
           bean.f.o = .6, # Bean fill
           bean.b.o = .9, 
           bean.b.col = "black",
           point.o = .3, # Points
           inf.f.o = .7, # Inference fill
           inf.b.o = .8, # Inference border
           avg.line.o = 0.8, # Average line
           bar.f.o = .5, # Bar
           inf.f.col = "white", # Inf fill col
           #inf.f.col = "black", # Inf fill col
           inf.b.col = "black", # Inf border col
           avg.line.col = "black", # avg line col
           bar.f.col = gray(1), # bar filling color
           point.pch = 21,
           point.bg = "white",
           #point.bg = "black",
           point.col = "black",
           point.cex = .1)
		 
           
dev.off()


Takapoto_R <- dat3[ which(dat3$key=='Katiu_R'),]

pdf(file = "Katiu_R_pirateplot.pdf", width = 4, height = 16)

pirateplot(formula = value ~ key,
           data = Katiu_R,
           xlab = "Populations",
           ylab = "Allelic frequencies",
           pal = c("red"),
           theme = 0,
           #pal = "southpark", # southpark color palette
           bean.f.o = .6, # Bean fill
           bean.b.o = .9, 
           bean.b.col = "black",
           point.o = .3, # Points
           inf.f.o = .7, # Inference fill
           inf.b.o = .8, # Inference border
           avg.line.o = 0.8, # Average line
           bar.f.o = .5, # Bar
           inf.f.col = "white", # Inf fill col
           #inf.f.col = "black", # Inf fill col
           inf.b.col = "black", # Inf border col
           avg.line.col = "black", # avg line col
           bar.f.col = gray(1), # bar filling color
           point.pch = 21,
           point.bg = "white",
           #point.bg = "black",
           point.col = "black",
           point.cex = .1)
		 
           
dev.off()


