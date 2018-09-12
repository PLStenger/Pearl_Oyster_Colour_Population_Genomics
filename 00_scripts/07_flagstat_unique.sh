#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g


#Global variables
WORKING_DIRECTORY=/home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped
SCRIPT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts
SAMTOOLS="samtools"
SAM_ENV=". /appli/bioinfo/samtools/latest/env.sh"

cd $WORKING_DIRECTORY
$SAM_ENV

$SAMTOOLS flagstat HI.4506.005.NS_Adaptor_9.pool1TR_05_mapping_unique_sequentiel.bam > HI.4506.005.NS_Adaptor_9.pool1TR_05_mapping_unique_sequentiel_flagstat.txt
$SAMTOOLS flagstat HI.4506.005.NS_Adaptor_9.pool1TR_filtered.bam > HI.4506.005.NS_Adaptor_9.pool1TR_filtered_flagstat.txt 
$SAMTOOLS flagstat HI.4527.006.NS_Adaptor_18.pool10ER_05_mapping_unique_sequentiel.bam > HI.4527.006.NS_Adaptor_18.pool10ER_05_mapping_unique_sequentiel_flagstat.txt
$SAMTOOLS flagstat HI.4527.006.NS_Adaptor_18.pool10ER_filtered.bam > HI.4527.006.NS_Adaptor_18.pool10ER_filtered_flagstat.txt 
$SAMTOOLS flagstat HI.4527.005.NS_Adaptor_19.pool11EJ_05_mapping_unique_sequentiel.bam > HI.4527.005.NS_Adaptor_19.pool11EJ_05_mapping_unique_sequentiel_flagstat.txt
$SAMTOOLS flagstat HI.4527.005.NS_Adaptor_19.pool11EJ_filtered.bam > HI.4527.005.NS_Adaptor_19.pool11EJ_filtered_flagstat.txt
$SAMTOOLS flagstat HI.4506.004.NS_Adaptor_10.pool2TJ_05_mapping_unique_sequentiel.bam > HI.4506.004.NS_Adaptor_10.pool2TJ_05_mapping_unique_sequentiel_flagstat.txt
$SAMTOOLS flagstat HI.4506.004.NS_Adaptor_10.pool2TJ_filtered.bam > HI.4506.004.NS_Adaptor_10.pool2TJ_filtered_flagstat.txt
