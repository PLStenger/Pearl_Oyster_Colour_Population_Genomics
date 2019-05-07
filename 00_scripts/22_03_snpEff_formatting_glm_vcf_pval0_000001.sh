#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g

#### PVALUE 0.000001

# Ce script permet de pouvoir modifier et formater le VCF afin que snpEff puisse le lire
# On va créer un VCF par comparaison de couleur basé sur les p-values 10-6 (pvalue < 0.000001) pour chaque comparaison


INDIR=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration
PATH_VCF=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified

cd $INDIR


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_HatcheryVsGambier_OK_dat_P_0_000001.txt > $INDIR/Total_HatcheryVsGambier_OK_dat_P_0_000001_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_HatcheryVsGambier_OK_dat_P_0_000001_SNP.txt > $INDIR/Total_HatcheryVsGambier_OK_dat_P_0_000001_SNP2.txt
sed 's/"//' $INDIR/Total_HatcheryVsGambier_OK_dat_P_0_000001_SNP2.txt > $INDIR/Total_HatcheryVsGambier_OK_dat_P_0_000001_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_HatcheryVsGambier_OK_dat_P_0_000001_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_000001.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_000001.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_000001.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_000001.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_000001.vcf




# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_HatcheryVsGambier_OK_dat_P_0_001.txt > $INDIR/Total_HatcheryVsGambier_OK_dat_P_0_001_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_HatcheryVsGambier_OK_dat_P_0_001_SNP.txt > $INDIR/Total_HatcheryVsGambier_OK_dat_P_0_001_SNP2.txt
sed 's/"//' $INDIR/Total_HatcheryVsGambier_OK_dat_P_0_001_SNP2.txt > $INDIR/Total_HatcheryVsGambier_OK_dat_P_0_001_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_HatcheryVsGambier_OK_dat_P_0_001_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_001.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_001.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_001.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_001.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_001.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_HatcheryVsGambier_OK_dat_P_0_01.txt > $INDIR/Total_HatcheryVsGambier_OK_dat_P_0_01_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_HatcheryVsGambier_OK_dat_P_0_01_SNP.txt > $INDIR/Total_HatcheryVsGambier_OK_dat_P_0_01_SNP2.txt
sed 's/"//' $INDIR/Total_HatcheryVsGambier_OK_dat_P_0_01_SNP2.txt > $INDIR/Total_HatcheryVsGambier_OK_dat_P_0_01_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_HatcheryVsGambier_OK_dat_P_0_01_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_01.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_01.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_01.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_01.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_01.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_KatiuVsGambier_OK_dat_P_0_000001.txt > $INDIR/Total_KatiuVsGambier_OK_dat_P_0_000001_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_KatiuVsGambier_OK_dat_P_0_000001_SNP.txt > $INDIR/Total_KatiuVsGambier_OK_dat_P_0_000001_SNP2.txt
sed 's/"//' $INDIR/Total_KatiuVsGambier_OK_dat_P_0_000001_SNP2.txt > $INDIR/Total_KatiuVsGambier_OK_dat_P_0_000001_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_KatiuVsGambier_OK_dat_P_0_000001_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_KatiuVsGambier_OK_dat_P_0_000001.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_KatiuVsGambier_OK_dat_P_0_000001.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_KatiuVsGambier_OK_dat_P_0_000001.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_KatiuVsGambier_OK_dat_P_0_000001.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_KatiuVsGambier_OK_dat_P_0_000001.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_KatiuVsGambier_OK_dat_P_0_001.txt > $INDIR/Total_KatiuVsGambier_OK_dat_P_0_001_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_KatiuVsGambier_OK_dat_P_0_001_SNP.txt > $INDIR/Total_KatiuVsGambier_OK_dat_P_0_001_SNP2.txt
sed 's/"//' $INDIR/Total_KatiuVsGambier_OK_dat_P_0_001_SNP2.txt > $INDIR/Total_KatiuVsGambier_OK_dat_P_0_001_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_KatiuVsGambier_OK_dat_P_0_001_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_KatiuVsGambier_OK_dat_P_0_001.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_KatiuVsGambier_OK_dat_P_0_001.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_KatiuVsGambier_OK_dat_P_0_001.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_KatiuVsGambier_OK_dat_P_0_001.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_KatiuVsGambier_OK_dat_P_0_001.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_KatiuVsGambier_OK_dat_P_0_01.txt > $INDIR/Total_KatiuVsGambier_OK_dat_P_0_01_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_KatiuVsGambier_OK_dat_P_0_01_SNP.txt > $INDIR/Total_KatiuVsGambier_OK_dat_P_0_01_SNP2.txt
sed 's/"//' $INDIR/Total_KatiuVsGambier_OK_dat_P_0_01_SNP2.txt > $INDIR/Total_KatiuVsGambier_OK_dat_P_0_01_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_KatiuVsGambier_OK_dat_P_0_01_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_KatiuVsGambier_OK_dat_P_0_01.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_KatiuVsGambier_OK_dat_P_0_01.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_KatiuVsGambier_OK_dat_P_0_01.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_KatiuVsGambier_OK_dat_P_0_01.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_KatiuVsGambier_OK_dat_P_0_01.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_KatiuVsHatchery_OK_dat_P_0_000001.txt > $INDIR/Total_KatiuVsHatchery_OK_dat_P_0_000001_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_KatiuVsHatchery_OK_dat_P_0_000001_SNP.txt > $INDIR/Total_KatiuVsHatchery_OK_dat_P_0_000001_SNP2.txt
sed 's/"//' $INDIR/Total_KatiuVsHatchery_OK_dat_P_0_000001_SNP2.txt > $INDIR/Total_KatiuVsHatchery_OK_dat_P_0_000001_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_KatiuVsHatchery_OK_dat_P_0_000001_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_KatiuVsHatchery_OK_dat_P_0_000001.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_KatiuVsHatchery_OK_dat_P_0_000001.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_KatiuVsHatchery_OK_dat_P_0_000001.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_KatiuVsHatchery_OK_dat_P_0_000001.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_KatiuVsHatchery_OK_dat_P_0_000001.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_KatiuVsHatchery_OK_dat_P_0_001.txt > $INDIR/Total_KatiuVsHatchery_OK_dat_P_0_001_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_KatiuVsHatchery_OK_dat_P_0_001_SNP.txt > $INDIR/Total_KatiuVsHatchery_OK_dat_P_0_001_SNP2.txt
sed 's/"//' $INDIR/Total_KatiuVsHatchery_OK_dat_P_0_001_SNP2.txt > $INDIR/Total_KatiuVsHatchery_OK_dat_P_0_001_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_KatiuVsHatchery_OK_dat_P_0_001_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_KatiuVsHatchery_OK_dat_P_0_001.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_KatiuVsHatchery_OK_dat_P_0_001.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_KatiuVsHatchery_OK_dat_P_0_001.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_KatiuVsHatchery_OK_dat_P_0_001.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_KatiuVsHatchery_OK_dat_P_0_001.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_KatiuVsHatchery_OK_dat_P_0_01.txt > $INDIR/Total_KatiuVsHatchery_OK_dat_P_0_01_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_KatiuVsHatchery_OK_dat_P_0_01_SNP.txt > $INDIR/Total_KatiuVsHatchery_OK_dat_P_0_01_SNP2.txt
sed 's/"//' $INDIR/Total_KatiuVsHatchery_OK_dat_P_0_01_SNP2.txt > $INDIR/Total_KatiuVsHatchery_OK_dat_P_0_01_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_KatiuVsHatchery_OK_dat_P_0_01_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_KatiuVsHatchery_OK_dat_P_0_01.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_KatiuVsHatchery_OK_dat_P_0_01.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_KatiuVsHatchery_OK_dat_P_0_01.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_KatiuVsHatchery_OK_dat_P_0_01.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_KatiuVsHatchery_OK_dat_P_0_01.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_RedVsGreen_OK_dat_P_0_000001.txt > $INDIR/Total_RedVsGreen_OK_dat_P_0_000001_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_RedVsGreen_OK_dat_P_0_000001_SNP.txt > $INDIR/Total_RedVsGreen_OK_dat_P_0_000001_SNP2.txt
sed 's/"//' $INDIR/Total_RedVsGreen_OK_dat_P_0_000001_SNP2.txt > $INDIR/Total_RedVsGreen_OK_dat_P_0_000001_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_RedVsGreen_OK_dat_P_0_000001_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_RedVsGreen_OK_dat_P_0_000001.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_RedVsGreen_OK_dat_P_0_000001.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_RedVsGreen_OK_dat_P_0_000001.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_RedVsGreen_OK_dat_P_0_000001.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_RedVsGreen_OK_dat_P_0_000001.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_RedVsGreen_OK_dat_P_0_001.txt > $INDIR/Total_RedVsGreen_OK_dat_P_0_001_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_RedVsGreen_OK_dat_P_0_001_SNP.txt > $INDIR/Total_RedVsGreen_OK_dat_P_0_001_SNP2.txt
sed 's/"//' $INDIR/Total_RedVsGreen_OK_dat_P_0_001_SNP2.txt > $INDIR/Total_RedVsGreen_OK_dat_P_0_001_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_RedVsGreen_OK_dat_P_0_001_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_RedVsGreen_OK_dat_P_0_001.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_RedVsGreen_OK_dat_P_0_001.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_RedVsGreen_OK_dat_P_0_001.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_RedVsGreen_OK_dat_P_0_001.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_RedVsGreen_OK_dat_P_0_001.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_RedVsGreen_OK_dat_P_0_01.txt > $INDIR/Total_RedVsGreen_OK_dat_P_0_01_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_RedVsGreen_OK_dat_P_0_01_SNP.txt > $INDIR/Total_RedVsGreen_OK_dat_P_0_01_SNP2.txt
sed 's/"//' $INDIR/Total_RedVsGreen_OK_dat_P_0_01_SNP2.txt > $INDIR/Total_RedVsGreen_OK_dat_P_0_01_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_RedVsGreen_OK_dat_P_0_01_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_RedVsGreen_OK_dat_P_0_01.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_RedVsGreen_OK_dat_P_0_01.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_RedVsGreen_OK_dat_P_0_01.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_RedVsGreen_OK_dat_P_0_01.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_RedVsGreen_OK_dat_P_0_01.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_TakapotoVsGambier_OK_dat_P_0_000001.txt > $INDIR/Total_TakapotoVsGambier_OK_dat_P_0_000001_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_TakapotoVsGambier_OK_dat_P_0_000001_SNP.txt > $INDIR/Total_TakapotoVsGambier_OK_dat_P_0_000001_SNP2.txt
sed 's/"//' $INDIR/Total_TakapotoVsGambier_OK_dat_P_0_000001_SNP2.txt > $INDIR/Total_TakapotoVsGambier_OK_dat_P_0_000001_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_TakapotoVsGambier_OK_dat_P_0_000001_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsGambier_OK_dat_P_0_000001.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsGambier_OK_dat_P_0_000001.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsGambier_OK_dat_P_0_000001.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsGambier_OK_dat_P_0_000001.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsGambier_OK_dat_P_0_000001.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_TakapotoVsGambier_OK_dat_P_0_001.txt > $INDIR/Total_TakapotoVsGambier_OK_dat_P_0_001_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_TakapotoVsGambier_OK_dat_P_0_001_SNP.txt > $INDIR/Total_TakapotoVsGambier_OK_dat_P_0_001_SNP2.txt
sed 's/"//' $INDIR/Total_TakapotoVsGambier_OK_dat_P_0_001_SNP2.txt > $INDIR/Total_TakapotoVsGambier_OK_dat_P_0_001_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_TakapotoVsGambier_OK_dat_P_0_001_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsGambier_OK_dat_P_0_001.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsGambier_OK_dat_P_0_001.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsGambier_OK_dat_P_0_001.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsGambier_OK_dat_P_0_001.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsGambier_OK_dat_P_0_001.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_TakapotoVsGambier_OK_dat_P_0_01.txt > $INDIR/Total_TakapotoVsGambier_OK_dat_P_0_01_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_TakapotoVsGambier_OK_dat_P_0_01_SNP.txt > $INDIR/Total_TakapotoVsGambier_OK_dat_P_0_01_SNP2.txt
sed 's/"//' $INDIR/Total_TakapotoVsGambier_OK_dat_P_0_01_SNP2.txt > $INDIR/Total_TakapotoVsGambier_OK_dat_P_0_01_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_TakapotoVsGambier_OK_dat_P_0_01_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsGambier_OK_dat_P_0_01.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsGambier_OK_dat_P_0_01.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsGambier_OK_dat_P_0_01.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsGambier_OK_dat_P_0_01.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsGambier_OK_dat_P_0_01.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_TakapotoVsHatchery_OK_dat_P_0_000001.txt > $INDIR/Total_TakapotoVsHatchery_OK_dat_P_0_000001_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_TakapotoVsHatchery_OK_dat_P_0_000001_SNP.txt > $INDIR/Total_TakapotoVsHatchery_OK_dat_P_0_000001_SNP2.txt
sed 's/"//' $INDIR/Total_TakapotoVsHatchery_OK_dat_P_0_000001_SNP2.txt > $INDIR/Total_TakapotoVsHatchery_OK_dat_P_0_000001_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_TakapotoVsHatchery_OK_dat_P_0_000001_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsHatchery_OK_dat_P_0_000001.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsHatchery_OK_dat_P_0_000001.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsHatchery_OK_dat_P_0_000001.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsHatchery_OK_dat_P_0_000001.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsHatchery_OK_dat_P_0_000001.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_TakapotoVsHatchery_OK_dat_P_0_001.txt > $INDIR/Total_TakapotoVsHatchery_OK_dat_P_0_001_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_TakapotoVsHatchery_OK_dat_P_0_001_SNP.txt > $INDIR/Total_TakapotoVsHatchery_OK_dat_P_0_001_SNP2.txt
sed 's/"//' $INDIR/Total_TakapotoVsHatchery_OK_dat_P_0_001_SNP2.txt > $INDIR/Total_TakapotoVsHatchery_OK_dat_P_0_001_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_TakapotoVsHatchery_OK_dat_P_0_001_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsHatchery_OK_dat_P_0_001.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsHatchery_OK_dat_P_0_001.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsHatchery_OK_dat_P_0_001.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsHatchery_OK_dat_P_0_001.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsHatchery_OK_dat_P_0_001.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_TakapotoVsHatchery_OK_dat_P_0_01.txt > $INDIR/Total_TakapotoVsHatchery_OK_dat_P_0_01_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_TakapotoVsHatchery_OK_dat_P_0_01_SNP.txt > $INDIR/Total_TakapotoVsHatchery_OK_dat_P_0_01_SNP2.txt
sed 's/"//' $INDIR/Total_TakapotoVsHatchery_OK_dat_P_0_01_SNP2.txt > $INDIR/Total_TakapotoVsHatchery_OK_dat_P_0_01_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_TakapotoVsHatchery_OK_dat_P_0_01_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsHatchery_OK_dat_P_0_01.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsHatchery_OK_dat_P_0_01.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsHatchery_OK_dat_P_0_01.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsHatchery_OK_dat_P_0_01.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsHatchery_OK_dat_P_0_01.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_TakapotoVsKatiu_OK_dat_P_0_000001.txt > $INDIR/Total_TakapotoVsKatiu_OK_dat_P_0_000001_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_TakapotoVsKatiu_OK_dat_P_0_000001_SNP.txt > $INDIR/Total_TakapotoVsKatiu_OK_dat_P_0_000001_SNP2.txt
sed 's/"//' $INDIR/Total_TakapotoVsKatiu_OK_dat_P_0_000001_SNP2.txt > $INDIR/Total_TakapotoVsKatiu_OK_dat_P_0_000001_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_TakapotoVsKatiu_OK_dat_P_0_000001_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsKatiu_OK_dat_P_0_000001.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsKatiu_OK_dat_P_0_000001.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsKatiu_OK_dat_P_0_000001.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsKatiu_OK_dat_P_0_000001.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsKatiu_OK_dat_P_0_000001.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_TakapotoVsKatiu_OK_dat_P_0_001.txt > $INDIR/Total_TakapotoVsKatiu_OK_dat_P_0_001_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_TakapotoVsKatiu_OK_dat_P_0_001_SNP.txt > $INDIR/Total_TakapotoVsKatiu_OK_dat_P_0_001_SNP2.txt
sed 's/"//' $INDIR/Total_TakapotoVsKatiu_OK_dat_P_0_001_SNP2.txt > $INDIR/Total_TakapotoVsKatiu_OK_dat_P_0_001_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_TakapotoVsKatiu_OK_dat_P_0_001_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsKatiu_OK_dat_P_0_001.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsKatiu_OK_dat_P_0_001.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsKatiu_OK_dat_P_0_001.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsKatiu_OK_dat_P_0_001.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsKatiu_OK_dat_P_0_001.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_TakapotoVsKatiu_OK_dat_P_0_01.txt > $INDIR/Total_TakapotoVsKatiu_OK_dat_P_0_01_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_TakapotoVsKatiu_OK_dat_P_0_01_SNP.txt > $INDIR/Total_TakapotoVsKatiu_OK_dat_P_0_01_SNP2.txt
sed 's/"//' $INDIR/Total_TakapotoVsKatiu_OK_dat_P_0_01_SNP2.txt > $INDIR/Total_TakapotoVsKatiu_OK_dat_P_0_01_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_TakapotoVsKatiu_OK_dat_P_0_01_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsKatiu_OK_dat_P_0_01.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsKatiu_OK_dat_P_0_01.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsKatiu_OK_dat_P_0_01.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_TakapotoVsKatiu_OK_dat_P_0_01.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsKatiu_OK_dat_P_0_01.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_YellowVsGreen_OK_dat_P_0_000001.txt > $INDIR/Total_YellowVsGreen_OK_dat_P_0_000001_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_YellowVsGreen_OK_dat_P_0_000001_SNP.txt > $INDIR/Total_YellowVsGreen_OK_dat_P_0_000001_SNP2.txt
sed 's/"//' $INDIR/Total_YellowVsGreen_OK_dat_P_0_000001_SNP2.txt > $INDIR/Total_YellowVsGreen_OK_dat_P_0_000001_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_YellowVsGreen_OK_dat_P_0_000001_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_YellowVsGreen_OK_dat_P_0_000001.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_YellowVsGreen_OK_dat_P_0_000001.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_YellowVsGreen_OK_dat_P_0_000001.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_YellowVsGreen_OK_dat_P_0_000001.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_YellowVsGreen_OK_dat_P_0_000001.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_YellowVsGreen_OK_dat_P_0_001.txt > $INDIR/Total_YellowVsGreen_OK_dat_P_0_001_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_YellowVsGreen_OK_dat_P_0_001_SNP.txt > $INDIR/Total_YellowVsGreen_OK_dat_P_0_001_SNP2.txt
sed 's/"//' $INDIR/Total_YellowVsGreen_OK_dat_P_0_001_SNP2.txt > $INDIR/Total_YellowVsGreen_OK_dat_P_0_001_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_YellowVsGreen_OK_dat_P_0_001_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_YellowVsGreen_OK_dat_P_0_001.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_YellowVsGreen_OK_dat_P_0_001.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_YellowVsGreen_OK_dat_P_0_001.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_YellowVsGreen_OK_dat_P_0_001.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_YellowVsGreen_OK_dat_P_0_001.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_YellowVsGreen_OK_dat_P_0_01.txt > $INDIR/Total_YellowVsGreen_OK_dat_P_0_01_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_YellowVsGreen_OK_dat_P_0_01_SNP.txt > $INDIR/Total_YellowVsGreen_OK_dat_P_0_01_SNP2.txt
sed 's/"//' $INDIR/Total_YellowVsGreen_OK_dat_P_0_01_SNP2.txt > $INDIR/Total_YellowVsGreen_OK_dat_P_0_01_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_YellowVsGreen_OK_dat_P_0_01_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_YellowVsGreen_OK_dat_P_0_01.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_YellowVsGreen_OK_dat_P_0_01.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_YellowVsGreen_OK_dat_P_0_01.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_YellowVsGreen_OK_dat_P_0_01.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_YellowVsGreen_OK_dat_P_0_01.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_YellowVsRed_OK_dat_P_0_000001.txt > $INDIR/Total_YellowVsRed_OK_dat_P_0_000001_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_YellowVsRed_OK_dat_P_0_000001_SNP.txt > $INDIR/Total_YellowVsRed_OK_dat_P_0_000001_SNP2.txt
sed 's/"//' $INDIR/Total_YellowVsRed_OK_dat_P_0_000001_SNP2.txt > $INDIR/Total_YellowVsRed_OK_dat_P_0_000001_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_YellowVsRed_OK_dat_P_0_000001_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_YellowVsRed_OK_dat_P_0_000001.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_YellowVsRed_OK_dat_P_0_000001.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_YellowVsRed_OK_dat_P_0_000001.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_YellowVsRed_OK_dat_P_0_000001.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_YellowVsRed_OK_dat_P_0_000001.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_YellowVsRed_OK_dat_P_0_001.txt > $INDIR/Total_YellowVsRed_OK_dat_P_0_001_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_YellowVsRed_OK_dat_P_0_001_SNP.txt > $INDIR/Total_YellowVsRed_OK_dat_P_0_001_SNP2.txt
sed 's/"//' $INDIR/Total_YellowVsRed_OK_dat_P_0_001_SNP2.txt > $INDIR/Total_YellowVsRed_OK_dat_P_0_001_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_YellowVsRed_OK_dat_P_0_001_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_YellowVsRed_OK_dat_P_0_001.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_YellowVsRed_OK_dat_P_0_001.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_YellowVsRed_OK_dat_P_0_001.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_YellowVsRed_OK_dat_P_0_001.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_YellowVsRed_OK_dat_P_0_001.vcf


# VCF file with SNP unique name and no header
# individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison
awk '{print $4}' $INDIR/Total_YellowVsRed_OK_dat_P_0_01.txt > $INDIR/Total_YellowVsRed_OK_dat_P_0_01_SNP.txt

# Deleted the '"'
sed 's/"//' $INDIR/Total_YellowVsRed_OK_dat_P_0_01_SNP.txt > $INDIR/Total_YellowVsRed_OK_dat_P_0_01_SNP2.txt
sed 's/"//' $INDIR/Total_YellowVsRed_OK_dat_P_0_01_SNP2.txt > $INDIR/Total_YellowVsRed_OK_dat_P_0_01_SNP3.txt


awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt $INDIR/Total_YellowVsRed_OK_dat_P_0_01_SNP3.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_YellowVsRed_OK_dat_P_0_01.vcf

#Deleted second colum and paste the header, deleted unnecessary spaces or tab

awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_YellowVsRed_OK_dat_P_0_01.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_YellowVsRed_OK_dat_P_0_01.vcf


# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_YellowVsRed_OK_dat_P_0_01.vcf
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_YellowVsRed_OK_dat_P_0_01.vcf

rm *_SNP2.txt



