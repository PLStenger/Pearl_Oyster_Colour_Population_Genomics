#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g


DATADIRECTORY=/home1/scratch/plstenge/A_digitifera

cd $DATADIRECTORY

export PATH=$PATH:/appli/anaconda/2.7/bin
source activate $DATAWORK/96_env_conda/deeptools

cd $DATADIRECTORY

#computeMatrix scale-regions -S Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw -R FC_C1vsA3_up.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o FC_C1vsA3_up_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz

#plotHeatmap -m FC_C1vsA3_up_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -out FC_C1vsA3_up_Acclimation_1_31_5b_heatmap.pdf 

#computeMatrixOperations cbind -m FC_C1vsA3_up_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_up_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_up_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA3_up_Control_3_30_cbind_matrix.mat.gz

#plotHeatmap -m FC_C1vsA3_up_Control_3_30_cbind_matrix.mat.gz -o FC_C1vsA3_up_Control_3_30_matrix.mat.gz_cbind.pdf

#computeMatrixOperations rbind -m FC_C1vsA3_up_Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_up_Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz FC_C1vsA3_up_Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_matrix.mat.gz_matrix.mat.gz -o FC_C1vsA3_up_Control_3_30_rbind_matrix.mat.gz

#plotHeatmap -m FC_C1vsA3_up_Control_3_30_rbind_matrix.mat.gz -o FC_C1vsA3_up_Control_3_30_matrix.mat.gz_rbind.pdf




#plotHeatmap -m FC_C1vsA1_down.mat.gz -out FC_C1vsA1_down.mat.gz.pdf
#plotHeatmap -m FC_C1vsA3_down.mat.gz -out FC_C1vsA3_down.mat.gz.pdf
#plotHeatmap -m FC_C1vsC3_down.mat.gz -out FC_C1vsC3_down.mat.gz.pdf
#plotHeatmap -m FC_C3vsA3_down.mat.gz -out FC_C3vsA3_down.mat.gz.pdf
#plotHeatmap -m FC_C1vsA1_up.mat.gz -out FC_C1vsA1_up.mat.gz.pdf
#plotHeatmap -m FC_C1vsA3_up.mat.gz -out FC_C1vsA3_up.mat.gz.pdf
#plotHeatmap -m FC_C1vsC3_up.mat.gz -out FC_C1vsC3_up.mat.gz.pdf
#plotHeatmap -m FC_C3vsA3_up.mat.gz -out FC_C3vsA3_up.mat.gz.pdf

plotHeatmap -m All_genes_matrix.mat.gz \
     -out All_genes_matrix.mat.gz_Kmeans_04_out_clusters.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions All_genes_matrix.mat.gz_Kmeans_04_out_clusters.bed





plotHeatmap -m FC_C1vsA1_down.mat.gz \
     -out FC_C1vsA1_down.mat.gz_Kmeans_04_out_clusters.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions FC_C1vsA1_down.mat.gz_Kmeans_04_out_clusters.bed

plotHeatmap -m FC_C1vsA1_up.mat.gz \
     -out FC_C1vsA1_up.mat.gz_Kmeans_04_out_clusters.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions FC_C1vsA1_up.mat.gz_Kmeans_04_out_clusters.bed










plotHeatmap -m FC_C1vsA1_down.mat.gz \
     -out FC_C1vsA1_down.mat.gz_hclust_04_out_clusters.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --hclust 4 \
     --outFileSortedRegions FC_C1vsA1_down.mat.gz_hclust_04_out_clusters.bed

plotHeatmap -m FC_C1vsA1_up.mat.gz \
     -out FC_C1vsA1_up.mat.gz_hclust_04_out_clusters.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --hclust 4 \
     --outFileSortedRegions FC_C1vsA1_up.mat.gz_hclust_04_out_clusters.bed


