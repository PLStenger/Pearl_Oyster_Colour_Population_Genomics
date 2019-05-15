#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g

# The goal is to obtain fasta file for Higher and Modifier genes from SNPeff output

# Put here all gene summary from SNPeff AND the transcriptome file
DATA_DIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/09_snpEff_glm_without_iteration
DATA_BASE=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/evm_out_masked_PasaExo_database_amino_acid.txt

cd $DATA_DIRECTORY

for FILE in $(ls $DATA_DIRECTORY/*summary.txt)
do


# delete first unecessary line
sed '1d' $FILE > ${FILE##*/}foooooo.txt

############################################################################
#### For Higher
# Print only column name and higher one
awk '{print $1"\t"$5}' ${FILE##*/}foooooo.txt > ${FILE##*/}foooooo2.txt

# delete row with "0"
awk '{ if ( $2 != "0" ) { print $0; } }' ${FILE##*/}foooooo2.txt > ${FILE##*/}foooooo3.txt


# Add ">" before trinity name
#sed 'N;s/TRI/>TRI/g' ${FILE##*/}foooooo3.txt > ${FILE##*/}foooooo4.txt

# RechercheV (vlookup) from transcriptome T41K the corresponding sequences

awk '
    NR==FNR{a[$1]
    next
}
($1 in a) {
    print
}' ${FILE##*/}foooooo3.txt $DATA_BASE > ${FILE##*/}foooooo6.txt


# Change tab into function CR 
awk '{gsub("\t","\n"); print}' ${FILE##*/}foooooo6.txt > ${FILE##*/}foooooo7.txt
sed 's/<CR>//g' ${FILE##*/}foooooo7.txt > ${FILE##*/}_higher_fasta.txt

#rm $DATA_DIRECTORY/*foooooo*

############################################################################
#### For Modifier

## delete first unecessary line
#sed '1d' $FILE > ${FILE##*/}foooooo.txt
#
## Print only column name and modifier one
#awk '{print $1"\t"$8}' ${FILE##*/}foooooo.txt > ${FILE##*/}foooooo2.txt
#
## delete row with "0"
#awk '{ if ( $2 != "0" ) { print $0; } }' ${FILE##*/}foooooo2.txt > ${FILE##*/}foooooo3.txt
#
#
## Add ">" before trinity name
##sed 'N;s/TRI/>TRI/g' ${FILE##*/}foooooo3.txt > ${FILE##*/}foooooo4.txt
#
## RechercheV (vlookup) from transcriptome T41K the corresponding sequences
#
#awk '
#    NR==FNR{a[$1]
#    next
#}
#($1 in a) {
#    print
#}' ${FILE##*/}foooooo3.txt $DATA_BASE > ${FILE##*/}foooooo6.txt
#
#
## Change tab into function CR 
#awk '{gsub("\t","\n"); print}' ${FILE##*/}foooooo6.txt > ${FILE##*/}foooooo7.txt
#sed 's/<CR>//g' ${FILE##*/}foooooo7.txt > ${FILE##*/}_modifier_fasta.txt
#
#rm $DATA_DIRECTORY/*foooooo*

done;


#rm $DATA_DIRECTORY/*foooooo*
