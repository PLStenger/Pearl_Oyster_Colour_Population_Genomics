#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATA_DIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/09_snpEff_glm_without_iteration
SNPEFF=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/95_software/SNPEff_2/snpEff #/Path/to/snpEff/Folder
DBNAME=sspace.final.scaffolds.fasta

cd $DATA_DIRECTORY

for FILE in $(ls $DATADIRECTORY/*.vcf)
do

java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/${FILE##*/} CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/${FILE##*/}_SnpSift.txt

done ;

