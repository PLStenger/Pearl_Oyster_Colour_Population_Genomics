#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATAWORK=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified

cd $DATAWORK

# Cat all problematics scaffold to find them and rerun the glm
cat input_glm_split_with_iteration_results_from_rerererun_00_not_ok.txt input_glm_split_with_iteration_results_from_rerererun_01_not_ok.txt input_glm_split_with_iteration_results_from_rerererun_02_not_ok.txt input_glm_split_with_iteration_results_from_rerererun_03_not_ok.txt input_glm_split_with_iteration_results_from_rerererun_04_not_ok.txt input_glm_split_with_iteration_results_from_rerererun_05_not_ok.txt input_glm_split_with_iteration_results_from_rerererun_06_not_ok.txt input_glm_split_with_iteration_results_from_rerererun_07_not_ok.txt input_glm_split_with_iteration_results_from_rerererun_08_not_ok.txt input_glm_split_with_iteration_results_from_rerererun_09_not_ok.txt input_glm_split_with_iteration_results_from_rerererun_10_not_ok.txt input_glm_split_with_iteration_results_from_rerererun_11_not_ok.txt > input_glm_split_with_iteration_results_from_rerererun_00_01_02_03_04_05_06_07_08_09_10_11_not_ok.txt 

# Cat all ok scaffold that have already be run by the glm, in order not rerun them
cat input_glm_split_with_iteration_results_from_rerererun_00_ok.txt input_glm_split_with_iteration_results_from_rerererun_01_ok.txt input_glm_split_with_iteration_results_from_rerererun_02_ok.txt input_glm_split_with_iteration_results_from_rerererun_03_ok.txt input_glm_split_with_iteration_results_from_rerererun_04_ok.txt input_glm_split_with_iteration_results_from_rerererun_05_ok.txt input_glm_split_with_iteration_results_from_rerererun_06_ok.txt input_glm_split_with_iteration_results_from_rerererun_07_ok.txt input_glm_split_with_iteration_results_from_rerererun_08_ok.txt input_glm_split_with_iteration_results_from_rerererun_09_ok.txt input_glm_split_with_iteration_results_from_rerererun_10_ok.txt input_glm_split_with_iteration_results_from_rerererun_11_ok.txt  > input_glm_split_with_iteration_results_from_rerererun_00_01_02_03_04_05_06_07_08_09_10_11_ok.txt 