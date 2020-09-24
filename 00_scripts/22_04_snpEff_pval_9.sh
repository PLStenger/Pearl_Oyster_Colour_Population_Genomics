#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home/datawork-rmpf/p_margaritifera/pl-pwgs/07_snpeff
SNPEFFENV=". /appli/bioinfo/snpeff/latest/env.sh"

# il faut d'abord mettre sur le fichier config la configuration du génome


SNPEFF=/home/datawork-rmpf/p_margaritifera/pl-pwgs/98_programms/SNPeff/snpEff #/Path/to/snpEff/Folder

export PATH=$PATH:/appli/anaconda/2.7/bin
source activate /home/datawork-rmpf/p_margaritifera/pl-pwgs/98_programms/SNPeff/

DBNAME=sspace.final.scaffolds.fasta

VCF_RvsG=/home/datawork-rmpf/p_margaritifera/pl-pwgs/06_vcf/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_RedVsGreen_dat_P_0_000000001.txt.vcf_SNPEff_02.vcf
VCF_YvsG=/home/datawork-rmpf/p_margaritifera/pl-pwgs/06_vcf/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsGreen_dat_P_0_000000001.txt.vcf_SNPEff_02.vcf
VCF_YvsR=/home/datawork-rmpf/p_margaritifera/pl-pwgs/06_vcf/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsRed_dat_P_0_000000001.txt.vcf_SNPEff_02.vcf

WORKDIR=/home/datawork-rmpf/p_margaritifera/pl-pwgs/07_snpeff

cd $SNPEFF

java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $VCF_RvsG > $WORKDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_RedVsGreen_dat_P_0_000000001_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_RedVsGreen_dat_P_0_000000001_SNPEff.vcf_report.html
mv snpEff_genes.txt $WORKDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_RedVsGreen_dat_P_0_000000001_SNPEff.vcf_genes_summary.txt

java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $VCF_YvsG > $WORKDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsGreen_dat_P_0_000000001_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsGreen_dat_P_0_000000001_SNPEff.vcf_report.html
mv snpEff_genes.txt $WORKDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsGreen_dat_P_0_000000001_SNPEff.vcf_genes_summary.txt

java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $VCF_YvsR > $WORKDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsRed_dat_P_0_000000001_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsRed_dat_P_0_000000001_SNPEff.vcf_report.html
mv snpEff_genes.txt $WORKDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsRed_dat_P_0_000000001_SNPEff.vcf_genes_summary.txt



## OLD SCRIPT:
#
##!/usr/bin/env bash
##PBS -q mpi
##PBS -l walltime=48:00:00
##PBS -l select=1:ncpus=28:mem=115g
#
#DATADIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/09_snpEff
#SNPEFFENV=". /appli/bioinfo/snpeff/latest/env.sh"
#
## il faut d'abord mettre sur le fichier config la configuration du génome
#
#
#SNPEFF=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/95_software/snpEff #/Path/to/snpEff/Folder
#DBNAME=sspace.final.scaffolds.fasta
#VCF_RvsJ=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_snpEff_input_RvsJ_Pvalue0.001.vcf
#VCF_VvsJ=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_snpEff_input_VvsJ_Pvalue0.001.vcf
#VCF_VvsR=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_snpEff_input_VvsR_Pvalue0.001.vcf
#
#WORKDIR=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/09_snpEff
#
#
#
#cd $SNPEFF
#
#java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $VCF_RvsJ > $WORKDIR/$OUTDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_snpEff_input_RvsJ_Pvalue0.001_SNPEff.vcf &&
#mv snpEff_summary.html $WORKDIR/$OUTDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_snpEff_input_RvsJ_Pvalue0.001_SNPEff.vcf_report.html
#mv snpEff_genes.txt $WORKDIR/$OUTDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_snpEff_input_RvsJ_Pvalue0.001_SNPEff.vcf_genes_summary.txt
#
#java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $VCF_VvsJ > $WORKDIR/$OUTDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_snpEff_input_VvsJ_Pvalue0.001_SNPEff.vcf &&
#mv snpEff_summary.html $WORKDIR/$OUTDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_snpEff_input_VvsJ_Pvalue0.001_SNPEff.vcf_report.html
#mv snpEff_genes.txt $WORKDIR/$OUTDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_snpEff_input_VvsJ_Pvalue0.001_SNPEff.vcf_genes_summary.txt
#
#java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $VCF_VvsR > $WORKDIR/$OUTDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_snpEff_input_VvsR_Pvalue0.001_SNPEff.vcf &&
#mv snpEff_summary.html $WORKDIR/$OUTDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_snpEff_input_VvsR_Pvalue0.001_SNPEff.vcf_report.html
#mv snpEff_genes.txt $WORKDIR/$OUTDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_noComplex_snpEff_input_VvsR_Pvalue0.001_SNPEff.vcf_genes_summary.txt
