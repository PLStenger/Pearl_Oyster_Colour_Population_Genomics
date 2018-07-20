#!/usr/bin/env Rscript
################ WGCNA RNA-seq Analysis ############
####################################################
rm(list=ls())

library("assertthat", warn.conflicts = FALSE)
library("scales", warn.conflicts = FALSE)
library("WGCNA", warn.conflicts = FALSE)
library("fastcluster", warn.conflicts = FALSE) 
library("dynamicTreeCut", warn.conflicts = FALSE) 
library("stats", warn.conflicts = FALSE) 


# library("doParallel")

ALLOW_WGCNA_THREADS=2
setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests")

load("dataInput_subset.Rda")
load("sft_signed.Rda")

# Test pour éviter ça : "Warning message:executing %dopar% sequentially: no parallel backend registered"
# registerDoParallel()

#allowWGCNAThreads(56)

#=====================================================================================
#
#  Code chunk 3
#
#=====================================================================================

### SUR DATARMOR
oftPower = 9; #reach 90%
adjacency = adjacency(datExpr, power = "softPower", type="signed");
TOM = TOMsimilarity(adjacency,TOMType = "signed");
dissTOM = 1-TOM

#save(adjacency,file="adjacency_cell.Rda")
#save(dissTOM,file="disTOM.Rda")
#save(TOM,file="TOM.Rda")

message("dissimilarity done")
#=====================================================================================
#
#  Code chunk 5
#
#=====================================================================================
# Call the hierarchical clustering function
geneTree = hclust(as.dist(dissTOM), method = "average");
# Plot the resulting clustering tree (dendrogram)
svg("genetree_subset.svg")
plot(geneTree, xlab="", sub="", main = "Gene clustering on TOM-based dissimilarity",
     labels = FALSE, hang = 0.04);
dev.off()


#=====================================================================================
#
#  Code chunk 6
#
#=====================================================================================


# We like large modules, so we set the minimum module size relatively high:
minModuleSize = 50;
# Module identification using dynamic tree cut:
dynamicMods = cutreeDynamic(dendro = geneTree, distM = dissTOM,
                            deepSplit = 2, pamRespectsDendro = FALSE,
                            minClusterSize = minModuleSize);
print("table dynamicMods")
table(dynamicMods)

#=====================================================================================
#
#  Code chunk 7
#
#=====================================================================================


# Convert numeric lables into colors
dynamicColors = labels2colors(dynamicMods)
print("table dynamicColors")
table(dynamicColors)
# Plot the dendrogram and colors underneath
svg("genetree_dyn_subset.svg")
plotDendroAndColors(geneTree, dynamicColors, "Dynamic Tree Cut",
                    dendroLabels = FALSE, hang = 0.03,
                    addGuide = TRUE, guideHang = 0.05,
                    main = "Gene dendrogram and module colors")
dev.off()

#=====================================================================================
#
#  Code chunk 8
#
#=====================================================================================



# Calculate eigengenes
MEList = moduleEigengenes(datExpr, colors = dynamicColors)
MEs = MEList$eigengenes
# Calculate dissimilarity of module eigengenes
MEDiss = 1-cor(MEs);
# Cluster module eigengenes
METree = hclust(as.dist(MEDiss), method = "average");
MEDissThres = 0.25
# Plot the result
svg("cluster_modules_subset.svg")
plot(METree, main = "Clustering of module eigengenes",
     xlab = "", sub = "")

#=====================================================================================
#
#  Code chunk 9
#
#=====================================================================================

# Plot the cut line into the dendrogram
abline(h=MEDissThres, col = "red")
dev.off()

# Call an automatic merging function
merge = mergeCloseModules(datExpr, dynamicColors, cutHeight = MEDissThres, verbose = 3)
# The merged module colors
mergedColors = merge$colors;
# Eigengenes of the new merged modules:
mergedMEs = merge$newMEs;

svg(file = "geneDendro-3_subset.svg")
plotDendroAndColors(geneTree, cbind(dynamicColors, mergedColors),
                    c("Dynamic Tree Cut", "Merged dynamic"),
                    dendroLabels = FALSE, hang = 0.03,
                    addGuide = TRUE, guideHang = 0.05)
dev.off()

#=====================================================================================
#
#  Code chunk 11
#
#=====================================================================================



# Rename to moduleColors
moduleColors = mergedColors
## Construct numerical labels corresponding to the colors
colorOrder = c("grey", standardColors(50));
moduleLabels = match(moduleColors, colorOrder)-1;
MEs = mergedMEs;
# Save module colors and labels for use in subsequent parts
#save(MEs, moduleLabels, moduleColors, geneTree, file = "networkConstruction-stepByStep_temp.Rda")


############### Relating genes with traits and identifying important traits ##############
##########################################################################################

#=====================================================================================
#
#  Code chunk 1
#
#=====================================================================================

#=====================================================================================
#
#  Code chunk 1
#
#=====================================================================================

# The following setting is important, do not omit.
#options(stringsAsFactors = FALSE);
# Load the expression and trait data saved in the first part
#lnames = load(file = "dataInput_subset.Rda");
#The variable lnames contains the names of loaded variables.
#lnames
# Load network data saved in the second part.
#lnames = load(file = "networkConstruction-stepByStep_temp.Rda");
#lnames


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
svg(file = "correlation_matrix.signed.nogreen.svg")
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
green = as.data.frame(datTraits$green);
names(green) = "green"

# names (colors) of the modules
modNames = substring(names(MEs), 3)

geneModuleMembership = as.data.frame(cor(datExpr, MEs, use = "p"));


MMPvalue = as.data.frame(corPvalueStudent(as.matrix(geneModuleMembership), nSamples));
names(geneModuleMembership) = paste("MM", modNames, sep="");
names(MMPvalue) = paste("p.MM", modNames, sep="");

geneTraitSignificance = as.data.frame(cor(datExpr, green, use = "p"));
GSPvalue = as.data.frame(corPvalueStudent(as.matrix(geneTraitSignificance), nSamples));

names(geneTraitSignificance) = paste("GS.", names(green), sep="");
names(GSPvalue) = paste("p.GS.", names(green), sep="");

save.image("wgcna_part1.Rda")

#=====================================================================================
#
#  Code chunk 4
#
#=====================================================================================


# Define variable weight containing the weight column of datTrait
red = as.data.frame(datTraits$red);
names(red) = "red"

# names (colors) of the modules
modNames = substring(names(MEs), 3)

geneModuleMembership = as.data.frame(cor(datExpr, MEs, use = "p"));


MMPvalue = as.data.frame(corPvalueStudent(as.matrix(geneModuleMembership), nSamples));
names(geneModuleMembership) = paste("MM", modNames, sep="");
names(MMPvalue) = paste("p.MM", modNames, sep="");

geneTraitSignificance = as.data.frame(cor(datExpr, red, use = "p"));
GSPvalue = as.data.frame(corPvalueStudent(as.matrix(geneTraitSignificance), nSamples));

names(geneTraitSignificance) = paste("GS.", names(red), sep="");
names(GSPvalue) = paste("p.GS.", names(red), sep="");

save.image("wgcna_part1.Rda")

#=====================================================================================
#
#  Code chunk 4
#
#=====================================================================================


# Define variable weight containing the weight column of datTrait
yellow = as.data.frame(datTraits$yellow);
names(yellow) = "yellow"

# names (colors) of the modules
modNames = substring(names(MEs), 3)

geneModuleMembership = as.data.frame(cor(datExpr, MEs, use = "p"));


MMPvalue = as.data.frame(corPvalueStudent(as.matrix(geneModuleMembership), nSamples));
names(geneModuleMembership) = paste("MM", modNames, sep="");
names(MMPvalue) = paste("p.MM", modNames, sep="");

geneTraitSignificance = as.data.frame(cor(datExpr, yellow, use = "p"));
GSPvalue = as.data.frame(corPvalueStudent(as.matrix(geneTraitSignificance), nSamples));

names(geneTraitSignificance) = paste("GS.", names(yellow), sep="");
names(GSPvalue) = paste("p.GS.", names(yellow), sep="");

save.image("wgcna_part1.Rda")




