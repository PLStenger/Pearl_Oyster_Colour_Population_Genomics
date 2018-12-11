#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g
#PBS -N vcftools

# A partir de maintenant, on retourne dans le VCF pour enlever les évènements complexes:
# Ex: scaffold12332 ATTAG ATTGG Car cela va poser probleme pour la suite, donc autant refaire tous les pipelines sans ces
# Evenements complexes (qui a priori apparaissent lors d’un SNP et d’une deletion proche,
# Ce qui est compliqué à expliqué d’un point de vue biologique, donc on les supprime purement et simplement)


INDIR=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified

cd $INDIR

grep "^#" $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf > $INDIR/header.txt
awk '$4=="A"' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf > $INDIR/A.txt
awk '$4=="C"' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf > $INDIR/C.txt
awk '$4=="G"' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf > $INDIR/G.txt
awk '$4=="T"' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf > $INDIR/T.txt

cat A.txt C.txt G.txt T.txt > temp_individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex.vcf
sort -k2 -n temp_individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex.vcf | sort -k1 > sorted_temp_individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex.vcf 
cat header.txt sorted_temp_individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex.vcf > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex.vcf

rm temp_individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex.vcf
rm sorted_temp_individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex.vcf
rm header.txt
rm A.txt
rm C.txt
rm G.txt
rm T.txt
