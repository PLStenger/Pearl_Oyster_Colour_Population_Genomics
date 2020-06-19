#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g


DATADIRECTORY=/home1/scratch/plstenge/A_digitifera

cd $DATADIRECTORY

export PATH=$PATH:/appli/anaconda/2.7/bin
source activate $DATAWORK/96_env_conda/deeptools

cd $DATADIRECTORY



#computeMatrix scale-regions -S Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw -R scaffold_gene_lenght_02.bed  --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz

#plotProfile -m Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -out Acclimation_1_31_5b.pdf --plotTitle "Acclimation_1_31_5b" --plotHeight 10 --plotWidth 10

#plotHeatmap -m Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -out Acclimation_1_31_5b_heatmap.pdf 

#######################################################################################################################################################################
#######################################################################################################################################################################

computeMatrix scale-regions -S Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw -R FC_A1vsA3_down.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o FC_A1vsA3_down_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz

plotHeatmap -m FC_A1vsA3_down_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -out FC_A1vsA3_down_Acclimation_1_31_5b_heatmap.pdf 

#######################################################################################################################################################################

computeMatrix scale-regions -S Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw -R FC_A1vsA3_up.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o FC_A1vsA3_up_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz

plotHeatmap -m FC_A1vsA3_up_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -out FC_A1vsA3_up_Acclimation_1_31_5c_heatmap.pdf 

#######################################################################################################################################################################
#######################################################################################################################################################################

computeMatrix scale-regions -S Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw -R FC_A1vsC3_down.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o FC_A1vsC3_down_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz

plotHeatmap -m FC_A1vsC3_down_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -out FC_A1vsC3_down_Acclimation_1_31_5b_heatmap.pdf 

#######################################################################################################################################################################

computeMatrix scale-regions -S Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw -R FC_A1vsC3_up.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o FC_A1vsC3_up_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz

plotHeatmap -m FC_A1vsC3_up_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -out FC_A1vsC3_up_Acclimation_1_31_5c_heatmap.pdf 

#######################################################################################################################################################################
#######################################################################################################################################################################

computeMatrix scale-regions -S Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw -R FC_C1vsA1_down.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o FC_C1vsA1_down_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz

plotHeatmap -m FC_C1vsA1_down_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -out FC_C1vsA1_down_Acclimation_1_31_5b_heatmap.pdf 

#######################################################################################################################################################################

computeMatrix scale-regions -S Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw -R FC_C1vsA1_up.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o FC_C1vsA1_up_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz

plotHeatmap -m FC_C1vsA1_up_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -out FC_C1vsA1_up_Acclimation_1_31_5c_heatmap.pdf 

#######################################################################################################################################################################
#######################################################################################################################################################################

computeMatrix scale-regions -S Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw -R FC_C1vsA3_down.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o FC_C1vsA3_down_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz

plotHeatmap -m FC_C1vsA3_down_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -out FC_C1vsA3_down_Acclimation_1_31_5b_heatmap.pdf 

#######################################################################################################################################################################

computeMatrix scale-regions -S Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw -R FC_C1vsA3_up.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o FC_C1vsA3_up_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz

plotHeatmap -m FC_C1vsA3_up_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -out FC_C1vsA3_up_Acclimation_1_31_5c_heatmap.pdf 

#######################################################################################################################################################################
#######################################################################################################################################################################

computeMatrix scale-regions -S Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw -R FC_C1vsC3_down.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o FC_C1vsC3_down_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz

plotHeatmap -m FC_C1vsC3_down_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -out FC_C1vsC3_down_Acclimation_1_31_5b_heatmap.pdf 

#######################################################################################################################################################################

computeMatrix scale-regions -S Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw -R FC_C1vsC3_up.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o FC_C1vsC3_up_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz

plotHeatmap -m FC_C1vsC3_up_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -out FC_C1vsC3_up_Acclimation_1_31_5c_heatmap.pdf 

#######################################################################################################################################################################
#######################################################################################################################################################################

computeMatrix scale-regions -S Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw -R FC_C3vsA3_down.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o FC_C3vsA3_down_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz

plotHeatmap -m FC_C3vsA3_down_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -out FC_C3vsA3_down_Acclimation_1_31_5b_heatmap.pdf 

#######################################################################################################################################################################

computeMatrix scale-regions -S Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw -R FC_C3vsA3_up.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o FC_C3vsA3_up_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz

plotHeatmap -m FC_C3vsA3_up_Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -out FC_C3vsA3_up_Acclimation_1_31_5c_heatmap.pdf 

#######################################################################################################################################################################
#######################################################################################################################################################################







