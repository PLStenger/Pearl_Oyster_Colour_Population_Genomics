#!/usr/bin/env Rscript


#######################################################################################################################
# Import data
#######################################################################################################################

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_glm_tuckey")

dat <- read.table("all_results_ok_from_glm_with_iteration_unique_final.txt", header=T)
head(dat)

dat$RedVsGreen <- as.numeric(as.character(dat$RedVsGreen ))
dat$RedVsGreen <- as.numeric(as.character(dat$RedVsGreen ))
dat$YellowVsGreen <- as.numeric(as.character(dat$YellowVsGreen ))
dat$YellowVsGreen <- as.numeric(as.character(dat$YellowVsGreen ))
dat$YellowVsRed <- as.numeric(as.character(dat$YellowVsRed ))
dat$YellowVsRed <- as.numeric(as.character(dat$YellowVsRed ))
dat$HatcheryVsGambier <- as.numeric(as.character(dat$HatcheryVsGambier ))
dat$HatcheryVsGambier <- as.numeric(as.character(dat$HatcheryVsGambier ))
dat$KatiuVsGambier <- as.numeric(as.character(dat$KatiuVsGambier ))
dat$KatiuVsGambier <- as.numeric(as.character(dat$KatiuVsGambier ))
dat$TakapotoVsGambier <- as.numeric(as.character(dat$TakapotoVsGambier ))
dat$TakapotoVsGambier <- as.numeric(as.character(dat$TakapotoVsGambier ))
dat$KatiuVsHatchery <- as.numeric(as.character(dat$KatiuVsHatchery ))
dat$KatiuVsHatchery <- as.numeric(as.character(dat$KatiuVsHatchery ))
dat$TakapotoVsHatchery <- as.numeric(as.character(dat$TakapotoVsHatchery ))
dat$TakapotoVsHatchery <- as.numeric(as.character(dat$TakapotoVsHatchery ))
dat$TakapotoVsKatiu <- as.numeric(as.character(dat$TakapotoVsKatiu ))
dat$TakapotoVsKatiu <- as.numeric(as.character(dat$TakapotoVsKatiu ))
dat$RedVsGreen <- as.numeric(dat$RedVsGreen)

######################################################################################################
## Check the length
print("length of RedVsGreen")
length(dat$RedVsGreen)
print("length of YellowVsGreen")
length(dat$YellowVsGreen)
print("length of YellowVsRed")
length(dat$YellowVsRed)
print("length of HatcheryVsGambier")
length(dat$HatcheryVsGambier)
print("length of KatiuVsGambier")
length(dat$KatiuVsGambier)
print("length of TakapotoVsGambier")
length(dat$TakapotoVsGambier)
print("length of KatiuVsHatchery")
length(dat$KatiuVsHatchery)
print("length of TakapotoVsHatchery")
length(dat$TakapotoVsHatchery)
print("length of TakapotoVsKatiu")
length(dat$TakapotoVsKatiu)

######################################################################################################
## Check the max
print("head(dat$RedVsGreen)")
head(dat$RedVsGreen)
print("head(as.numeric(dat$RedVsGreen))")
head(as.numeric(dat$RedVsGreen))
print("max(as.numeric(dat$RedVsGreen))")
max(as.numeric(dat$RedVsGreen))
print("max of RedVsGreen")
max(dat$RedVsGreen)
print("max of YellowVsGreen")
max(dat$YellowVsGreen)
print("max of YellowVsRed")
max(dat$YellowVsRed)
print("max of HatcheryVsGambier")
max(dat$HatcheryVsGambier)
print("max of KatiuVsGambier")
max(dat$KatiuVsGambier)
print("max of TakapotoVsGambier")
max(dat$TakapotoVsGambier)
print("max of KatiuVsHatchery")
max(dat$KatiuVsHatchery)
print("max of TakapotoVsHatchery")
max(dat$TakapotoVsHatchery)
print("max of TakapotoVsKatiu")
max(dat$TakapotoVsKatiu)

######################################################################################################
## Check the min
print("min of RedVsGreen")
min(dat$RedVsGreen)
print("min of YellowVsGreen")
min(dat$YellowVsGreen)
print("min of YellowVsRed")
min(dat$YellowVsRed)
print("min of HatcheryVsGambier")
min(dat$HatcheryVsGambier)
print("min of KatiuVsGambier")
min(dat$KatiuVsGambier)
print("min of TakapotoVsGambier")
min(dat$TakapotoVsGambier)
print("min of KatiuVsHatchery")
min(dat$KatiuVsHatchery)
print("min of TakapotoVsHatchery")
min(dat$TakapotoVsHatchery)
print("min of TakapotoVsKatiu")
min(dat$TakapotoVsKatiu)



THRESHOLD <- 0.000001

print("THRESHOLD")
print(THRESHOLD)


######################################################################################################
## RedVsGreen with threshold
datRedVsGreen <- subset(dat, RedVsGreen<THRESHOLD) 
print("length of RedVsGreen with threshold")
length(datRedVsGreen$RedVsGreen)
print("Percentage of significant SNP in RedVsGreen")
((length(datRedVsGreen$RedVsGreen))*100)/length(dat$RedVsGreen)
######################################################################################################
## YellowVsGreen with threshold
datYellowVsGreen <- subset(dat, YellowVsGreen<THRESHOLD) 
print("length of YellowVsGreen with threshold")
length(datYellowVsGreen$YellowVsGreen)
print("Percentage of significant SNP in YellowVsGreen")
((length(datYellowVsGreen$YellowVsGreen))*100)/length(dat$YellowVsGreen)
######################################################################################################
## YellowVsRed with threshold
datYellowVsRed <- subset(dat, YellowVsRed<THRESHOLD) 
print("length of YellowVsRed with threshold")
length(datYellowVsRed$YellowVsRed)
print("Percentage of significant SNP in YellowVsRed")
((length(datYellowVsRed$YellowVsRed))*100)/length(dat$YellowVsRed)
######################################################################################################
## HatcheryVsGambier with threshold
datHatcheryVsGambier <- subset(dat, HatcheryVsGambier<THRESHOLD) 
print("length of HatcheryVsGambier with threshold")
length(datHatcheryVsGambier$HatcheryVsGambier)
print("Percentage of significant SNP in HatcheryVsGambier")
((length(datHatcheryVsGambier$HatcheryVsGambier))*100)/length(dat$HatcheryVsGambier)
######################################################################################################
## KatiuVsGambier with threshold
datKatiuVsGambier <- subset(dat, KatiuVsGambier<THRESHOLD) 
print("length of KatiuVsGambier with threshold")
length(datKatiuVsGambier$KatiuVsGambier)
print("Percentage of significant SNP in KatiuVsGambier")
((length(datKatiuVsGambier$KatiuVsGambier))*100)/length(dat$KatiuVsGambier)
######################################################################################################
## TakapotoVsGambier with threshold
datTakapotoVsGambier <- subset(dat, TakapotoVsGambier<THRESHOLD) 
print("length of TakapotoVsGambier with threshold")
length(datTakapotoVsGambier$TakapotoVsGambier)
print("Percentage of significant SNP in TakapotoVsGambier")
((length(datTakapotoVsGambier$TakapotoVsGambier))*100)/length(dat$TakapotoVsGambier)
######################################################################################################
## KatiuVsHatchery with threshold
datKatiuVsHatchery <- subset(dat, KatiuVsHatchery<THRESHOLD) 
print("length of KatiuVsHatchery with threshold")
length(datKatiuVsHatchery$KatiuVsHatchery)
print("Percentage of significant SNP in KatiuVsHatchery")
((length(datKatiuVsHatchery$KatiuVsHatchery))*100)/length(dat$KatiuVsHatchery)
######################################################################################################
## TakapotoVsHatchery with threshold
datTakapotoVsHatchery <- subset(dat, TakapotoVsHatchery<THRESHOLD) 
print("length of TakapotoVsHatchery with threshold")
length(datTakapotoVsHatchery$TakapotoVsHatchery)
print("Percentage of significant SNP in TakapotoVsHatchery")
((length(datTakapotoVsHatchery$TakapotoVsHatchery))*100)/length(dat$TakapotoVsHatchery)
######################################################################################################
## TakapotoVsKatiu with threshold
datTakapotoVsKatiu <- subset(dat, TakapotoVsKatiu<THRESHOLD) 
print("length of TakapotoVsKatiu with threshold")
length(datTakapotoVsKatiu$TakapotoVsKatiu)
print("Percentage of significant SNP in TakapotoVsKatiu")
((length(datTakapotoVsKatiu$TakapotoVsKatiu))*100)/length(dat$TakapotoVsKatiu)




######################################################################################################
######### Common in color
## Common SNP between RedVsGreen & YellowVsGreen (Green specific SNP)
print("Common SNP between RedVsGreen & YellowVsGreen (Green specific SNP)")
communG <- intersect(datRedVsGreen$SNP, datYellowVsGreen$SNP)
length(communG) 
## Common SNP between RedVsGreen & YellowVsRed (Red specific SNP)
print("Common SNP between RedVsGreen & YellowVsRed (Red specific SNP)")
communR <- intersect(datRedVsGreen$SNP, datYellowVsRed$SNP)
length(communR) 
## Common SNP between YellowVsGreen & YellowVsRed (Yellow specific SNP)
print("Common SNP between YellowVsGreen & YellowVsRed (Yellow specific SNP)")
communY <- intersect(datYellowVsGreen$SNP, datYellowVsRed$SNP)
length(communY) 

## Common SNP between red specific & yellow specific
print("Common SNP between red specific & yellow specific")
communYR <- intersect(communY, communR)
length(communYR) 

## Common SNP between green specific & red specific
print("Common SNP between green specific & yellow specific")
communGR <- intersect(communG, communR)
length(communGR) 

## Common SNP between green specific & yellow specific
print("Common SNP between green specific & yellow specific")
communGY <- intersect(communG, communY)
length(communGY) 

## Common SNP between green specific & red specific & yellow specific
print("Common SNP between green specific & red specific & yellow specific")
communGYR <- intersect(communGY, communGR)
length(communGYR) 


######################################################################################################
######### Common in site
## Common SNP between HatcheryVsGambier & KatiuVsHatchery & TakapotoVsHatchery (Hatchery specific SNP)
print("Common SNP between HatcheryVsGambier & KatiuVsHatchery")
commun1 <- intersect(datHatcheryVsGambier$SNP, datKatiuVsHatchery$SNP)
length(commun1)
print("Common SNP between HatcheryVsGambier & TakapotoVsHatchery")
commun2 <- intersect(datHatcheryVsGambier$SNP, datTakapotoVsHatchery$SNP)
length(commun2)
communH <- intersect(commun1, commun2)
print("Common SNP between HatcheryVsGambier & KatiuVsHatchery & TakapotoVsHatchery (Hatchery specific SNP)")
length(communH) 

## Common SNP between HatcheryVsGambier & KatiuVsGambier & TakapotoVsGambier (Gambier specific SNP)
print("Common SNP between HatcheryVsGambier & KatiuVsGambier")
commun1 <- intersect(datHatcheryVsGambier$SNP, datKatiuVsGambier$SNP)
length(commun1) 
print("Common SNP between HatcheryVsGambier & TakapotoVsGambier")
commun2 <- intersect(datHatcheryVsGambier$SNP, datTakapotoVsGambier$SNP)
length(commun2) 
communGa <- intersect(commun1, commun2)
print("Common SNP between HatcheryVsGambier & KatiuVsGambier & TakapotoVsGambier (Gambier specific SNP)")
length(communGa) 

## Common SNP between KatiuVsHatchery & KatiuVsGambier & TakapotoVsKatiu (Katiu specific SNP)
print("Common SNP between KatiuVsHatchery & KatiuVsGambier")
commun1 <- intersect(datKatiuVsHatchery$SNP, datKatiuVsGambier$SNP)
length(commun1) 
print("Common SNP between KatiuVsHatchery & TakapotoVsKatiu")
commun2 <- intersect(datKatiuVsHatchery$SNP, datTakapotoVsKatiu$SNP)
length(commun2) 
communK <- intersect(commun1, commun2)
print("Common SNP between KatiuVsHatchery & KatiuVsGambier & TakapotoVsKatiu (Katiu specific SNP)")
length(communK) 

## Common SNP between TakapotoVsGambier & TakapotoVsHatchery & TakapotoVsKatiu (Takapoto specific SNP)
print("Common SNP between TakapotoVsGambier & TakapotoVsHatchery")
commun1 <- intersect(datTakapotoVsGambier$SNP, datTakapotoVsHatchery$SNP)
print("Common SNP between TakapotoVsGambier & TakapotoVsKatiu")
commun2 <- intersect(datTakapotoVsGambier$SNP, datTakapotoVsKatiu$SNP)
communT <- intersect(commun1, commun2)
print("Common SNP between TakapotoVsGambier & TakapotoVsHatchery & TakapotoVsKatiu (Takapoto specific SNP)")
length(communT) 


## Common SNP between all site
print("Common SNP between Takapoto specific & Gambier specific")
commun1 <- intersect(communT, communGa)
length(commun1) 
print("Common SNP between Katiu specific & Hatchery specific")
commun2 <- intersect(communK, communH)
length(commun2) 
print("Common SNP between Katiu specific & Gambier specific")
commun3 <- intersect(communK, communGa)
length(commun3) 
print("Common SNP between Katiu specific & Takapoto specific")
commun4 <- intersect(communK, communT)
length(commun4) 
print("Common SNP between all site")
communAllS <- intersect(commun1, commun2)
length(communAllS) 


######################################################################################################
######### Common in site specific & color specific

######################################################################################################
## For red

## Common SNP between Red specific and Gambier specific
print("Common SNP between Red specific & Gambier specific")
communRGa <- intersect(communR, communGa)
length(communRGa) 

## Common SNP between Red specific and Hatchery specific
print("Common SNP between Red specific Hatchery specific")
communRH <- intersect(communR, communH)
length(communRH) 

## Common SNP between Red specific and Takapoto specific
print("Common SNP between Red specific & Takapoto specific")
communRT <- intersect(communR, communT)
length(communRT) 

## Common SNP between Red specific and Katiu specific
print("Common SNP between Red specific & Katiu specific")
communRK <- intersect(communR, communK)
length(communRK) 




######################################################################################################
## For green

## Common SNP between green specific and Gambier specific
print("Common SNP between Green specific & Gambier specific")
communGGa <- intersect(communG, communGa)
length(communGGa) 

## Common SNP between green specific and Hatchery specific
print("Common SNP between Green specific Hatchery specific")
communGH <- intersect(communG, communH)
length(communGH) 

## Common SNP between green specific and Takapoto specific
print("Common SNP between Green specific & Takapoto specific")
communGT <- intersect(communG, communT)
length(communRG) 

## Common SNP between green specific and Katiu specific
print("Common SNP between Green specific & Katiu specific")
communGK <- intersect(communG, communK)
length(communGK)



######################################################################################################
## For Yellow

## Common SNP between Yellow specific and Gambier specific
print("Common SNP between Yellow specific & Gambier specific")
communYGa <- intersect(communY, communGa)
length(communYGa) 

## Common SNP between Yellow specific and Hatchery specific
print("Common SNP between Yellow specific Hatchery specific")
communYH <- intersect(communY, communH)
length(communYH) 

## Common SNP between Yellow specific and Takapoto specific
print("Common SNP between Yellow specific & Takapoto specific")
communYT <- intersect(communY, communT)
length(communYG) 

## Common SNP between Yellow specific and Katiu specific
print("Common SNP between Yellow specific & Katiu specific")
communYK <- intersect(communY, communK)
length(communYK) 



######################################################################################################
######### Common in site & color 


## Common SNP between datRedVsGreen & HatcheryVsGambier
print("Common SNP between datRedVsGreen & HatcheryVsGambier")
communZ <- intersect(datRedVsGreen$SNP, datHatcheryVsGambier$SNP)
length(communZ) 

## Common SNP between datRedVsGreen & KatiuVsGambier
print("Common SNP between datRedVsGreen & KatiuVsGambier")
communZZ <- intersect(datRedVsGreen$SNP, datKatiuVsGambier$SNP)
length(communZZ) 

## Common SNP between datRedVsGreen & TakapotoVsGambier
print("Common SNP between datRedVsGreen & TakapotoVsGambier")
communZZZ <- intersect(datRedVsGreen$SNP, datTakapotoVsGambier$SNP)
length(communZZZ) 

## Common SNP between datRedVsGreen & KatiuVsHatchery
print("Common SNP between datRedVsGreen & KatiuVsHatchery")
communZZZZ <- intersect(datRedVsGreen$SNP, datKatiuVsHatchery$SNP)
length(communZZZZ) 

## Common SNP between datRedVsGreen & TakapotoVsHatchery
print("Common SNP between datRedVsGreen & TakapotoVsHatchery")
communZZZZZ <- intersect(datRedVsGreen$SNP, datTakapotoVsHatchery$SNP)
length(communZZZZZ) 

## Common SNP between datRedVsGreen & TakapotoVsKatiu
print("Common SNP between datRedVsGreen & TakapotoVsKatiu")
communZZZZZZ <- intersect(datRedVsGreen$SNP, datTakapotoVsKatiu$SNP)
length(communZZZZZZ) 


## Common SNP between datYellowVsGreen & HatcheryVsGambier
print("Common SNP between datYellowVsGreen & HatcheryVsGambier")
communW <- intersect(datYellowVsGreen$SNP, datHatcheryVsGambier$SNP)
length(communW) 

## Common SNP between datYellowVsGreen & KatiuVsGambier
print("Common SNP between datYellowVsGreen & KatiuVsGambier")
communWW <- intersect(datYellowVsGreen$SNP, datKatiuVsGambier$SNP)
length(communWW) 

## Common SNP between datYellowVsGreen & TakapotoVsGambier
print("Common SNP between datYellowVsGreen & TakapotoVsGambier")
communWWW <- intersect(datYellowVsGreen$SNP, datTakapotoVsGambier$SNP)
length(communWWW) 

## Common SNP between datYellowVsGreen & KatiuVsHatchery
print("Common SNP between datYellowVsGreen & KatiuVsHatchery")
communWWWW <- intersect(datYellowVsGreen$SNP, datKatiuVsHatchery$SNP)
length(communWWWW) 

## Common SNP between datYellowVsGreen & TakapotoVsHatchery
print("Common SNP between datYellowVsGreen & TakapotoVsHatchery")
communWWWWW <- intersect(datYellowVsGreen$SNP, datTakapotoVsHatchery$SNP)
length(communWWWWW) 

## Common SNP between datYellowVsGreen & TakapotoVsKatiu
print("Common SNP between datYellowVsGreen & TakapotoVsKatiu")
communWWWWWW <- intersect(datYellowVsGreen$SNP, datTakapotoVsKatiu$SNP)
length(communWWWWWW) 

## Common SNP between datYellowVsRed & HatcheryVsGambier
print("Common SNP between datYellowVsRed & HatcheryVsGambier")
communX <- intersect(datYellowVsRed$SNP, datHatcheryVsGambier$SNP)
length(communX) 

## Common SNP between datYellowVsRed & KatiuVsGambier
print("Common SNP between datYellowVsRed & KatiuVsGambier")
communXX <- intersect(datYellowVsRed$SNP, datKatiuVsGambier$SNP)
length(communXX) 

## Common SNP between datYellowVsRed & TakapotoVsGambier
print("Common SNP between datYellowVsRed & TakapotoVsGambier")
communXXX <- intersect(datYellowVsRed$SNP, datTakapotoVsGambier$SNP)
length(communXXX) 

## Common SNP between datYellowVsRed & KatiuVsHatchery
print("Common SNP between datYellowVsRed & KatiuVsHatchery")
communXXXX <- intersect(datYellowVsRed$SNP, datKatiuVsHatchery$SNP)
length(communXXXX) 

## Common SNP between datYellowVsRed & TakapotoVsHatchery
print("Common SNP between datYellowVsRed & TakapotoVsHatchery")
communXXXXX <- intersect(datYellowVsRed$SNP, datTakapotoVsHatchery$SNP)
length(communXXXXX) 

## Common SNP between datYellowVsRed & TakapotoVsKatiu
print("Common SNP between datYellowVsRed & TakapotoVsKatiu")
communXXXXXX <- intersect(datYellowVsRed$SNP, datTakapotoVsKatiu$SNP)
length(communXXXXXX) 




