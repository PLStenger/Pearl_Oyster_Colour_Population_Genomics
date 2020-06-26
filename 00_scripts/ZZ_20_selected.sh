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
# computeMatrix sample by sample
################################################################################################################################################################
################################################################################################################################################################



#for SELECTION in $(ls $DATADIRECTORY/select_*.bed)
#do
#
#for FILE in $(ls $DATADIRECTORY/*.bam_sorted.bam.bw)
#do
#
#computeMatrix scale-regions -S ${FILE##*/} -R ${SELECTION##*/} --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o ${FILE##*/}_${SELECTION##*/}_matrix.mat.gz
#
#plotHeatmap -m ${FILE##*/}_${SELECTION##*/}_matrix.mat.gz -out ${FILE##*/}_${SELECTION##*/}_matrix.mat.gz.pdf 
#
#
#done ;
#done ;


################################################################################################################################################################
################################################################################################################################################################
# rbind pour obtenir une seule valeure par point d'échantillonnage
################################################################################################################################################################
################################################################################################################################################################


#computeMatrixOperations rbind -m Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05.bed_matrix.mat.gz Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05.bed_matrix.mat.gz Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05.bed_matrix.mat.gz -o Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05_rbind.bed_matrix.mat.gz
#plotHeatmap -m Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05_rbind.bed_matrix.mat.gz -out  Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05_rbind.bed_matrix.mat.gz.pdf
#
#
#computeMatrixOperations rbind -m Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05.bed_matrix.mat.gz Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05.bed_matrix.mat.gz Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05.bed_matrix.mat.gz -o Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05_rbind.bed_matrix.mat.gz
#plotHeatmap -m Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05_rbind.bed_matrix.mat.gz -out  Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05_rbind.bed_matrix.mat.gz.pdf
#
#
#computeMatrixOperations rbind -m Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05.bed_matrix.mat.gz Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05.bed_matrix.mat.gz Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05.bed_matrix.mat.gz -o Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05_rbind.bed_matrix.mat.gz
#plotHeatmap -m Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05_rbind.bed_matrix.mat.gz -out  Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05_rbind.bed_matrix.mat.gz.pdf
#
#
#computeMatrixOperations rbind -m Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05.bed_matrix.mat.gz Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05.bed_matrix.mat.gz Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05.bed_matrix.mat.gz -o Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05_rbind.bed_matrix.mat.gz
#plotHeatmap -m Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05_rbind.bed_matrix.mat.gz -out  Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05_rbind.bed_matrix.mat.gz.pdf
#
#
#computeMatrixOperations rbind -m Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05.bed_matrix.mat.gz Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05.bed_matrix.mat.gz Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05.bed_matrix.mat.gz -o Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05_rbind.bed_matrix.mat.gz
#plotHeatmap -m plotHeatmap -m Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05_rbind.bed_matrix.mat.gz -out  Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05_rbind.bed_matrix.mat.gz.pdf
#
#
#computeMatrixOperations rbind -m Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05.bed_matrix.mat.gz Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05.bed_matrix.mat.gz Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05.bed_matrix.mat.gz -o Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05_rbind.bed_matrix.mat.gz
#plotHeatmap -m Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05_rbind.bed_matrix.mat.gz  -out Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05_rbind.bed_matrix.mat.gz.pdf
#
#
#computeMatrixOperations rbind -m Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05.bed_matrix.mat.gz Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05.bed_matrix.mat.gz Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05.bed_matrix.mat.gz -o Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05_rbind.bed_matrix.mat.gz
#plotHeatmap -m Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05_rbind.bed_matrix.mat.gz -out  Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05_rbind.bed_matrix.mat.gz.pdf
#
#
#computeMatrixOperations rbind -m Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05.bed_matrix.mat.gz Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05.bed_matrix.mat.gz Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05.bed_matrix.mat.gz -o Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05_rbind.bed_matrix.mat.gz
#plotHeatmap -m Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05_rbind.bed_matrix.mat.gz -out Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05_rbind.bed_matrix.mat.gz.pdf
#
#
#computeMatrixOperations rbind -m Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05.bed_matrix.mat.gz Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05.bed_matrix.mat.gz Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05.bed_matrix.mat.gz -o Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz
#plotHeatmap -m Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz -out  Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz.pdf
#
#
#computeMatrixOperations rbind -m Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05.bed_matrix.mat.gz Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05.bed_matrix.mat.gz Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05.bed_matrix.mat.gz -o Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz
#plotHeatmap -m Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz -out  Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz.pdf
#
#
#computeMatrixOperations rbind -m Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05.bed_matrix.mat.gz Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05.bed_matrix.mat.gz Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05.bed_matrix.mat.gz -o Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz
#plotHeatmap -m Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz -out  Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz.pdf
#
#
#computeMatrixOperations rbind -m Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05.bed_matrix.mat.gz Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05.bed_matrix.mat.gz Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05.bed_matrix.mat.gz -o Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz
#plotHeatmap -m Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz -out  Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz.pdf
#
#
#computeMatrixOperations rbind -m Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05.bed_matrix.mat.gz Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05.bed_matrix.mat.gz Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05.bed_matrix.mat.gz -o Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05_rbind.bed_matrix.mat.gz
#plotHeatmap -m Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05_rbind.bed_matrix.mat.gz -out  Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05_rbind.bed_matrix.mat.gz.pdf
#
#
#computeMatrixOperations rbind -m Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05.bed_matrix.mat.gz Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05.bed_matrix.mat.gz Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05.bed_matrix.mat.gz -o Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05_rbind.bed_matrix.mat.gz
#plotHeatmap -m Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05_rbind.bed_matrix.mat.gz -out  Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05_rbind.bed_matrix.mat.gz.pdf
#
#
#computeMatrixOperations rbind -m Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05.bed_matrix.mat.gz Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05.bed_matrix.mat.gz Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05.bed_matrix.mat.gz -o Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05_rbind.bed_matrix.mat.gz
#plotHeatmap -m Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05_rbind.bed_matrix.mat.gz -out  Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05_rbind.bed_matrix.mat.gz.pdf
#
#
#computeMatrixOperations rbind -m Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05.bed_matrix.mat.gz Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05.bed_matrix.mat.gz Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05.bed_matrix.mat.gz -o Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05_rbind.bed_matrix.mat.gz
#plotHeatmap -m Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05_rbind.bed_matrix.mat.gz -out  -out  Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05_rbind.bed_matrix.mat.gz.pdf
#
#
#computeMatrixOperations rbind -m Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05.bed_matrix.mat.gz Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05.bed_matrix.mat.gz Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05.bed_matrix.mat.gz -o Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05_rbind.bed_matrix.mat.gz
#plotHeatmap -m Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05_rbind.bed_matrix.mat.gz -out  Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05_rbind.bed_matrix.mat.gz.pdf
#
#
#computeMatrixOperations rbind -m Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05.bed_matrix.mat.gz Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05.bed_matrix.mat.gz Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05.bed_matrix.mat.gz -o Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05_rbind.bed_matrix.mat.gz
#plotHeatmap -m Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05_rbind.bed_matrix.mat.gz -out  Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05_rbind.bed_matrix.mat.gz.pdf
#
#
#
#computeMatrixOperations rbind -m Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05.bed_matrix.mat.gz Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05.bed_matrix.mat.gz Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05.bed_matrix.mat.gz -o Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05_rbind.bed_matrix.mat.gz
#plotHeatmap -m Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05_rbind.bed_matrix.mat.gz -out  Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05_rbind.bed_matrix.mat.gz.pdf
#
#
#computeMatrixOperations rbind -m Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05.bed_matrix.mat.gz Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05.bed_matrix.mat.gz Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05.bed_matrix.mat.gz -o Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05_rbind.bed_matrix.mat.gz
#plotHeatmap -m Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05_rbind.bed_matrix.mat.gz -out  Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05_rbind.bed_matrix.mat.gz.pdf
#
#
#
#computeMatrixOperations rbind -m Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05.bed_matrix.mat.gz Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05.bed_matrix.mat.gz Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05.bed_matrix.mat.gz -o Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05_rbind.bed_matrix.mat.gz
#plotHeatmap -m Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05_rbind.bed_matrix.mat.gz -out  Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05_rbind.bed_matrix.mat.gz.pdf
#
#
#computeMatrixOperations rbind -m Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05.bed_matrix.mat.gz Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05.bed_matrix.mat.gz Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05.bed_matrix.mat.gz -o Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05_rbind.bed_matrix.mat.gz
#plotHeatmap -m plotHeatmap -m Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05_rbind.bed_matrix.mat.gz -out  Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05_rbind.bed_matrix.mat.gz.pdf
#
#
#computeMatrixOperations rbind -m Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05.bed_matrix.mat.gz Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05.bed_matrix.mat.gz Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05.bed_matrix.mat.gz -o Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05_rbind.bed_matrix.mat.gz
#plotHeatmap -m Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05_rbind.bed_matrix.mat.gz -out  Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05_rbind.bed_matrix.mat.gz.pdf
#
#
#computeMatrixOperations rbind -m Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05.bed_matrix.mat.gz Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05.bed_matrix.mat.gz Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05.bed_matrix.mat.gz -o Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05_rbind.bed_matrix.mat.gz 
#plotHeatmap -m Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05_rbind.bed_matrix.mat.gz -out  Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05_rbind.bed_matrix.mat.gz.pdf



################################################################################################################################################################
################################################################################################################################################################
# cbind pour aligner les 4 temps d'echantillonnage
################################################################################################################################################################
################################################################################################################################################################



#computeMatrixOperations cbind -m Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05_rbind.bed_matrix.mat.gz Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05_rbind.bed_matrix.mat.gz Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05_rbind.bed_matrix.mat.gz Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsA3_p0_05_rbind.bed_matrix.mat.gz -o select_A1vsA3_p0_05_rbind.bed_matrix.mat.gz 

plotHeatmap -m select_A1vsA3_p0_05_rbind.bed_matrix.mat.gz \
     -out select_A1vsA3_p0_05_rbind_kmeans_04.bed_matrix.mat.gz.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions select_A1vsA3_p0_05_rbind_kmeans_04_out_clusters.bed

#computeMatrixOperations cbind -m Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05_rbind.bed_matrix.mat.gz Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05_rbind.bed_matrix.mat.gz Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05_rbind.bed_matrix.mat.gz Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_A1vsC3_p0_05_rbind.bed_matrix.mat.gz -o select_A1vsC3_p0_05_rbind.bed_matrix.mat.gz

#plotHeatmap -m select_A1vsC3_p0_05_rbind.bed_matrix.mat.gz \
     -out select_A1vsC3_p0_05_rbind_kmeans_04.bed_matrix.mat.gz.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions select_A1vsC3_p0_05_rbind_kmeans_04_out_clusters.bed

#computeMatrixOperations cbind -m Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz -o select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz

plotHeatmap -m select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz \
     -out select_C1vsA1_p0_05_rbind_kmeans_04.bed_matrix.mat.gz.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions select_C1vsA1_p0_05_rbind_kmeans_04_out_clusters.bed

#computeMatrixOperations cbind -m Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05_rbind.bed_matrix.mat.gz Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05_rbind.bed_matrix.mat.gz Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05_rbind.bed_matrix.mat.gz Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA3_p0_05_rbind.bed_matrix.mat.gz -o select_C1vsA3_p0_05_rbind.bed_matrix.mat.gz

plotHeatmap -m select_C1vsA3_p0_05_rbind.bed_matrix.mat.gz \
     -out select_C1vsA3_p0_05_rbind_kmeans_04.bed_matrix.mat.gz.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions select_C1vsA3_p0_05_rbind_kmeans_04_out_clusters.bed

#computeMatrixOperations cbind -m Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05_rbind.bed_matrix.mat.gz Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05_rbind.bed_matrix.mat.gz Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05_rbind.bed_matrix.mat.gz Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsC3_p0_05_rbind.bed_matrix.mat.gz -o select_C1vsC3_p0_05_rbind.bed_matrix.mat.gz 

plotHeatmap -m select_C1vsC3_p0_05_rbind.bed_matrix.mat.gz \
     -out select_C1vsC3_p0_05_rbind_kmeans_04.bed_matrix.mat.gz.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions select_C1vsC3_p0_05_rbind_kmeans_04_out_clusters.bed

#computeMatrixOperations cbind -m Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05_rbind.bed_matrix.mat.gz Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05_rbind.bed_matrix.mat.gz Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05_rbind.bed_matrix.mat.gz Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C3vsA3_p0_05_rbind.bed_matrix.mat.gz -o select_C3vsA3_p0_05_rbind.bed_matrix.mat.gz

plotHeatmap -m select_C3vsA3_p0_05_rbind.bed_matrix.mat.gz \
     -out select_C3vsA3_p0_05_rbind_kmeans_04.bed_matrix.mat.gz.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions select_C3vsA3_p0_05_rbind_kmeans_04_out_clusters.bed





