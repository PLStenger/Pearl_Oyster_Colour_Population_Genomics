#!/usr/bin/env bash
#PBS -q omp
#PBS -l walltime=120:00:00
#PBS -l mem=120g
#PBS -l ncpus=4

#Global variables
ASSEMBLY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/sspace.final.scaffolds.fasta
WORKING_DIRECTORY=/home1/scratch/plstenge/BWA/mapping_BWA_sspace.final.scaffolds.fasta
SCRIPT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts
BWA="bwa"			
BWA_ENV=". /appli/bioinfo/bwa/latest/env.sh"

#BWA

cd ${WORKING_DIRECTORY}
  
${BWA_ENV}
  
time bwa mem -t 4 -M ${ASSEMBLY} /home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/03_trimmed/HI.4506.001.NS_Adaptor_13.pool5GJ_R1.paired.fastq.gz /home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/03_trimmed/HI.4506.001.NS_Adaptor_13.pool5GJ_R2.paired.fastq.gz > HI.4506.001.NS_Adaptor_13.pool5GJ_05_mapping_unique_sequentiel.sam

