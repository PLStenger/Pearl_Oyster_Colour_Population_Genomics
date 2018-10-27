#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

# Data from 12_01_freebayes_pool_no_genotypes.sh

DATADIRECTORY=/home1/scratch/plstenge/merged_bam
BCFLIBENV=". /appli/bioinfo/bcftools/1.4.1/env.sh"

$BCFLIBENV
cd $DATADIRECTORY

# Goal: remove the multi allelic list
# Manual for bcftools : http://samtools.github.io/bcftools/bcftools.html#view
# Use -m2 -M2 -v snps to only view biallelic SNPs.

bcftools view -m2 -M2 -v snps merged_bam_ryg_paralell_DP50_maf0.1_miss1.vcf.recode.vcf -o merged_bam_ryg_paralell_DP50_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf
