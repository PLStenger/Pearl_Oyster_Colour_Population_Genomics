#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

# Data from 12_01_freebayes_pool_no_genotypes.sh

# Prepare input step:

#sed '/#/d' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsRed_dat_P_0_000000001.txt.vcf_SNPEff.vcf > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsRed_dat_P_0_000000001.txt.vcf_SNPEff_02.vcf
#awk '{print $1"\t"$2"\t"$2}' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsRed_dat_P_0_000000001.txt.vcf_SNPEff_02.vcf > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsRed_dat_P_0_000000001.txt.vcf_SNPEff.bed
#
#sed '/#/d' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsGreen_dat_P_0_000000001.txt.vcf_SNPEff.vcf > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsGreen_dat_P_0_000000001.txt.vcf_SNPEff_02.vcf
#awk '{print $1"\t"$2"\t"$2}' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsGreen_dat_P_0_000000001.txt.vcf_SNPEff_02.vcf > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsGreen_dat_P_0_000000001.txt.vcf_SNPEff.bed
#
#sed '/#/d' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_RedVsGreen_dat_P_0_000000001.txt.vcf_SNPEff.vcf > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_RedVsGreen_dat_P_0_000000001.txt.vcf_SNPEff_02.vcf
#awk '{print $1"\t"$2"\t"$2}' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_RedVsGreen_dat_P_0_000000001.txt.vcf_SNPEff_02.vcf > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_RedVsGreen_dat_P_0_000000001.txt.vcf_SNPEff.bed

VCFTOOLSENV=". /appli/bioinfo/vcftools/0.1.14/env.sh"

$VCFTOOLSENV


vcftools --vcf /home/datawork-rmpf/p_margaritifera/pl-pwgs/06_vcf/individuals.vcf --bed individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsRed_dat_P_0_000000001.txt.vcf_SNPEff.bed --out /home2/scratch/plstenge/vcf/individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf --recode --keep-INFO-all
