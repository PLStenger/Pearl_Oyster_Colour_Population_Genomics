#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data
GENOME_FASTA=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/sspace.final.scaffolds.fasta
#GFF=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/sspace.final.scaffolds.gff3
GFF=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/space.final.scaffolds_54K_CDS_3.gff3

# https://bedtools.readthedocs.io/en/latest/content/tools/getfasta.html

BEDTOOLS_ENV=". /appli/bioinfo/bedtools/2.26.0/env.sh"

$BEDTOOLS_ENV

cd $DATADIRECTORY

bedtools getfasta -fi $GENOME_FASTA -bed $GFF > $DATADIRECTORY/sspace.final.scaffolds_54K_CDS.fasta

