#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g

# On va essayer virer les deletions dans les complexes, et de garder les SNP dans le scaffold2460|size144317 (celui qui porte la Porpho)

VCFLIBENV=". /appli/bioinfo/vcflib/1.0.0_rc1/env.sh"

WORKING_OUT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified
VCF=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_vcf_files/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf 


$VCFLIBENV
cd $WORKING_OUT

grep "scaffold2460|size144317" $VCF > $WORKING_OUT/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_scaffold2460_size144317.vcf
vcfallelicprimitives -t, --tag-parsed COMPLEX $WORKING_OUT/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_scaffold2460_size144317.vcf > $WORKING_OUT/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_scaffold2460_size144317_NoAllComplex_TEST.vcf 
