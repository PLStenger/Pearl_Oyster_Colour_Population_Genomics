#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

#DATADIRECTORY=Pearl_Oyster_Colour_Population_Genomics/09_snpEff_glm_without_iteration_old_gff
INPUT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_02_input_pvalued_without_iteration
SNPEFFENV=". /appli/bioinfo/snpeff/latest/env.sh"

# il faut d'abord mettre sur le fichier config la configuration du génome


SNPEFF=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/95_software/snpEff #/Path/to/snpEff/Folder
DBNAME=sspace.final.scaffolds.fasta
WORKDIR=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/09_snpEff_glm_without_iteration_old_gff




cd $SNPEFF





for FILE in $(ls $INPUT/*.vcf)
do

java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $INPUT/${FILE##*/} > $WORKDIR/$OUTDIR/${FILE##*/}_SNPEff_old_gff.vcf &&
mv snpEff_summary.html $WORKDIR/$OUTDIR/${FILE##*/}_SNPEff_report_old_gff.html
mv snpEff_genes.txt $WORKDIR/$OUTDIR/${FILE##*/}_SNPEff_genes_summary_old_gff.txt

done ;
