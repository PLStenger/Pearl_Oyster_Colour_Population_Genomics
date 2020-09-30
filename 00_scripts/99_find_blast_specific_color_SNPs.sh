#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

cd /home/datawork-rmpf/p_margaritifera/pl-pwgs/07_snpeff

BEDTOOLS_ENV=". /appli/bioinfo/bedtools/2.27.1/env.sh" # https://bedtools.readthedocs.io/en/latest/content/tools/getfasta.html

$BEDTOOLS_ENV

awk -vRS="_" -vORS="\t" '1'  Green_specific_SNPs_P_0_000000001_list.txt > Green_specific_SNPs_P_0_000000001_list_02.txt
awk -vRS="_" -vORS="\t" '1'  Red_specific_SNPs_P_0_000000001_list.txt > Red_specific_SNPs_P_0_000000001_list_02.txt
awk -vRS="_" -vORS="\t" '1'  Yellow_specific_SNPs_P_0_000000001_list.txt > Yellow_specific_SNPs_P_0_000000001_list_02.txt

awk '{print $1"\t"$2"\t"$2}' Green_specific_SNPs_P_0_000000001_list_02.txt > Green_specific_SNPs_P_0_000000001_list_03.txt
awk '{print $1"\t"$2"\t"$2}' Red_specific_SNPs_P_0_000000001_list_02.txt > Red_specific_SNPs_P_0_000000001_list_03.txt
awk -v OFS='/t' '{print $1, $2, $2}' Yellow_specific_SNPs_P_0_000000001_list_02.txt > Yellow_specific_SNPs_P_0_000000001_list_03.txt


bedtools intersect -b Green_specific_SNPs_P_0_000000001_list_03.txt -a /home/datawork-rmpf/p_margaritifera/genome/annotation/EVM_combined.gff3 -wb -wa > Green_specific_SNPs_P_0_000000001_list_03_gene.txt
bedtools intersect -b Red_specific_SNPs_P_0_000000001_list_03.txt -a /home/datawork-rmpf/p_margaritifera/genome/annotation/EVM_combined.gff3 -wb -wa > Red_specific_SNPs_P_0_000000001_list_03_gene.txt
bedtools intersect -b Yellow_specific_SNPs_P_0_000000001_list_03.txt -a /home/datawork-rmpf/p_margaritifera/genome/annotation/EVM_combined.gff3 -wb -wa > Yellow_specific_SNPs_P_0_000000001_list_03_gene.txt


