#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/09_snpEff_glm
SNPEFFENV=". /appli/bioinfo/snpeff/latest/env.sh"

# il faut d'abord mettre sur le fichier config la configuration du génome


SNPEFF=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/95_software/snpEff #/Path/to/snpEff/Folder
DBNAME=sspace.final.scaffolds.fasta
VCF_RvsJ=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_000001.vcf

WORKDIR=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/09_snpEff_glm



cd $SNPEFF

java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $VCF_RvsJ > $WORKDIR/$OUTDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_000001_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_000001_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_000001_genes_summary.txt
