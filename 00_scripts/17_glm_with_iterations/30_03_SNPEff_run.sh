#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/09_snpEff_glm_without_iteration
#SNPEFFENV=". /appli/bioinfo/snpeff/latest/env.sh"

# il faut d'abord mettre sur le fichier config la configuration du génome


SNPEFF=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/95_software/snpEff #/Path/to/snpEff/Folder
DBNAME=sspace.final.scaffolds.fasta



cd $SNPEFF

for FILE in $(ls $DATADIRECTORY/*.vcf)
do

java -Xmx115G -jar $SNPEFF/snpEff.jar $DBNAME $DATADIRECTORY/${FILE##*/} > $DATADIRECTORY/${FILE##*/}_SNPEff.vcf &&
mv snpEff_summary.html $DATADIRECTORY/${FILE##*/}_SNPEff_report.html
mv snpEff_genes.txt DATADIRECTORY/${FILE##*/}_SNPEff_genes_summary.txt

done ;


