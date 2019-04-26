#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATAWORK=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified

cd $DATAWORK

cat all_results_ok_from_glm_with_iteration_2.txt input_glm_split_with_iteration_results_from_rerererererun_ultime_last_OK.txt > all_results_ok_from_glm_with_iteration_3.txt
