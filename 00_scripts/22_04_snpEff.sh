#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests
SNPEFFENV=". /appli/bioinfo/snpeff/latest/env.sh"

# il faut d'abord mettre sur le fichier config la configuration du génome


SNPEFF=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/95_software/snpEff #/Path/to/snpEff/Folder
DBNAME=sspace.final.scaffolds.fasta
VCF=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_tests_snpF_input_12355.vcf
WORKDIR=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/09_snpEff


cd $SNPEFF

java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $VCF > $WORKDIR/$OUTDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_genes_summary.txt
