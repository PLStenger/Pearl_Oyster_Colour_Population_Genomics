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

$SAMTOOLS flagstat /home1/scratch/plstenge/filtering_bamfiles/HI.4506.005.NS_Adaptor_9.pool1TR_filtered_sorted.bam > /home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/06_flagstat/HI.4506.005.NS_Adaptor_9.pool1TR_filtered_sorted_flagstat.txt
$SAMTOOLS flagstat /home1/scratch/plstenge/filtering_bamfiles/HI.4506.004.NS_Adaptor_10.pool2TJ_filtered_sorted.bam > /home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/06_flagstat/HI.4506.004.NS_Adaptor_10.pool2TJ_filtered_sorted_flagstat.txt
$SAMTOOLS flagstat /home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped/HI.4506.003.NS_Adaptor_11.pool3TV_filtered_sorted.bam > /home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/06_flagstat/HI.4506.003.NS_Adaptor_11.pool3TV_filtered_sorted_flagstat.txt
$SAMTOOLS flagstat /home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped/HI.4499.006.NS_Adaptor_16.pool8KJ_filtered_sorted.bam > /home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/06_flagstat/HI.4499.006.NS_Adaptor_16.pool8KJ_filtered_sorted_flagstat.txt
$SAMTOOLS flagstat /home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped/HI.4527.007.NS_Adaptor_17.pool9KV_filtered_sorted.bam > /home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/06_flagstat/HI.4527.007.NS_Adaptor_17.pool9KV_filtered_sorted_flagstat.txt
$SAMTOOLS flagstat /home1/scratch/plstenge/filtering_bamfiles/HI.4527.006.NS_Adaptor_18.pool10ER_filtered_sorted.bam > /home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/06_flagstat/HI.4527.006.NS_Adaptor_18.pool10ER_filtered_sorted_flagstat.txt
$SAMTOOLS flagstat /home1/scratch/plstenge/filtering_bamfiles/HI.4527.005.NS_Adaptor_19.pool11EJ_filtered_sorted.bam > /home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/06_flagstat/HI.4527.005.NS_Adaptor_19.pool11EJ_filtered_sorted_flagstat.txt
$SAMTOOLS flagstat /home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped/HI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted.bam > /home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/06_flagstat/HI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted_flagstat.txt
$SAMTOOLS flagstat /home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped/HI.4506.002.NS_Adaptor_12.pool4GR_05_mapping_unique_sequentiel.bam > /home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/06_flagstat/HI.4506.002.NS_Adaptor_12.pool4GR_05_mapping_unique_sequentiel_flagstat.txt
$SAMTOOLS flagstat /home1/scratch/plstenge/BWA/mapping_BWA_sspace.final.scaffolds.fasta/HI.4506.002.NS_Adaptor_12.pool4GR_filtered.bam > /home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/06_flagstat/HI.4506.002.NS_Adaptor_12.pool4GR_filtered_flagstat.txt
