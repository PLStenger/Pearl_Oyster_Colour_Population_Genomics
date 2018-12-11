#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g
#PBS -N vcftools

INDIR=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified

cd $INDIR

grep "^#" $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf > $INDIR/header.txt
awk '$4=="A"' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf > $INDIR/A.txt
awk '$4=="C"' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf > $INDIR/C.txt
awk '$4=="G"' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf > $INDIR/G.txt
awk '$4=="T"' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf > $INDIR/T.txt

cat header.txt A.txt C.txt G.txt T.txt > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex.vcf

rm header.txt
rm A.txt
rm C.txt
rm G.txt
rm T.txt
