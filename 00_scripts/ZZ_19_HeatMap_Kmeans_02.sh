#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g


DATADIRECTORY=/home1/scratch/plstenge/A_digitifera

cd $DATADIRECTORY

export PATH=$PATH:/appli/anaconda/2.7/bin
source activate $DATAWORK/96_env_conda/deeptools

cd $DATADIRECTORY


plotHeatmap -m FC_A1vsA3_down.mat.gz \
     -out FC_A1vsA3_down.mat.gz_k_means_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4


plotHeatmap -m FC_A1vsA3_up.mat.gz \
     -out FC_A1vsA3_up.mat.gz_k_means_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4


plotHeatmap -m FC_A1vsC3_down.mat.gz \
     -out FC_A1vsC3_down.mat.gz_k_means_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4


plotHeatmap -m FC_A1vsC3_up.mat.gz \
     -out FC_A1vsC3_up.mat.gz_k_means_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4


plotHeatmap -m FC_C1vsA1_down.mat.gz \
     -out FC_C1vsA1_down.mat.gz_k_means_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4


plotHeatmap -m FC_C1vsA1_up.mat.gz \
     -out FC_C1vsA1_up.mat.gz_k_means_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4


plotHeatmap -m FC_C1vsA3_down.mat.gz \
     -out FC_C1vsA3_down.mat.gz_k_means_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4


plotHeatmap -m FC_C1vsA3_up.mat.gz \
     -out FC_C1vsA3_up.mat.gz_k_means_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4


plotHeatmap -m FC_C1vsC3_down.mat.gz \
     -out FC_C1vsC3_down.mat.gz_k_means_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4


plotHeatmap -m FC_C1vsC3_up.mat.gz \
     -out FC_C1vsC3_up.mat.gz_k_means_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4


plotHeatmap -m FC_C3vsA3_down.mat.gz \
     -out FC_C3vsA3_down.mat.gz_k_means_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4


plotHeatmap -m FC_C3vsA3_up.mat.gz \
     -out FC_C3vsA3_up.mat.gz_k_means_04.pdf \
     --colorMap RdBu \
     --whatToShow 'plot, heatmap and colorbar' \
     --zMin -3 --zMax 3 \
     --kmeans 4



