#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

# Data from 12_01_freebayes_pool_no_genotypes.sh

DATADIRECTORY=/home1/scratch/creisser/PL_BAM_MD
VCFTOOLSENV=". /appli/bioinfo/vcftools/0.1.14/env.sh"

$VCFTOOLSENV
cd $DATADIRECTORY

# --max-missing 1 = On garde tout 

vcftools --maf 0.1 --max-missing 0.9 --vcf $DATADIRECTORY/individuals.vcf_DP10.vcf --recode --out $DATADIRECTORY/individuals.vcf_DP10_maf0.1_miss0.9.vcf
