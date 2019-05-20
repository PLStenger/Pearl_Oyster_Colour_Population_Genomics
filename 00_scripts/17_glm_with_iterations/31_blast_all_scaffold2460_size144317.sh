#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g

# The goal is to obtain fasta file for Higher and Modifier genes from SNPeff output

# Put here all gene summary from SNPeff AND the transcriptome file
DATA_DIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/
DATA_BASE=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/sspace.final.scaffolds_54K_2.fasta # nucleotid database for the 54k genes

cd $DATA_DIRECTORY


# RechercheV (vlookup) from transcriptome T41K the corresponding sequences

awk '
    NR==FNR{a[$1]
    next
}
($1 in a) {
    print
}' scaffold2460_size144317.txt $DATA_BASE > scaffold2460_size144317.fasta 



