#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

#Global variables
WORDING_DIRECTORY=/home1/scratch/plstenge/filtering_bamfiles
SCRIPT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts
SAMTOOLS_ENV=". /appli/bioinfo/samtools/latest/env.sh"
SAMTOOLS="samtools"

cd $WORDING_DIRECTORY
$SAMTOOLS_ENV

$SAMTOOLS sort /home1/scratch/plstenge/BWA/mapping_BWA_sspace.final.scaffolds.fasta/HI.4506.002.NS_Adaptor_12.pool4GR_filtered.bam > /home1/scratch/plstenge/filtering_bamfiles/HI.4506.002.NS_Adaptor_12.pool4GR_filtered_sorted.bam
