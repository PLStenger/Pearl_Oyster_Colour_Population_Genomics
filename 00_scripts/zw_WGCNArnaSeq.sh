#!/bin/bash
#PBS -l walltime=20:00:00
#PBS -l mem=100gb
#PBS -N "wgcna"
#PBS -o "log.wgcna.out"
#PBS -l ncpus=2
#PBS -q omp
#PBS -r n

cd $PBS_O_WORKDIR

#Chargement de conda
export PATH=$PATH:/appli/anaconda/2.7/bin

#Chargement de votre environnement
source activate /home1/scratch/plstenge/testWGCNA

SCRIPT_WGCNA=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/zw_WGCNArnaSeq.R

Rscript --vanilla $SCRIPT_WGCNA