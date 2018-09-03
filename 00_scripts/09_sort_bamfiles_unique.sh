#!/usr/bin/env bash
#PBS -q sequentiel
#PBS -l walltime=180:00:00
#PBS -l mem=120g

#Global variables
WORKING_DIRECTORY=/home1/scratch/plstenge/filtering_bamfiles
DATAOUTPUT=/home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped_filtered
INPUT=/home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped
SCRIPT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts
HEADER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/header.txt
SAMTOOLS_ENV=". /appli/bioinfo/samtools/latest/env.sh"
SAMTOOLS="samtools"


cd $INPUT

$SAMTOOLS_ENV

$SAMTOOLS sort HI.4499.008.NS_Adaptor_14.pool6GV_filtered.bam > HI.4499.008.NS_Adaptor_14.pool6GV_filtered_sorted.bam
