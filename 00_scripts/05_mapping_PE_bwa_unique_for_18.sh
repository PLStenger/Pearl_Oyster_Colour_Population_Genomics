#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=90:00:00
#PBS -l select=1:ncpus=16:mem=115g

#Global variables
ASSEMBLY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/sspace.final.scaffolds.fasta
WORKING_DIRECTORY=/home1/scratch/plstenge/BWA/mapping_BWA_sspace.final.scaffolds.fasta
SCRIPT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts
BWA="bwa"			
BWA_ENV=". /appli/bioinfo/bwa/latest/env.sh"

#BWA

cd ${WORKING_DIRECTORY}
  
${BWA_ENV}
  
time bwa mem -t 16 -M ${ASSEMBLY} /home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/03_trimmed/HI.4527.006.NS_Adaptor_18.pool10ER_R1.paired.fastq.gz /home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/03_trimmed/HI.4527.006.NS_Adaptor_18.pool10ER_R2.paired.fastq.gz > HI.4527.006.NS_Adaptor_18.pool10ER_05_mapping_unique_sequentiel.sam

