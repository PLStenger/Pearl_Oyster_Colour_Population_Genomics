#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATAWORK=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified

cd $DATAWORK

# Cat all problematics scaffold to find them and rerun the glm
cat input_glm_split_with_iteration_results_00_not_ok.txt input_glm_split_with_iteration_results_01_not_ok.txt input_glm_split_with_iteration_results_02_not_ok.txt input_glm_split_with_iteration_results_03_not_ok.txt input_glm_split_with_iteration_results_04_not_ok.txt input_glm_split_with_iteration_results_05_not_ok.txt input_glm_split_with_iteration_results_06_not_ok.txt input_glm_split_with_iteration_results_07_not_ok.txt input_glm_split_with_iteration_results_08_not_ok.txt input_glm_split_with_iteration_results_09_not_ok.txt input_glm_split_with_iteration_results_10_not_ok.txt input_glm_split_with_iteration_results_11_not_ok.txt input_glm_split_with_iteration_results_12_not_ok.txt input_glm_split_with_iteration_results_13_not_ok.txt input_glm_split_with_iteration_results_14_not_ok.txt input_glm_split_with_iteration_results_15_not_ok.txt input_glm_split_with_iteration_results_16_not_ok.txt input_glm_split_with_iteration_results_17_not_ok.txt input_glm_split_with_iteration_results_18_not_ok.txt > input_glm_split_with_iteration_results_00_01_03_04_05_06_07_08_09_10_11_12_13_14_15_16_17_18_not_ok.txt 

# Cat all ok scaffold that have already be run by the glm, in order not rerun them
cat input_glm_split_with_iteration_results_00_ok.txt input_glm_split_with_iteration_results_01_ok.txt input_glm_split_with_iteration_results_02_ok.txt input_glm_split_with_iteration_results_03_ok.txt input_glm_split_with_iteration_results_04_ok.txt input_glm_split_with_iteration_results_05_ok.txt input_glm_split_with_iteration_results_06_ok.txt input_glm_split_with_iteration_results_07_ok.txt input_glm_split_with_iteration_results_08_ok.txt input_glm_split_with_iteration_results_09_ok.txt input_glm_split_with_iteration_results_10_ok.txt input_glm_split_with_iteration_results_11_ok.txt input_glm_split_with_iteration_results_12_ok.txt input_glm_split_with_iteration_results_13_ok.txt input_glm_split_with_iteration_results_14_ok.txt input_glm_split_with_iteration_results_15_ok.txt input_glm_split_with_iteration_results_16_ok.txt input_glm_split_with_iteration_results_17_ok.txt input_glm_split_with_iteration_results_18_ok.txt > input_glm_split_with_iteration_results_00_01_03_04_05_06_07_08_09_10_11_12_13_14_15_16_17_18_ok.txt 

# Data base of all scaffolds
cat input_glm_split_with_iteration_00 input_glm_split_with_iteration_01 input_glm_split_with_iteration_02 input_glm_split_with_iteration_03 input_glm_split_with_iteration_04 input_glm_split_with_iteration_05 input_glm_split_with_iteration_06 input_glm_split_with_iteration_07 input_glm_split_with_iteration_08 input_glm_split_with_iteration_09 input_glm_split_with_iteration_10 input_glm_split_with_iteration_11 input_glm_split_with_iteration_12 input_glm_split_with_iteration_13 input_glm_split_with_iteration_14 input_glm_split_with_iteration_15 input_glm_split_with_iteration_16 input_glm_split_with_iteration_17 input_glm_split_with_iteration_18 input_glm_split_with_iteration_19 > input_glm_split_with_iteration_all
