#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

WORKING_DIRECTORY=/home2/scratch/plstenge/bam
DATA=/home2/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_genome/sspace.final.scaffolds.fasta
SAMTOOLS=". /appli/bioinfo/samtools/latest/env.sh" # samtools-1.4.1

cd $WORKING_DIRECTORY
$SAMTOOLS

samtools faidx $DATA

# Don't forget to did it:
# java -jar /home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/95_software/picard-tools-1.119/CreateSequenceDictionary.jar R= /home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/sspace.final.scaffolds.fasta O= /home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/sspace.final.scaffolds.dict
