#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g


DATADIRECTORY=/home1/scratch/plstenge/A_digitifera

cd $DATADIRECTORY

export PATH=$PATH:/appli/anaconda/2.7/bin
source activate $DATAWORK/96_env_conda/deeptools

cd $DATADIRECTORY


for SELECTION in $(ls $DATADIRECTORY/select_*.bed)
do

for FILE in $(ls $DATADIRECTORY/*.bam_sorted.bam.bw)
do

computeMatrix scale-regions -S ${FILE##*/} -R ${SELECTION##*/} --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o ${FILE##*/}_${SELECTION##*/}_matrix.mat.gz

plotHeatmap -m ${FILE##*/}_${SELECTION##*/}_matrix.mat.gz -out ${FILE##*/}_${SELECTION##*/}_matrix.mat.gz.pdf 


done ;
done ;


