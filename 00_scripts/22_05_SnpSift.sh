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


java -jar $SNPEFF/SnpSift.jar  \
   extractFields $DATADIRECTORY/YellowVsGreen_OK_dat_P_0_000001_SNPEff.vcf  \
   CHROM \
    POS \
   REF \
   ALT \
 "ANN[0].EFFECT" \
    "ANN[*].HGVS" \
    > $DATADIRECTORY/YellowVsGreen_OK_dat_P_0_000001_SNPEff_SnpSift.txt
