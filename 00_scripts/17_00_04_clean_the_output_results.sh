#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATAWORK=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified

cd $DATAWORK

# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_02.txt > input_glm_split_with_iteration_results_02_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_02_without_dbsp.txt > input_glm_split_with_iteration_results_02_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_02_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_02_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_02_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_02_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_02_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_02_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_02_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_02_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_02_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_02_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_02_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_02_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_02_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_02_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_02_not_ok.txt




# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_03.txt > input_glm_split_with_iteration_results_03_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_03_without_dbsp.txt > input_glm_split_with_iteration_results_03_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_03_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_03_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_03_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_03_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_03_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_03_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_03_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_03_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_03_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_03_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_03_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_03_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_03_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_03_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_03_not_ok.txt


# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_11.txt > input_glm_split_with_iteration_results_11_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_11_without_dbsp.txt > input_glm_split_with_iteration_results_11_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_11_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_11_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_11_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_11_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_11_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_11_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_11_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_11_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_11_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_11_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_11_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_11_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_11_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_11_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_11_not_ok.txt



# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_00.txt > input_glm_split_with_iteration_results_00_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_00_without_dbsp.txt > input_glm_split_with_iteration_results_00_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_00_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_00_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_00_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_00_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_00_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_00_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_00_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_00_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_00_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_00_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_00_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_00_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_00_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_00_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_00_not_ok.txt



# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_23.txt > input_glm_split_with_iteration_results_23_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_23_without_dbsp.txt > input_glm_split_with_iteration_results_23_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_23_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_23_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_23_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_23_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_23_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_23_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_23_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_23_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_23_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_23_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_23_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_23_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_23_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_23_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_23_not_ok.txt



# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_26.txt > input_glm_split_with_iteration_results_26_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_26_without_dbsp.txt > input_glm_split_with_iteration_results_26_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_26_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_26_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_26_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_26_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_26_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_26_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_26_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_26_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_26_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_26_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_26_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_26_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_26_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_26_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_26_not_ok.txt


# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_18.txt > input_glm_split_with_iteration_results_18_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_18_without_dbsp.txt > input_glm_split_with_iteration_results_18_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_18_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_18_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_18_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_18_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_18_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_18_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_18_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_18_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_18_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_18_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_18_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_18_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_18_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_18_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_18_not_ok.txt



# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_25.txt > input_glm_split_with_iteration_results_25_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_25_without_dbsp.txt > input_glm_split_with_iteration_results_25_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_25_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_25_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_25_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_25_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_25_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_25_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_25_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_25_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_25_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_25_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_25_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_25_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_25_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_25_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_25_not_ok.txt




# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_21.txt > input_glm_split_with_iteration_results_21_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_21_without_dbsp.txt > input_glm_split_with_iteration_results_21_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_21_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_21_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_21_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_21_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_21_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_21_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_21_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_21_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_21_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_21_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_21_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_21_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_21_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_21_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_21_not_ok.txt



# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_17.txt > input_glm_split_with_iteration_results_17_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_17_without_dbsp.txt > input_glm_split_with_iteration_results_17_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_17_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_17_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_17_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_17_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_17_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_17_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_17_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_17_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_17_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_17_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_17_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_17_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_17_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_17_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_17_not_ok.txt



# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_24.txt > input_glm_split_with_iteration_results_24_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_24_without_dbsp.txt > input_glm_split_with_iteration_results_24_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_24_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_24_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_24_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_24_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_24_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_24_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_24_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_24_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_24_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_24_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_24_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_24_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_24_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_24_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_24_not_ok.txt



# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_20.txt > input_glm_split_with_iteration_results_20_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_20_without_dbsp.txt > input_glm_split_with_iteration_results_20_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_20_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_20_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_20_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_20_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_20_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_20_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_20_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_20_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_20_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_20_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_20_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_20_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_20_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_20_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_20_not_ok.txt




# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_16.txt > input_glm_split_with_iteration_results_16_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_16_without_dbsp.txt > input_glm_split_with_iteration_results_16_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_16_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_16_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_16_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_16_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_16_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_16_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_16_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_16_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_16_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_16_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_16_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_16_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_16_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_16_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_16_not_ok.txt




# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_15.txt > input_glm_split_with_iteration_results_15_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_15_without_dbsp.txt > input_glm_split_with_iteration_results_15_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_15_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_15_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_15_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_15_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_15_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_15_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_15_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_15_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_15_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_15_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_15_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_15_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_15_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_15_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_15_not_ok.txt


# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_14.txt > input_glm_split_with_iteration_results_14_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_14_without_dbsp.txt > input_glm_split_with_iteration_results_14_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_14_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_14_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_14_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_14_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_14_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_14_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_14_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_14_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_14_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_14_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_14_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_14_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_14_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_14_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_14_not_ok.txt




# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_12.txt > input_glm_split_with_iteration_results_12_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_12_without_dbsp.txt > input_glm_split_with_iteration_results_12_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_12_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_12_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_12_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_12_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_12_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_12_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_12_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_12_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_12_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_12_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_12_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_12_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_12_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_12_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_12_not_ok.txt





# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_13.txt > input_glm_split_with_iteration_results_13_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_13_without_dbsp.txt > input_glm_split_with_iteration_results_13_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_13_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_13_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_13_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_13_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_13_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_13_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_13_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_13_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_13_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_13_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_13_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_13_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_13_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_13_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_13_not_ok.txt




# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_19.txt > input_glm_split_with_iteration_results_19_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_19_without_dbsp.txt > input_glm_split_with_iteration_results_19_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_19_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_19_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_19_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_19_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_19_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_19_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_19_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_19_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_19_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_19_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_19_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_19_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_19_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_19_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_19_not_ok.txt



# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' input_glm_split_with_iteration_results_22.txt > input_glm_split_with_iteration_results_22_without_dbsp.txt

# Delete return to the line
tr -d '\n' < input_glm_split_with_iteration_results_22_without_dbsp.txt > input_glm_split_with_iteration_results_22_without_dbsp_no_rt.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' input_glm_split_with_iteration_results_22_without_dbsp_no_rt.txt > input_glm_split_with_iteration_results_22_without_dbsp_no_rt_scaf.txt
sed -e 's/\ \ /\ /g' input_glm_split_with_iteration_results_22_without_dbsp_no_rt_scaf.txt > input_glm_split_with_iteration_results_22_without_dbsp_no_rt_scaf_dbsp.txt

# Si pas 10 block, met la ligne dans un autre fichier:

# Compte le nombre de "mots" par ligne
awk '$0="line"NR": "NF' input_glm_split_with_iteration_results_22_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_22_without_dbsp_no_rt_scaf_dbsp_line_nb.txt

# Enlever "lineX:" pour n'avoir que la valeur du nombre de mots
awk '{$1=""; print $2}' input_glm_split_with_iteration_results_22_without_dbsp_no_rt_scaf_dbsp_line_nb.txt > input_glm_split_with_iteration_results_22_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt

# Merge the 2 files (nb of lines with the output)
paste input_glm_split_with_iteration_results_22_without_dbsp_no_rt_scaf_dbsp_line_nb_clean.txt input_glm_split_with_iteration_results_22_without_dbsp_no_rt_scaf_dbsp.txt > input_glm_split_with_iteration_results_22_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt

# If 10 put in output_ok.txt
awk '$1=="10"' input_glm_split_with_iteration_results_22_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_22_ok.txt

# If not 10 put in output_not_ok.txt
awk '$1!="10"' input_glm_split_with_iteration_results_22_without_dbsp_no_rt_scaf_dbsp_nb_line_merged.txt > input_glm_split_with_iteration_results_22_not_ok.txt
