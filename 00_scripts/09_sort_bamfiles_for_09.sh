#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

#Global variables
WORKING_DIRECTORY=/home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped
SCRIPT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts
SAMTOOLS_ENV=". /appli/bioinfo/samtools/latest/env.sh"
SAMTOOLS="samtools"


cd $WORKING_DIRECTORY

$SAMTOOLS_ENV

$SAMTOOLS sort HI.4506.005.NS_Adaptor_9.pool1TR_filtered.bam > HI.4506.005.NS_Adaptor_9.pool1TR_filtered_sorted.bam
