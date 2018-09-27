#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

# In order to filter just snp with vcffilter from vcflib

# -f, --info-filter: specifies a filter to apply to the info fields of records,removes alleles which do not pass the filter
# DP = The number of reads covering; = Total Depth

DATADIRECTORY=/home1/scratch/plstenge/freebayes	
VCFLIBENV=". /appli/bioinfo/vcflib/1.0.0_rc1/env.sh"

$VCFLIBENV
cd $DATADIRECTORY

vcffilter -f "DP > 15 & TYPE = snp" $DATADIRECTORY/platax_sex_raw_snp.vcf > $DATADIRECTORY/platax_sex_DP15_snp.vcf
