#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g


#Global variables
WORKING_DIRECTORY=/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/06_flagstat
SCRIPT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts
SAMTOOLS="samtools"
SAM_ENV=". /appli/bioinfo/samtools/latest/env.sh"

cd $WORKING_DIRECTORY
$SAM_ENV

$SAMTOOLS flagstat /home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped/HI.4499.007.NS_Adaptor_15.pool7KR_filtered_sorted.bam > /home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/06_flagstat/HI.4499.007.NS_Adaptor_15.pool7KR_filtered_sorted_flagstat.txt
$SAMTOOLS flagstat /home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped/HI.4506.002.NS_Adaptor_12.pool4GR_filtered_sorted.bam > /home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/06_flagstat/HI.4506.002.NS_Adaptor_12.pool4GR_filtered_sorted_flagstat.txt
