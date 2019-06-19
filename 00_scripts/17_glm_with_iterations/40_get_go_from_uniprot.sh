#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

WORKING_DIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/10_00_annotation_go

cd $WORKING_DIRECTORY

#wget -q -O - http://www.uniprot.org/uniprot/CATK_CANLF.txt > CATK_CANLF.txt
#wget -qO- http://www.uniprot.org/uniprot/CATK_CANLF.txt | sed -e 's/<[^>]*>//g' > CATK_CANLF.txt
wget -O - http://www.uniprot.org/uniprot/CATK_CANLF.txt > CATK_CANLF.txt


