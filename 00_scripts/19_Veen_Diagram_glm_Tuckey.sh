#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g


DATAWORK=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_glm_tuckey

cd $DATAWORK

#Chargement de conda
export PATH=$PATH:/appli/anaconda/2.7/bin

#Chargement de votre environnement
source activate /home1/datawork/plstenge/96_env_conda/glm

SCRIPT_R=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/19_Veen_Diagram_glm_Tuckey.R

Rscript --vanilla $SCRIPT_R >& ${SCRATCH}/19_Veen_Diagram_glm_Tuckey.out
