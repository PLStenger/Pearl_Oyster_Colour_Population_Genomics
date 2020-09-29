#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home/datawork-rmpf/p_margaritifera/pl-pwgs/07_snpeff
BEDTOOLS_ENV=". /appli/bioinfo/bedtools/2.27.1/env.sh" # https://bedtools.readthedocs.io/en/latest/content/tools/getfasta.html

cd $DATADIRECTORY

$BEDTOOLS_ENV

bedtools intersect -b SNP_color_selection.bed -a /home/datawork-rmpf/p_margaritifera/genome/annotation/EVM_combined.gff3 -wa -wb > SNP_color_selection_EVM_combined_gene_upstream.gff

