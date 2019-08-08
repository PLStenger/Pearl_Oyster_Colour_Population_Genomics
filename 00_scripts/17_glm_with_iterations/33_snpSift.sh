#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/09_snpEff_glm_without_iteration
SNPEFF=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/95_software/SNPEff_2/snpEff #/Path/to/snpEff/Folder
DBNAME=sspace.final.scaffolds.fasta

cd $DATADIRECTORY

#for FILE in $(ls $DATADIRECTORY/*.vcf)
for FILE in $(ls $DATADIRECTORY/*P_0_000000001.txt.vcf_SNPEff.vcf)

do

#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/${FILE##*/} CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/${FILE##*/}_SnpSift.txt
java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/${FILE##*/} CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" "ANN[*].HGVS_P" "EFF[*].AA" > $DATADIRECTORY/${FILE##*/}_SnpSift_aa.txt

awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5}' $DATADIRECTORY/${FILE##*/}_SnpSift_aa.txt > $DATADIRECTORY/${FILE##*/}_SnpSift_OK_aa.txt

done ;

