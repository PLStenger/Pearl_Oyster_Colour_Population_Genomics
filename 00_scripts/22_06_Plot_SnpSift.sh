#!/usr/bin/env bash
#PBS -q omp
#PBS -l walltime=180:00:00
#PBS -l mem=1024g
#PBS -l ncpus=6

DATAWORK=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/09_snpEff_glm
SCRIPT_FOLDER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/

cd $DATAWORK

#Chargement de conda
export PATH=$PATH:/appli/anaconda/2.7/bin

#Chargement de votre environnement
source activate /home1/datawork/plstenge/96_env_conda/glm

SCRIPT_R=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/22_06_Plot_SnpSift.R

Rscript --vanilla $SCRIPT_R >& ${SCRIPT_FOLDER}/22_06_Plot_SnpSift.out

