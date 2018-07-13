#!/usr/bin/env Rscript
################ WGCNA RNA-seq Analysis ############
####################################################
rm(list=ls())

library("assertthat")
library("scales")
library("WGCNA")

ALLOW_WGCNA_THREADS=20
setwd("/home1/datawork/pauffret/couleur/src/wgcna/analyse_2_filter_10_5_50_echa/couleurs_detaillees")

load("dataInput_subset.Rda")
load("sft_signed.Rda")
