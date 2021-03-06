#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/09_snpEff_glm
SNPEFFENV=". /appli/bioinfo/snpeff/latest/env.sh"

# il faut d'abord mettre sur le fichier config la configuration du génome


SNPEFF=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/95_software/snpEff #/Path/to/snpEff/Folder
DBNAME=sspace.final.scaffolds.fasta
WORKDIR=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/09_snpEff_glm

HatcheryVsGambier_OK_dat_P_0_000001=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_000001.vcf
HatcheryVsGambier_OK_dat_P_0_001=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_001.vcf
HatcheryVsGambier_OK_dat_P_0_01=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_HatcheryVsGambier_OK_dat_P_0_01.vcf
KatiuVsGambier_OK_dat_P_0_000001=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_KatiuVsGambier_OK_dat_P_0_000001.vcf
KatiuVsGambier_OK_dat_P_0_001=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_KatiuVsGambier_OK_dat_P_0_001.vcf
KatiuVsGambier_OK_dat_P_0_01=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_KatiuVsGambier_OK_dat_P_0_01.vcf
KatiuVsHatchery_OK_dat_P_0_000001=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_KatiuVsHatchery_OK_dat_P_0_000001.vcf
KatiuVsHatchery_OK_dat_P_0_001=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_KatiuVsHatchery_OK_dat_P_0_001.vcf
KatiuVsHatchery_OK_dat_P_0_01=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_KatiuVsHatchery_OK_dat_P_0_01.vcf
RedVsGreen_OK_dat_P_0_000001=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_RedVsGreen_OK_dat_P_0_000001.vcf
RedVsGreen_OK_dat_P_0_001=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_RedVsGreen_OK_dat_P_0_001.vcf
RedVsGreen_OK_dat_P_0_01=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_RedVsGreen_OK_dat_P_0_01.vcf
TakapotoVsGambier_OK_dat_P_0_000001=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsGambier_OK_dat_P_0_000001.vcf
TakapotoVsGambier_OK_dat_P_0_001=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsGambier_OK_dat_P_0_001.vcf
TakapotoVsGambier_OK_dat_P_0_01=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsGambier_OK_dat_P_0_01.vcf
TakapotoVsHatchery_OK_dat_P_0_000001=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsHatchery_OK_dat_P_0_000001.vcf
TakapotoVsHatchery_OK_dat_P_0_001=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsHatchery_OK_dat_P_0_001.vcf
TakapotoVsHatchery_OK_dat_P_0_01=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsHatchery_OK_dat_P_0_01.vcf
TakapotoVsKatiu_OK_dat_P_0_000001=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsKatiu_OK_dat_P_0_000001.vcf
TakapotoVsKatiu_OK_dat_P_0_001=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsKatiu_OK_dat_P_0_001.vcf
TakapotoVsKatiu_OK_dat_P_0_01=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_TakapotoVsKatiu_OK_dat_P_0_01.vcf
YellowVsGreen_OK_dat_P_0_000001=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_YellowVsGreen_OK_dat_P_0_000001.vcf
YellowVsGreen_OK_dat_P_0_001=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_YellowVsGreen_OK_dat_P_0_001.vcf
YellowVsGreen_OK_dat_P_0_01=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_YellowVsGreen_OK_dat_P_0_01.vcf
YellowVsRed_OK_dat_P_0_000001=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_YellowVsRed_OK_dat_P_0_000001.vcf
YellowVsRed_OK_dat_P_0_001=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_YellowVsRed_OK_dat_P_0_001.vcf
YellowVsRed_OK_dat_P_0_01=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_input_pvalued_with_iteration/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_inputRL_PL_YellowVsRed_OK_dat_P_0_01.vcf


cd $SNPEFF

java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $HatcheryVsGambier_OK_dat_P_0_000001 > $WORKDIR/$OUTDIR/HatcheryVsGambier_OK_dat_P_0_000001_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/HatcheryVsGambier_OK_dat_P_0_000001_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/HatcheryVsGambier_OK_dat_P_0_000001_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $HatcheryVsGambier_OK_dat_P_0_001 > $WORKDIR/$OUTDIR/HatcheryVsGambier_OK_dat_P_0_001_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/HatcheryVsGambier_OK_dat_P_0_001_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/HatcheryVsGambier_OK_dat_P_0_001_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $HatcheryVsGambier_OK_dat_P_0_01 > $WORKDIR/$OUTDIR/HatcheryVsGambier_OK_dat_P_0_01_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/HatcheryVsGambier_OK_dat_P_0_01_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/HatcheryVsGambier_OK_dat_P_0_01_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $KatiuVsGambier_OK_dat_P_0_000001 > $WORKDIR/$OUTDIR/KatiuVsGambier_OK_dat_P_0_000001_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/KatiuVsGambier_OK_dat_P_0_000001_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/KatiuVsGambier_OK_dat_P_0_000001_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $KatiuVsGambier_OK_dat_P_0_001 > $WORKDIR/$OUTDIR/KatiuVsGambier_OK_dat_P_0_001_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/KatiuVsGambier_OK_dat_P_0_001_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/KatiuVsGambier_OK_dat_P_0_001_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $KatiuVsGambier_OK_dat_P_0_01 > $WORKDIR/$OUTDIR/KatiuVsGambier_OK_dat_P_0_01_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/KatiuVsGambier_OK_dat_P_0_01_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/KatiuVsGambier_OK_dat_P_0_01_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $KatiuVsHatchery_OK_dat_P_0_000001 > $WORKDIR/$OUTDIR/KatiuVsHatchery_OK_dat_P_0_000001_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/KatiuVsHatchery_OK_dat_P_0_000001_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/KatiuVsHatchery_OK_dat_P_0_000001_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $KatiuVsHatchery_OK_dat_P_0_001 > $WORKDIR/$OUTDIR/KatiuVsHatchery_OK_dat_P_0_001_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/KatiuVsHatchery_OK_dat_P_0_001_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/KatiuVsHatchery_OK_dat_P_0_001_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $KatiuVsHatchery_OK_dat_P_0_01 > $WORKDIR/$OUTDIR/KatiuVsHatchery_OK_dat_P_0_01_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/KatiuVsHatchery_OK_dat_P_0_01_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/KatiuVsHatchery_OK_dat_P_0_01_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $RedVsGreen_OK_dat_P_0_000001 > $WORKDIR/$OUTDIR/RedVsGreen_OK_dat_P_0_000001_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/RedVsGreen_OK_dat_P_0_000001_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/RedVsGreen_OK_dat_P_0_000001_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $RedVsGreen_OK_dat_P_0_001 > $WORKDIR/$OUTDIR/RedVsGreen_OK_dat_P_0_001_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/RedVsGreen_OK_dat_P_0_001_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/RedVsGreen_OK_dat_P_0_001_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $RedVsGreen_OK_dat_P_0_01 > $WORKDIR/$OUTDIR/RedVsGreen_OK_dat_P_0_01_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/RedVsGreen_OK_dat_P_0_01_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/RedVsGreen_OK_dat_P_0_01_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $TakapotoVsGambier_OK_dat_P_0_000001 > $WORKDIR/$OUTDIR/TakapotoVsGambier_OK_dat_P_0_000001_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/TakapotoVsGambier_OK_dat_P_0_000001_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/TakapotoVsGambier_OK_dat_P_0_000001_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $TakapotoVsGambier_OK_dat_P_0_001 > $WORKDIR/$OUTDIR/TakapotoVsGambier_OK_dat_P_0_001_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/TakapotoVsGambier_OK_dat_P_0_001_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/TakapotoVsGambier_OK_dat_P_0_001_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $TakapotoVsGambier_OK_dat_P_0_01 > $WORKDIR/$OUTDIR/TakapotoVsGambier_OK_dat_P_0_01_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/TakapotoVsGambier_OK_dat_P_0_01_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/TakapotoVsGambier_OK_dat_P_0_01_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $TakapotoVsHatchery_OK_dat_P_0_000001 > $WORKDIR/$OUTDIR/TakapotoVsHatchery_OK_dat_P_0_000001_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/TakapotoVsHatchery_OK_dat_P_0_000001_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/TakapotoVsHatchery_OK_dat_P_0_000001_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $TakapotoVsHatchery_OK_dat_P_0_001 > $WORKDIR/$OUTDIR/TakapotoVsHatchery_OK_dat_P_0_001_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/TakapotoVsHatchery_OK_dat_P_0_001_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/TakapotoVsHatchery_OK_dat_P_0_001_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $TakapotoVsHatchery_OK_dat_P_0_01 > $WORKDIR/$OUTDIR/TakapotoVsHatchery_OK_dat_P_0_01_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/TakapotoVsHatchery_OK_dat_P_0_01_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/TakapotoVsHatchery_OK_dat_P_0_01_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $TakapotoVsKatiu_OK_dat_P_0_000001 > $WORKDIR/$OUTDIR/TakapotoVsKatiu_OK_dat_P_0_000001_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/TakapotoVsKatiu_OK_dat_P_0_000001_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/TakapotoVsKatiu_OK_dat_P_0_000001_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $TakapotoVsKatiu_OK_dat_P_0_001 > $WORKDIR/$OUTDIR/TakapotoVsKatiu_OK_dat_P_0_001_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/TakapotoVsKatiu_OK_dat_P_0_001_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/TakapotoVsKatiu_OK_dat_P_0_001_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $TakapotoVsKatiu_OK_dat_P_0_01 > $WORKDIR/$OUTDIR/TakapotoVsKatiu_OK_dat_P_0_01_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/TakapotoVsKatiu_OK_dat_P_0_01_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/TakapotoVsKatiu_OK_dat_P_0_01_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $YellowVsGreen_OK_dat_P_0_000001 > $WORKDIR/$OUTDIR/YellowVsGreen_OK_dat_P_0_000001_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/YellowVsGreen_OK_dat_P_0_000001_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/YellowVsGreen_OK_dat_P_0_000001_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $YellowVsGreen_OK_dat_P_0_001 > $WORKDIR/$OUTDIR/YellowVsGreen_OK_dat_P_0_001_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/YellowVsGreen_OK_dat_P_0_001_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/YellowVsGreen_OK_dat_P_0_001_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $YellowVsGreen_OK_dat_P_0_01 > $WORKDIR/$OUTDIR/YellowVsGreen_OK_dat_P_0_01_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/YellowVsGreen_OK_dat_P_0_01_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/YellowVsGreen_OK_dat_P_0_01_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $YellowVsRed_OK_dat_P_0_000001 > $WORKDIR/$OUTDIR/YellowVsRed_OK_dat_P_0_000001_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/YellowVsRed_OK_dat_P_0_000001_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/YellowVsRed_OK_dat_P_0_000001_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $YellowVsRed_OK_dat_P_0_001 > $WORKDIR/$OUTDIR/YellowVsRed_OK_dat_P_0_001_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/YellowVsRed_OK_dat_P_0_001_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/YellowVsRed_OK_dat_P_0_001_genes_summary.txt
java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $YellowVsRed_OK_dat_P_0_01 > $WORKDIR/$OUTDIR/YellowVsRed_OK_dat_P_0_01_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/YellowVsRed_OK_dat_P_0_01_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/YellowVsRed_OK_dat_P_0_01_genes_summary.txt




