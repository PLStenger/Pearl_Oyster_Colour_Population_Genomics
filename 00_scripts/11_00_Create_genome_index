#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

WORKING_DIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data
DATA=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/sspace.final.scaffolds.fasta
SAMTOOLS=". /appli/bioinfo/samtools/latest/env.sh" # samtools-1.4.1

cd $WORKING_DIRECTORY

samtools faidx $DATA
