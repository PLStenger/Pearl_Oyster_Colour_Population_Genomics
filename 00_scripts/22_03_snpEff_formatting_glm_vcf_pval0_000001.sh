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

#awk 'NR==FNR{a[$0];next} $NF in a' $INDIR/Total_HatcheryVsGambier_OK_dat_P_0_000001_SNP.txt $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_000001.vcf
awk 'NR==FNR{vals[$1];next} ($1) in vals' $INDIR/Total_HatcheryVsGambier_OK_dat_P_0_000001_SNP.txt $PATH_VCF/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_000001.vcf



# On va vérifier le nombre de SNPs:
wc -l $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_000001.vcf

# ici le vcf est bon, mais il y a la colonne supplémentaire que l'on a rajouté (scaffold_position) à la fin qui nous gène, et il n'y a toujours pas le headerfunction .
# Donc, on va enlever la première colonne dans le individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header_snp.vcf
# sed -re 's/^[ ]//g' pour enlever l'espace en trop qui va apparaitre juste devant le nom unique du snp
# sed -re 's/ /\t/g'  car pour remplacer les espaces par des tabulations entre les différentes colonnes.

#awk '{ $1=""; print $0 }' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header_vcf_significant_pval_RvsJ_Bonf_Pvalue0.001.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_header.vcf - > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_snpEff_input_RvsJ_Pvalue0.001.vcf
