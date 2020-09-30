#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home/datawork-rmpf/p_margaritifera/pl-pwgs/07_snpeff
BEDTOOLS_ENV=". /appli/bioinfo/bedtools/2.27.1/env.sh" # https://bedtools.readthedocs.io/en/latest/content/tools/getfasta.html

cd $DATADIRECTORY

$BEDTOOLS_ENV

sed '/#/d' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_RedVsGreen_dat_P_0_000000001_SNPEff.vcf > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_RedVsGreen_dat_P_0_000000001_SNPEff_no_header.vcf
sed '/#/d' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsGreen_dat_P_0_000000001_SNPEff.vcf > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsGreen_dat_P_0_000000001_SNPEff_no_header.vcf
sed '/#/d' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsRed_dat_P_0_000000001_SNPEff.vcf > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsRed_dat_P_0_000000001_SNPEff_no_header.vcf

awk -v OFS='\t' '{print $1, $2, $2, $0}' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_RedVsGreen_dat_P_0_000000001_SNPEff_no_header.vcf > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_RedVsGreen_dat_P_0_000000001_SNPEff_no_header_02.vcf
awk -v OFS='\t' '{print $1, $2, $2, $0}' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsGreen_dat_P_0_000000001_SNPEff_no_header.vcf > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsGreen_dat_P_0_000000001_SNPEff_no_header_02.vcf
awk -v OFS='\t' '{print $1, $2, $2, $0}' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsRed_dat_P_0_000000001_SNPEff_no_header.vcf > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsRed_dat_P_0_000000001_SNPEff_no_header_02.vcf

bedtools intersect -b SNP_color_selection.bed -a /home/datawork-rmpf/p_margaritifera/genome/annotation/EVM_combined.gff3 -wb -wa > SNP_color_selection_EVM_combined_gene.gff

bedtools intersect -b individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_RedVsGreen_dat_P_0_000000001_SNPEff_no_header_02.vcf -a /home/datawork-rmpf/p_margaritifera/genome/annotation/EVM_combined.gff3 -wb -wa > SNP_color_selection_EVM_combined_gene_RedVsGreen_dat_P_0_000000001_SNPEff.txt

bedtools intersect -b individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsGreen_dat_P_0_000000001_SNPEff_no_header_02.vcf -a /home/datawork-rmpf/p_margaritifera/genome/annotation/EVM_combined.gff3 -wb -wa > SNP_color_selection_EVM_combined_gene_YellowVsGreen_dat_P_0_000000001_SNPEff.txt

bedtools intersect -b individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsRed_dat_P_0_000000001_SNPEff_no_header_02.vcf -a /home/datawork-rmpf/p_margaritifera/genome/annotation/EVM_combined.gff3 -wb -wa > SNP_color_selection_EVM_combined_gene_YellowVsRed_dat_P_0_000000001_SNPEff.txt
