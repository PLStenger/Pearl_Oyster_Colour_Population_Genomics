#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATAWORK=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified

cd $DATAWORK



# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_from_rerererun_00.txt > input_glm_split_with_iteration_results_from_rerererun_00_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_from_rerererun_00_without_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_00_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_from_rerererun_00_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_from_rerererun_00_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_from_rerererun_00_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_from_rerererun_00_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_from_rerererun_00_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_00_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_from_rerererun_00_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_from_rerererun_00_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_from_rerererun_00_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_from_rerererun_00_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_00_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_from_rerererun_00_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_from_rerererun_00_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_from_rerererun_00_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_from_rerererun_00_not_ok.txt




# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_from_rerererun_01.txt > input_glm_split_with_iteration_results_from_rerererun_01_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_from_rerererun_01_without_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_01_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_from_rerererun_01_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_from_rerererun_01_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_from_rerererun_01_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_from_rerererun_01_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_from_rerererun_01_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_01_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_from_rerererun_01_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_from_rerererun_01_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_from_rerererun_01_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_from_rerererun_01_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_01_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_from_rerererun_01_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_from_rerererun_01_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_from_rerererun_01_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_from_rerererun_01_not_ok.txt



# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_from_rerererun_02.txt > input_glm_split_with_iteration_results_from_rerererun_02_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_from_rerererun_02_without_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_02_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_from_rerererun_02_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_from_rerererun_02_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_from_rerererun_02_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_from_rerererun_02_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_from_rerererun_02_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_02_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_from_rerererun_02_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_from_rerererun_02_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_from_rerererun_02_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_from_rerererun_02_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_02_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_from_rerererun_02_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_from_rerererun_02_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_from_rerererun_02_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_from_rerererun_02_not_ok.txt




# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_from_rerererun_03.txt > input_glm_split_with_iteration_results_from_rerererun_03_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_from_rerererun_03_without_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_03_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_from_rerererun_03_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_from_rerererun_03_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_from_rerererun_03_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_from_rerererun_03_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_from_rerererun_03_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_03_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_from_rerererun_03_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_from_rerererun_03_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_from_rerererun_03_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_from_rerererun_03_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_03_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_from_rerererun_03_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_from_rerererun_03_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_from_rerererun_03_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_from_rerererun_03_not_ok.txt




# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_from_rerererun_04.txt > input_glm_split_with_iteration_results_from_rerererun_04_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_from_rerererun_04_without_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_04_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_from_rerererun_04_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_from_rerererun_04_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_from_rerererun_04_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_from_rerererun_04_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_from_rerererun_04_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_04_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_from_rerererun_04_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_from_rerererun_04_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_from_rerererun_04_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_from_rerererun_04_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_04_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_from_rerererun_04_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_from_rerererun_04_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_from_rerererun_04_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_from_rerererun_04_not_ok.txt




# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_from_rerererun_05.txt > input_glm_split_with_iteration_results_from_rerererun_05_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_from_rerererun_05_without_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_05_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_from_rerererun_05_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_from_rerererun_05_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_from_rerererun_05_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_from_rerererun_05_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_from_rerererun_05_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_05_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_from_rerererun_05_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_from_rerererun_05_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_from_rerererun_05_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_from_rerererun_05_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_05_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_from_rerererun_05_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_from_rerererun_05_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_from_rerererun_05_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_from_rerererun_05_not_ok.txt




# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_from_rerererun_06.txt > input_glm_split_with_iteration_results_from_rerererun_06_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_from_rerererun_06_without_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_06_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_from_rerererun_06_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_from_rerererun_06_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_from_rerererun_06_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_from_rerererun_06_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_from_rerererun_06_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_06_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_from_rerererun_06_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_from_rerererun_06_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_from_rerererun_06_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_from_rerererun_06_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_06_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_from_rerererun_06_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_from_rerererun_06_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_from_rerererun_06_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_from_rerererun_06_not_ok.txt






# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_from_rerererun_07.txt > input_glm_split_with_iteration_results_from_rerererun_07_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_from_rerererun_07_without_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_07_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_from_rerererun_07_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_from_rerererun_07_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_from_rerererun_07_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_from_rerererun_07_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_from_rerererun_07_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_07_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_from_rerererun_07_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_from_rerererun_07_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_from_rerererun_07_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_from_rerererun_07_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_07_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_from_rerererun_07_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_from_rerererun_07_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_from_rerererun_07_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_from_rerererun_07_not_ok.txt




# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_from_rerererun_08.txt > input_glm_split_with_iteration_results_from_rerererun_08_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_from_rerererun_08_without_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_08_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_from_rerererun_08_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_from_rerererun_08_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_from_rerererun_08_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_from_rerererun_08_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_from_rerererun_08_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_08_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_from_rerererun_08_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_from_rerererun_08_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_from_rerererun_08_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_from_rerererun_08_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_08_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_from_rerererun_08_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_from_rerererun_08_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_from_rerererun_08_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_from_rerererun_08_not_ok.txt




# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_from_rerererun_09.txt > input_glm_split_with_iteration_results_from_rerererun_09_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_from_rerererun_09_without_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_09_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_from_rerererun_09_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_from_rerererun_09_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_from_rerererun_09_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_from_rerererun_09_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_from_rerererun_09_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_09_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_from_rerererun_09_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_from_rerererun_09_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_from_rerererun_09_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_from_rerererun_09_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_09_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_from_rerererun_09_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_from_rerererun_09_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_from_rerererun_09_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_from_rerererun_09_not_ok.txt





# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_from_rerererun_10.txt > input_glm_split_with_iteration_results_from_rerererun_10_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_from_rerererun_10_without_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_10_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_from_rerererun_10_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_from_rerererun_10_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_from_rerererun_10_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_from_rerererun_10_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_from_rerererun_10_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_10_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_from_rerererun_10_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_from_rerererun_10_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_from_rerererun_10_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_from_rerererun_10_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_10_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_from_rerererun_10_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_from_rerererun_10_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_from_rerererun_10_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_from_rerererun_10_not_ok.txt




# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_from_rerererun_11.txt > input_glm_split_with_iteration_results_from_rerererun_11_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_from_rerererun_11_without_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_11_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_from_rerererun_11_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_from_rerererun_11_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_from_rerererun_11_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_from_rerererun_11_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_from_rerererun_11_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_11_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_from_rerererun_11_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_from_rerererun_11_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_from_rerererun_11_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_from_rerererun_11_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_from_rerererun_11_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_from_rerererun_11_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_from_rerererun_11_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_from_rerererun_11_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_from_rerererun_11_not_ok.txt




