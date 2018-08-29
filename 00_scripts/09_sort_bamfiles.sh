#!/usr/bin/env bash
#PBS -q omp
#PBS -l ncpus=16
#PBS -l mem=60gb
#PBS -l walltime=48:00:00

#Global variables
WORKING_DIRECTORY=/home1/scratch/plstenge/filtering_bamfiles
DATAOUTPUT=/home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped_filtered
INPUT=/home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped
SCRIPT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts
HEADER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/header.txt
SAMTOOLS_ENV=". /appli/bioinfo/samtools/latest/env.sh"
SAMTOOLS="samtools"


$HEADER

cd $INPUT

$SAMTOOLS_ENV

$SAMTOOLS view sort HI.4499.007.NS_Adaptor_15.pool7KR_filtered.bam > HI.4499.007.NS_Adaptor_15.pool7KR_filtered_sorted.bam
