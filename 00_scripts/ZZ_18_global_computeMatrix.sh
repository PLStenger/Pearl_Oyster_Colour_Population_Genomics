#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g


DATADIRECTORY=/home1/scratch/plstenge/A_digitifera

cd $DATADIRECTORY

export PATH=$PATH:/appli/anaconda/2.7/bin
source activate $DATAWORK/96_env_conda/deeptools

cd $DATADIRECTORY


for FILE in $(ls $DATADIRECTORY/*_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw)
do

computeMatrix scale-regions -S $FILE -R FC_A1vsA3_down.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o ${FILE##*/}_All_genes_matrix.mat.gz ;
plotHeatmap -m ${FILE##*/}_All_genes_matrix.mat.gz -out ${FILE##*/}_All_genes_matrix.mat.gz.pdf

done ;





