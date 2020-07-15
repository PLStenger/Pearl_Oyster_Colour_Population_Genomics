#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g


DATADIRECTORY=/home1/scratch/plstenge/A_digitifera
#BW_DIRECTORY=/home1/datawork/plstenge/A_digitifera

cd $DATADIRECTORY

export PATH=$PATH:/appli/anaconda/2.7/bin
source activate $DATAWORK/96_env_conda/deeptools

cd $DATADIRECTORY


################################################################################################################################################################
################################################################################################################################################################
# computeMatrix sample by sample
################################################################################################################################################################
################################################################################################################################################################


#################################################################################################################################################################
### TNF
#for FILE in $(ls $DATADIRECTORY/*.bam_sorted.bam.bw)
#do
#computeMatrix scale-regions -S ${FILE##*/} -R TNF.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o ${FILE##*/}_TNF_matrix.mat.gz
#done ;
#
#################################################################################################################################################################
### heat_shock_protein
#for FILE in $(ls $DATADIRECTORY/*.bam_sorted.bam.bw)
#do
#computeMatrix scale-regions -S ${FILE##*/} -R heat_shock_protein.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o ${FILE##*/}_heat_shock_protein_matrix.mat.gz
#done ;
#
#################################################################################################################################################################
### fibroblast
#for FILE in $(ls $DATADIRECTORY/*.bam_sorted.bam.bw)
#do
#computeMatrix scale-regions -S ${FILE##*/} -R fibroblast.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o ${FILE##*/}_fibroblast_matrix.mat.gz
#done ;
#
#
#################################################################################################################################################################
### collagen
#for FILE in $(ls $DATADIRECTORY/*.bam_sorted.bam.bw)
#do
#computeMatrix scale-regions -S ${FILE##*/} -R collagen.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o ${FILE##*/}_collagen_matrix.mat.gz
#done ;
#
#################################################################################################################################################################
### CCR4_not
#for FILE in $(ls $DATADIRECTORY/*.bam_sorted.bam.bw)
#do
#computeMatrix scale-regions -S ${FILE##*/} -R CCR4_not.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o ${FILE##*/}_CCR4_not_matrix.mat.gz
#done ;
#
#################################################################################################################################################################
################################################################################################################################################################
# rbind pour obtenir une seule valeure par point d'échantillonnage
################################################################################################################################################################
################################################################################################################################################################

################################################################################################################################################################
## TNF

computeMatrixOperations rbind -m Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_TNF_matrix.mat.gz Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_TNF_matrix.mat.gz Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_TNF_matrix.mat.gz \
 -o Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_TNF_matrix.mat.gz

computeMatrixOperations rbind -m Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_TNF_matrix.mat.gz Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_TNF_matrix.mat.gz Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_TNF_matrix.mat.gz \
 -o Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_TNF_matrix.mat.gz

computeMatrixOperations rbind -m Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_TNF_matrix.mat.gz Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_TNF_matrix.mat.gz Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_TNF_matrix.mat.gz \
 -o Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_TNF_matrix.mat.gz

computeMatrixOperations rbind -m Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_TNF_matrix.mat.gz Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_TNF_matrix.mat.gz Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_TNF_matrix.mat.gz \
 -o Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_TNF_matrix.mat.gz
 
################################################################################################################################################################
## heat_shock_protein

computeMatrixOperations rbind -m Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_heat_shock_protein_matrix.mat.gz Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_heat_shock_protein_matrix.mat.gz Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_heat_shock_protein_matrix.mat.gz \
 -o Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_heat_shock_protein_matrix.mat.gz

computeMatrixOperations rbind -m Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_heat_shock_protein_matrix.mat.gz Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_heat_shock_protein_matrix.mat.gz Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_heat_shock_protein_matrix.mat.gz \
 -o Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_heat_shock_protein_matrix.mat.gz

computeMatrixOperations rbind -m Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_heat_shock_protein_matrix.mat.gz Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_heat_shock_protein_matrix.mat.gz Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_heat_shock_protein_matrix.mat.gz \
 -o Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_heat_shock_protein_matrix.mat.gz

computeMatrixOperations rbind -m Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_heat_shock_protein_matrix.mat.gz Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_heat_shock_protein_matrix.mat.gz Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_heat_shock_protein_matrix.mat.gz \
 -o Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_heat_shock_protein_matrix.mat.gz
 
 
 ################################################################################################################################################################
## fibroblast

computeMatrixOperations rbind -m Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_fibroblast_matrix.mat.gz Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_fibroblast_matrix.mat.gz Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_fibroblast_matrix.mat.gz \
 -o Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_fibroblast_matrix.mat.gz

computeMatrixOperations rbind -m Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_fibroblast_matrix.mat.gz Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_fibroblast_matrix.mat.gz Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_fibroblast_matrix.mat.gz \
 -o Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_fibroblast_matrix.mat.gz

computeMatrixOperations rbind -m Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_fibroblast_matrix.mat.gz Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_fibroblast_matrix.mat.gz Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_fibroblast_matrix.mat.gz \
 -o Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_fibroblast_matrix.mat.gz

computeMatrixOperations rbind -m Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_fibroblast_matrix.mat.gz Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_fibroblast_matrix.mat.gz Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_fibroblast_matrix.mat.gz \
 -o Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_fibroblast_matrix.mat.gz
 
 
 ################################################################################################################################################################
## collagen

computeMatrixOperations rbind -m Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_collagen_matrix.mat.gz Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_collagen_matrix.mat.gz Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_collagen_matrix.mat.gz \
 -o Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_collagen_matrix.mat.gz

computeMatrixOperations rbind -m Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_collagen_matrix.mat.gz Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_collagen_matrix.mat.gz Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_collagen_matrix.mat.gz \
 -o Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_collagen_matrix.mat.gz

computeMatrixOperations rbind -m Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_collagen_matrix.mat.gz Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_collagen_matrix.mat.gz Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_collagen_matrix.mat.gz \
 -o Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_collagen_matrix.mat.gz

computeMatrixOperations rbind -m Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_collagen_matrix.mat.gz Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_collagen_matrix.mat.gz Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_collagen_matrix.mat.gz \
 -o Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_collagen_matrix.mat.gz
 
 
 ################################################################################################################################################################
## CCR4_not

computeMatrixOperations rbind -m Control_1_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_CCR4_not_matrix.mat.gz Control_1_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_CCR4_not_matrix.mat.gz Control_1_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_CCR4_not_matrix.mat.gz \
 -o Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_CCR4_not_matrix.mat.gz

computeMatrixOperations rbind -m Acclimation_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_CCR4_not_matrix.mat.gz Acclimation_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_CCR4_not_matrix.mat.gz Acclimation_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_CCR4_not_matrix.mat.gz \
 -o Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_CCR4_not_matrix.mat.gz

computeMatrixOperations rbind -m Acclimation_1_31_5c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_CCR4_not_matrix.mat.gz Acclimation_1_31_5b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_CCR4_not_matrix.mat.gz Acclimation_1_31_5a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_CCR4_not_matrix.mat.gz \
 -o Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_CCR4_not_matrix.mat.gz

computeMatrixOperations rbind -m Control_3_30c_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_CCR4_not_matrix.mat.gz Control_3_30b_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_CCR4_not_matrix.mat.gz Control_3_30a_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_CCR4_not_matrix.mat.gz \
 -o Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_CCR4_not_matrix.mat.gz
  
################################################################################################################################################################
################################################################################################################################################################
# cbind pour aligner les 4 temps d'echantillonnage
################################################################################################################################################################
################################################################################################################################################################


################################################################################################################################################################
## TNF

computeMatrixOperations cbind -m Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_TNF_matrix.mat.gz Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_TNF_matrix.mat.gz Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_TNF_matrix.mat.gz Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_TNF_matrix.mat.gz \
 -o TNF_matrix.mat.gz
 
plotHeatmap -m TNF_matrix.mat.gz \
     -out TNF_matrix.mat.gz.pdf 

plotHeatmap -m TNF_matrix.mat.gz \
     -out TNF_matrix.mat.gz_kmeans_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 2 \
     --outFileSortedRegions TNF_matrix.mat.gz_kmeans_02.bed

plotHeatmap -m TNF_matrix.mat.gz \
     -out TNF_matrix.mat.gz_kmeans_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 3 \
     --outFileSortedRegions TNF_matrix.mat.gz_kmeans_043.bed

plotHeatmap -m TNF_matrix.mat.gz \
     -out TNF_matrix.mat.gz_kmeans_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions TNF_matrix.mat.gz_kmeans_04.bed



################################################################################################################################################################
## heat_shock_protein

computeMatrixOperations cbind -m Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_heat_shock_protein_matrix.mat.gz Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_heat_shock_protein_matrix.mat.gz Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_heat_shock_protein_matrix.mat.gz Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_heat_shock_protein_matrix.mat.gz \
 -o heat_shock_protein_matrix.mat.gz
 
plotHeatmap -m heat_shock_protein_matrix.mat.gz \
     -out heat_shock_protein_matrix.mat.gz.pdf 

plotHeatmap -m heat_shock_protein_matrix.mat.gz \
     -out heat_shock_protein_matrix.mat.gz_kmeans_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 2 \
     --outFileSortedRegions heat_shock_protein_matrix.mat.gz_kmeans_02.bed

plotHeatmap -m heat_shock_protein_matrix.mat.gz \
     -out heat_shock_protein_matrix.mat.gz_kmeans_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 3 \
     --outFileSortedRegions heat_shock_protein_matrix.mat.gz_kmeans_043.bed

plotHeatmap -m heat_shock_protein_matrix.mat.gz \
     -out heat_shock_protein_matrix.mat.gz_kmeans_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions heat_shock_protein_matrix.mat.gz_kmeans_04.bed

################################################################################################################################################################
## fibroblast

computeMatrixOperations cbind -m Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_fibroblast_matrix.mat.gz Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_fibroblast_matrix.mat.gz Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_fibroblast_matrix.mat.gz Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_fibroblast_matrix.mat.gz \
 -o fibroblast_matrix.mat.gz
 
plotHeatmap -m fibroblast_matrix.mat.gz \
     -out fibroblast_matrix.mat.gz.pdf 

plotHeatmap -m fibroblast_matrix.mat.gz \
     -out fibroblast_matrix.mat.gz_kmeans_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 2 \
     --outFileSortedRegions fibroblast_matrix.mat.gz_kmeans_02.bed

plotHeatmap -m fibroblast_matrix.mat.gz \
     -out fibroblast_matrix.mat.gz_kmeans_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 3 \
     --outFileSortedRegions fibroblast_matrix.mat.gz_kmeans_043.bed

plotHeatmap -m fibroblast_matrix.mat.gz \
     -out fibroblast_matrix.mat.gz_kmeans_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions fibroblast_matrix.mat.gz_kmeans_04.bed



################################################################################################################################################################
## collagen

computeMatrixOperations cbind -m Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_collagen_matrix.mat.gz Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_collagen_matrix.mat.gz Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_collagen_matrix.mat.gz Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_collagen_matrix.mat.gz \
 -o collagen_matrix.mat.gz
 
plotHeatmap -m collagen_matrix.mat.gz \
     -out collagen_matrix.mat.gz.pdf 

plotHeatmap -m collagen_matrix.mat.gz \
     -out collagen_matrix.mat.gz_kmeans_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 2 \
     --outFileSortedRegions collagen_matrix.mat.gz_kmeans_02.bed

plotHeatmap -m collagen_matrix.mat.gz \
     -out collagen_matrix.mat.gz_kmeans_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 3 \
     --outFileSortedRegions collagen_matrix.mat.gz_kmeans_043.bed

plotHeatmap -m collagen_matrix.mat.gz \
     -out collagen_matrix.mat.gz_kmeans_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions collagen_matrix.mat.gz_kmeans_04.bed

################################################################################################################################################################
## CCR4_not

computeMatrixOperations cbind -m Acclimation_1_31_5_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_CCR4_not_matrix.mat.gz Acclimation_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_CCR4_not_matrix.mat.gz Control_1_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_CCR4_not_matrix.mat.gz Control_3_30_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bw_CCR4_not_matrix.mat.gz \
 -o CCR4_not_matrix.mat.gz
 
plotHeatmap -m CCR4_not_matrix.mat.gz \
     -out CCR4_not_matrix.mat.gz.pdf 

plotHeatmap -m CCR4_not_matrix.mat.gz \
     -out CCR4_not_matrix.mat.gz_kmeans_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 2 \
     --outFileSortedRegions CCR4_not_matrix.mat.gz_kmeans_02.bed

plotHeatmap -m CCR4_not_matrix.mat.gz \
     -out CCR4_not_matrix.mat.gz_kmeans_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 3 \
     --outFileSortedRegions CCR4_not_matrix.mat.gz_kmeans_043.bed

plotHeatmap -m CCR4_not_matrix.mat.gz \
     -out CCR4_not_matrix.mat.gz_kmeans_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4 \
     --outFileSortedRegions CCR4_not_matrix.mat.gz_kmeans_04.bed



