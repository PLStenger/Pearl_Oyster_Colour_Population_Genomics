#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

# In order to filter just snp with vcffilter from vcflib

# -f, --info-filter: specifies a filter to apply to the info fields of records,removes alleles which do not pass the filter
# DP = The number of reads covering = c'est par rapport au nombre de reads qui couvrent le snp, c'est un cut off de minimum, donc regarder "à l'oeil" les DP du VCF non filtré

DATADIRECTORY=/home1/scratch/plstenge/merged_bam	
VCFLIBENV=". /appli/bioinfo/vcflib/1.0.0_rc1/env.sh"

$VCFLIBENV
cd $DATADIRECTORY

vcffilter -g "DP > 50" -f "TYPE = snp" $DATADIRECTORY/merged_bam_ryg_paralell.vcf > $DATADIRECTORY/merged_bam_ryg_paralell.vcf_DP50.vcf
