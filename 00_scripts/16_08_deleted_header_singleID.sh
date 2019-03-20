#!/usr/bin/env bash
#PBS -q sequentiel
#PBS -l walltime=720:00:00
#PBS -l mem=1024g


# Ce script permet de pouvoir modifier et formater le VCF pour les analyses statistiques suivantes, notament d'enlever le header et d'obtenir un noms de SNP unique en fusion le nom du scaffold avec la position


INDIR=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified

cd $INDIR

# - = input de l'étape précédente'

# Enlever le header (comprenant les "#")

grep -v "^#" $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex.vcf > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header.vcf

# Et pour stocker le header dans un autre fichier:

grep "^#" $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex.vcf > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf

# On va maintenant merged les noms de scaffold et la position des SNP afin d'avoir un nom unique pour chaque SNP

awk '{OFS = "_" ; print $1,$2}' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header.vcf| paste - $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header.vcf > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_single_ID.vcf
