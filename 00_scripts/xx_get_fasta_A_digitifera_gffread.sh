#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home1/datahome/plstenge/A_digitifera
GENOME_FASTA=/home1/datahome/plstenge/A_digitifera/GCF_000222465.1_Adig_1.1_genomic_database_06_col1.fna
GFF=/home1/datahome/plstenge/A_digitifera/GCF_000222465.1_Adig_1.1_genomicMOD.gtf

# https://github.com/gpertea/gffread


cd $DATADIRECTORY

#gffread -w transcripts.fa -g /path/to/genome.fa transcripts.gtf
#gffread your_transcripts.gff -g genomic_reference.fasta -w your_transcripts.fasta

gffread $GFF -g $GENOME_FASTA -w GCF_000222465.1_Adig_1.1_genomicMOD.fasta

#bedtools getfasta -fi $GENOME_FASTA -bed $GFF > $DATADIRECTORY/oyster_v9_AMP_enriched_ok.fasta
