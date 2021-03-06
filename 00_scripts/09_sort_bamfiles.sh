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

$SAMTOOLS sort HI.4499.006.NS_Adaptor_16.pool8KJ_filtered.bam > HI.4499.006.NS_Adaptor_16.pool8KJ_filtered_sorted.bam
$SAMTOOLS sort HI.4506.003.NS_Adaptor_11.pool3TV_filtered.bam > HI.4506.003.NS_Adaptor_11.pool3TV_filtered_sorted.bam
$SAMTOOLS sort HI.4527.004.NS_Adaptor_20.pool12EV_filtered.bam > HI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted.bam
$SAMTOOLS sort HI.4527.007.NS_Adaptor_17.pool9KV_filtered.bam > HI.4527.007.NS_Adaptor_17.pool9KV_filtered_sorted.bam
