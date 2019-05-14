#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATAWORK=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified

cd $DATAWORK


cat input_glm_tuckey_without_iteration_order_for_third_round_results_02.txt_ok.txt input_glm_tuckey_without_iteration_order_for_second_round_results_01.txt_ok.txt input_glm_tuckey_without_iteration_all_results_ok_00.txt > all_glm_tuckey_without_iteration_results.txt

