#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home1/datawork/plstenge/crassostrea/gffread
GENOME_FASTA=/home1/datawork/plstenge/crassostrea/oyster_v9_AMP_enriched.fa.fasta
GFF=/home1/datawork/plstenge/crassostrea/Oyster_V9_AMP_sorted_gff.gff

# https://github.com/gpertea/gffread


cd $DATADIRECTORY

#gffread -w transcripts.fa -g /path/to/genome.fa transcripts.gtf
#gffread your_transcripts.gff -g genomic_reference.fasta -w your_transcripts.fasta

gffread $GFF -g $GENOME_FASTA -w your_transcripts.fasta

#bedtools getfasta -fi $GENOME_FASTA -bed $GFF > $DATADIRECTORY/oyster_v9_AMP_enriched_ok.fasta
