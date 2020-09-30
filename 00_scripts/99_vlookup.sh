#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

cd /home/datawork-rmpf/p_margaritifera/pl-pwgs/07_snpeff

awk -v OFS='_' '{print $1, $2}' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_RedVsGreen_dat_P_0_000000001_SNPEff_no_header_02.vcf > RedVsGreen_dat_P_0_000000001_list.txt
awk -v OFS='_' '{print $1, $2}' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsGreen_dat_P_0_000000001_SNPEff_no_header_02.vcf > YellowVsGreen_dat_P_0_000000001_list.txt
awk -v OFS='_' '{print $1, $2}' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsRed_dat_P_0_000000001_SNPEff_no_header_02.vcf > YellowVsRed_dat_P_0_000000001_list.txt

awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
FNR==NR{
  a[$1]=$2
  next
}
{ if ($1 in a) {print $1, a[$1]} else {print $1, "NA"}  }'  RedVsGreen_dat_P_0_000000001_list.txt  YellowVsGreen_dat_P_0_000000001_list.txt > Green_specific_SNPs_P_0_000000001_list.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
FNR==NR{
  a[$1]=$2
  next
}
{ if ($1 in a) {print $1, a[$1]} else {print $1, "NA"}  }'  RedVsGreen_dat_P_0_000000001_list.txt  YellowVsRed_dat_P_0_000000001_list.txt > Red_specific_SNPs_P_0_000000001_list.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
FNR==NR{
  a[$1]=$2
  next
}
{ if ($1 in a) {print $1, a[$1]} else {print $1, "NA"}  }'  YellowVsRed_dat_P_0_000000001_list.txt  YellowVsGreen_dat_P_0_000000001_list.txt > Yellow_specific_SNPs_P_0_000000001_list.txt


