#!/usr/bin/env bash
#PBS -q omp
#PBS -l walltime=600:00:00
#PBS -l mem=115g
#PBS -l ncpus=56

# Au final on va essayer de dealer avec les complexes, et va tenter de les decomplexifier

WORKING_DIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified
VT_ENV=". /appli/bioinfo/vt/2015.11.10/env.sh"


$VT_ENV
cd $WORKING_DIRECTORY

#decomposes biallelic block substitutions and write out to decomposed_blocksub.vcf
vt decompose_blocksub individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf -o individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex.vcf
