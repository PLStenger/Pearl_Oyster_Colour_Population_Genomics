#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g

# The goal is to obtain fasta file for Higher and Modifier genes from SNPeff output

# Put here all gene summary from SNPeff AND the transcriptome file
DATA_DIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/09_snpEff_glm_without_iteration
DATA_BASE=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/sspace.final.scaffolds_54K_CDS_fasta_2.txt # nucleotid database for the 54k genes with the concatenated CDS
#POSITION=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/position_7.txt

cd $DATA_DIRECTORY

for FILE in $(ls $DATA_DIRECTORY/*summary.txt)
do


# delete first unecessary line
sed '1d' $FILE > ${FILE##*/}foooooo.txt

############################################################################
#### For Higher
# Print only column name and higher one
awk '{print $3"\t"$5}' ${FILE##*/}foooooo.txt > ${FILE##*/}foooooo2.txt

# delete row with "0"
awk '{ if ( $2 != "0" ) { print $0; } }' ${FILE##*/}foooooo2.txt > ${FILE##*/}foooooo3.txt

# Delete "evm.model." pattern
sed 's/evm.model.//g' ${FILE##*/}foooooo3.txt > ${FILE##*/}foooooo4.txt


# Add ">" before scaffold name
sed 'N;s/scaff/>scaff/g' ${FILE##*/}foooooo4.txt > ${FILE##*/}foooooo5.txt


#paste ${FILE##*/}foooooo5.txt $POSITION | awk '{print $0}' > ${FILE##*/}foooooo6.txt

#awk 'NR==FNR {h[$1] = $2; next} {print $1"\t"$2"\t"h[$1]}' $POSITION  ${FILE##*/}foooooo5.txt > ${FILE##*/}foooooo6.txt

# Change order
#awk '{print $3"\t"$1"\t"$2}' ${FILE##*/}foooooo6.txt > ${FILE##*/}foooooo666.txt


# RechercheV (vlookup) from transcriptome T41K the corresponding sequences

awk '
    NR==FNR{a[$1]
    next
}
($1 in a) {
    print
}' ${FILE##*/}foooooo5.txt $DATA_BASE > ${FILE##*/}foooooo66.txt


# Change tab into function CR 
awk '{gsub("\t","\n"); print}' ${FILE##*/}foooooo66.txt > ${FILE##*/}foooooo7.txt
sed 's/<CR>//g' ${FILE##*/}foooooo7.txt > ${FILE##*/}_higher_fasta_nucleotids.txt

rm $DATA_DIRECTORY/*foooooo*

############################################################################
#### For modifier

# delete first unecessary line
sed '1d' $FILE > ${FILE##*/}foooooo.txt

# Print only column name and higher one
awk '{print $3"\t"$8}' ${FILE##*/}foooooo.txt > ${FILE##*/}foooooo2.txt

# delete row with "0"
awk '{ if ( $2 != "0" ) { print $0; } }' ${FILE##*/}foooooo2.txt > ${FILE##*/}foooooo3.txt

# Delete "evm.model." pattern
sed 's/evm.model.//g' ${FILE##*/}foooooo3.txt > ${FILE##*/}foooooo4.txt


# Add ">" before scaffold name
sed 'N;s/scaff/>scaff/g' ${FILE##*/}foooooo4.txt > ${FILE##*/}foooooo5.txt


#paste ${FILE##*/}foooooo5.txt $POSITION | awk '{print $0}' > ${FILE##*/}foooooo6.txt

#awk 'NR==FNR {h[$1] = $2; next} {print $1"\t"$2"\t"h[$1]}' $POSITION  ${FILE##*/}foooooo5.txt > ${FILE##*/}foooooo6.txt

# Change order
#awk '{print $3"\t"$1"\t"$2}' ${FILE##*/}foooooo6.txt > ${FILE##*/}foooooo666.txt


# RechercheV (vlookup) from transcriptome T41K the corresponding sequences

awk '
    NR==FNR{a[$1]
    next
}
($1 in a) {
    print
}' ${FILE##*/}foooooo5.txt $DATA_BASE > ${FILE##*/}foooooo66.txt


# Change tab into function CR 
awk '{gsub("\t","\n"); print}' ${FILE##*/}foooooo66.txt > ${FILE##*/}foooooo7.txt
sed 's/<CR>//g' ${FILE##*/}foooooo7.txt > ${FILE##*/}_modifier_fasta_nucleotids.txt

rm $DATA_DIRECTORY/*foooooo*


############################################################################
#### For moderate

# delete first unecessary line
sed '1d' $FILE > ${FILE##*/}foooooo.txt

# Print only column name and higher one
awk '{print $3"\t"$7}' ${FILE##*/}foooooo.txt > ${FILE##*/}foooooo2.txt

# delete row with "0"
awk '{ if ( $2 != "0" ) { print $0; } }' ${FILE##*/}foooooo2.txt > ${FILE##*/}foooooo3.txt

# Delete "evm.model." pattern
sed 's/evm.model.//g' ${FILE##*/}foooooo3.txt > ${FILE##*/}foooooo4.txt


# Add ">" before scaffold name
sed 'N;s/scaff/>scaff/g' ${FILE##*/}foooooo4.txt > ${FILE##*/}foooooo5.txt


#paste ${FILE##*/}foooooo5.txt $POSITION | awk '{print $0}' > ${FILE##*/}foooooo6.txt

#awk 'NR==FNR {h[$1] = $2; next} {print $1"\t"$2"\t"h[$1]}' $POSITION  ${FILE##*/}foooooo5.txt > ${FILE##*/}foooooo6.txt

# Change order
#awk '{print $3"\t"$1"\t"$2}' ${FILE##*/}foooooo6.txt > ${FILE##*/}foooooo666.txt


# RechercheV (vlookup) from transcriptome T41K the corresponding sequences

awk '
    NR==FNR{a[$1]
    next
}
($1 in a) {
    print
}' ${FILE##*/}foooooo5.txt $DATA_BASE > ${FILE##*/}foooooo66.txt


# Change tab into function CR 
awk '{gsub("\t","\n"); print}' ${FILE##*/}foooooo66.txt > ${FILE##*/}foooooo7.txt
sed 's/<CR>//g' ${FILE##*/}foooooo7.txt > ${FILE##*/}_moderate_fasta_nucleotids.txt

rm $DATA_DIRECTORY/*foooooo*

done;


#rm $DATA_DIRECTORY/*foooooo*
