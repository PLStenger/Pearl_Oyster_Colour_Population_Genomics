#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g


DATADIRECTORY=/home1/scratch/plstenge/A_digitifera

cd $DATADIRECTORY

export PATH=$PATH:/appli/anaconda/2.7/bin
source activate $DATAWORK/96_env_conda/deeptools

cd $DATADIRECTORY


################################################################################################################################################################
################################################################################################################################################################
# rbind pour obtenir une seule valeure par point d'échantillonnage
################################################################################################################################################################
################################################################################################################################################################

computeMatrixOperations rbind -m FC_A1vsA3_down_Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_down_Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz FC_A1vsA3_down_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsA3_down_Acclimation_1_31_5_rbind_matrix.mat.gz

plotHeatmap -m FC_A1vsA3_down_Acclimation_1_31_5_rbind_matrix.mat.gz -out FC_A1vsA3_down_Acclimation_1_31_5_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_A1vsA3_down_Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_down_Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_down_Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsA3_down_Acclimation_3_30_rbind_matrix.mat.gz

plotHeatmap -m FC_A1vsA3_down_Acclimation_3_30_rbind_matrix.mat.gz -out FC_A1vsA3_down_Acclimation_3_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_A1vsA3_down_Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_down_Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_down_Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsA3_down_Control_1_30_rbind_matrix.mat.gz

plotHeatmap -m FC_A1vsA3_down_Control_1_30_rbind_matrix.mat.gz -out FC_A1vsA3_down_Control_1_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_A1vsA3_down_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_down_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_down_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsA3_down_Control_3_30_rbind_matrix.mat.gz

plotHeatmap -m FC_A1vsA3_down_Control_3_30_rbind_matrix.mat.gz -out FC_A1vsA3_down_Control_3_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_A1vsA3_up_Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_up_Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz FC_A1vsA3_up_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsA3_up_Acclimation_1_31_5_rbind_matrix.mat.gz

plotHeatmap -m FC_A1vsA3_up_Acclimation_1_31_5_rbind_matrix.mat.gz -out FC_A1vsA3_up_Acclimation_1_31_5_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_A1vsA3_up_Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_up_Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_up_Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsA3_up_Acclimation_3_30_rbind_matrix.mat.gz

plotHeatmap -m FC_A1vsA3_up_Acclimation_3_30_rbind_matrix.mat.gz -out FC_A1vsA3_up_Acclimation_3_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_A1vsA3_up_Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_up_Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_up_Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsA3_up_Control_1_30_rbind_matrix.mat.gz

plotHeatmap -m FC_A1vsA3_up_Control_1_30_rbind_matrix.mat.gz -out FC_A1vsA3_up_Control_1_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_A1vsA3_up_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_up_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_up_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsA3_up_Control_3_30_rbind_matrix.mat.gz

plotHeatmap -m FC_A1vsA3_up_Control_3_30_rbind_matrix.mat.gz -out FC_A1vsA3_up_Control_3_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_A1vsC3_down_Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_down_Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz FC_A1vsC3_down_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsC3_down_Acclimation_1_31_5_rbind_matrix.mat.gz

plotHeatmap -m FC_A1vsC3_down_Acclimation_1_31_5_rbind_matrix.mat.gz -out FC_A1vsC3_down_Acclimation_1_31_5_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_A1vsC3_down_Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_down_Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_down_Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsC3_down_Acclimation_3_30_rbind_matrix.mat.gz

plotHeatmap -m FC_A1vsC3_down_Acclimation_3_30_rbind_matrix.mat.gz -out FC_A1vsC3_down_Acclimation_3_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_A1vsC3_down_Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_down_Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_down_Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsC3_down_Control_1_30_rbind_matrix.mat.gz

plotHeatmap -m FC_A1vsC3_down_Control_1_30_rbind_matrix.mat.gz -out FC_A1vsC3_down_Control_1_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_A1vsC3_down_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_down_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_down_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsC3_down_Control_3_30_rbind_matrix.mat.gz

plotHeatmap -m FC_A1vsC3_down_Control_3_30_rbind_matrix.mat.gz -out FC_A1vsC3_down_Control_3_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_A1vsC3_up_Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_up_Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz FC_A1vsC3_up_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsC3_up_Acclimation_1_31_5_rbind_matrix.mat.gz

plotHeatmap -m FC_A1vsC3_up_Acclimation_1_31_5_rbind_matrix.mat.gz -out FC_A1vsC3_up_Acclimation_1_31_5_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_A1vsC3_up_Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_up_Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_up_Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsC3_up_Acclimation_3_30_rbind_matrix.mat.gz

plotHeatmap -m FC_A1vsC3_up_Acclimation_3_30_rbind_matrix.mat.gz -out FC_A1vsC3_up_Acclimation_3_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_A1vsC3_up_Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_up_Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_up_Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsC3_up_Control_1_30_rbind_matrix.mat.gz

plotHeatmap -m FC_A1vsC3_up_Control_1_30_rbind_matrix.mat.gz -out FC_A1vsC3_up_Control_1_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_A1vsC3_up_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_up_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_up_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsC3_up_Control_3_30_rbind_matrix.mat.gz

plotHeatmap -m FC_A1vsC3_up_Control_3_30_rbind_matrix.mat.gz -out FC_A1vsC3_up_Control_3_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C1vsA1_down_Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_down_Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz FC_C1vsA1_down_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA1_down_Acclimation_1_31_5_rbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA1_down_Acclimation_1_31_5_rbind_matrix.mat.gz -out FC_C1vsA1_down_Acclimation_1_31_5_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C1vsA1_down_Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_down_Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_down_Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA1_down_Acclimation_3_30_rbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA1_down_Acclimation_3_30_rbind_matrix.mat.gz -out FC_C1vsA1_down_Acclimation_3_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C1vsA1_down_Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_down_Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_down_Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA1_down_Control_1_30_rbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA1_down_Control_1_30_rbind_matrix.mat.gz -out FC_C1vsA1_down_Control_1_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C1vsA1_down_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_down_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_down_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA1_down_Control_3_30_rbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA1_down_Control_3_30_rbind_matrix.mat.gz -out FC_C1vsA1_down_Control_3_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C1vsA1_up_Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_up_Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz FC_C1vsA1_up_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA1_up_Acclimation_1_31_5_rbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA1_up_Acclimation_1_31_5_rbind_matrix.mat.gz -out FC_C1vsA1_up_Acclimation_1_31_5_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C1vsA1_up_Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_up_Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_up_Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA1_up_Acclimation_3_30_rbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA1_up_Acclimation_3_30_rbind_matrix.mat.gz -out FC_C1vsA1_up_Acclimation_3_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C1vsA1_up_Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_up_Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_up_Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA1_up_Control_1_30_rbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA1_up_Control_1_30_rbind_matrix.mat.gz -out FC_C1vsA1_up_Control_1_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C1vsA1_up_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_up_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_up_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA1_up_Control_3_30_rbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA1_up_Control_3_30_rbind_matrix.mat.gz -out FC_C1vsA1_up_Control_3_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C1vsA3_down_Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_down_Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz FC_C1vsA3_down_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA3_down_Acclimation_1_31_5_rbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA3_down_Acclimation_1_31_5_rbind_matrix.mat.gz -out FC_C1vsA3_down_Acclimation_1_31_5_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C1vsA3_down_Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_down_Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_down_Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA3_down_Acclimation_3_30_rbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA3_down_Acclimation_3_30_rbind_matrix.mat.gz -out FC_C1vsA3_down_Acclimation_3_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C1vsA3_down_Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_down_Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_down_Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA3_down_Control_1_30_rbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA3_down_Control_1_30_rbind_matrix.mat.gz -out FC_C1vsA3_down_Control_1_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C1vsA3_down_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_down_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_down_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA3_down_Control_3_30_rbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA3_down_Control_3_30_rbind_matrix.mat.gz -out FC_C1vsA3_down_Control_3_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C1vsA3_up_Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_up_Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz FC_C1vsA3_up_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA3_up_Acclimation_1_31_5_rbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA3_up_Acclimation_1_31_5_rbind_matrix.mat.gz -out FC_C1vsA3_up_Acclimation_1_31_5_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C1vsA3_up_Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_up_Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_up_Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA3_up_Acclimation_3_30_rbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA3_up_Acclimation_3_30_rbind_matrix.mat.gz -out FC_C1vsA3_up_Acclimation_3_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C1vsA3_up_Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_up_Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_up_Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA3_up_Control_1_30_rbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA3_up_Control_1_30_rbind_matrix.mat.gz -out FC_C1vsA3_up_Control_1_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C1vsA3_up_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_up_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_up_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA3_up_Control_3_30_rbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA3_up_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA3_up_Control_3_30_rbind_matrix.mat.gz -out FC_C1vsA3_up_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA3_up_Control_3_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C1vsC3_down_Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_down_Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz FC_C1vsC3_down_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsC3_down_Acclimation_1_31_5_rbind_matrix.mat.gz

plotHeatmap -m FC_C1vsC3_down_Acclimation_1_31_5_rbind_matrix.mat.gz -out FC_C1vsC3_down_Acclimation_1_31_5_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C1vsC3_down_Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_down_Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_down_Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsC3_down_Acclimation_3_30_rbind_matrix.mat.gz

plotHeatmap -m FC_C1vsC3_down_Acclimation_3_30_rbind_matrix.mat.gz -out FC_C1vsC3_down_Acclimation_3_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C1vsC3_down_Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_down_Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_down_Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsC3_down_Control_1_30_rbind_matrix.mat.gz

plotHeatmap -m FC_C1vsC3_down_Control_1_30_rbind_matrix.mat.gz -out FC_C1vsC3_down_Control_1_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C1vsC3_down_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_down_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_down_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsC3_down_Control_3_30_rbind_matrix.mat.gz

plotHeatmap -m FC_C1vsC3_down_Control_3_30_rbind_matrix.mat.gz -out FC_C1vsC3_down_Control_3_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C1vsC3_up_Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_up_Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz FC_C1vsC3_up_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsC3_up_Acclimation_1_31_5_rbind_matrix.mat.gz

plotHeatmap -m FC_C1vsC3_up_Acclimation_1_31_5_rbind_matrix.mat.gz -out FC_C1vsC3_up_Acclimation_1_31_5_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C1vsC3_up_Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_up_Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_up_Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsC3_up_Acclimation_3_30_rbind_matrix.mat.gz

plotHeatmap -m FC_C1vsC3_up_Acclimation_3_30_rbind_matrix.mat.gz -out FC_C1vsC3_up_Acclimation_3_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C1vsC3_up_Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_up_Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_up_Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsC3_up_Control_1_30_rbind_matrix.mat.gz

plotHeatmap -m FC_C1vsC3_up_Control_1_30_rbind_matrix.mat.gz -out FC_C1vsC3_up_Control_1_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C1vsC3_up_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_up_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_up_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsC3_up_Control_3_30_rbind_matrix.mat.gz

plotHeatmap -m FC_C1vsC3_up_Control_3_30_rbind_matrix.mat.gz -out FC_C1vsC3_up_Control_3_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C3vsA3_down_Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_down_Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz FC_C3vsA3_down_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C3vsA3_down_Acclimation_1_31_5_rbind_matrix.mat.gz

plotHeatmap -m FC_C3vsA3_down_Acclimation_1_31_5_rbind_matrix.mat.gz -out FC_C3vsA3_down_Acclimation_1_31_5_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C3vsA3_down_Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_down_Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_down_Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C3vsA3_down_Acclimation_3_30_rbind_matrix.mat.gz

plotHeatmap -m FC_C3vsA3_down_Acclimation_3_30_rbind_matrix.mat.gz -out FC_C3vsA3_down_Acclimation_3_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C3vsA3_down_Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_down_Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_down_Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C3vsA3_down_Control_1_30_rbind_matrix.mat.gz

plotHeatmap -m FC_C3vsA3_down_Control_1_30_rbind_matrix.mat.gz -out FC_C3vsA3_down_Control_1_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C3vsA3_down_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_down_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_down_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C3vsA3_down_Control_3_30_rbind_matrix.mat.gz

plotHeatmap -m FC_C3vsA3_down_Control_3_30_rbind_matrix.mat.gz -out FC_C3vsA3_down_Control_3_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C3vsA3_up_Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_up_Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz FC_C3vsA3_up_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C3vsA3_up_Acclimation_1_31_5_rbind_matrix.mat.gz

plotHeatmap -m FC_C3vsA3_up_Acclimation_1_31_5_rbind_matrix.mat.gz -out FC_C3vsA3_up_Acclimation_1_31_5_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C3vsA3_up_Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_up_Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_up_Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C3vsA3_up_Acclimation_3_30_rbind_matrix.mat.gz

plotHeatmap -m FC_C3vsA3_up_Acclimation_3_30_rbind_matrix.mat.gz -out FC_C3vsA3_up_Acclimation_3_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C3vsA3_up_Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_up_Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_up_Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C3vsA3_up_Control_1_30_rbind_matrix.mat.gz

plotHeatmap -m FC_C3vsA3_up_Control_1_30_rbind_matrix.mat.gz -out FC_C3vsA3_up_Control_1_30_matrix.mat.gz_rbind.pdf


computeMatrixOperations rbind -m FC_C3vsA3_up_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_up_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_up_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C3vsA3_up_Control_3_30_rbind_matrix.mat.gz

plotHeatmap -m FC_C3vsA3_up_Control_3_30_rbind_matrix.mat.gz -out FC_C3vsA3_up_Control_3_30_matrix.mat.gz_rbind.pdf


################################################################################################################################################################
################################################################################################################################################################
# cbind pour connaitre la vairabilité individuel entre chaque point d'echantillonnage
################################################################################################################################################################
################################################################################################################################################################

computeMatrixOperations cbind -m FC_A1vsA3_down_Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_down_Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz FC_A1vsA3_down_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsA3_down_Acclimation_1_31_5_cbind_matrix.mat.gz

plotHeatmap -m FC_A1vsA3_down_Acclimation_1_31_5_cbind_matrix.mat.gz -out FC_A1vsA3_down_Acclimation_1_31_5_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_A1vsA3_down_Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_down_Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_down_Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsA3_down_Acclimation_3_30_cbind_matrix.mat.gz

plotHeatmap -m FC_A1vsA3_down_Acclimation_3_30_cbind_matrix.mat.gz -out FC_A1vsA3_down_Acclimation_3_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_A1vsA3_down_Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_down_Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_down_Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsA3_down_Control_1_30_cbind_matrix.mat.gz

plotHeatmap -m FC_A1vsA3_down_Control_1_30_cbind_matrix.mat.gz -out FC_A1vsA3_down_Control_1_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_A1vsA3_down_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_down_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_down_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsA3_down_Control_3_30_cbind_matrix.mat.gz

plotHeatmap -m FC_A1vsA3_down_Control_3_30_cbind_matrix.mat.gz -out FC_A1vsA3_down_Control_3_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_A1vsA3_up_Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_up_Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz FC_A1vsA3_up_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsA3_up_Acclimation_1_31_5_cbind_matrix.mat.gz

plotHeatmap -m FC_A1vsA3_up_Acclimation_1_31_5_cbind_matrix.mat.gz -out FC_A1vsA3_up_Acclimation_1_31_5_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_A1vsA3_up_Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_up_Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_up_Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsA3_up_Acclimation_3_30_cbind_matrix.mat.gz

plotHeatmap -m FC_A1vsA3_up_Acclimation_3_30_cbind_matrix.mat.gz -out FC_A1vsA3_up_Acclimation_3_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_A1vsA3_up_Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_up_Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_up_Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsA3_up_Control_1_30_cbind_matrix.mat.gz

plotHeatmap -m FC_A1vsA3_up_Control_1_30_cbind_matrix.mat.gz -out FC_A1vsA3_up_Control_1_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_A1vsA3_up_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_up_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsA3_up_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsA3_up_Control_3_30_cbind_matrix.mat.gz

plotHeatmap -m FC_A1vsA3_up_Control_3_30_cbind_matrix.mat.gz -out FC_A1vsA3_up_Control_3_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_A1vsC3_down_Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_down_Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz FC_A1vsC3_down_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsC3_down_Acclimation_1_31_5_cbind_matrix.mat.gz

plotHeatmap -m FC_A1vsC3_down_Acclimation_1_31_5_cbind_matrix.mat.gz -out FC_A1vsC3_down_Acclimation_1_31_5_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_A1vsC3_down_Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_down_Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_down_Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsC3_down_Acclimation_3_30_cbind_matrix.mat.gz

plotHeatmap -m FC_A1vsC3_down_Acclimation_3_30_cbind_matrix.mat.gz -out FC_A1vsC3_down_Acclimation_3_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_A1vsC3_down_Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_down_Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_down_Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsC3_down_Control_1_30_cbind_matrix.mat.gz

plotHeatmap -m FC_A1vsC3_down_Control_1_30_cbind_matrix.mat.gz -out FC_A1vsC3_down_Control_1_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_A1vsC3_down_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_down_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_down_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsC3_down_Control_3_30_cbind_matrix.mat.gz

plotHeatmap -m FC_A1vsC3_down_Control_3_30_cbind_matrix.mat.gz -out FC_A1vsC3_down_Control_3_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_A1vsC3_up_Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_up_Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz FC_A1vsC3_up_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsC3_up_Acclimation_1_31_5_cbind_matrix.mat.gz

plotHeatmap -m FC_A1vsC3_up_Acclimation_1_31_5_cbind_matrix.mat.gz -out FC_A1vsC3_up_Acclimation_1_31_5_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_A1vsC3_up_Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_up_Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_up_Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsC3_up_Acclimation_3_30_cbind_matrix.mat.gz

plotHeatmap -m FC_A1vsC3_up_Acclimation_3_30_cbind_matrix.mat.gz -out FC_A1vsC3_up_Acclimation_3_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_A1vsC3_up_Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_up_Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_up_Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsC3_up_Control_1_30_cbind_matrix.mat.gz

plotHeatmap -m FC_A1vsC3_up_Control_1_30_cbind_matrix.mat.gz -out FC_A1vsC3_up_Control_1_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_A1vsC3_up_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_up_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_A1vsC3_up_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_A1vsC3_up_Control_3_30_cbind_matrix.mat.gz

plotHeatmap -m FC_A1vsC3_up_Control_3_30_cbind_matrix.mat.gz -out FC_A1vsC3_up_Control_3_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C1vsA1_down_Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_down_Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz FC_C1vsA1_down_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA1_down_Acclimation_1_31_5_cbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA1_down_Acclimation_1_31_5_cbind_matrix.mat.gz -out FC_C1vsA1_down_Acclimation_1_31_5_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C1vsA1_down_Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_down_Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_down_Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA1_down_Acclimation_3_30_cbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA1_down_Acclimation_3_30_cbind_matrix.mat.gz -out FC_C1vsA1_down_Acclimation_3_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C1vsA1_down_Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_down_Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_down_Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA1_down_Control_1_30_cbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA1_down_Control_1_30_cbind_matrix.mat.gz -out FC_C1vsA1_down_Control_1_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C1vsA1_down_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_down_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_down_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA1_down_Control_3_30_cbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA1_down_Control_3_30_cbind_matrix.mat.gz -out FC_C1vsA1_down_Control_3_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C1vsA1_up_Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_up_Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz FC_C1vsA1_up_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA1_up_Acclimation_1_31_5_cbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA1_up_Acclimation_1_31_5_cbind_matrix.mat.gz -out FC_C1vsA1_up_Acclimation_1_31_5_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C1vsA1_up_Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_up_Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_up_Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA1_up_Acclimation_3_30_cbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA1_up_Acclimation_3_30_cbind_matrix.mat.gz -out FC_C1vsA1_up_Acclimation_3_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C1vsA1_up_Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_up_Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_up_Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA1_up_Control_1_30_cbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA1_up_Control_1_30_cbind_matrix.mat.gz -out FC_C1vsA1_up_Control_1_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C1vsA1_up_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_up_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA1_up_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA1_up_Control_3_30_cbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA1_up_Control_3_30_cbind_matrix.mat.gz -out FC_C1vsA1_up_Control_3_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C1vsA3_down_Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_down_Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz FC_C1vsA3_down_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA3_down_Acclimation_1_31_5_cbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA3_down_Acclimation_1_31_5_cbind_matrix.mat.gz -out FC_C1vsA3_down_Acclimation_1_31_5_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C1vsA3_down_Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_down_Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_down_Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA3_down_Acclimation_3_30_cbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA3_down_Acclimation_3_30_cbind_matrix.mat.gz -out FC_C1vsA3_down_Acclimation_3_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C1vsA3_down_Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_down_Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_down_Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA3_down_Control_1_30_cbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA3_down_Control_1_30_cbind_matrix.mat.gz -out FC_C1vsA3_down_Control_1_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C1vsA3_down_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_down_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_down_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA3_down_Control_3_30_cbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA3_down_Control_3_30_cbind_matrix.mat.gz -out FC_C1vsA3_down_Control_3_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C1vsA3_up_Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_up_Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz FC_C1vsA3_up_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA3_up_Acclimation_1_31_5_cbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA3_up_Acclimation_1_31_5_cbind_matrix.mat.gz -out FC_C1vsA3_up_Acclimation_1_31_5_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C1vsA3_up_Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_up_Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_up_Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA3_up_Acclimation_3_30_cbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA3_up_Acclimation_3_30_cbind_matrix.mat.gz -out FC_C1vsA3_up_Acclimation_3_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C1vsA3_up_Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_up_Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_up_Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA3_up_Control_1_30_cbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA3_up_Control_1_30_cbind_matrix.mat.gz -out FC_C1vsA3_up_Control_1_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C1vsA3_up_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_up_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_up_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA3_up_Control_3_30_cbind_matrix.mat.gz

plotHeatmap -m FC_C1vsA3_up_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA3_up_Control_3_30_cbind_matrix.mat.gz -out FC_C1vsA3_up_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA3_up_Control_3_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C1vsC3_down_Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_down_Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz FC_C1vsC3_down_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsC3_down_Acclimation_1_31_5_cbind_matrix.mat.gz

plotHeatmap -m FC_C1vsC3_down_Acclimation_1_31_5_cbind_matrix.mat.gz -out FC_C1vsC3_down_Acclimation_1_31_5_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C1vsC3_down_Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_down_Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_down_Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsC3_down_Acclimation_3_30_cbind_matrix.mat.gz

plotHeatmap -m FC_C1vsC3_down_Acclimation_3_30_cbind_matrix.mat.gz -out FC_C1vsC3_down_Acclimation_3_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C1vsC3_down_Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_down_Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_down_Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsC3_down_Control_1_30_cbind_matrix.mat.gz

plotHeatmap -m FC_C1vsC3_down_Control_1_30_cbind_matrix.mat.gz -out FC_C1vsC3_down_Control_1_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C1vsC3_down_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_down_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_down_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsC3_down_Control_3_30_cbind_matrix.mat.gz

plotHeatmap -m FC_C1vsC3_down_Control_3_30_cbind_matrix.mat.gz -out FC_C1vsC3_down_Control_3_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C1vsC3_up_Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_up_Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz FC_C1vsC3_up_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsC3_up_Acclimation_1_31_5_cbind_matrix.mat.gz

plotHeatmap -m FC_C1vsC3_up_Acclimation_1_31_5_cbind_matrix.mat.gz -out FC_C1vsC3_up_Acclimation_1_31_5_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C1vsC3_up_Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_up_Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_up_Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsC3_up_Acclimation_3_30_cbind_matrix.mat.gz

plotHeatmap -m FC_C1vsC3_up_Acclimation_3_30_cbind_matrix.mat.gz -out FC_C1vsC3_up_Acclimation_3_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C1vsC3_up_Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_up_Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_up_Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsC3_up_Control_1_30_cbind_matrix.mat.gz

plotHeatmap -m FC_C1vsC3_up_Control_1_30_cbind_matrix.mat.gz -out FC_C1vsC3_up_Control_1_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C1vsC3_up_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_up_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsC3_up_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsC3_up_Control_3_30_cbind_matrix.mat.gz

plotHeatmap -m FC_C1vsC3_up_Control_3_30_cbind_matrix.mat.gz -out FC_C1vsC3_up_Control_3_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C3vsA3_down_Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_down_Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz FC_C3vsA3_down_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C3vsA3_down_Acclimation_1_31_5_cbind_matrix.mat.gz

plotHeatmap -m FC_C3vsA3_down_Acclimation_1_31_5_cbind_matrix.mat.gz -out FC_C3vsA3_down_Acclimation_1_31_5_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C3vsA3_down_Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_down_Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_down_Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C3vsA3_down_Acclimation_3_30_cbind_matrix.mat.gz

plotHeatmap -m FC_C3vsA3_down_Acclimation_3_30_cbind_matrix.mat.gz -out FC_C3vsA3_down_Acclimation_3_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C3vsA3_down_Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_down_Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_down_Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C3vsA3_down_Control_1_30_cbind_matrix.mat.gz

plotHeatmap -m FC_C3vsA3_down_Control_1_30_cbind_matrix.mat.gz -out FC_C3vsA3_down_Control_1_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C3vsA3_down_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_down_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_down_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C3vsA3_down_Control_3_30_cbind_matrix.mat.gz

plotHeatmap -m FC_C3vsA3_down_Control_3_30_cbind_matrix.mat.gz -out FC_C3vsA3_down_Control_3_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C3vsA3_up_Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_up_Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz FC_C3vsA3_up_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C3vsA3_up_Acclimation_1_31_5_cbind_matrix.mat.gz

plotHeatmap -m FC_C3vsA3_up_Acclimation_1_31_5_cbind_matrix.mat.gz -out FC_C3vsA3_up_Acclimation_1_31_5_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C3vsA3_up_Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_up_Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_up_Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C3vsA3_up_Acclimation_3_30_cbind_matrix.mat.gz

plotHeatmap -m FC_C3vsA3_up_Acclimation_3_30_cbind_matrix.mat.gz -out FC_C3vsA3_up_Acclimation_3_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C3vsA3_up_Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_up_Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_up_Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C3vsA3_up_Control_1_30_cbind_matrix.mat.gz

plotHeatmap -m FC_C3vsA3_up_Control_1_30_cbind_matrix.mat.gz -out FC_C3vsA3_up_Control_1_30_matrix.mat.gz_cbind.pdf


computeMatrixOperations cbind -m FC_C3vsA3_up_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_up_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C3vsA3_up_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C3vsA3_up_Control_3_30_cbind_matrix.mat.gz

plotHeatmap -m FC_C3vsA3_up_Control_3_30_cbind_matrix.mat.gz -out FC_C3vsA3_up_Control_3_30_matrix.mat.gz_cbind.pdf


