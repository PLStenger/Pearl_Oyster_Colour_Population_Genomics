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

samtools merge green.bam HI.4506.003.NS_Adaptor_11.pool3TV_filtered_sorted_MD_sorted_split_RG.bam HI.4499.008.NS_Adaptor_14.pool6GV_filtered_sorted_MD_sorted_split_RG.bam HI.4527.007.NS_Adaptor_17.pool9KV_filtered_sorted_MD_sorted_split_RG.bam HI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted_MD_sorted_split_RG.bam ;
samtools merge yellow.bam HI.4506.004.NS_Adaptor_10.pool2TJ_filtered_sorted_MD_sorted_split_RG.bam HI.4506.001.NS_Adaptor_13.pool5GJ_filtered_sorted_MD_sorted_split_RG.bam HI.4499.006.NS_Adaptor_16.pool8KJ_filtered_sorted_MD_sorted_split_RG.bam HI.4527.005.NS_Adaptor_19.pool11EJ_filtered_sorted_MD_sorted_split_RG.bam ;
samtools merge red.bam HI.4506.005.NS_Adaptor_9.pool1TR_filtered_sorted_MD_sorted_split_RG.bam HI.4506.002.NS_Adaptor_12.pool4GR_filtered_sorted_MD_sorted_split_RG.bam HI.4499.007.NS_Adaptor_15.pool7KR_filtered_sorted_MD_sorted_split_RG.bam HI.4527.006.NS_Adaptor_18.pool10ER_filtered_sorted_MD_sorted_split_RG.bam ;
