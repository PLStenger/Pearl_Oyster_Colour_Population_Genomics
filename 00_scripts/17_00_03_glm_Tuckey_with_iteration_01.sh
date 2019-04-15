#!/usr/bin/env bash
#PBS -q omp
#PBS -l walltime=180:00:00
#PBS -l mem=1024g
#PBS -l ncpus=12

DATAWORK=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified

cd $DATAWORK

#Chargement de conda
export PATH=$PATH:/appli/anaconda/2.7/bin

#Chargement de votre environnement
source activate /home1/datawork/plstenge/96_env_conda/glm

SCRIPT_R=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/17_00_03_glm_Tuckey_with_iteration_01.R

Rscript --vanilla $SCRIPT_R >& ${SCRATCH}/17_00_03_glm_Tuckey_with_iteration_01.out
