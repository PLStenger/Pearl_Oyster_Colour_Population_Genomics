#!/usr/bin/env Rscript
################ WGCNA RNA-seq Analysis ############
####################################################
rm(list=ls())

library("assertthat")
library("scales")
library("WGCNA")

ALLOW_WGCNA_THREADS=20
setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests")

load("dataInput_subset.Rda")
load("sft_signed.Rda")

############### Relating genes with traits and identifying important traits ##############
##########################################################################################

#=====================================================================================
#
#  Code chunk 1
#
#=====================================================================================

# The following setting is important, do not omit.
options(stringsAsFactors = FALSE);
# Load the expression and trait data saved in the first part
lnames = load(file = "dataInput_subset.Rda");
#The variable lnames contains the names of loaded variables.
lnames
# Load network data saved in the second part.
lnames = load(file = "networkConstruction-stepByStep_subset.noalbinos.Rda");
lnames


#=====================================================================================
#
#  Code chunk 2
#
#=====================================================================================


# Define numbers of genes and samples
nGenes = ncol(datExpr);
nSamples = nrow(datExpr);
# Recalculate MEs with color labels
MEs0 = moduleEigengenes(datExpr, moduleColors)$eigengenes
MEs = orderMEs(MEs0)
moduleTraitCor = cor(MEs, datTraits, use = "p");
moduleTraitPvalue = corPvalueStudent(moduleTraitCor, nSamples);
#moduleTraitPvalue[moduleTraitPvalue>0.049]<-0
#moduleTraitCor[moduleTraitCor > -0.6 & moduleTraitCor < 0.6]<-0
head(moduleTraitCor)
head(moduleTraitPvalue)
#=====================================================================================
#
#  Code chunk 3
#
#=====================================================================================


sizeGrWindow(25,15)
#tiff(file = "correlation_matrix.signed.noalbinos.tiff", width =2500, height = 2000, units = "px", res = "200")
# Will display correlations and their p-values
#moduleTraitPvalue[moduleTraitPvalue >0.049]=NA #test
textMatrix =  paste(signif(moduleTraitCor, 2), "\n(",
                    signif(moduleTraitPvalue, 1), ")", sep = "");



dim(textMatrix) = dim(moduleTraitCor)
par(mar = c(6, 10, 3, 3));
# Display the correlation values within a heatmap plot
labeledHeatmap(Matrix = moduleTraitCor,
               xLabels = names(datTraits),
               yLabels = names(MEs),
               ySymbols = names(MEs),
               colorLabels = FALSE,
               colors = blueWhiteRed(50),
               textAdj = c(0.5, 0.5),
               textMatrix = textMatrix,
               setStdMargins = FALSE,
               cex.text = 0.5,
               zlim = c(-1,1),
               main = paste("Module-trait relationships"))
dev.off()


#=====================================================================================
#
#  Code chunk 4
#
#=====================================================================================


# Define variable weight containing the weight column of datTrait
albinos = as.data.frame(datTraits$albinos);
names(albinos) = "albinos"
str(albinos)
# names (colors) of the modules
modNames = substring(names(MEs), 3)

geneModuleMembership = as.data.frame(cor(datExpr, MEs, use = "p"));
str(geneModuleMembership)


MMPvalue = as.data.frame(corPvalueStudent(as.matrix(geneModuleMembership), nSamples));
str(MMPvalue)
names(geneModuleMembership) = paste("MM", modNames, sep="");
names(MMPvalue) = paste("p.MM", modNames, sep="");

geneTraitSignificance = as.data.frame(cor(datExpr, albinos, use = "p"));
GSPvalue = as.data.frame(corPvalueStudent(as.matrix(geneTraitSignificance), nSamples));

names(geneTraitSignificance) = paste("GS.", names(albinos), sep="");
names(GSPvalue) = paste("p.GS.", names(albinos), sep="");


#=====================================================================================
#
#  Code chunk 5
#
#=====================================================================================

### plot correlation module membqrship vs gene significance

module = "darkred"
column = match(module, modNames);
moduleGenes = moduleColors==module;

sizeGrWindow(7, 7);
par(mfrow = c(1,1));
verboseScatterplot(abs(geneModuleMembership[moduleGenes, column]),
                   abs(geneTraitSignificance[moduleGenes, 1]),
                   xlab = paste("Module Membership in", module, "module"),
                   ylab = "Gene significance for temperature",
                   main = paste("Module membership vs. gene significance\n"),
                   cex.main = 1.2, cex.lab = 1.2, cex.axis = 1.2, col = module)
abline(h = 0.6,v=0.8, col = "red")

module = "darkmagenta"
column = match(module, modNames);
moduleGenes = moduleColors==module;

sizeGrWindow(7, 7);
par(mfrow = c(1,1));
verboseScatterplot(abs(geneModuleMembership[moduleGenes, column]),
                   abs(geneTraitSignificance[moduleGenes, 1]),
                   xlab = paste("Module Membership in", module, "module"),
                   ylab = "Gene significance for temperature",
                   main = paste("Module membership vs. gene significance\n"),
                   cex.main = 1.2, cex.lab = 1.2, cex.axis = 1.2, col = module)
abline(h = 0.6,v=0.8, col = "red")
