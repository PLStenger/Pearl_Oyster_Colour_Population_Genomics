#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home1/datawork/plstenge/crassostrea
GENOME_FASTA=/home1/datawork/plstenge/crassostrea/oyster_v9_AMP_enriched.fa.fasta
GFF=/home1/datawork/plstenge/crassostrea/Oyster_V9_AMP_sorted_gff.gff

# https://bedtools.readthedocs.io/en/latest/content/tools/getfasta.html

BEDTOOLS_ENV=". /appli/bioinfo/bedtools/2.26.0/env.sh"

$BEDTOOLS_ENV

cd $DATADIRECTORY

bedtools getfasta -fi $GENOME_FASTA -bed $GFF > $DATADIRECTORY/oyster_v9_AMP_enriched_ok.fasta
