#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g


DATADIRECTORY=/home1/scratch/plstenge/A_digitifera

cd $DATADIRECTORY

export PATH=$PATH:/appli/anaconda/2.7/bin
source activate $DATAWORK/96_env_conda/deeptools

cd $DATADIRECTORY

computeMatrixOperations cbind -m FC_A1vsA3_down_Acclimation_1_31_5_rbind_matrix.mat.gz FC_A1vsA3_down_Acclimation_3_30_rbind_matrix.mat.gz -o FC_A1vsA3_down_Acclimation_cbind_matrix.mat.gz

plotHeatmap -m FC_A1vsA3_down_Acclimation_cbind_matrix.mat.gz -out FC_A1vsA3_down_Acclimation_cbind_matrix.mat.gz.pdf


