#!/usr/bin/env bash
#PBS -q omp
#PBS -l walltime=48:00:00
#PBS -l ncpus=28
#PBS -l mem=115g

WORKING_DIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data

cd $WORKING_DIRECTORY

grep -f list_map_combination2.txt evm_out_masked_PasaExo.gff3  > gff_54K.txt 

