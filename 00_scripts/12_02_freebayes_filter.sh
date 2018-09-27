#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

# In order to filter just snp with vcffilter from vcflib

# -f, --info-filter: specifies a filter to apply to the info fields of records,removes alleles which do not pass the filter
# DP = The number of reads covering = c'est par rapport au nombre de reads qui couvrent le snp, c'est un cut off de minimum, donc regarder "à l'oeil" les DP du VCF non filtré

DATADIRECTORY=/home1/scratch/plstenge/freebayes	
VCFLIBENV=". /appli/bioinfo/vcflib/1.0.0_rc1/env.sh"

$VCFLIBENV
cd $DATADIRECTORY

vcffilter -f "DP > 50 & TYPE = snp" $DATADIRECTORY/pools1_2_test.vcf > $DATADIRECTORY/pools1_2_test_filter.vcf

# ensuite il faudra ajouter des parametres
# vcftools --maf 0.1 --max-missing 1 --vcf $INDIR/platax_sex_DP15_snp.vcf --recode --out $INDIR/platax_sex_DP15_snp_maf0.1_miss0

# Céline: tu vois là dans le code j'ai mis une fréquence allélique minimum de 10% pour l'allèle minoritaire, et j'ai refusé d'avoir des génotypes manquant dans mes données
