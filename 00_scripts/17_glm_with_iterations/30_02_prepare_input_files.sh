#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g


# Ce script permet de pouvoir modifier et formater le VCF afin que snpEff puisse le lire
# On va créer un VCF par comparaison de couleur basé sur les p-values 10-6 (pvalue < 0.000001) pour chaque comparaison


DATADIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_02_input_pvalued_without_iteration
PATH_VCF=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified

cd $DATADIRECTORY

for FILE in $(ls $DATADIRECTORY/*1.txt)
do


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $3}' $DATADIRECTORY/${FILE##*/} > $DATADIRECTORY/${FILE##*/}_SNP.txt

# Deleted the '"'
sed 's/"//' $DATADIRECTORY/${FILE##*/}_SNP.txt > $DATADIRECTORY/${FILE##*/}_SNP2.txt
sed 's/"//' $DATADIRECTORY/${FILE##*/}_SNP2.txt > $DATADIRECTORY/${FILE##*/}_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $DATADIRECTORY/${FILE##*/}_SNP3.txt > $DATADIRECTORY/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_${FILE##*/}.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $DATADIRECTORY/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_${FILE##*/}.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $DATADIRECTORY/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_${FILE##*/}.vcf


# On va vérifier le nombre de SNPs:
wc -l $DATADIRECTORY/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_${FILE##*/}.vcf
wc -l $DATADIRECTORY/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_${FILE##*/}.vcf

# Delete the unecessary files:
rm *_SNP.txt
rm *_SNP2.txt

done ; 
