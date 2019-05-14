#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATAWORK=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_02_input_pvalued_without_iteration
SCRIPT_FOLDER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/17_glm_with_iterations

cd $DATAWORK

#Chargement de conda
export PATH=$PATH:/appli/anaconda/2.7/bin

#Chargement de votre environnement
source activate /home1/datawork/plstenge/96_env_conda/glm

SCRIPT_R=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/17_glm_with_iterations/28_find_significant_SNP.R

Rscript --vanilla $SCRIPT_R >& ${SCRIPT_FOLDER}/28_find_significant_SNP.out
