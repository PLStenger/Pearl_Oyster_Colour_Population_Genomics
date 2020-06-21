#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g


DATADIRECTORY=/home1/scratch/plstenge/A_digitifera

cd $DATADIRECTORY

export PATH=$PATH:/appli/anaconda/2.7/bin
source activate $DATAWORK/96_env_conda/deeptools

cd $DATADIRECTORY


#for FILE in $(ls $DATADIRECTORY/*_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw)
#do

#computeMatrix scale-regions -S $FILE -R real_gene_lenght_32469_all_exons_introns_02.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o ${FILE##*/}_All_genes_matrix.mat.gz ;
#plotHeatmap -m ${FILE##*/}_All_genes_matrix.mat.gz -out ${FILE##*/}_All_genes_matrix.mat.gz.pdf

#done ;


####### Combine by point


computeMatrixOperations rbind -m Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_All_genes_matrix.mat.gz Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_All_genes_matrix.mat.gz Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_All_genes_matrix.mat.gz -o Acclimation_1_31_5_All_genes_matrix.mat.gz

plotHeatmap -m Acclimation_1_31_5_All_genes_matrix.mat.gz -out Acclimation_1_31_5_All_genes_matrix.mat.gz.pdf


computeMatrixOperations rbind -m Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_All_genes_matrix.mat.gz Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_All_genes_matrix.mat.gz Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_All_genes_matrix.mat.gz -o Acclimation_3_30_All_genes_matrix.mat.gz

plotHeatmap -m Acclimation_3_30_All_genes_matrix.mat.gz -out Acclimation_3_30_All_genes_matrix.mat.gz.pdf


computeMatrixOperations rbind -m Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_All_genes_matrix.mat.gz Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_All_genes_matrix.mat.gz Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_All_genes_matrix.mat.gz -o Control_1_30_All_genes_matrix.mat.gz

plotHeatmap -m Control_1_30_All_genes_matrix.mat.gz -out Control_1_30_All_genes_matrix.mat.gz.pdf


computeMatrixOperations rbind -m Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_All_genes_matrix.mat.gz Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_All_genes_matrix.mat.gz Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_All_genes_matrix.mat.gz -o Control_3_30_All_genes_matrix.mat.gz

plotHeatmap -m Control_3_30_All_genes_matrix.mat.gz -out Control_3_30_All_genes_matrix.mat.gz.pdf


####### cbind

computeMatrixOperations cbind -m Acclimation_1_31_5_All_genes_matrix.mat.gz Acclimation_3_30_All_genes_matrix.mat.gz Control_1_30_All_genes_matrix.mat.gz Control_3_30_All_genes_matrix.mat.gz -o All_genes_matrix.mat.gz

plotHeatmap -m All_genes_matrix.mat.gz -out All_genes_matrix.mat.gz_plotHeatmap.pdf


### KMEANS

plotHeatmap -m All_genes_matrix.mat.gz \
     -out All_genes_matrix.mat.gz_k_means_06.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 6

plotHeatmap -m All_genes_matrix.mat.gz \
     -out All_genes_matrix.mat.gz_k_means_05.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 5

plotHeatmap -m All_genes_matrix.mat.gz \
     -out All_genes_matrix.mat.gz_k_means_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4
	
plotHeatmap -m All_genes_matrix.mat.gz \
     -out All_genes_matrix.mat.gz_k_means_03.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 3


plotHeatmap -m All_genes_matrix.mat.gz \
     -out All_genes_matrix.mat.gz_k_means_02.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 2

### HCLUST


plotHeatmap -m All_genes_matrix.mat.gz \
     -out All_genes_matrix.mat.gz_hclust_06.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --hclust 6

plotHeatmap -m All_genes_matrix.mat.gz \
     -out All_genes_matrix.mat.gz_hclust_05.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --hclust 5

plotHeatmap -m All_genes_matrix.mat.gz \
     -out All_genes_matrix.mat.gz_hclust_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --hclust 4
	
plotHeatmap -m All_genes_matrix.mat.gz \
     -out All_genes_matrix.mat.gz_hclust_03.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --hclust 3


plotHeatmap -m All_genes_matrix.mat.gz \
     -out All_genes_matrix.mat.gz_hclust_02.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --hclust 2





