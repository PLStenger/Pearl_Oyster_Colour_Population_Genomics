#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATAWORK=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified

cd $DATAWORK

split -d -l 3743652 $DATAWORK/for_rerererun.txt $DATAWORK/input_glm_split_with_iteration_for_rerererun_
