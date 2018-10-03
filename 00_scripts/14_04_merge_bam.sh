#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

#Global variables
WORDING_DIRECTORY=/home1/scratch/plstenge/merged_bam
SCRIPT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts
SAMTOOLS_ENV=". /appli/bioinfo/samtools/latest/env.sh"
SAMTOOLS="samtools"

cd $WORDING_DIRECTORY
$SAMTOOLS_ENV

# $SAMTOOLS sort red.bam > red_sorted.bam
# $SAMTOOLS sort yellow.bam > yellow_sorted.bam
# $SAMTOOLS sort green.bam > green_sorted.bam

$SAMTOOLS index red.bam > red.bam.bai
$SAMTOOLS index yellow.bam > yellow.bam.bai
$SAMTOOLS index green.bam > green.bam.bai
