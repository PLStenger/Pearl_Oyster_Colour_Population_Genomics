#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g
#PBS -N vcftools

# Ce script permet de pouvoir modifier et formater le VCF afin que snpEff puisse le lire
# Ces étapes peuvent se réaliser en local
# On va créer un VCF par comparaison de couleur basé sur les p-values 10-6 (pvalue < 0.00001) pour chaque comparaison
# Ces informations on été obtenues avec un script R nommé "nb_Pvalue_Chi2_RvsJ_JvsV_VvsR_VeenDiagram.R"
# Script stocké ici : /Users/pierre-louisstenger/Documents/Thèse/Génomique des Populations/04 - Analyses PWGS/07 - vcf files/01 - VCF files - Tests statistiques - fichiers/01 - Chi2 ind - Pvalues RvsJ JvsV VvsR
# le fichier obtenue avec les snp interessant se nomment "snp_ind_DP20_NOM_DE_LA_COMPARAISON.txt"

INDIR=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified

cd $INDIR

# - = input de l'étape précédente'

# Enlever le header (comprenant les "#")

grep -v "^#" individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex.vcf > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header.vcf

# Et pour stocker le header dans un autre fichier:

grep "^#" individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex.vcf > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex.vcf_header.vcf

# On va maintenant merged les noms de scaffold et la position des SNP afin d'avoir un nom unique pour chaque SNP

awk '{OFS = "_" ; print $1,$2}' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header.vcf | paste - individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header.vcf > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_single_ID.vcf

# Après avec R (script "nb_Pvalue_Chi2_RvsJ_JvsV_VvsR_VeenDiagram.R"), on obtient 3 fichiers .txt avec le nom des snp propres pour chaque comparaison qui ont une p-value inférieure à 0.00001 (Test du Chi2). (le nom est construit de la meme maniere, scaffold_position). Ils se nomment snp_ind_DP20_NoComplex_pval_COLOR(RorJorV)vsCOLOR(RorJorV)_Bonf.txt

# Il faut donc penser à l'uploader dans le bon repertoire

# puis on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse pour chaque comparaison

awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_single_ID.vcf snp_ind_DP20_NoComplex_pval_RvsJ_Bonf.txt > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header_vcf_significant_pval_RvsJ_Bonf.vcf

awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_single_ID.vcf snp_ind_DP20_NoComplex_pval_VvsJ_Bonf.txt > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header_vcf_significant_pval_VvsJ_Bonf.vcf

awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_single_ID.vcf snp_ind_DP20_NoComplex_pval_VvsR_Bonf.txt > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header_vcf_significant_pval_VvsR_Bonf.vcf


# On va vérifier le nombre de SNPs:
wc -l individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header_vcf_significant_pval_RvsJ_Bonf.vcf
wc -l individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header_vcf_significant_pval_VvsJ_Bonf.vcf
wc -l individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header_vcf_significant_pval_VvsR_Bonf.vcf

# ici le vcf est bon, mais il y a la colonne supplémentaire que l'on a rajouté (scaffold_position) à la fin qui nous gène, et il n'y a toujours pas le headerfunction .
# Donc, on va enlever la première colonne dans le individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header_snp.vcf
# sed -re 's/^[ ]//g' pour enlever l'espace en trop qui va apparaitre juste devant le nom unique du snp
# sed -re 's/ /\t/g'  car pour remplacer les espaces par des tabulations entre les différentes colonnes.

awk '{ $1=""; print $0 }' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header_vcf_significant_pval_RvsJ_Bonf.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_header.vcf - > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_snpEff_input_RvsJ.vcf

awk '{ $1=""; print $0 }' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header_vcf_significant_pval_VvsJ_Bonf.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_header.vcf - > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_snpEff_input_VvsJ.vcf

awk '{ $1=""; print $0 }' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_no_header_vcf_significant_pval_VvsR_Bonf.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_header.vcf - > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_snpEff_input_VvsR.vcf


 


