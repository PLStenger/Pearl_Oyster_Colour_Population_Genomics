#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home1/datahome/plstenge/A_digitifera
GENOME_FASTA=/home1/datahome/plstenge/A_digitifera/GCF_000222465.1_Adig_1.1_genomic_database_06_col1.fna
GFF=/home1/datahome/plstenge/A_digitifera/GCF_000222465.1_Adig_1.1_genomicMOD.gtf

# https://bedtools.readthedocs.io/en/latest/content/tools/getfasta.html

BEDTOOLS_ENV=". /appli/bioinfo/bedtools/2.26.0/env.sh"

$BEDTOOLS_ENV

cd $DATADIRECTORY

bedtools getfasta -fi $GENOME_FASTA -bed $GFF -split > $DATADIRECTORY/GCF_000222465.1_Adig_1.1_genomicMOD.fasta
