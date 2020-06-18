#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g


DATADIRECTORY=/home1/scratch/plstenge/A_digitifera

cd $DATADIRECTORY

export PATH=$PATH:/appli/anaconda/2.7/bin
source activate $DATAWORK/96_env_conda/deeptools

cd $DATADIRECTORY

#computeMatrixOperations cbind -m FC_A1vsA3_down_Acclimation_1_31_5_rbind_matrix.mat.gz FC_A1vsA3_down_Acclimation_3_30_rbind_matrix.mat.gz -o FC_A1vsA3_down_Acclimation_cbind_matrix.mat.gz

#plotHeatmap -m FC_A1vsA3_down_Acclimation_cbind_matrix.mat.gz -out FC_A1vsA3_down_Acclimation_cbind_matrix.mat.gz.pdf

computeMatrixOperations cbind -m FC_A1vsA3_down_Acclimation_1_31_5_rbind_matrix.mat.gz FC_A1vsA3_down_Acclimation_3_30_rbind_matrix.mat.gz FC_A1vsA3_down_Control_1_30_rbind_matrix.mat.gz FC_A1vsA3_down_Control_3_30_rbind_matrix.mat.gz -o FC_A1vsA3_down.mat.gz

plotHeatmap -m FC_A1vsA3_down.mat.gz -out FC_A1vsA3_down.mat.gz.pdf

computeMatrixOperations cbind -m FC_A1vsC3_down_Acclimation_1_31_5_rbind_matrix.mat.gz FC_A1vsC3_down_Acclimation_3_30_rbind_matrix.mat.gz FC_A1vsC3_down_Control_1_30_rbind_matrix.mat.gz FC_A1vsC3_down_Control_3_30_rbind_matrix.mat.gz -o FC_A1vsC3_down.mat.gz

plotHeatmap -m FC_A1vsC3_down.mat.gz -out FC_A1vsC3_down.mat.gz.pdf

computeMatrixOperations cbind -m FC_C1vsA1_down_Acclimation_1_31_5_rbind_matrix.mat.gz FC_C1vsA1_down_Acclimation_3_30_rbind_matrix.mat.gz FC_C1vsA1_down_Control_1_30_rbind_matrix.mat.gz FC_C1vsA1_down_Control_3_30_rbind_matrix.mat.gz -o FC_C1vsA1_down.mat.gz

plotHeatmap -m FC_A1vsC3_down.mat.gz -out FC_A1vsC3_down.mat.gz.pdf

computeMatrixOperations cbind -m FC_C1vsA3_down_Acclimation_1_31_5_rbind_matrix.mat.gz FC_C1vsA3_down_Acclimation_3_30_rbind_matrix.mat.gz FC_C1vsA3_down_Control_1_30_rbind_matrix.mat.gz FC_C1vsA3_down_Control_3_30_rbind_matrix.mat.gz -o FC_C1vsA3_down.mat.gz

plotHeatmap -m FC_A1vsC3_down.mat.gz -out FC_A1vsC3_down.mat.gz.pdf

computeMatrixOperations cbind -m FC_C1vsC3_down_Acclimation_1_31_5_rbind_matrix.mat.gz FC_C1vsC3_down_Acclimation_3_30_rbind_matrix.mat.gz FC_C1vsC3_down_Control_1_30_rbind_matrix.mat.gz FC_C1vsC3_down_Control_3_30_rbind_matrix.mat.gz -o FC_C1vsC3_down.mat.gz

plotHeatmap -m FC_A1vsC3_down.mat.gz -out FC_A1vsC3_down.mat.gz.pdf

computeMatrixOperations cbind -m FC_C3vsA3_down_Acclimation_1_31_5_rbind_matrix.mat.gz FC_C3vsA3_down_Acclimation_3_30_rbind_matrix.mat.gz FC_C3vsA3_down_Control_1_30_rbind_matrix.mat.gz FC_C3vsA3_down_Control_3_30_rbind_matrix.mat.gz -o FC_C3vsA3_down.mat.gz

plotHeatmap -m FC_A1vsC3_down.mat.gz -out FC_A1vsC3_down.mat.gz.pdf

#### 

computeMatrixOperations cbind -m FC_A1vsA3_up_Acclimation_1_31_5_rbind_matrix.mat.gz FC_A1vsA3_up_Acclimation_3_30_rbind_matrix.mat.gz FC_A1vsA3_up_Control_1_30_rbind_matrix.mat.gz FC_A1vsA3_up_Control_3_30_rbind_matrix.mat.gz -o FC_A1vsA3_up.mat.gz

plotHeatmap -m FC_A1vsA3_up.mat.gz -out FC_A1vsA3_up.mat.gz.pdf

computeMatrixOperations cbind -m FC_A1vsC3_up_Acclimation_1_31_5_rbind_matrix.mat.gz FC_A1vsC3_up_Acclimation_3_30_rbind_matrix.mat.gz FC_A1vsC3_up_Control_1_30_rbind_matrix.mat.gz FC_A1vsC3_up_Control_3_30_rbind_matrix.mat.gz -o FC_A1vsC3_up.mat.gz

plotHeatmap -m FC_A1vsC3_up.mat.gz -out FC_A1vsC3_up.mat.gz.pdf

computeMatrixOperations cbind -m FC_C1vsA1_up_Acclimation_1_31_5_rbind_matrix.mat.gz FC_C1vsA1_up_Acclimation_3_30_rbind_matrix.mat.gz FC_C1vsA1_up_Control_1_30_rbind_matrix.mat.gz FC_C1vsA1_up_Control_3_30_rbind_matrix.mat.gz -o FC_C1vsA1_up.mat.gz

plotHeatmap -m FC_A1vsC3_up.mat.gz -out FC_A1vsC3_up.mat.gz.pdf

computeMatrixOperations cbind -m FC_C1vsA3_up_Acclimation_1_31_5_rbind_matrix.mat.gz FC_C1vsA3_up_Acclimation_3_30_rbind_matrix.mat.gz FC_C1vsA3_up_Control_1_30_rbind_matrix.mat.gz FC_C1vsA3_up_Control_3_30_rbind_matrix.mat.gz -o FC_C1vsA3_up.mat.gz

plotHeatmap -m FC_A1vsC3_up.mat.gz -out FC_A1vsC3_up.mat.gz.pdf

computeMatrixOperations cbind -m FC_C1vsC3_up_Acclimation_1_31_5_rbind_matrix.mat.gz FC_C1vsC3_up_Acclimation_3_30_rbind_matrix.mat.gz FC_C1vsC3_up_Control_1_30_rbind_matrix.mat.gz FC_C1vsC3_up_Control_3_30_rbind_matrix.mat.gz -o FC_C1vsC3_up.mat.gz

plotHeatmap -m FC_A1vsC3_up.mat.gz -out FC_A1vsC3_up.mat.gz.pdf

computeMatrixOperations cbind -m FC_C3vsA3_up_Acclimation_1_31_5_rbind_matrix.mat.gz FC_C3vsA3_up_Acclimation_3_30_rbind_matrix.mat.gz FC_C3vsA3_up_Control_1_30_rbind_matrix.mat.gz FC_C3vsA3_up_Control_3_30_rbind_matrix.mat.gz -o FC_C3vsA3_up.mat.gz

plotHeatmap -m FC_A1vsC3_up.mat.gz -out FC_A1vsC3_up.mat.gz.pdf



