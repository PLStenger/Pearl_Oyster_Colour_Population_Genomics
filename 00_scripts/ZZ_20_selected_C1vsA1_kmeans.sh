#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g


DATADIRECTORY=/home1/scratch/plstenge/A_digitifera

cd $DATADIRECTORY

export PATH=$PATH:/appli/anaconda/2.7/bin
source activate $DATAWORK/96_env_conda/deeptools

cd $DATADIRECTORY


plotHeatmap -m Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_up_rbind.bed_matrix.mat.gz \
     -out Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_up_rbind.bed_matrix.mat.gz_kmeans_04.bed_matrix.mat.gz.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_up_rbind.bed_matrix.mat.gz_kmeans_04_out_clusters.bed

plotHeatmap -m Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_up_rbind.bed_matrix.mat.gz \
     -out Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_up_rbind.bed_matrix.mat.gz_kmeans_04.bed_matrix.mat.gz.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_up_rbind.bed_matrix.mat.gz_kmeans_04_out_clusters.bed

plotHeatmap -m Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_up_rbind.bed_matrix.mat.gz \
     -out Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_up_rbind.bed_matrix.mat.gz_kmeans_04.bed_matrix.mat.gz.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_up_rbind.bed_matrix.mat.gz_kmeans_04_out_clusters.bed

plotHeatmap -m Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_up_rbind.bed_matrix.mat.gz \
     -out Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_up_rbind.bed_matrix.mat.gz_kmeans_04.bed_matrix.mat.gz.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_up_rbind.bed_matrix.mat.gz_kmeans_04_out_clusters.bed


plotHeatmap -m Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_down_rbind.bed_matrix.mat.gz \
     -out Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_down_rbind.bed_matrix.mat.gz_kmeans_04.bed_matrix.mat.gz.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_down_rbind.bed_matrix.mat.gz_kmeans_04_out_clusters.bed

plotHeatmap -m Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_down_rbind.bed_matrix.mat.gz \
     -out Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_down_rbind.bed_matrix.mat.gz_kmeans_04.bed_matrix.mat.gz.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_down_rbind.bed_matrix.mat.gz_kmeans_04_out_clusters.bed

plotHeatmap -m Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_down_rbind.bed_matrix.mat.gz \
     -out Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_down_rbind.bed_matrix.mat.gz_kmeans_04.bed_matrix.mat.gz.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_down_rbind.bed_matrix.mat.gz_kmeans_04_out_clusters.bed

plotHeatmap -m Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_down_rbind.bed_matrix.mat.gz \
     -out Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_down_rbind.bed_matrix.mat.gz_kmeans_04.bed_matrix.mat.gz.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_down_rbind.bed_matrix.mat.gz_kmeans_04_out_clusters.bed


plotHeatmap -m Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz \
     -out Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz_kmeans_04.bed_matrix.mat.gz.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz_kmeans_04_out_clusters.bed

plotHeatmap -m Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz \
     -out Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz_kmeans_04.bed_matrix.mat.gz.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz_kmeans_04_out_clusters.bed

plotHeatmap -m Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz \
     -out Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz_kmeans_04.bed_matrix.mat.gz.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz_kmeans_04_out_clusters.bed

plotHeatmap -m Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz \
     -out Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz_kmeans_04.bed_matrix.mat.gz.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_select_C1vsA1_p0_05_rbind.bed_matrix.mat.gz_kmeans_04_out_clusters.bed


