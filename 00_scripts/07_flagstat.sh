#!/usr/bin/env bash
#PBS -o flagstat.out
#PBS -q omp
#PBS -l ncpus=16
#PBS -l mem=60gb
#PBS -l walltime=96:00:00


#Global variables
INPUT=/home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped
WORKING_DIRECTORY=/home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped
SCRIPT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts
SAMTOOLS="samtools"
SAM_ENV=". /appli/bioinfo/samtools/latest/env.sh"
NB_CPU=16	#number of cpus


#loop through sam files:
$SAM_ENV
for f in $INPUT/*.bam; do $SAMTOOLS flagstat $f > ${f/.flagstat_results.txt};
done
