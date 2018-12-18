#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/09_snpEff
SNPEFFENV=". /appli/bioinfo/snpeff/latest/env.sh"

# il faut d'abord mettre sur le fichier config la configuration du génome


SNPEFF=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/95_software/snpEff #/Path/to/snpEff/Folder
DBNAME=sspace.final.scaffolds.fasta
VCF=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_snpEff_input_VvsR_Pvalue0.05.vcf
WORKDIR=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/09_snpEff



cd $SNPEFF

java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $VCF > $WORKDIR/$OUTDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_snpEff_input_VvsR_Pvalue0.05_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_snpEff_input_VvsR_Pvalue0.05_SNPEff.vcf_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_snpEff_input_VvsR_Pvalue0.05_SNPEff.vcf_genes_summary.txt
