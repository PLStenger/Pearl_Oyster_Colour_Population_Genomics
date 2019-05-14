#!/bin/bash

#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g



DATADIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified

cd $DATADIRECTORY

for FILE in $(ls $DATADIRECTORY/*without_iteration_order_for_third_round_results_02.txt)
do

# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' ${FILE##*/} > ${FILE##*/}_dbsp.txt

# Delete return to the line
tr -d '\n' < ${FILE##*/}_dbsp.txt > ${FILE##*/}_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' ${FILE##*/}_dbsp_no_rt.txt > ${FILE##*/}_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' ${FILE##*/}_dbsp_no_rt_scaf.txt > ${FILE##*/}_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' ${FILE##*/}_dbsp_no_rt_scaf_dbsp.txt > ${FILE##*/}_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' ${FILE##*/}_dbsp_no_rt_scaf_dbsp_line_nb.txt > ${FILE##*/}_dbsp_no_rt_scaf_dbsp_line_nb_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste ${FILE##*/}_dbsp_no_rt_scaf_dbsp_line_nb_nb_clean.txt ${FILE##*/}_dbsp_no_rt_scaf_dbsp.txt > ${FILE##*/}_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' ${FILE##*/}_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > ${FILE##*/}_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' ${FILE##*/}_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > ${FILE##*/}_not_ok.txt

rm *_dbsp_*

done ;
