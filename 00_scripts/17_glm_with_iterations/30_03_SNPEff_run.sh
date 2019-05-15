#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/09_snpEff_glm_without_iteration
INPUT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_02_input_pvalued_without_iteration
SNPEFFENV=". /appli/bioinfo/snpeff/latest/env.sh"

# il faut d'abord mettre sur le fichier config la configuration du génome


SNPEFF=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/95_software/SNPEff_2/snpEff #/Path/to/snpEff/Folder
DBNAME=sspace.final.scaffolds.fasta
WORKDIR=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/09_snpEff_glm_without_iteration




cd $SNPEFF



#java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $HatcheryVsGambier_dat_P_0_000000001 > $WORKDIR/$OUTDIR/HatcheryVsGambier_OK_dat_P_0_000001_SNPEff.vcf &&
#mv snpEff_summary.html $WORKDIR/$OUTDIR/HatcheryVsGambier_OK_dat_P_0_000001_report.html
#mv snpEff_genes.txt $WORKDIR/$OUTDIR/HatcheryVsGambier_OK_dat_P_0_000001_genes_summary.txt


for FILE in $(ls $INPUT/*.vcf)
do

java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $INPUT/${FILE##*/} > $WORKDIR/$OUTDIR/${FILE##*/}_SNPEff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/${FILE##*/}_SNPEff_report.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/${FILE##*/}_SNPEff_genes_summary.txt

done ;


