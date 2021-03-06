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

$SAMTOOLS sort /home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped/HI.4527.006.NS_Adaptor_18.pool10ER_filtered.bam > /home1/scratch/plstenge/filtering_bamfiles/HI.4527.006.NS_Adaptor_18.pool10ER_filtered_sorted.bam
